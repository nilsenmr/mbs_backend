import { Request, Response } from "express";
import * as obtenerMaestrosVentas from "../services/maestroVentasServices";

export const getMaestrosVentas = async (req: Request, res: Response) => {
    try {
        const data = await obtenerMaestrosVentas.obtenerMaestrosVentas();
    
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