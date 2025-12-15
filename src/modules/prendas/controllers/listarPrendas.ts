import { Request, Response } from "express";
import { listarPrendas } from "../services/listarPrendas";

export const listarPrendasHandler = async (req: Request, res: Response) => {
  try {
    const resultado = await listarPrendas();
    res.status(200).json(resultado);
  } catch (err: any) {
    console.error("Error al listar prendas:", err);
    res.status(500).json({
      error: "Error interno",
      detalle: err.message || err
    });
  }
};
