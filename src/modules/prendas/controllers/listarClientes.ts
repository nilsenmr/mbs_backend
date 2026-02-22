import { Request, Response } from "express";
import { listarClientes } from "../services/listarClientes";

export const listarClientesHandler = async (req: Request, res: Response) => {
  try {
    const resultado = await listarClientes();
    res.status(200).json(resultado);
  } catch (err: any) {
    console.error("Error al listar clientes:", err);
    res.status(500).json({
      error: "Error interno al listar clientes",
      detalle: err.message || err
    });
  }
};