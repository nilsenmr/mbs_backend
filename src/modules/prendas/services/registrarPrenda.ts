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
  
  // Extraemos la raíz (Ej: si es 'VE-CAS' o simplemente 'VE', se queda con 'VE')
  const rootPrefijo = catRes.rows[0].codigo.split('-')[0];
  let prefijo = catRes.rows[0].codigo;

  if (estilo_id) {
    const estRes = await db.query('SELECT codigo FROM estilos WHERE id = $1', [estilo_id]);
    if (estRes.rowCount === 0) throw 'Estilo inválido';
    prefijo = `${prefijo}-${estRes.rows[0].codigo}`;
  }

  // 🔥 NUEVO AJUSTE: Buscamos el código con el número más alto real de toda la marca raíz (Ej: 'VE-%')
  // Ordenamos extrayendo los dígitos finales como entero para saltar baches del Excel
  const maxCodigoRes = await db.query(
    `SELECT codigo FROM prendas 
     WHERE codigo LIKE $1 
     ORDER BY CAST(SUBSTRING(codigo FROM '-([0-9]+)$') AS INTEGER) DESC 
     LIMIT 1`, 
    [`${rootPrefijo}-%`]
  );

  let siguienteCorrelativo = 1;

  if ((maxCodigoRes.rowCount ?? 0) > 0) {
    const ultimoCodigo = maxCodigoRes.rows[0].codigo; // Ej: "VE-DEP-0042" o "VE-CAS-0042"
    const partesCodigo = ultimoCodigo.split('-');
    const ultimoNumeroStr = partesCodigo[partesCodigo.length - 1]; // Extrae "0042"
    const ultimoNumero = parseInt(ultimoNumeroStr, 10);
    
    siguienteCorrelativo = ultimoNumero + 1; // Hará el salto correcto a 43
  }

  const correlativoFormateado = String(siguienteCorrelativo).padStart(4, '0');
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

// 🌟 ESTA FUNCIÓN SE MANTIENE INTACTA, SIN CAMBIOS NI DAÑOS
export const registrarPrendaDesdeExcel = async (datosPrenda: any) => {
  const { CODIGO, TALLA, COLOR, ESTATUS, PRECIO } = datosPrenda;

  if (!CODIGO) throw 'Falta columna CODIGO';

  const partes = CODIGO.toUpperCase().trim().split('-');
  const siglaCategoria = partes[0];
  const siglaEstilo = partes.length > 1 ? partes[1] : null;

  const catRes = await db.query('SELECT id FROM categorias WHERE codigo = $1', [siglaCategoria]);
  if (!catRes.rows || catRes.rows.length === 0) throw `Sigla categoría "${siglaCategoria}" no existe`;
  const categoria_id = catRes.rows[0].id;

  let estilo_id = null;
  if (siglaEstilo) {
    const estRes = await db.query('SELECT id FROM estilos WHERE codigo = $1', [siglaEstilo]);
    if (estRes.rows && estRes.rows.length > 0) estilo_id = estRes.rows[0].id;
  }

  const tallaRes = await db.query('SELECT id FROM tallas WHERE nombre ILIKE $1', [TALLA?.trim()]);
  if (!tallaRes.rows || tallaRes.rows.length === 0) throw `Talla "${TALLA}" no existe`;
  const talla_id = tallaRes.rows[0].id;

  const estadoRes = await db.query(
    'SELECT id FROM estados_prenda WHERE codigo = $1', 
    [ESTATUS?.toUpperCase().trim() || 'DISPONIBLE']
  );
  if (!estadoRes.rows || estadoRes.rows.length === 0) throw `Estado "${ESTATUS}" inválido`;
  const estado_id = estadoRes.rows[0].id;

  const baseRepo = "https://raw.githubusercontent.com/nilsenmr/imagenes/main/";
  const codigoLimpio = CODIGO.toUpperCase().trim();
  const urlReferencial = `${baseRepo}${codigoLimpio}.jpeg`;
  const urlReal = `${baseRepo}${codigoLimpio}-real.jpeg`;

  await db.query(
    `INSERT INTO prendas (
      categoria_id, estilo_id, estado_id, talla_id,
      color, precio, imagen_real, imagen_referencial, codigo, created_by
    ) VALUES ($1,$2,$3,$4,$5,$6,$7,$8,$9,$10)
    ON CONFLICT (codigo) 
    DO UPDATE SET 
      estado_id = EXCLUDED.estado_id,
      talla_id = EXCLUDED.talla_id,
      color = EXCLUDED.color,
      precio = EXCLUDED.precio,
      categoria_id = EXCLUDED.categoria_id,
      estilo_id = EXCLUDED.estilo_id
    `,
    [
      categoria_id,
      estilo_id,
      estado_id,
      talla_id,
      COLOR || 'VARIOS',
      parseFloat(PRECIO) || 0,
      urlReal,        
      urlReferencial, 
      codigoLimpio,
      'excel_import'
    ]
  );

  return { mensaje: 'Procesado', codigo: codigoLimpio };
};