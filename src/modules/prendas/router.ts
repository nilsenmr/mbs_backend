import { Router } from "express";
import { registrarPrendaHandler } from "./controllers/registrarPrenda";
import { actualizarPrendaHandler } from "./controllers/actualizarPrenda";
import { listarPrendasHandler } from "./controllers/listarPrendas";
import { getMaestrosPrendas } from "./controllers/maestroController"; 
import { getMaestrosClientes } from "./controllers/maestroClienteController"; 
import { registrarMasivoHandler } from "./controllers/registarMasivo";
import { listarClientesHandler } from "./controllers/listarClientes";
import { registrarClienteHandler } from "./controllers/registrarCliente";
import { actualizarClienteHandler } from "./controllers/actualizarCliente";
import { registrarVentaHandler } from "./controllers/registrarVentaController"; 
import { listarVentasHandler } from "./controllers/listarVentas";
import { getMaestrosVentas } from "./controllers/maestroVentasController";
import { pagarCuotaHandler } from './controllers/pagarCuotaController';

const router = Router();

router.get("/listar-prendas", listarPrendasHandler);
router.post("/registrar-prenda", registrarPrendaHandler);
router.post("/actualizar-prenda", actualizarPrendaHandler);
router.post("/masivo", registrarMasivoHandler);
router.post("/registrar-cliente", registrarClienteHandler);
router.post("/actualizar-cliente", actualizarClienteHandler);
router.get("/listar-clientes", listarClientesHandler);
router.get("/maestros-prendas", getMaestrosPrendas);
router.get("/maestros-clientes", getMaestrosClientes);
router.post("/registrar-venta", registrarVentaHandler);
router.get("/listar-ventas", listarVentasHandler);
router.get("/modalidad-pago", getMaestrosVentas);
router.patch('/pagar-cuota/:id_cuota', pagarCuotaHandler);

export default router;