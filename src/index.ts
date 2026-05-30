import express from 'express';
import dotenv from 'dotenv';
import cors from 'cors';
import prendasRouter from './modules/prendas/router';

dotenv.config();
const app = express();

app.use(express.json());

app.use(cors({
  origin: "http://localhost:5173", 
  methods: ["GET", "POST", "PUT", "DELETE", "PATCH"],
  credentials: true
}));


app.get('/api/test-rutas', (req, res) => {
  const rutas: string[] = [];
  
 
  if (prendasRouter && prendasRouter.stack) {
    prendasRouter.stack.forEach((layer: any) => {
      if (layer.route) {
        const metodos = Object.keys(layer.route.methods).join(', ').toUpperCase();
        rutas.push(`[PrendasRouter] ${metodos} -> /api/prendas${layer.route.path}`);
      }
    });
  }

  res.json({
    mensaje: "Diagnóstico de rutas activas",
    rutas_detectadas: rutas
  });
});


app.use('/api/prendas', prendasRouter);

const PORT = process.env.PORT || 3001;
app.listen(PORT, () => {
  console.log(`Backend corriendo en puerto ${PORT}`);
});