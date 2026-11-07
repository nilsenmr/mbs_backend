import { db } from '../../../config/db';

export const registrarVenta = async (datos: any) => {
  
  const { cliente_id, monto_total, monto_descuento, id_modalidad, detalles, cuotas, obs } = datos;

  const fechaHoy = new Date().toLocaleDateString('sv-SE').split('-');
  const prefijoFecha = `${fechaHoy[2]}${fechaHoy[1]}`;
  const prefijoVenta = `V${prefijoFecha}`;

  const countRes = await db.query(
    `SELECT COUNT(*) FROM ventas WHERE id_venta LIKE $1`, 
    [`${prefijoVenta}-%`]
  );
  
  const correlativo = parseInt(countRes.rows[0].count, 10) + 1;
  const id_venta = `${prefijoVenta}-${String(correlativo).padStart(3, '0')}`;

  const client = await db.connect();

  try {
    await client.query('BEGIN');

    
    await client.query(
      `INSERT INTO ventas (id_venta, cliente_id, monto_total, monto_descuento, id_modalidad, id_estado_pago, obs) 
       VALUES ($1, $2, $3, $4, $5, $6, $7)`,
      [
        id_venta, 
        cliente_id, 
        monto_total, 
        monto_descuento || null,
        id_modalidad || 1, 
        1, 
        obs || null
      ]
    );

    for (const item of detalles) {
      await client.query(
        `INSERT INTO venta_detalles (id_venta, codigo_prenda, precio_unitario) 
         VALUES ($1, $2, $3)`,
        [id_venta, item.codigo_prenda, item.precio_unitario]
      );
      
      await client.query(
        `UPDATE prendas SET estado_id = 3 WHERE codigo = $1`,
        [item.codigo_prenda]
      );
    }

    if (cuotas && Array.isArray(cuotas)) {
      for (const cuota of cuotas) {
        await client.query(
          `INSERT INTO venta_cuotas (id_venta, numero_cuota, fecha_vencimiento, monto_cuota, monto_original_cuota, id_estado_pago) 
           VALUES ($1, $2, $3, $4, $4, $5)`,
          [
            id_venta, 
            cuota.numero_cuota, 
            cuota.fecha_vencimiento, 
            cuota.monto_cuota,
            1                  
          ]
        );
      }
    }

    await client.query('COMMIT');
    return { mensaje: 'Venta registrada con éxito', id_venta };

  } catch (error) {
    await client.query('ROLLBACK');
    throw error;
  } finally {
    client.release();
  }
};

export const actualizarFechaCuota = async (id_cuota: number | string, nueva_fecha: string) => {
  try {
    const result = await db.query(
      `UPDATE venta_cuotas 
       SET fecha_vencimiento = $1 
       WHERE id = $2 AND id_estado_pago != 2`, 
      [nueva_fecha, id_cuota]
    );

    if (result.rowCount === 0) {
      throw new Error("La cuota no existe o ya ha sido pagada.");
    }

    return { mensaje: 'Fecha de cuota actualizada correctamente' };
  } catch (error) {
    console.error("Error al actualizar fecha de cuota:", error);
    throw error;
  }
};

