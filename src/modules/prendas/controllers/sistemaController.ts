import { Request, Response } from "express";
import fs from 'fs';
import path from 'path';
import { publicarCatalogoService, subirImagenesService } from "../services/sistemaService";
import { db } from '../../../config/db'; // <--- Importamos tu conexión para la BD

export const publicarCatalogoHandler = async (req: Request, res: Response) => {
  try {
    const resultado = await publicarCatalogoService();
    res.status(200).json(resultado);
  } catch (err: any) {
    console.error("Error en publicarCatalogoHandler:", err);
    res.status(500).json({
      error: "Error interno al procesar la actualización del catálogo",
      detalle: err.detalle || err.message || err
    });
  }
};

export const subirImagenesHandler = async (req: Request, res: Response) => {
  try {
    const resultado = await subirImagenesService();
    res.status(200).json(resultado);
  } catch (err: any) {
    console.error("Error en subirImagenesHandler:", err);
    res.status(500).json({
      error: "Error interno al sincronizar el servidor de imágenes",
      detalle: err.detalle || err.message || err
    });
  }
}; 

// 🌟 TU CONTROLADOR ORIGINAL DE LA IMAGEN PRINCIPAL (Intacto)
export const guardarImagenLocalController = async (req: Request, res: Response) => {
  try {
    const { codigoPrenda } = req.body;
    const file = req.file;

    if (!codigoPrenda) {
      return res.status(400).json({ mensaje: "Falta el código de la prenda." });
    }
    if (!file) {
      return res.status(400).json({ mensaje: "No se ha arrastrado ninguna imagen." });
    }

    const destinos = [
      "C:\\wamp64\\www\\imagenes",
      "C:\\wamp64\\www\\mbs_frontend\\public\\imagenes"
    ];

    const nombreArchivo = `${codigoPrenda.trim().toUpperCase()}.jpeg`;

    destinos.forEach((carpeta) => {
      if (!fs.existsSync(carpeta)) {
        fs.mkdirSync(carpeta, { recursive: true });
      }
      
      const rutaCompleta = path.join(carpeta, nombreArchivo);
      fs.writeFileSync(rutaCompleta, file.buffer);
      console.log(`Imagen guardada en: ${rutaCompleta}`);
    });

    return res.json({
      success: true,
      mensaje: `Imagen ${nombreArchivo} guardada con éxito en ambas rutas.`
    });

  } catch (error: any) {
    console.error("Error al guardar imagen local:", error);
    return res.status(500).json({
      mensaje: "Error interno al escribir el archivo en el servidor.",
      detalle: error.message
    });
  }
};


// 🚀 NUEVO CONTROLADOR PARA LAS IMÁGENES EXTRA (Con cálculo automático de correlativo y BD)
export const guardarImagenExtraController = async (req: Request, res: Response) => {
  const client = await db.connect();
  try {
    const { codigoPrenda } = req.body;
    const file = req.file;

    if (!codigoPrenda) {
      return res.status(400).json({ mensaje: "Falta el código de la prenda." });
    }
    if (!file) {
      return res.status(400).json({ mensaje: "No se ha arrastrado ninguna imagen extra." });
    }

    const codigoLimpio = codigoPrenda.trim().toUpperCase();

    await client.query('BEGIN');

    // 1. Verificar si la prenda existe y obtener su ID
    const resPrenda = await client.query("SELECT id FROM prendas WHERE codigo = $1", [codigoLimpio]);
    if (resPrenda.rowCount === 0) {
      await client.query('ROLLBACK');
      return res.status(404).json({ mensaje: `La prenda con código ${codigoLimpio} no existe en la base de datos.` });
    }
    const prendaId = resPrenda.rows[0].id;

    // 2. Contar cuántas imágenes extra tiene para calcular el correlativo (-01, -02...)
    const resCount = await client.query(
      "SELECT COUNT(*) as total FROM prendas_imagenes WHERE prenda_id = $1", 
      [prendaId]
    );
    const totalExistentes = parseInt(resCount.rows[0].total, 10);
    const correlativo = (totalExistentes + 1).toString().padStart(2, '0');
    
    // 3. Definir nombres y URLs
    const nombreArchivoExtra = `${codigoLimpio}-${correlativo}.jpeg`;
    const urlGenerada = `https://raw.githubusercontent.com/nilsenmr/imagenes/main/${nombreArchivoExtra}`;

    // 4. Guardar físicamente en las carpetas locales (igual que la principal)
    const destinos = [
      "C:\\wamp64\\www\\imagenes",
      "C:\\wamp64\\www\\mbs_frontend\\public\\imagenes"
    ];

    destinos.forEach((carpeta) => {
      if (!fs.existsSync(carpeta)) {
        fs.mkdirSync(carpeta, { recursive: true });
      }
      const rutaCompleta = path.join(carpeta, nombreArchivoExtra);
      fs.writeFileSync(rutaCompleta, file.buffer);
      console.log(`Imagen extra guardada en: ${rutaCompleta}`);
    });

    // 5. Registrar en la tabla `prendas_imagenes`
    await client.query(
      "INSERT INTO prendas_imagenes (prenda_id, url_imagen, codigo_extra) VALUES ($1, $2, $3)",
      [prendaId, urlGenerada, nombreArchivoExtra.replace('.jpeg', '')]
    );

    await client.query('COMMIT');

    return res.json({
      success: true,
      mensaje: `¡Imagen extra ${nombreArchivoExtra} guardada y registrada con éxito!`,
      codigo_extra: nombreArchivoExtra.replace('.jpeg', '')
    });

  } catch (error: any) {
    await client.query('ROLLBACK');
    console.error("Error al guardar imagen extra:", error);
    return res.status(500).json({
      mensaje: "Error interno al procesar la imagen extra.",
      detalle: error.message || error
    });
  } finally {
    client.release();
  }
};