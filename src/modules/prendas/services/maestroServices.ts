import { db } from "../../../config/db";

export const obtenerMaestrosFormulario = async () => {
  const [categorias, estilos, estados, tallas] = await Promise.all([
    db.query("SELECT id AS value, nombre AS label FROM categorias ORDER BY nombre ASC"),
    db.query("SELECT id AS value, nombre AS label FROM estilos ORDER BY nombre ASC"),
    db.query("SELECT id AS value, codigo AS label FROM estados_prenda ORDER BY codigo ASC"),
    db.query("SELECT id AS value, nombre AS label FROM tallas ORDER BY nombre ASC"),
  ]);

  return {
    categorias: categorias.rows,
    estilos: estilos.rows,
    estados: estados.rows,
    tallas: tallas.rows
  };
};