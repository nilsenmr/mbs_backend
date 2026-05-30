# 📑 Especificación Técnica de la API - MSB SHOP

Todos los endpoints detallados a continuación tienen como prefijo base la ruta: `http://localhost:3001/api/prendas`

---

## 🧭 Catálogo General de Endpoints

| Módulo | Método | Endpoint | Descripción | Requiere Payload (Entrada) | Tipo de Respuesta (Salida) |
| :--- | :---: | :--- | :--- | :---: | :---: |
| **Prendas** | `GET` | `/listar-prendas` | Recupera el inventario completo con su conteo total. | No | `JSON (Objeto)` |
| **Prendas** | `POST` | `/registrar-prenda` | Inserta una nueva prenda al inventario local. | Sí | `JSON (Objeto)` |
| **Prendas** | `POST` | `/actualizar-prenda` | Modifica datos puntuales de una prenda (Precio/Color). | Sí | `JSON (Objeto)` |
| **Prendas** | `POST` | `/masivo` | Carga masiva de prendas mediante lotes de datos. | Sí | `JSON (Objeto)` |
| **Clientes** | `GET` | `/listar-clientes` | Obtiene el padrón de clientes de la tienda. | No | `JSON (Arreglo)` |
| **Clientes** | `POST` | `/registrar-cliente` | Registra un nuevo cliente en el sistema. | Sí | `JSON (Objeto)` |
| **Clientes** | `POST` | `/actualizar-cliente` | Modifica la información de un cliente existente. | Sí | `JSON (Objeto)` |
| **Ventas** | `GET` | `/listar-ventas` | Retorna el histórico de ventas (Créditos y Contados). | No | `JSON (Arreglo)` |
| **Ventas** | `POST` | `/registrar-venta` | Procesa una nueva venta calculando cuotas si aplica. | Sí | `JSON (Objeto)` |
| **Ventas** | `PATCH` | `/pagar-cuota/:id_cuota` | Registra el pago y amortización de una cuota específica. | No | `JSON (Objeto)` |
| **Ventas** | `PATCH` | `/pagar-contado/:id_venta` | Liquida el saldo de una venta totalizada bajo Contado. | No | `JSON (Objeto)` |
| **Sistema** | `POST` | `/guardar-imagen-local` | Procesa y guarda un binario en `C:\wamp64\www\imagenes`. | Sí (`Multipart`) | `JSON (Objeto)` |
| **Sistema** | `POST` | `/subir-imagenes` | Dispara `publicar_imagenes.sh` para hacer Git Push de fotos. | No | `JSON (Objeto)` |
| **Sistema** | `POST` | `/publicar-catalogo` | Dispara `publicar.sh` para exportar JSON y actualizar Web. | No | `JSON (Objeto)` |
| **Maestros** | `GET` | `/maestros-prendas` | Retorna listados dinámicos (Categorías, Tallas, Estados). | No | `JSON (Objeto)` |
| **Maestros** | `GET` | `/maestros-clientes` | Retorna los estados paramétricos de los clientes. | No | `JSON (Objeto)` |
| **Maestros** | `GET` | `/modalidad-pago` | Retorna los tipos de financiamiento de ventas. | No | `JSON (Objeto)` |

---

## 📦 Estructuras JSON de Entrada y Salida (Payloads)

### 1. Módulo de Prendas e Inventario

#### 📋 Listar Prendas (`GET /listar-prendas`)
* **Entrada:** N/A (No requiere Body).
* **Salida (200 OK):**
```json
{
  "total": 3,
  "registros": [
    {
      "id": 1,
      "codigo": "BL-CASUAL-1",
      "color": "Negro",
      "precio": "59.99",
      "imagen_real": "[https://mi-bucket.com/real.jpg](https://mi-bucket.com/real.jpg)",
      "imagen_referencial": "[https://mi-bucket.com/ref.jpg](https://mi-bucket.com/ref.jpg)",
      "categoria": "Blusas",
      "estilo": "Casual",
      "estado": "DISPONIBLE",
      "talla": "L"
    }
  ]
}
```

#### Registrar Prenda** (POST /registrar-prenda)
* **Entrada (Body JSON)**
```json
{
  "categoria_id": 2,
  "estado_id": 1,
  "talla_id": 3,
  "color": "Fucsia",
  "precio": 45.00,
  "imagen_real": "[https://images.msb.shop/PRD-102.jpeg](https://images.msb.shop/PRD-102.jpeg)",
  "imagen_referencial": ""
}
```

