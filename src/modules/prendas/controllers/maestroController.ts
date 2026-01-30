import { Request, Response } from "express";
import * as MaestroService from "../services/maestroServices";

export const getMaestrosPrendas = async (req: Request, res: Response) => {
    try {
        const data = await MaestroService.obtenerMaestrosFormulario();
    
        res.status(200).json({
        success: true,
        data
        });
    } catch (error) {
        const errorMessage = error instanceof Error ? error.message : "Error desconocido";
        res.status(500).json({
            success: false,
            message: "Error al obtener los datos maestros",
            error: errorMessage
        });
    }
};