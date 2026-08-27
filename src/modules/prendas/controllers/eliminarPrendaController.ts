import { Request, Response } from 'express';
import { eliminarPrendaService, eliminarPrendaPorCodigoService } from '../services/eliminarPrenda';


export const eliminarPrendaHandler = async (req: Request, res: Response) => {
  try {
    const { id } = req.params;

    const idNumerico = Number(id);
    if (!id || isNaN(idNumerico)) {
      return res.status(400).json({
        error: 'ID inválido',
        detalle: 'Se requiere un ID numérico válido en los parámetros'
      });
    }

    const result = await eliminarPrendaService(idNumerico);
    return res.status(200).json(result);
  } catch (err: any) {
    console.error('Error en eliminarPrendaHandler:', err);
    
    if (typeof err === 'string' && err.includes('no existe')) {
      return res.status(404).json({ error: err });
    }

    res.status(500).json({
      error: 'Error al eliminar la prenda',
      detalle: err.message || err
    });
  }
};


export const eliminarPrendaPorCodigoHandler = async (req: Request, res: Response) => {
  try {
    const { codigo } = req.params;

    if (!codigo) {
      return res.status(400).json({
        error: 'Código obligatorio faltante',
        detalle: 'Se requiere el código de la prenda en los parámetros'
      });
    }

    const result = await eliminarPrendaPorCodigoService(codigo);
    return res.status(200).json(result);
  } catch (err: any) {
    console.error('Error en eliminarPrendaPorCodigoHandler:', err);

    if (typeof err === 'string' && err.includes('no se encontró')) {
      return res.status(404).json({ error: err });
    }

    res.status(500).json({
      error: 'Error al eliminar la prenda',
      detalle: err.message || err
    });
  }
};