import { db } from '../../../config/db';

export const listarVentas = async () => {

  await db.query(`
    UPDATE venta_cuotas 
    SET id_estado_pago = 3 
    WHERE id_estado_pago = 1 
    AND fecha_vencimiento < CURRENT_DATE
  `);

  await db.query(`
    UPDATE ventas 
    SET id_estado_pago = 3 
    WHERE id_venta IN (
      SELECT id_venta FROM venta_cuotas WHERE id_estado_pago = 3
    ) 
    AND id_estado_pago != 2
  `);

  const query = `
    SELECT 
      v.id_venta,
      v.monto_total,
      v.monto_descuento,
      v.id_modalidad,
      m.nombre AS modalidad,
      v.id_estado_pago,
      v.obs,
      ep.nombre AS estado_pago,
      TO_CHAR(v.fecha_venta, 'DD/MM/YYYY') as fecha_venta,
      c.id AS id_cliente,
      CONCAT(c.nombre, ' ', c.apellido) as cliente_nombre,
      (
        SELECT json_agg(json_build_object(
          'codigo_prenda', vd.codigo_prenda,
          'precio_unitario', vd.precio_unitario
        )) 
        FROM venta_detalles vd 
        WHERE vd.id_venta = v.id_venta
      ) as detalles,
      (
        SELECT json_agg(json_build_object(
          'id_cuota', vc.id,
          'numero_cuota', vc.numero_cuota,
          'fecha_vencimiento', TO_CHAR(vc.fecha_vencimiento, 'DD/MM/YYYY'),
          'monto_cuota', vc.monto_cuota,
          'id_estado', vc.id_estado_pago,
          'estado', ep_c.nombre
        ) ORDER BY vc.fecha_vencimiento ASC) 
        FROM venta_cuotas vc 
        JOIN estados_pago ep_c ON vc.id_estado_pago = ep_c.id 
        WHERE vc.id_venta = v.id_venta
      ) as cuotas
    FROM ventas v
    JOIN clientes c ON v.cliente_id = c.id
    JOIN modalidades_pago m ON v.id_modalidad = m.id
    JOIN estados_pago ep on v.id_estado_pago = ep.id
    ORDER BY v.fecha_venta DESC
  `;

  const { rows } = await db.query(query);
  return rows;
};