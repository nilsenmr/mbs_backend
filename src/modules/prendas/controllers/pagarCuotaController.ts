import { Request, Response } from 'express';
import * as pagarCuotaService from '../services/pagarCuota';
import { obtenerMetodosPago } from '../services/metodosPagoService'; // <--- Importa tu servicio de métodos de pago

export const pagarCuotaHandler = async (req: Request, res: Response) => {
  try {
    const { id_cuota } = req.params; 
    const { id_venta, metodo_pago, referencia } = req.body;   

    if (!id_cuota || !id_venta || !metodo_pago) {
      return res.status(400).json({ 
        error: 'Faltan datos obligatorios: id_cuota, id_venta y metodo_pago son requeridos' 
      });
    }

    // 1. Obtenemos los métodos activos directamente desde la base de datos usando tu servicio
    const metodosBD = await obtenerMetodosPago();
    
    // Buscamos si el método enviado coincide con alguno de la BD (ignorando mayúsculas/minúsculas)
    const metodoEncontrado = metodosBD.find(
      (m: any) => m.nombre.toLowerCase() === metodo_pago.toLowerCase()
    );

    if (!metodoEncontrado) {
      return res.status(400).json({ error: `El método de pago '${metodo_pago}' no es válido o está inactivo` });
    }

    const requiereReferencia = metodoEncontrado.requiere_referencia;

    // 2. Validar únicamente si la BD indica que es obligatorio
    if (requiereReferencia && (!referencia || referencia.trim() === '')) {
      return res.status(400).json({ 
        error: `El método de pago '${metodo_pago}' requiere obligatoriamente un número de referencia` 
      });
    }

    const resultado = await pagarCuotaService.pagarCuota(
      Number(id_cuota), 
      id_venta, 
      metodo_pago, 
      referencia || null
    );
    
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
    const { metodo_pago, referencia } = req.body;

    if (!id_venta || !metodo_pago) {
      return res.status(400).json({ 
        error: 'Faltan datos obligatorios: el ID de la venta y el metodo_pago son requeridos' 
      });
    }

    // 1. Obtenemos los métodos activos desde la BD
    const metodosBD = await obtenerMetodosPago();
    const metodoEncontrado = metodosBD.find(
      (m: any) => m.nombre.toLowerCase() === metodo_pago.toLowerCase()
    );

    if (!metodoEncontrado) {
      return res.status(400).json({ error: `El método de pago '${metodo_pago}' no es válido o está inactivo` });
    }

    const requiereReferencia = metodoEncontrado.requiere_referencia;

    // 2. Validar estrictamente según lo que indique la BD
    if (requiereReferencia && (!referencia || referencia.trim() === '')) {
      return res.status(400).json({ 
        error: `El método de pago '${metodo_pago}' requiere obligatoriamente un número de referencia` 
      });
    }

    const resultado = await pagarCuotaService.pagarVentaCompleta(
      id_venta, 
      metodo_pago, 
      referencia || null
    );
    
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