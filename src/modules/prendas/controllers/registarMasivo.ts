    import { Request, Response } from 'express';
    import { registrarPrendaDesdeExcel } from '../services/registrarPrenda';

    export const registrarMasivoHandler = async (req: Request, res: Response) => {
    try {
        const prendas = req.body; 

        if (!Array.isArray(prendas)) {
        return res.status(400).json({ error: 'Se esperaba un formato de lista (Array).' });
        }

        const resultados = [];
        const errores = [];

        
        for (const [index, datosPrenda] of prendas.entries()) {
        try {
            
            const nuevaPrenda = await registrarPrendaDesdeExcel(datosPrenda);
            resultados.push(nuevaPrenda);
        } catch (err: any) {
            
            errores.push({
            fila: index + 1,
            codigo: datosPrenda.CODIGO || 'Sin código',
            error: err.message
            });
        }
        }

        res.status(200).json({
        mensaje: 'Proceso completado',
        exitosos: resultados.length,
        fallidos: errores.length,
        detalles_errores: errores
        });

    } catch (err: any) {
        res.status(500).json({ error: 'Error crítico en el servidor', detalle: err.message });
    }
    };