import { Pool } from 'pg';
import fs from 'fs';
import path from 'path';
import dotenv from 'dotenv';

dotenv.config();

const pool = new Pool({
  user: process.env.DB_USER,
  host: process.env.DB_HOST,
  database: process.env.DB_NAME,
  password: process.env.DB_PASSWORD,
  port: Number(process.env.DB_PORT) || 5432,
});

async function exportarCatalogo() {
  const query = `
    SELECT 
      p.codigo, 
      p.precio, 
      p.imagen_referencial as imagen, 
      c.nombre as categoria, 
      t.nombre as talla
    FROM prendas p
    JOIN categorias c ON p.categoria_id = c.id
    JOIN tallas t ON p.talla_id = t.id
    WHERE p.estado_id = 1; 
  `;

  try {
    console.log('--- 🚀 Iniciando exportación sincronizada ---');
    const res = await pool.query(query);
    const contenido = JSON.stringify(res.rows, null, 2);
    

    const rutas = [
      path.resolve(__dirname, '../../mbs_frontend/data/prendas.json'),
      path.resolve(__dirname, '../../MSB-CATALOGO-PUBLICO/src/data/prendas.json')
    ];

    rutas.forEach((ruta) => {
      const dir = path.dirname(ruta);
      
      
      if (!fs.existsSync(dir)) {
        fs.mkdirSync(dir, { recursive: true });
      }

    
      fs.writeFileSync(ruta, contenido);
      console.log(`✅ Sincronizado en: ${ruta}`);
    });

    console.log(`\n🎉 ¡Listo! ${res.rows.length} prendas disponibles en ambos proyectos.`);
    
  } catch (err) {
    console.error('❌ Error durante la exportación:', err);
  } finally {
    await pool.end();
  }
}

exportarCatalogo();