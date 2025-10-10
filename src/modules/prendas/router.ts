import { Router } from 'express';
import { registrarPrendaHandler } from './controllers/registrarPrenda';
import { actualizarPrendaHandler } from './controllers/actualizarPrenda';

const router = Router();

router.post('/registrar-prenda', registrarPrendaHandler);
router.post('/actualizar-prenda', actualizarPrendaHandler);

export default router;