import { db } from '../../../config/db';

export const registrarVenta = async (datos: any) => {
  const { cliente_id, monto_total, id_modalidad, detalles, cuotas } = datos;

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
      `INSERT INTO ventas (id_venta, cliente_id, monto_total, id_modalidad, id_estado_pago) 
       VALUES ($1, $2, $3, $4, $5)`,
      [id_venta, cliente_id, monto_total, id_modalidad || 1, 1]
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

    if (cuotas && cuotas.length > 0) {
      for (const cuota of cuotas) {
        await client.query(
          `INSERT INTO venta_cuotas (id_venta, numero_cuota, fecha_vencimiento, monto_cuota, id_estado_pago) 
           VALUES ($1, $2, $3, $4, $5)`,
          [id_venta, cuota.numero_cuota, cuota.fecha_vencimiento, cuota.monto_cuota, 1]
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