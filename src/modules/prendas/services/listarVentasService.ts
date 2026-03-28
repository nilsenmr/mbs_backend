import { db } from '../../../config/db';

export const listarVentas = async () => {
  const query = `
    SELECT 
      v.id_venta,
      v.monto_total,
      v.id_modalidad,
      m.nombre AS modalidad,
      v.id_estado_pago,
      ep.nombre AS estado_pago,
      TO_CHAR(v.fecha_venta, 'DD/MM/YYYY') as fecha_venta,
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
          'numero_cuota', vc.numero_cuota,
          'fecha_vencimiento', vc.fecha_vencimiento,
          'monto_cuota', vc.monto_cuota,
          'estado', vc.id_estado_pago
        ) ORDER BY vc.fecha_vencimiento ASC) 
        FROM venta_cuotas vc 
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