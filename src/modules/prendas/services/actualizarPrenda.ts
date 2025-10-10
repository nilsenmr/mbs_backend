import { db } from '../../../config/db';

export const actualizarPrenda = async ({
  prenda_id,
  categoria_id,
  estilo_id,
  estado_id,
  talla_id,
  color,
  precio,
  imagen_real,
  imagen_referencial,
  updated_by
}: {
  prenda_id: number;
  categoria_id?: number;
  estilo_id?: number;
  estado_id?: number;
  talla_id?: number;
  color?: string;
  precio?: number;
  imagen_real?: string;
  imagen_referencial?: string;
  updated_by?: string;
}) => {
  const prendaRes = await db.query(
    'SELECT id FROM prendas WHERE id = $1',
    [prenda_id]
  );
  if (prendaRes.rowCount === 0) {
    throw new Error('Prenda no encontrada');
  }

  const updateFields: string[] = [];
  const updateValues: any[] = [];
  let paramIndex = 1;

  if (categoria_id !== undefined) {
    updateFields.push(`categoria_id = $${paramIndex++}`);
    updateValues.push(categoria_id);
  }
  if (estilo_id !== undefined) {
    updateFields.push(`estilo_id = $${paramIndex++}`);
    updateValues.push(estilo_id);
  }
  if (estado_id !== undefined) {
    updateFields.push(`estado_id = $${paramIndex++}`);
    updateValues.push(estado_id);
  }
  if (talla_id !== undefined) {
    updateFields.push(`talla_id = $${paramIndex++}`);
    updateValues.push(talla_id);
  }
  if (color !== undefined) {
    updateFields.push(`color = $${paramIndex++}`);
    updateValues.push(color);
  }
  if (precio !== undefined) {
    updateFields.push(`precio = $${paramIndex++}`);
    updateValues.push(precio);
  }
  if (imagen_real !== undefined) {
    updateFields.push(`imagen_real = $${paramIndex++}`);
    updateValues.push(imagen_real);
  }
  if (imagen_referencial !== undefined) {
    updateFields.push(`imagen_referencial = $${paramIndex++}`);
    updateValues.push(imagen_referencial);
  }

  // Campos de auditoría
  updateFields.push(`updated_by = $${paramIndex++}`);
  updateValues.push(updated_by ?? 'sistema');

  updateFields.push(`updated_at = $${paramIndex++}`);
  updateValues.push(new Date());

  if (updateFields.length === 0) {
    throw new Error('No se proporcionaron campos para actualizar');
  }

  const updateQuery = `
    UPDATE prendas
    SET ${updateFields.join(', ')}
    WHERE id = $${paramIndex}
  `;
  updateValues.push(prenda_id);

  await db.query(updateQuery, updateValues);

  return { mensaje: 'Prenda actualizada correctamente' };
};