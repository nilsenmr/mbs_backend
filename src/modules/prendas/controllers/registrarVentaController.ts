import { Request, Response } from 'express';
import * as ventaService from '../services/registrarVenta';

export const registrarVentaHandler = async (req: Request, res: Response) => {
  try {
    const resultado = await ventaService.registrarVenta(req.body);
    res.status(201).json(resultado);
  } catch (error: any) {
    res.status(500).json({ 
      error: error.message || 'Error interno al registrar la venta' 
    });
  }
};