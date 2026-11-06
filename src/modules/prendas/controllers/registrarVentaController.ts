import { Request, Response } from 'express';
import * as ventaService from '../services/registrarVenta';

export const registrarVentaHandler = async (req: Request, res: Response) => {
  try {
    const resultado = await ventaService.registrarVenta(req.body);
    res.status(201).json(resultado);
  } catch (error: any) {
    console.error("Error en registrarVenta:", error);
    res.status(500).json({ 
      error: error.message || 'Error interno al registrar la venta' 
    });
  }
};

export const actualizarFechaCuotaHandler = async (req: Request, res: Response) => {
  try {
    const { idCuota } = req.params; 
    const { nuevaFecha } = req.body;
    
    const resultado = await ventaService.actualizarFechaCuota(idCuota, nuevaFecha);
    res.status(200).json(resultado);
  } catch (error: any) {
    console.error("Error en actualizarFechaCuota:", error);
    res.status(400).json({ 
      error: error.message || 'Error al actualizar la fecha de la cuota' 
    });
  }
};

export const abonarVentaHandler = async (req: Request, res: Response) => {
  try {
    const { id_venta, monto_abono } = req.body;
    
    const resultado = await ventaService.abonarVenta({ id_venta, monto_abono });
    
    res.status(200).json({ success: true, ...resultado });
  } catch (error: any) {
    console.error("Error en abonarVenta:", error);
    res.status(400).json({ 
      success: false, 
      message: error.message || 'Error al procesar el abono y recálculo' 
    });
  }
};