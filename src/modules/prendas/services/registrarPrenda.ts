import { db } from '../../../config/db';

export const registrarPrenda = async ({
  categoria_id,
  estilo_id,
  estado_id,
  talla_id,
  color,
  precio
}: {
  categoria_id: number;
  estilo_id?: number;
  estado_id: number;
  talla_id: number;
  color: string;
  precio: number;
}) => {
 
  const catRes = await db.query('SELECT codigo FROM categorias WHERE id = $1', [categoria_id]);
  if (catRes.rowCount === 0) throw 'Categoría inválida';
  let prefijo = catRes.rows[0].codigo;

 
  if (estilo_id) {
    const estRes = await db.query('SELECT codigo FROM estilos WHERE id = $1', [estilo_id]);
    if (estRes.rowCount === 0) throw 'Estilo inválido';
    prefijo = `${prefijo}-${estRes.rows[0].codigo}`;
  }

  
  const countRes = await db.query(`SELECT COUNT(*) FROM prendas WHERE codigo ILIKE $1`, [`${prefijo}-%`]);
  const count = parseInt(countRes.rows[0].count, 10);
  const correlativoFormateado = String(count + 1).padStart(4, '0');
  const nuevoCodigo = `${prefijo}-${correlativoFormateado}`;
  
  const baseRepo = "https://raw.githubusercontent.com/nilsenmr/imagenes/main/";
  const urlReferencial = `${baseRepo}${nuevoCodigo}.jpeg`;
  const urlReal = `${baseRepo}${nuevoCodigo}-real.jpeg`;

  
  await db.query(
    `INSERT INTO prendas (
      categoria_id, estilo_id, estado_id, talla_id,
      color, precio, imagen_real, imagen_referencial, codigo, created_by
    ) VALUES ($1,$2,$3,$4,$5,$6,$7,$8,$9,$10)`,
    [
      categoria_id,
      estilo_id ?? null,
      estado_id,
      talla_id,
      color,
      precio,
      urlReal,        
      urlReferencial, 
      nuevoCodigo,
      'sistema'
    ]
  );

  return { mensaje: 'Prenda registrada', codigo: nuevoCodigo };
};