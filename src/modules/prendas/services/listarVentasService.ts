import { db } from '../../../config/db';

export const listarVentas = async () => {
  const query = `
    SELECT 
      v.id_venta,
      c.nombre || ' ' || c.apellido AS cliente_nombre,
      v.monto_total,
      m.nombre AS modalidad,
      ep.nombre AS estado_pago,
      TO_CHAR(v.fecha_venta, 'DD/MM/YYYY HH24:MI') AS fecha_formateada
    FROM ventas v
    JOIN clientes c ON v.cliente_id = c.id
    JOIN modalidades_pago m ON v.id_modalidad = m.id
    JOIN estados_pago ep ON v.id_estado_pago = ep.id
    ORDER BY v.fecha_venta DESC
  `;

  const { rows } = await db.query(query);
  return rows;
};