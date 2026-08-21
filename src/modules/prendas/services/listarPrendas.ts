import { db } from "../../../config/db";

export const listarPrendas = async () => {
  const res = await db.query(
    `SELECT 
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
    GROUP BY p.id, c.nombre, e.nombre, est.codigo, t.nombre
    ORDER BY p.id DESC`
  );

  return {
    total: res.rowCount,
    registros: res.rows
  };
};