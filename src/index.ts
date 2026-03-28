import express from 'express';
import dotenv from 'dotenv';
import cors from 'cors';
import prendasRouter from './modules/prendas/router';

dotenv.config();
const app = express();

app.use(express.json());

app.use(cors({
  origin: "http://localhost:5173", 
  methods: ["GET", "POST", "PUT", "DELETE","PATCH"],
  credentials: true
}));

// Tus rutas
app.use('/api/prendas', prendasRouter);

const PORT = process.env.PORT || 3001;
app.listen(PORT, () => {
  console.log(`Backend corriendo en puerto ${PORT}`);
});