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

const guardarJson = (nombreArchivo: string, contenido: any, rutas: string[]) => {
  rutas.forEach((rutaBase: string) => {
    const rutaCompleta = path.resolve(rutaBase, nombreArchivo);
    const dir = path.dirname(rutaCompleta);
    
    if (!fs.existsSync(dir)) {
      fs.mkdirSync(dir, { recursive: true });
    }
    
    fs.writeFileSync(rutaCompleta, JSON.stringify(contenido, null, 2));
    console.log(`✅ Sincronizado: ${rutaCompleta}`);
  });
};

async function ejecutarExportacion() {
  const carpetasDestino = [
    path.resolve(__dirname, '../../mbs_frontend/data'),
    path.resolve(__dirname, '../../MSB-CATALOGO-PUBLICO/src/data')
  ];

  try {
    console.log('--- 🚀 Iniciando exportación masiva ---');

  
    const queryPrendas = `
      SELECT p.codigo, p.precio, p.imagen_referencial as imagen, c.nombre as categoria, t.nombre as talla
      FROM prendas p
      JOIN categorias c ON p.categoria_id = c.id
      JOIN tallas t ON p.talla_id = t.id
      WHERE p.estado_id = 1;
    `;
    const resPrendas = await pool.query(queryPrendas);
    guardarJson('prendas.json', resPrendas.rows, carpetasDestino);

  
    const queryVentas = `
      SELECT 
        v.id_venta, 
        v.monto_total, 
        v.fecha_venta,
        CONCAT(c.nombre, ' ', c.apellido) as cliente_nombre,
        (
          SELECT json_agg(json_build_object(
            'codigo', vd.codigo_prenda,
            'precio', vd.precio_unitario
          )) 
          FROM venta_detalles vd 
          WHERE vd.id_venta = v.id_venta
        ) as detalles,
        (
          SELECT json_agg(json_build_object(
            'numero_cuota', vc.numero_cuota,
            'fecha_vencimiento', TO_CHAR(vc.fecha_vencimiento, 'DD/MM/YYYY'),
            'monto_cuota', vc.monto_cuota,
            'estado', ep_c.nombre
          ) ORDER BY vc.fecha_vencimiento ASC) 
          FROM venta_cuotas vc 
          JOIN estados_pago ep_c ON vc.id_estado_pago = ep_c.id 
          WHERE vc.id_venta = v.id_venta
        ) as cuotas
      FROM ventas v
      JOIN clientes c ON v.cliente_id = c.id
      WHERE v.id_estado_pago != 2
      ORDER BY v.fecha_venta DESC;
    `;
    const resVentas = await pool.query(queryVentas);
    guardarJson('ventas.json', resVentas.rows, carpetasDestino);

    console.log(`\n🎉 ¡Proceso completado! ${resPrendas.rows.length} prendas y ${resVentas.rows.length} ventas procesadas.`);

  } catch (err) {
    console.error('❌ Error crítico en la exportación:', err);
  } finally {
    await pool.end();
  }
}

ejecutarExportacion();