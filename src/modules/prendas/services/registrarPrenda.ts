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

export const registrarPrendaDesdeExcel = async (datosPrenda: any) => {
  const { CODIGO, TALLA, COLOR, ESTATUS, PRECIO } = datosPrenda;

  if (!CODIGO) throw 'Falta columna CODIGO';

  const partes = CODIGO.toUpperCase().trim().split('-');
  const siglaCategoria = partes[0];
  const siglaEstilo = partes.length > 1 ? partes[1] : null;

  const catRes = await db.query('SELECT id FROM categorias WHERE codigo = $1', [siglaCategoria]);
  if (!catRes.rows || catRes.rows.length === 0) throw `Sigla categoría "${siglaCategoria}" no existe`;
  const categoria_id = catRes.rows[0].id;

  let estilo_id = undefined;
  if (siglaEstilo) {
    const estRes = await db.query('SELECT id FROM estilos WHERE codigo = $1', [siglaEstilo]);
    if (estRes.rows && estRes.rows.length > 0) {
      estilo_id = estRes.rows[0].id;
    }
  }

  const tallaRes = await db.query('SELECT id FROM tallas WHERE nombre ILIKE $1', [TALLA?.trim()]);
  if (!tallaRes.rows || tallaRes.rows.length === 0) throw `Talla "${TALLA}" no existe`;
  const talla_id = tallaRes.rows[0].id;

  // BUSCAR ID DE ESTADO EN estados_prenda
  // Buscamos por la columna "codigo" de tu tabla de estados (DISPONIBLE, APARTADA, VENDIDA)
  const estadoRes = await db.query(
    'SELECT id FROM estados_prenda WHERE codigo = $1', 
    [ESTATUS?.toUpperCase().trim() || 'DISPONIBLE']
  );
  
  if (!estadoRes.rows || estadoRes.rows.length === 0) {
    throw `El estado "${ESTATUS}" no es válido. Use: DISPONIBLE, APARTADA o VENDIDA`;
  }
  const estado_id = estadoRes.rows[0].id;

  return await registrarPrenda({
    categoria_id,
    estilo_id,
    estado_id,
    talla_id,
    color: COLOR || 'VARIOS',
    precio: parseFloat(PRECIO) || 0
  });
};