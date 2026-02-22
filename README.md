## 🛠️ INSTALACIÓN Y CONFIGURACIÓN DE POSTGRESQL

Este paso instala PostgreSQL, configura el acceso remoto para la red local y establece la contraseña del usuario `postgres`.

### 1. Instalar PostgreSQL y herramientas adicionales

```
sudo apt update
sudo apt install -y postgresql postgresql-contrib
```

### 2. Habilitar acceso remoto
- Editamos el archivo de configuración para permitir conexiones externas:
```
sudo sed -i "s/^#listen_addresses = 'localhost'/listen_addresses = '*'/g" /etc/postgresql/16/main/postgresql.conf
```

- Agregamos una regla de acceso en pg_hba.conf para permitir conexiones desde la red local (ajustar según tu rango IP):
```
echo "host all all 192.168.0.0/24 md5" | sudo tee -a /etc/postgresql/16/main/pg_hba.conf
```

### 3. Reiniciar el servicio 
```
sudo systemctl restart postgresql
```

### 4. Establecer contraseña de usuario postgres:
```
sudo -u postgres psql -c "ALTER USER postgres WITH PASSWORD 'postgres';"
```

# 🧰 INSTALAR NODE.JS Y NPM
Verificar si están instalados:
```
node -v
npm -v
```


# 🧱 Despliegue Backend MSB (Node.js + TypeScript)

Este documento describe paso a paso cómo clonar, configurar y ejecutar el backend de MSB en un servidor Linux, con reinicio automático y ejecución persistente.

---

## CLONAR PROYECTO

```
git clone https://github.com/nilsenmr/MSB_BACKEND.git
cd MSB_BACKEND
```

## INSTALAR DEPENDENCIAS
```
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
```
npx ts-node src/index.ts
```

## CREAR SCRIPT DE ARRANQUE AUTOMÁTICO
```
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
```
chmod +x arrancar_backend.sh
```

## EJECUTAR EN SEGUNDO PLANO CON NOHUP
```
nohup ./arrancar_backend.sh > backend.log 2>&1 &
```

## VERIFICAR LOGS EN TIEMPO REAL
```
nohup ./arrancar_backend.sh > backend.log 2>&1 &
```

## VERIFICAR SI EL BACKEND ESTÁ CORRIENDO
```
ps aux | grep ts-node
```

## DETERNER BACKEND MANUALMENTE
```
pkill -f ts-node
```

## REINICIAR BACKEND MANUALMENTE
```
nohup ./arrancar_backend.sh > backend.log 2>&1 &
```

## VALIDAR DESDE EL NAVEGADOR O POSTMAN:

[http://192.168.0.169:3001/api/prendas/registrar-prenda]()



# 🧠 Guía Literal para Levantar el Backend con PM2 (Node.js + Express)

Esta guía permite ejecutar el backend de MSB SHOP en segundo plano, con reinicio automático y monitoreo persistente usando PM2.

---

## ✅ Requisitos Previos

Asegúrate de tener instalado:

- Node.js (v18+ recomendado)
- npm
- PM2

Instalación de PM2:

```
sudo npm install -g pm2
```

### 🚀 Levantar el Backend con PM2
Desde la raíz del proyecto backend:

```
pm2 start npm --name msb-backend -- start
```

Esto ejecuta el script npm start como proceso persistente llamado msb-backend.


### 💾 Guardar Configuración para Reinicio Automático

```
pm2 save
```

### 🔁 Habilitar Reinicio al Arrancar el Sistema
```
pm2 startup
```
Este comando mostrará una línea como esta:

```
sudo env PATH=$PATH:/home/tu_usuario/.nvm/versions/node/v18.x/bin pm2 startup systemd -u tu_usuario --hp /home/tu_usuario
```
Ejecuta esa línea tal cual para registrar el servicio.

## 🛠️ Comandos Útiles de PM2

|Acción                        | Comando                    |
|------------------------------|----------------------------|
| Ver procesos activos         | `pm2 list`                |
| Ver logs del backend         | `pm2 logs msb-backend`    |
| Monitorear en tiempo real    | `pm2 monit`               |
| Reiniciar el backend         | `pm2 restart msb-backend` |
| Detener el backend           | `pm2 stop msb-backend`    |
| Eliminar del monitoreo       | `pm2 delete msb-backend`  |

## 📦 Endpoints del Backend MSB
Una vez levantado el backend, tendrás disponibles los siguientes endpoints bajo el prefijo ```/api/prendas```:

➕ Registrar prenda
```
POST /api/prendas/registrar-prenda
```
Body esperado:
```
{
  "categoria_id": 1,
  "estado_id": 1,
  "talla_id": 2,
  "color": "Negro",
  "precio": 59.99,
  "imagen_real": "https://mi-bucket.com/real.jpg",
  "imagen_referencial": "https://mi-bucket.com/ref.jpg"
}

```

✏️ Actualizar prenda
```
POST /api/prendas/actualizar-prenda
```
Body esperado:
```
{
  "id": 3,
  "color": "Azul",
  "precio": 49.99
}
```

📋 Listar prendas con total
```
GET /api/prendas/listar-prendas
```
Respuesta:
```
{
  "total": 3,
  "registros": [
    {
      "id": 3,
      "codigo": "ST-FORMAL-1",
      "color": "Negro",
      "precio": "59.99",
      "imagen_real": "https://mi-bucket.com/real.jpg",
      "imagen_referencial": "https://mi-bucket.com/ref.jpg",
      "categoria": "Suéteres",
      "estilo": "Formal",
      "estado": "DISPONIBLE",
      "talla": "M"
    },
    {
      "id": 2,
      "codigo": "BL-CASUAL-2",
      "color": "Negro",
      "precio": "59.99",
      "imagen_real": "https://mi-bucket.com/real.jpg",
      "imagen_referencial": "https://mi-bucket.com/ref.jpg",
      "categoria": "Blusas",
      "estilo": "Casual",
      "estado": "DISPONIBLE",
      "talla": "S"
    },
    {
      "id": 1,
      "codigo": "BL-CASUAL-1",
      "color": "Negro",
      "precio": "59.99",
      "imagen_real": "https://mi-bucket.com/real.jpg",
      "imagen_referencial": "https://mi-bucket.com/ref.jpg",
      "categoria": "Blusas",
      "estilo": "Casual",
      "estado": "DISPONIBLE",
      "talla": "L"
    }
  ]
}
```

📋 Listar clientes
```
GET /api/prendas/listar-clientes
```
Respuesta:
```
[
    {
        "id": 1,
        "nombre": "NILSEN MARTINEZ",
        "apellido": null,
        "telefono": "04241987215",
        "estado": "ACTIVO",
        "id_estado": 1
    },
    {
        "id": 2,
        "nombre": "NORCARLY",
        "apellido": null,
        "telefono": null,
        "estado": "ACTIVO",
        "id_estado": 1
    },
    {
        "id": 3,
        "nombre": "CLARIBEL",
        "apellido": null,
        "telefono": null,
        "estado": "ACTIVO",
        "id_estado": 1
    },
    {
        "id": 4,
        "nombre": "YOGLEIDYS",
        "apellido": null,
        "telefono": null,
        "estado": "ACTIVO",
        "id_estado": 1
    },
    {
        "id": 5,
        "nombre": "KEILA",
        "apellido": null,
        "telefono": null,
        "estado": "ACTIVO",
        "id_estado": 1
    },
    {
        "id": 6,
        "nombre": "KISBEL",
        "apellido": null,
        "telefono": null,
        "estado": "ACTIVO",
        "id_estado": 1
    },
    {
        "id": 7,
        "nombre": "MAYELA",
        "apellido": null,
        "telefono": null,
        "estado": "ACTIVO",
        "id_estado": 1
    },
    {
        "id": 8,
        "nombre": "NAYIBET",
        "apellido": null,
        "telefono": null,
        "estado": "ACTIVO",
        "id_estado": 1
    },
    {
        "id": 9,
        "nombre": "GREICY",
        "apellido": null,
        "telefono": null,
        "estado": "ACTIVO",
        "id_estado": 1
    }
]
```
💻 Listar datos maestros
```
GET /api/prendas/maestros-prendas
```
Respuesta:
```
{
    "success": true,
    "data": {
        "categorias": [
            {
                "value": 8,
                "label": "Blazer"
            },
            {
                "value": 2,
                "label": "Blusa"
            },
            {
                "value": 10,
                "label": "Body"
            },
            {
                "value": 7,
                "label": "Braga"
            },
            {
                "value": 9,
                "label": "Chaqueta"
            },
            {
                "value": 4,
                "label": "Conjunto"
            },
            {
                "value": 14,
                "label": "Falda"
            },
            {
                "value": 13,
                "label": "Licra"
            },
            {
                "value": 5,
                "label": "Mono"
            },
            {
                "value": 15,
                "label": "Short"
            },
            {
                "value": 11,
                "label": "Sudadera"
            },
            {
                "value": 3,
                "label": "Suéter"
            },
            {
                "value": 12,
                "label": "Top"
            },
            {
                "value": 6,
                "label": "Traje de baño"
            },
            {
                "value": 1,
                "label": "Vestido"
            }
        ],
        "estilos": [
            {
                "value": 4,
                "label": "2 pz"
            },
            {
                "value": 1,
                "label": "Casual"
            },
            {
                "value": 3,
                "label": "Deportivo"
            },
            {
                "value": 5,
                "label": "Entero"
            },
            {
                "value": 2,
                "label": "Formal"
            }
        ],
        "estados": [
            {
                "value": 2,
                "label": "APARTADA"
            },
            {
                "value": 1,
                "label": "DISPONIBLE"
            },
            {
                "value": 3,
                "label": "VENDIDA"
            }
        ],
        "tallas": [
            {
                "value": 7,
                "label": "3XL"
            },
            {
                "value": 8,
                "label": "4XL"
            },
            {
                "value": 4,
                "label": "L"
            },
            {
                "value": 3,
                "label": "M"
            },
            {
                "value": 2,
                "label": "S"
            },
            {
                "value": 9,
                "label": "U"
            },
            {
                "value": 5,
                "label": "XL"
            },
            {
                "value": 1,
                "label": "XS"
            },
            {
                "value": 6,
                "label": "XXL"
            }
        ]
    }
}
```

## 🔁 Gestión de procesos con PM2
Esta guía documenta cómo administrar el backend msb-backend usando PM2, empezando por listar y validar duplicados, y luego aplicar acciones de eliminación, reinicio, guardado y monitoreo.

📋 Listar procesos activos
Antes de cualquier acción, valida qué procesos están corriendo:

```
pm2 list
```
Si ves más de una instancia con el mismo nombre (msb-backend), el proceso está duplicado.

🧹 Eliminar procesos duplicados
Para matar todas las instancias del proceso con nombre msb-backend:

```
pm2 delete msb-backend
Esto elimina cualquier ejecución previa y limpia el entorno.
```

🚀 Iniciar el backend nuevamente
Desde la raíz del proyecto:

```
pm2 start npm --name msb-backend -- start
```
Este comando levanta el backend usando el script start de tu package.json y lo registra bajo el nombre msb-backend.

💾 Guardar configuración para reinicio automático
```
pm2 save
```
Guarda el estado actual de los procesos para que se reinicien automáticamente al arrancar el sistema.

🔁 Reiniciar el backend manualmente
```
pm2 restart msb-backend
```
Reinicia el proceso sin detener el monitoreo ni perder el historial.

🔍 Ver logs en tiempo real
```
pm2 logs msb-backend
```




# Lo que tenemos "en cola" para el Bloque de Seguridad:
Tabla de Usuarios: Con soporte para roles, intentos fallidos y logs.

Cifrado bcrypt: Para que las claves sean indescifrables.

Middlewares de Auth: El "guardián" en el Backend que revisará el Token antes de soltar cualquier dato.

Contexto de Autenticación en React: Para que el sistema sepa si hay un usuario logueado y muestre u oculte el menú