export const abonarVenta = async (datos: { id_venta: string; monto_abono: number }) => {
  const { id_venta, monto_abono } = datos;
  const abonoNum = parseFloat(String(monto_abono));

  if (!abonoNum || abonoNum <= 0) {
    throw new Error("El monto del abono debe ser mayor a 0.");
  }

  const client = await db.connect();

  try {
    await client.query('BEGIN');

    const resultCuotas = await client.query(
      `SELECT * FROM venta_cuotas WHERE id_venta = $1 AND id_estado_pago != 2 ORDER BY id ASC`,
      [id_venta]
    );
    const cuotasPendientes = resultCuotas.rows;

    if (cuotasPendientes.length === 0) {
      throw new Error("Esta venta ya no tiene cuotas pendientes o ya está pagada en su totalidad.");
    }

    const saldoPendienteTotal = cuotasPendientes.reduce((acc, c) => acc + parseFloat(c.monto_cuota), 0);

    if (abonoNum > saldoPendienteTotal) {
      throw new Error(`El abono ($${abonoNum.toFixed(2)}) supera el saldo pendiente total ($${saldoPendienteTotal.toFixed(2)})`);
    }

    let montoRestanteAbono = abonoNum;
    let cuotasLiquidadas: number[] = [];
    let cuotasPorRecalcular: any[] = [];

    for (const cuota of cuotasPendientes) {
      const montoCuotaActual = parseFloat(cuota.monto_cuota);

      if (montoRestanteAbono >= montoCuotaActual) {
        montoRestanteAbono -= montoCuotaActual;
        cuotasLiquidadas.push(cuota.id);
      } else if (montoRestanteAbono > 0) {
        const nuevoMontoCuota = montoCuotaActual - montoRestanteAbono;
        montoRestanteAbono = 0;

        await client.query(
          `UPDATE venta_cuotas SET monto_cuota = $1, id_estado_pago = 4 WHERE id = $2`, // 4 = Parcial
          [nuevoMontoCuota.toFixed(2), cuota.id]
        );
        cuotasPorRecalcular.push({ ...cuota, monto_cuota: nuevoMontoCuota });
      } else {
        // Cuotas subsiguientes que quedan intactas antes del recálculo o entran en el pool
        cuotasPorRecalcular.push(cuota);
      }
    }

    if (cuotasLiquidadas.length > 0) {
      await client.query(
        `UPDATE venta_cuotas SET id_estado_pago = 2 WHERE id = ANY($1::int[])`,
        [cuotasLiquidadas]
      );
    }

    const cuotasVivasRestantes = cuotasPorRecalcular.filter(c => !cuotasLiquidadas.includes(c.id));

    if (montoRestanteAbono === 0 && cuotasVivasRestantes.length > 0 && cuotasLiquidadas.length > 0) {
     
      const nuevoSaldoRestante = cuotasVivasRestantes.reduce((acc, c) => acc + parseFloat(c.monto_cuota), 0);
      const cantCuotasRestantes = cuotasVivasRestantes.length;

      const nuevoMontoBase = Math.floor((nuevoSaldoRestante / cantCuotasRestantes) * 100) / 100;
      let acumulado = 0;

      for (let i = 0; i < cantCuotasRestantes; i++) {
        const cuotaActual = cuotasVivasRestantes[i];
        let montoCuotaAjustado = nuevoMontoBase;

        if (i === cantCuotasRestantes - 1) {
          montoCuotaAjustado = parseFloat((nuevoSaldoRestante - acumulado).toFixed(2));
        } else {
          acumulado += nuevoMontoBase;
        }

        await client.query(
          `UPDATE venta_cuotas SET monto_cuota = $1 WHERE id = $2`,
          [montoCuotaAjustado.toFixed(2), cuotaActual.id]
        );
      }
    }

    const checkRestantes = await client.query(
      `SELECT COUNT(*) FROM venta_cuotas WHERE id_venta = $1 AND id_estado_pago != 2`,
      [id_venta]
    );

    const countPendientes = parseInt(checkRestantes.rows[0].count, 10);
    const nuevoEstadoVenta = countPendientes === 0 ? 2 : 4; // 2 = Pagado Total, 4 = Parcial

    await client.query(
      `UPDATE ventas SET id_estado_pago = $1 WHERE id_venta = $2`,
      [nuevoEstadoVenta, id_venta]
    );

    await client.query('COMMIT');
    return { mensaje: 'Abono procesado y cuotas actualizadas correctamente.' };

  } catch (error) {
    await client.query('ROLLBACK');
    console.error("Error al procesar el abono:", error);
    throw error;
  } finally {
    client.release();
  }
};