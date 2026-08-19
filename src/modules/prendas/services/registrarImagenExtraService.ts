import { db } from '../../../config/db';

export const registrarImagenExtraService = async (codigoPrenda: string, urlImagen: string) => {
  const client = await db.connect();
  
  try {
    // 1. Buscar el ID de la prenda basándonos en el código (ej: CJ-CAS-0025)
    const resPrenda = await client.query("SELECT id FROM prendas WHERE codigo = $1", [codigoPrenda]);
    
    if (resPrenda.rowCount === 0) {
      throw new Error(`La prenda con código ${codigoPrenda} no existe en el sistema.`);
    }
    const prendaId = resPrenda.rows[0].id;

    // 2. Contar cuántas imágenes extra tiene para calcular el correlativo
    const resCount = await client.query(
      "SELECT COUNT(*) as total FROM prendas_imagenes WHERE prenda_id = $1", 
      [prendaId]
    );
    const totalExistentes = parseInt(resCount.rows[0].total, 10);
    
    // 3. Crear el nuevo código extra (ej: CJ-CAS-0025-01)
    const correlativo = (totalExistentes + 1).toString().padStart(2, '0');
    const nuevoCodigoExtra = `${codigoPrenda}-${correlativo}`;

    // 4. Insertar en la nueva tabla
    await client.query(
      "INSERT INTO prendas_imagenes (prenda_id, url_imagen, codigo_extra) VALUES ($1, $2, $3)",
      [prendaId, urlImagen, nuevoCodigoExtra]
    );

    return { 
      mensaje: 'Imagen extra agregada', 
      codigo_extra: nuevoCodigoExtra 
    };

  } catch (error) {
    throw error;
  } finally {
    client.release();
  }
};