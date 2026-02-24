import { db } from "../../../config/db";

export const obtenerMaestrosCliente = async () => {
  const [estados] = await Promise.all([
    db.query("SELECT id AS value, nombre AS label FROM estados_cliente ORDER BY id ASC")
  ]);

  return {
    estados: estados.rows
  };
};