import { Request, Response } from "express";
import * as MaestroClienteService from "../services/maestroClienteServices";

export const getMaestrosClientes = async (req: Request, res: Response) => {
    try {
        const data = await MaestroClienteService.obtenerMaestrosCliente();
    
        res.status(200).json({
            success: true,
            data
        });
    } catch (error) {
        // Manejo de error tipado para TypeScript
        const errorMessage = error instanceof Error ? error.message : "Error desconocido";
        
        res.status(500).json({
            success: false,
            message: "Error al obtener los datos maestros de clientes",
            error: errorMessage
        });
    }
};