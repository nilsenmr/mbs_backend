import { Request, Response } from 'express';
import { actualizarPrenda } from '../services/actualizarPrenda';

export const actualizarPrendaHandler = async (req: Request, res: Response) => {
  try {
    const { prenda_id } = req.body;

    // Validación literal del campo obligatorio
    if (!prenda_id) {
      return res.status(400).json({
        error: 'Campo obligatorio faltante',
        detalle: 'Se requiere prenda_id para actualizar'
      });
    }

    const result = await actualizarPrenda(req.body);
    res.status(200).json(result);
  } catch (err: any) {
    console.error('Error en actualizarPrendaHandler:', err);
    res.status(500).json({
      error: 'Error al actualizar prenda',
      detalle: err.message || err
    });
  }
};