import { db } from '../../../config/db';

export const pagarCuota = async (id_cuota: number, id_venta: string) => {
  const client = await db.connect();
  try {
    await client.query('BEGIN');

    await client.query(
      'UPDATE venta_cuotas SET id_estado_pago = 2 WHERE id = $1',
      [id_cuota]
    );

    const { rows } = await client.query(
      `SELECT 
        COUNT(*) as total,
        COUNT(*) FILTER (WHERE id_estado_pago = 2) as pagadas
       FROM venta_cuotas WHERE id_venta = $1`,
      [id_venta]
    );

    const total = parseInt(rows[0].total);
    const pagadas = parseInt(rows[0].pagadas);
    
    const nuevoEstado = (pagadas === total) ? 2 : 4;

    await client.query(
      'UPDATE ventas SET id_estado_pago = $1 WHERE id_venta = $2',
      [nuevoEstado, id_venta]
    );

    await client.query('COMMIT');
    return { success: true, nuevoEstadoVenta: nuevoEstado };
  } catch (error) {
    await client.query('ROLLBACK');
    throw error;
  } finally {
    client.release();
  }
};