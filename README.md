# 🧱 Despliegue Backend MSB (Node.js + TypeScript)

Este documento describe paso a paso cómo clonar, configurar y ejecutar el backend de MSB en un servidor Linux, con reinicio automático y ejecución persistente.

---

## CLONAR PROYECTO

```bash
git clone https://github.com/nilsenmr/MSB_BACKEND.git
cd MSB_BACKEND
```

## INSTALAR DEPENDENCIAS
```bash
npm install
```

## VERIFICAR O CREAR ARCHIVO
nano .env

EJEMPLO .ENV
PORT=3001
DB_HOST=localhost
DB_USER=postgres
DB_PASSWORD=tu_clave
DB_NAME=tu_base
DB_PORT=5432

## PROBAR BACKEND MANUALMENTE
```bash
npx ts-node src/index.ts
```

## CREAR SCRIPT DE ARRANQUE AUTOMÁTICO
```bash
nano arrancar_backend.sh
```

## CONTENIDO
#!/bin/bash

echo "Iniciando backend en bucle infinito..."

while true; do
    echo "[`date '+%Y-%m-%d %H:%M:%S'`] Ejecutando backend..."
    npx ts-node src/index.ts
    echo "[`date '+%Y-%m-%d %H:%M:%S'`] El backend se detuvo. Reiniciando en 5 segundos..."
    sleep 5
done

## DAR PERMISOS DE EJECUCION
```bash
chmod +x arrancar_backend.sh
```

## EJECUTAR EN SEGUNDO PLANO CON NOHUP
```bash
nohup ./arrancar_backend.sh > backend.log 2>&1 &
```

## VERIFICAR LOGS EN TIEMPO REAL
```bash
nohup ./arrancar_backend.sh > backend.log 2>&1 &
```

## VERIFICAR SI EL BACKEND ESTÁ CORRIENDO
```bash
ps aux | grep ts-node
```

## DETERNER BACKEND MANUALMENTE
```bash
pkill -f ts-node
```

## REINICIAR BACKEND MANUALMENTE
```bash
nohup ./arrancar_backend.sh > backend.log 2>&1 &
```

## VALIDAR DESDE EL NAVEGADOR O POSTMAN:

[http://192.168.0.169:3001/api/prendas/registrar-prenda]()