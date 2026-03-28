import { Request, Response } from 'express';
import * as pagarCuotaService from '../services/pagarCuota';

export const pagarCuotaHandler = async (req: Request, res: Response) => {
  try {
    const { id_cuota } = req.params; 
    const { id_venta } = req.body;   

    if (!id_cuota || !id_venta) {
      return res.status(400).json({ 
        error: 'Faltan datos: id_cuota e id_venta (ej. V2803-001) son obligatorios' 
      });
    }

    const resultado = await pagarCuotaService.pagarCuota(Number(id_cuota), id_venta);
    
    res.status(200).json(resultado);
  } catch (error: any) {
    res.status(500).json({ 
      error: error.message || 'Error al procesar el pago en MSB Shop' 
    });
  }
};