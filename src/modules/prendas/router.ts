import { Router } from "express";
import { registrarPrendaHandler } from "./controllers/registrarPrenda";
import { actualizarPrendaHandler } from "./controllers/actualizarPrenda";
import { listarPrendasHandler } from "./controllers/listarPrendas";
// 1. Importa el nuevo controlador
import { getMaestrosPrendas } from "./controllers/maestroController"; 

const router = Router();

router.get("/listar-prendas", listarPrendasHandler);
router.post("/registrar-prenda", registrarPrendaHandler);
router.post("/actualizar-prenda", actualizarPrendaHandler);

router.get("/maestros-prendas", getMaestrosPrendas);

export default router;