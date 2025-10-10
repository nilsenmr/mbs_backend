import { Request, Response } from 'express';
import { registrarPrenda } from '../services/registrarPrenda';

export const registrarPrendaHandler = async (req: Request, res: Response) => {
  try {
    const {
      categoria_id,
      estado_id,
      talla_id,
      color,
      precio
    } = req.body;

    // Validación literal de campos obligatorios
    if (!categoria_id || !estado_id || !talla_id || !color || !precio) {
      return res.status(400).json({
        error: 'Campos obligatorios faltantes',
        detalle: 'Se requieren: categoria_id, estado_id, talla_id, color, precio'
      });
    }

    const result = await registrarPrenda(req.body);
    res.status(200).json(result);
  } catch (err: any) {
    console.error('Error en registrarPrendaHandler:', err);
    res.status(500).json({
      error: 'Error al registrar prenda',
      detalle: err.message || err
    });
  }
};