* **Salida (201 Created):**
```json
{
  "success": true,
  "mensaje": "Prenda registrada exitosamente.",
  "id_prenda": 102
}

```

#### Actualizar Prenda** (POST /actualizar-prenda)
* **Entrada (Body JSON)**
```json
{
  "id": 3,
  "color": "Azul Marino",
  "precio": 49.99
}
```
* **Salida (200 OK):**
```json
{
  "success": true,
  "mensaje": "Prenda actualizada correctamente."
}
```

### 2.  Módulo de Clientes
#### Listar Clientes** (GET /listar-clientes)
* **Entrada: N/A**
* **Salida (200 OK):**
```json
[
  {
    "id": 1,
    "nombre": "NILSEN MARTINEZ",
    "apellido": null,
    "telefono": "04241987215",
    "estado": "ACTIVO",
    "id_estado": 1
  }
]
```

### 3.  Módulo de Ventas y Finanzas
#### Registrar Venta** (POST /registrar-venta)
* **Entrada (Body JSON):**
```json
{
  "id_cliente": 1,
  "id_modalidad_pago": 2, 
  "monto_total": 120.00,
  "cantidad_cuotas": 4,
  "detalles": [
    { "id_prenda": 1, "precio_venta": 60.00 },
    { "id_prenda": 2, "precio_venta": 60.00 }
  ]
}
```
* **Salida (201 Created):**
```json
{
  "success": true,
  "mensaje": "Venta procesada con éxito.",
  "id_venta": 45,
  "cuotas_generadas": 4
}
```

#### Registrar Venta** (POST /registrar-venta)
* **Entrada:** Parámetro en URL (id_cuota). No requiere Body.
* **Salida (200 OK):**
```json
{
  "success": true,
  "mensaje": "Pago de cuota registrado. Saldo amortizado correctamente.",
  "saldo_restante_venta": 60.00
}
```
### 4.  Módulo de Mantenimiento y Automatización del Sistema
#### Carga Rápida de Imagen al Disco (POST /guardar-imagen-local)**
* **Entrada: Requiere cabecera multipart/form-data.
    - Campo codigoPrenda (String): Código identificador (Ej: VEST-01).
    - Campo imagen (Binary): Archivo de la fotografía.

* **Salida (200 OK):**
```json
{
  "success": true,
  "mensaje": "Imagen VEST-01.jpeg guardada con éxito en la carpeta local."
}
```

#### Sincronizar Galería de Fotos (POST /subir-imagenes)**
* **Entrada: N/A**
* **Salida (200 OK):**
```json
{
  "success": true,
  "mensaje": "Script ejecutar_imagenes.sh finalizado. Repositorio de GitHub actualizado con éxito."
}
```

#### Publicar Cambios de la Tienda (POST /publicar-catalogo)**
* **Entrada: N/A**
* **Salida (200 OK):**
```json
{
  "success": true,
  "mensaje": "Catálogo exportado a JSON. Repositorios público y frontend sincronizados en producción."
}
```
### 5.  Módulo de Datos Maestros (GET /maestros-prendas)
* **Entrada: N/A**
* **Salida (200 OK):**
```json
{
  "success": true,
  "data": {
    "categorias": [
      { "value": 1, "label": "Vestido" },
      { "value": 2, "label": "Blusa" }
    ],
    "estilos": [
      { "value": 1, "label": "Casual" },
      { "value": 2, "label": "Formal" }
    ],
    "estados": [
      { "value": 1, "label": "DISPONIBLE" },
      { "value": 3, "label": "VENDIDA" }
    ],
    "tallas": [
      { "value": 2, "label": "S" },
      { "value": 3, "label": "M" }
    ]
  }
}
```

---------------------------------------------------------------------------------------------------------------------------------
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
DB_PASSWORD=postgres
DB_NAME=postgres
DB_PORT=5432



# 🧠 Guía Literal para Levantar el Backend con PM2 (Node.js + Express)

Esta guía permite ejecutar el backend de MSB SHOP en segundo plano, con reinicio automático y monitoreo persistente usando PM2.

---


# Lo que tenemos "en cola" para el Bloque de Seguridad:
Tabla de Usuarios: Con soporte para roles, intentos fallidos y logs.

Cifrado bcrypt: Para que las claves sean indescifrables.

Middlewares de Auth: El "guardián" en el Backend que revisará el Token antes de soltar cualquier dato.

Contexto de Autenticación en React: Para que el sistema sepa si hay un usuario logueado y muestre u oculte el menú