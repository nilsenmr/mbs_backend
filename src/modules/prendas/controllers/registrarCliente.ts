import { Request, Response } from 'express';
import * as ClienteService from '../services/registrarCliente';

export const registrarClienteHandler = async (req: Request, res: Response) => {
  try {
    const { nombre, apellido, telefono, id_estado } = req.body;
    if (!nombre) {
      return res.status(400).json({
        success: false,
        mensaje: 'El nombre es obligatorio'
      });
    }

    const resultado = await ClienteService.registrarCliente({
      nombre,
      apellido,
      telefono,
      id_estado: id_estado ? parseInt(id_estado.toString()) : undefined
    });

    return res.status(201).json({
      success: true,
      ...resultado
    });

  } catch (error: any) {
    const mensajeError = error instanceof Error ? error.message : 'Error inesperado en el servidor';
    
    console.error('Error en registrarNuevoCliente:', mensajeError);

    return res.status(500).json({
      success: false,
      mensaje: mensajeError
    });
  }
};