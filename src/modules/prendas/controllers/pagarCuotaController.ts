import { Request, Response } from 'express';
import * as pagarCuotaService from '../services/pagarCuota';

export const pagarCuotaHandler = async (req: Request, res: Response) => {
  try {
    const { id_cuota } = req.params; 
    const { id_venta } = req.body;   

    if (!id_cuota || !id_venta) {
      return res.status(400).json({ 
        error: 'Faltan datos: id_cuota e id_venta son obligatorios' 
      });
    }

    const resultado = await pagarCuotaService.pagarCuota(Number(id_cuota), id_venta);
    res.status(200).json(resultado);
  } catch (error: any) {
    res.status(500).json({ 
      error: error.message || 'Error al procesar el pago de la cuota' 
    });
  }
};

export const pagarVentaCompletaHandler = async (req: Request, res: Response) => {
  try {
    const { id_venta } = req.params;

    if (!id_venta) {
      return res.status(400).json({ error: 'El ID de la venta es obligatorio' });
    }

    const resultado = await pagarCuotaService.pagarVentaCompleta(id_venta);
    
    res.status(200).json({
      message: `Venta ${id_venta} marcada como pagada exitosamente`,
      ...resultado
    });
  } catch (error: any) {
    res.status(500).json({ 
      error: error.message || 'Error al liquidar la venta completa' 
    });
  }
};