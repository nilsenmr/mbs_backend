import { db } from '../../../config/db';

export const eliminarPrendaService = async (id: number) => {
  const resultado = await db.query(
    'DELETE FROM prendas WHERE id = $1 AND estado_id = 1 RETURNING id, codigo, estado_id', 
    [id]
  );
  
  if (resultado.rowCount === 0) {
    const prendaRes = await db.query('SELECT id, estado_id FROM prendas WHERE id = $1', [id]);
    
    if (prendaRes.rowCount === 0) {
      throw 'La prenda que intentas eliminar no existe';
    } else {
      throw 'No se puede eliminar la prenda porque su estado no lo permite (debe estar en estado 1)';
    }
  }

  const codigoEliminado = resultado.rows[0].codigo;

  return { 
    mensaje: 'Prenda eliminada exitosamente', 
    id, 
    codigo: codigoEliminado 
  };
};

export const eliminarPrendaPorCodigoService = async (codigo: string) => {
  const codigoLimpio = codigo.toUpperCase().trim();
  
  const resultado = await db.query('DELETE FROM prendas WHERE codigo = $1 RETURNING id, codigo', [codigoLimpio]);
  
  if (resultado.rowCount === 0) {
    throw 'No se encontró ninguna prenda con ese código';
  }

  return { 
    mensaje: 'Prenda eliminada exitosamente', 
    codigo: resultado.rows[0].codigo 
  };
};