#!/bin/bash

echo "======================================================="
echo "   INICIANDO PUBLICACIÓN DE IMÁGENES (MSB SHOP)"
echo "======================================================="

# 1. Ir al repositorio local de imágenes
echo "[+] Accediendo al directorio de imágenes..."
cd /c/wamp64/www/imagenes || { echo "❌ Error: No se encontró la carpeta /c/wamp64/www/imagenes"; exit 1; }

# 2. Verificar si hay cambios reales antes de proceder
if [ -z "$(git status --porcelain)" ]; then
    echo "✅ No hay imágenes nuevas o modificadas para subir."
    echo "======================================================="
    exit 0
fi

# 3. Git Add, Commit y Push para el repositorio de imágenes
echo "[+] Añadiendo nuevas imágenes al Git..."
git add .

echo "[+] Creando Commit..."
git commit -m "media: upload/update images $(date +'%Y-%m-%d %H:%M:%S')"

echo "[+] Subiendo imágenes a GitHub (main)..."
git push origin main || { echo "❌ Error al subir las imágenes a GitHub"; exit 1; }

echo "======================================================="
echo "   ÉXITO: Todas las imágenes se sincronizaron."
echo "======================================================="
exit 0