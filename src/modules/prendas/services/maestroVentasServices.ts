import { db } from "../../../config/db";


export const obtenerMaestrosVentas = async () => {
  const [modalidades_pago] = await Promise.all([
    db.query("SELECT id AS value, nombre AS label FROM modalidades_pago ORDER BY id ASC")
  ]);

  return {
    modalidades_pago: modalidades_pago.rows
  };
};