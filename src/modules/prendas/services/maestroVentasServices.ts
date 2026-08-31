import { db } from "../../../config/db";

export const obtenerMaestrosVentas = async () => {
  const queryModalidades = `
    SELECT 
      m.id AS value, 
      m.nombre AS label, 
      m.cantidad_cuotas,
      f.dias_intervalo AS dias_intervalo
    FROM modalidades_pago m
    LEFT JOIN frecuencias_pago f ON m.frecuencia_id = f.id
    ORDER BY m.id ASC;
  `;

  const [modalidades_pago] = await Promise.all([
    db.query(queryModalidades)
  ]);

  return {
    modalidades_pago: modalidades_pago.rows
  };
};