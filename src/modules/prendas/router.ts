import { Router } from "express";
import { registrarPrendaHandler } from "./controllers/registrarPrenda";
import { actualizarPrendaHandler } from "./controllers/actualizarPrenda";
import { listarPrendasHandler } from "./controllers/listarPrendas";

const router = Router();

router.post("/registrar-prenda", registrarPrendaHandler);
router.post("/actualizar-prenda", actualizarPrendaHandler);
router.get("/listar-prendas", listarPrendasHandler);

export default router;
