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

        for (const [index, datosOriginales] of prendas.entries()) {
            try {
                // NORMALIZACIÓN: Aseguramos que los datos tengan el formato que espera tu service
                // Si el front envía 'codigo', lo pasamos a 'CODIGO' para el service
                const datosPrenda = {
                    CODIGO: (datosOriginales.CODIGO || datosOriginales.codigo || '').toString().trim(),
                    TALLA: (datosOriginales.TALLA || datosOriginales.talla || '').toString().trim(),
                    COLOR: (datosOriginales.COLOR || datosOriginales.color || '').toString().trim(),
                    PRECIO: parseFloat(datosOriginales.PRECIO || datosOriginales.precio || 0),
                    ESTATUS: (datosOriginales.ESTATUS || datosOriginales.estatus || 'DISPONIBLE').toString().trim().toUpperCase()
                };

                // Validamos que tenga código antes de intentar registrar
                if (!datosPrenda.CODIGO) {
                    throw new Error('El código de la prenda es obligatorio.');
                }

                const nuevaPrenda = await registrarPrendaDesdeExcel(datosPrenda);
                resultados.push(nuevaPrenda);
            } catch (err: any) {
                errores.push({
                    fila: index + 1,
                    // Intentamos sacar el código de cualquier lado para el reporte de error
                    codigo: datosOriginales.CODIGO || datosOriginales.codigo || 'Sin código',
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