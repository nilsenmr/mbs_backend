import { db } from "../../../config/db";

export const listarClientes = async () => {
  try {
    const query = `
      SELECT 
        c.id, 
        c.nombre, 
        c.apellido, 
        c.telefono,
        TO_CHAR(c.fecha_creacion, 'DD/MM/YYYY HH12:MI:SS AM') as fecha_creacion,
        e.nombre as estado,
        e.id as id_estado
      FROM clientes c
      INNER JOIN estados_cliente e ON c.id_estado = e.id
      ORDER BY c.id
    `;
    const result = await db.query(query);
    return result.rows;
  } catch (error) {
    console.error("Error en listarClientes:", error);
    throw error;
  }
};