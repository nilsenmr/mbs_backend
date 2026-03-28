import { Request, Response } from 'express';
import * as ventasService from '../services/listarVentasService';

export const listarVentasHandler = async (req: Request, res: Response) => {
  try {
    const ventas = await ventasService.listarVentas();
    res.status(200).json(ventas);
  } catch (error: any) {
    res.status(500).json({ 
      error: error.message || 'Error al obtener el listado de ventas' 
    });
  }
};