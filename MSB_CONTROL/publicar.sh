#!/bin/bash

echo "======================================================="
echo "   INICIANDO PUBLICACION DESDE GIT BASH (MSB SHOP)"
echo "======================================================="

# 1. Exportar (Backend)
echo "[+] Generando JSON..."
cd /c/wamp64/www/mbs_backend || { echo "❌ Error: No se encontró la carpeta mbs_backend"; exit 1; }
npm run exportar || { echo "❌ Error en exportar"; exit 1; }
git commit -m "fix: update prendas.json y ventas.json $(date +'%Y-%m-%d %H:%M:%S')"
git push origin main

# 2. Git Frontend
echo "[+] Actualizando Repo Frontend..."
cd /c/wamp64/www/mbs_frontend || { echo "❌ Error: No se encontró la carpeta mbs_frontend"; exit 1; }
git add .
git commit -m "fix: update prendas.json y ventas.json $(date +'%Y-%m-%d %H:%M:%S')"
git push origin main

# 3. Git Catalogo Publico
echo "[+] Actualizando Catalogo Publico..."
cd /c/wamp64/www/msb-catalogo-publico || { echo "❌ Error: No se encontró la carpeta msb-catalogo-publico"; exit 1; }
git add .
git commit -m "fix: update prendas.json y ventas.json $(date +'%Y-%m-%d %H:%M:%S')"
git push origin main

echo "======================================================="
echo "   EXITO: Todo sincronizado correctamente."
echo "======================================================="
exit 0