import { Router } from "express";
import { registrarPrendaHandler } from "./controllers/registrarPrenda";
import { actualizarPrendaHandler } from "./controllers/actualizarPrenda";
import { listarPrendasHandler } from "./controllers/listarPrendas";
import { getMaestrosPrendas } from "./controllers/maestroController"; 
import { registrarMasivoHandler } from "./controllers/registarMasivo";
import { listarClientesHandler } from "./controllers/listarClientes";

const router = Router();

router.get("/listar-prendas", listarPrendasHandler);
router.post("/registrar-prenda", registrarPrendaHandler);
router.post("/actualizar-prenda", actualizarPrendaHandler);
router.post("/masivo", registrarMasivoHandler);
router.get("/listar-clientes", listarClientesHandler);

router.get("/maestros-prendas", getMaestrosPrendas);

export default router;