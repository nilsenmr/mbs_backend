import { Request, Response } from 'express';
import * as ClienteService from '../services/actualizarCliente';


export const actualizarClienteHandler = async (req: Request, res: Response) => {
  try {
    const { id, nombre, apellido, telefono, id_estado } = req.body;

    if (!id) {
      return res.status(400).json({
        success: false,
        mensaje: 'El ID del cliente es obligatorio para actualizar'
      });
    }

    const resultado = await ClienteService.actualizarClienteHandler({
      id: parseInt(id.toString()),
      nombre,
      apellido,
      telefono,
      id_estado: id_estado ? parseInt(id_estado.toString()) : undefined
    });

    return res.status(200).json({
      success: true,
      ...resultado
    });

  } catch (error: any) {
    const mensajeError = error instanceof Error ? error.message : 'Error inesperado';
    console.error('Error en actualizarClienteHandler:', mensajeError);
    return res.status(500).json({ success: false, mensaje: mensajeError });
  }
};