import { Request, Response } from "express";
import fs from 'fs';
import path from 'path';
import { publicarCatalogoService, subirImagenesService } from "../services/sistemaService";


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