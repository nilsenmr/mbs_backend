import { Pool } from 'pg';
import fs from 'fs';
import path from 'path';
import { execSync } from 'child_process';
import dotenv from 'dotenv';

dotenv.config();

const pool = new Pool({
  user: process.env.DB_USER,
  host: process.env.DB_HOST,
  database: process.env.DB_NAME,
  password: process.env.DB_PASSWORD,
  port: Number(process.env.DB_PORT) || 5432,
});

const sincronizarImagenesLocales = (origen: string, destino: string) => {
  if (!fs.existsSync(origen)) {
    console.error(`❌ Carpeta origen no encontrada: ${origen}`);
    return;
  }
  
  if (!fs.existsSync(destino)) fs.mkdirSync(destino, { recursive: true });

  fs.cpSync(origen, destino, { 
    recursive: true,
    filter: (src) => path.basename(src) !== '.git'
  });
  console.log(`📂 Imágenes sincronizadas en: ${destino}`);
};

const guardarJson = (nombreArchivo: string, contenido: any, rutas: string[]) => {
  rutas.forEach((rutaBase: string) => {
    const rutaCompleta = path.resolve(rutaBase, nombreArchivo);
    const dir = path.dirname(rutaCompleta);
    if (!fs.existsSync(dir)) fs.mkdirSync(dir, { recursive: true });
    fs.writeFileSync(rutaCompleta, JSON.stringify(contenido, null, 2));
    console.log(`✅ Sincronizado JSON: ${rutaCompleta}`);
  });
};

const subirAGitHub = (rutaRepo: string) => {
  console.log('--- 🐙 Subiendo a GitHub ---');
  execSync('git add .', { cwd: rutaRepo });
  try {
    execSync('git commit -m "Actualización automática de catálogo e imágenes"', { cwd: rutaRepo });
    execSync('git push', { cwd: rutaRepo });
    console.log('✅ Cambios enviados a GitHub');
  } catch (e) {
    console.log('ℹ️ No hay cambios nuevos para subir o error en el commit.');
  }
};

async function ejecutarExportacion() {
  const carpetasDestinoJson = [
    path.resolve(__dirname, '../../mbs_frontend/data'),
    path.resolve(__dirname, '../../MSB-CATALOGO-PUBLICO/src/data')
  ];
  
  const carpetasDestinoImg = [
    'C:\\wamp64\\www\\mbs_frontend\\public\\imagenes',
    'C:\\wamp64\\www\\msb-catalogo-publico\\public\\imagenes'
  ];

  try {
    console.log('--- 🚀 Iniciando exportación completa ---');
    const carpetaOrigen = 'C:\\wamp64\\www\\imagenes';

    // 1. Sincronizar imágenes
    carpetasDestinoImg.forEach(destino => sincronizarImagenesLocales(carpetaOrigen, destino));

    // 2. Exportar JSONs de prendas usando la misma consulta SQL de tu backend
    const resPrendas = await pool.query(`
      SELECT 
        p.id, p.codigo, p.color, p.precio, p.en_oferta,
        p.imagen_real, p.imagen_referencial,
        c.nombre AS categoria,
        e.nombre AS estilo,
        est.codigo AS estado,
        t.nombre AS talla,
        p.created_at,
        COALESCE(
          json_agg(
            json_build_object(
              'id', pi.id,
              'url_imagen', pi.url_imagen,
              'codigo_extra', pi.codigo_extra
            )
          ) FILTER (WHERE pi.id IS NOT NULL), 
          '[]'
        ) AS imagenes_extra
      FROM prendas p
      LEFT JOIN categorias c ON p.categoria_id = c.id
      LEFT JOIN estilos e ON p.estilo_id = e.id
      LEFT JOIN estados_prenda est ON p.estado_id = est.id
      LEFT JOIN tallas t ON p.talla_id = t.id
      LEFT JOIN prendas_imagenes pi ON p.id = pi.prenda_id
      WHERE p.estado_id = 1
      GROUP BY p.id, c.nombre, e.nombre, est.codigo, t.nombre
      ORDER BY p.id DESC;
    `);

    const baseUrlImg = "https://raw.githubusercontent.com/nilsenmr/imagenes/main/";

    // Mapeo para asegurar el formato limpio con la propiedad "imagen" principal
    const prendasMapeadas = resPrendas.rows.map(item => {
      const imagenFinal = item.imagen_referencial 
        ? (item.imagen_referencial.startsWith('http') ? item.imagen_referencial : `${baseUrlImg}${item.codigo}.jpeg`)
        : `${baseUrlImg}${item.codigo}.jpeg`;

      return {
        codigo: item.codigo,
        precio: item.precio,
        en_oferta: item.en_oferta,
        imagen: imagenFinal,
        categoria: item.categoria,
        talla: item.talla,
        created_at: item.created_at,
        imagenes_extra: item.imagenes_extra
      };
    });

    guardarJson('prendas.json', prendasMapeadas, carpetasDestinoJson);

    // 3. Exportar JSONs de ventas
    const resVentas = await pool.query(`SELECT  
        v.id_venta,
        v.monto_total,
        v.monto_descuento,
        v.fecha_venta,
        v.obs,
        c.id as id_cliente,
        c.telefono,
        Concat(c.nombre, ' ', c.apellido) AS cliente_nombre,
        (
          SELECT Json_agg(Json_build_object('codigo', vd.codigo_prenda, 'precio', vd.precio_unitario))
          FROM   venta_detalles vd
          WHERE  vd.id_venta = v.id_venta
        ) AS detalles,
        (
          SELECT json_agg(Json_build_object('numero_cuota', vc.numero_cuota, 'fecha_vencimiento', To_char(vc.fecha_vencimiento, 'DD/MM/YYYY'), 'monto_cuota', vc.monto_cuota, 'estado', ep_c.nombre) ORDER BY vc.fecha_vencimiento ASC)
          FROM   venta_cuotas vc
          JOIN   estados_pago ep_c ON vc.id_estado_pago = ep_c.id
          WHERE  vc.id_venta = v.id_venta
        ) AS cuotas
      FROM    ventas v
      JOIN    clientes c ON v.cliente_id = c.id
      WHERE   v.id_estado_pago != 2
      ORDER BY v.fecha_venta DESC;`);
      
    guardarJson('ventas.json', resVentas.rows, carpetasDestinoJson);

    // 4. Subir a GitHub
    subirAGitHub('C:\\wamp64\\www\\msb-catalogo-publico');

    console.log('\n🎉 ¡Proceso finalizado con éxito!');
  } catch (err) {
    console.error('❌ Error crítico:', err);
  } finally {
    await pool.end();
  }
}

ejecutarExportacion();