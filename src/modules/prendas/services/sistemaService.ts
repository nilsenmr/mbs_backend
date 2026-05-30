import { exec } from "child_process";
import path from "path";

const directorioControl = path.join(process.cwd(), "MSB_CONTROL");

// Definimos la interfaz del error para que TypeScript no se queje en el reject
interface ErrorScript {
  mensaje: string;
  detalle: string;
}

const ejecutarScriptBash = (nombreScript: string): Promise<string> => {
  return new Promise<string>((resolve, reject) => {
    const rutaScript = path.join(directorioControl, nombreScript);

    console.log(`🚀 Ejecutando desde backend: bash "${rutaScript}"`);

    try {
      exec(`bash "${rutaScript}"`, (error, stdout, stderr) => {
        if (error) {
          console.error(`❌ Error en script ${nombreScript}:`, error.message);
          // Rechazamos con la estructura de objeto que tus controladores esperan
          return reject({
            mensaje: `Error al ejecutar el proceso en el servidor.`,
            detalle: error.message
          } as ErrorScript);
        }
        
        if (stderr) {
          console.warn(`⚠️ Advertencia de script ${nombreScript}:`, stderr);
        }

        console.log(`✅ Salida de ${nombreScript}:`, stdout);
        resolve(stdout);
      });
    } catch (err: any) {
      console.error("💥 Error crítico al invocar exec:", err);
      reject({
        mensaje: "Error fatal en el hilo del servidor.",
        detalle: err.message
      } as ErrorScript);
    }
  });
};

export const publicarCatalogoService = async () => {
  try {
    const resultado = await ejecutarScriptBash("publicar.sh");
    return { success: true, mensaje: "¡Catálogo Web actualizado con éxito!", data: resultado };
  } catch (error) {
    throw error;
  }
};

export const subirImagenesService = async () => {
  try {
    const resultado = await ejecutarScriptBash("publicar_imagenes.sh");
    return { success: true, mensaje: "¡Imágenes sincronizadas con éxito!", data: resultado };
  } catch (error) {
    throw error;
  }
};