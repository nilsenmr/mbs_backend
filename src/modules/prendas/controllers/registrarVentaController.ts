import { Request, Response } from 'express';
import * as ventaService from '../services/registrarVenta';

export const registrarVentaHandler = async (req: Request, res: Response) => {
  try {
    const resultado = await ventaService.registrarVenta(req.body);
    res.status(201).json(resultado);
  } catch (error: any) {
    console.error("Error en registrarVenta:", error); // Útil para depurar si falla una fecha
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