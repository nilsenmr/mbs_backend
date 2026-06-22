#!/bin/bash

echo "======================================================="
echo "   INICIANDO PUBLICACION DESDE GIT BASH (MSB SHOP)"
echo "======================================================="

# Función para hacer commit y push solo si hay cambios
actualizar_repo() {
    local nombre=$1
    git add .
    # git diff-index --quiet HEAD devuelve 0 si no hay cambios, 1 si hay cambios
    if git diff-index --quiet HEAD --; then
        echo "ℹ️  $nombre: Sin cambios, saltando..."
    else
        git commit -m "fix: update inventario/db $(date +'%Y-%m-%d %H:%M:%S')"
        git push origin main
        echo "✅ $nombre: Actualizado correctamente."
    fi
}

# 1. Exportar y Backend
echo "[+] Generando JSON (Backend)..."
cd /c/wamp64/www/mbs_backend || { echo "❌ Error: Carpeta mbs_backend no encontrada"; exit 1; }
npm run exportar || { echo "❌ Error en npm run exportar"; exit 1; }
actualizar_repo "Backend"

# 2. Git Frontend
echo "[+] Actualizando Repo Frontend..."
cd /c/wamp64/www/mbs_frontend || { echo "❌ Error: Carpeta mbs_frontend no encontrada"; exit 1; }
actualizar_repo "Frontend"

# 3. Git Catalogo Publico
echo "[+] Actualizando Catalogo Publico..."
cd /c/wamp64/www/msb-catalogo-publico || { echo "❌ Error: Carpeta msb-catalogo-publico no encontrada"; exit 1; }
actualizar_repo "Catalogo Público"

echo "======================================================="
echo "   EXITO: Proceso finalizado."
echo "======================================================="
exit 0