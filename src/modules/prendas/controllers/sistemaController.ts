import { Request, Response } from "express";
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