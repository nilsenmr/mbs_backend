import { db } from '../../../config/db';

export const obtenerMetodosPago = async () => {
  const query = `
    SELECT id, nombre, requiere_referencia 
    FROM metodos_pago 
    WHERE activo = TRUE 
    ORDER BY id ASC;
  `;
  const { rows } = await db.query(query);
  return rows;
};