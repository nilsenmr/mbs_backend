import { db } from '../../../config/db';

interface ClienteParams {
  nombre: string;
  apellido?: string;
  telefono?: string;
  id_estado?: number;
}

export const registrarCliente = async ({
  nombre,
  apellido,
  telefono,
  id_estado
}: ClienteParams) => {
  

  if (telefono) {
    const existe = await db.query('SELECT id FROM clientes WHERE telefono = $1', [telefono]);
    if (existe.rowCount && existe.rowCount > 0) {
      throw new Error('Ya existe un cliente registrado con ese número de teléfono');
    }
  }

  const estadoFinal = id_estado || 1; 
  const estRes = await db.query('SELECT id FROM estados_cliente WHERE id = $1', [estadoFinal]);
  if (estRes.rowCount === 0) throw new Error('El estado de cliente proporcionado es inválido');

  try {
    const res = await db.query(
      `INSERT INTO clientes (
        nombre, 
        apellido, 
        telefono, 
        id_estado, 
        fecha_creacion
      ) VALUES ($1, $2, $3, $4, NOW()) 
      RETURNING id`,
      [
        nombre.trim(),
        apellido?.trim() || null,
        telefono?.trim() || null,
        estadoFinal
      ]
    );

    return { 
      mensaje: 'Cliente registrado exitosamente', 
      id: res.rows[0].id 
    };

  } catch (error: any) {
    const msg = error instanceof Error ? error.message : 'Error desconocido al registrar cliente';
    throw new Error(msg);
  }
};