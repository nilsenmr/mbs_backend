import { db } from '../../../config/db';

interface ActualizarClienteParams {
  id: number;
  nombre?: string;
  apellido?: string;
  telefono?: string;
  id_estado?: number;
}

export const actualizarClienteHandler = async ({
  id,
  nombre,
  apellido,
  telefono,
  id_estado
}: ActualizarClienteParams) => {
  
  const checkId = await db.query('SELECT id FROM clientes WHERE id = $1', [id]);
  if (checkId.rowCount === 0) {
    throw new Error(`El cliente con ID ${id} no existe en la base de datos.`);
  }

  if (telefono) {
    const existeTel = await db.query(
      'SELECT id FROM clientes WHERE telefono = $1 AND id != $2', 
      [telefono, id]
    );
    if (existeTel.rowCount && existeTel.rowCount > 0) {
      throw new Error('El número de teléfono ya está asignado a otro cliente.');
    }
  }

  try {
    const res = await db.query(
      `UPDATE clientes 
       SET 
        nombre = COALESCE($1, nombre), 
        apellido = COALESCE($2, apellido), 
        telefono = COALESCE($3, telefono), 
        id_estado = COALESCE($4, id_estado),
        fecha_actualizacion = NOW()
       WHERE id = $5
       RETURNING id`,
      [
        nombre?.trim() || null,
        apellido?.trim() || null,
        telefono?.trim() || null,
        id_estado || null,
        id
      ]
    );

    return { 
      mensaje: 'Cliente actualizado exitosamente', 
      id: res.rows[0].id 
    };

  } catch (error: any) {
    const msg = error instanceof Error ? error.message : 'Error interno al actualizar';
    throw new Error(msg);
  }
};