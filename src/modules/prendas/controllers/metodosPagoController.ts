import { Request, Response } from 'express';
import * as metodosPagoService from '../services/metodosPagoService';

export const listarMetodosPagoHandler = async (_req: Request, res: Response) => {
  try {
    const metodos = await metodosPagoService.obtenerMetodosPago();
    res.status(200).json(metodos);
  } catch (error: any) {
    res.status(500).json({ 
      error: error.message || 'Error al listar los métodos de pago' 
    });
  }
};