--
-- PostgreSQL database dump
--

\restrict 0b0HjLTGKNnIMWkiMqhZbThhVloMWywAl3LtS8avkTeoy4nDZHrdZ59lFPdU24e

-- Dumped from database version 16.10
-- Dumped by pg_dump version 16.10

-- Started on 2026-02-23 21:46:57

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 5 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: pg_database_owner
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO pg_database_owner;

--
-- TOC entry 4982 (class 0 OID 0)
-- Dependencies: 5
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: pg_database_owner
--

COMMENT ON SCHEMA public IS 'standard public schema';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 216 (class 1259 OID 16398)
-- Name: categorias; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.categorias (
    id integer NOT NULL,
    codigo character varying(255) NOT NULL,
    nombre character varying(255) NOT NULL
);


ALTER TABLE public.categorias OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 16403)
-- Name: categorias_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.categorias_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.categorias_id_seq OWNER TO postgres;

--
-- TOC entry 4983 (class 0 OID 0)
-- Dependencies: 217
-- Name: categorias_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.categorias_id_seq OWNED BY public.categorias.id;


--
-- TOC entry 236 (class 1259 OID 24659)
-- Name: clientes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.clientes (
    id integer NOT NULL,
    nombre character varying(100) NOT NULL,
    apellido character varying(100),
    telefono character varying(20),
    id_estado integer DEFAULT 1 NOT NULL,
    fecha_creacion timestamp without time zone DEFAULT ((CURRENT_TIMESTAMP AT TIME ZONE 'UTC'::text) AT TIME ZONE 'America/Caracas'::text)
);


ALTER TABLE public.clientes OWNER TO postgres;

--
-- TOC entry 235 (class 1259 OID 24658)
-- Name: clientes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.clientes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.clientes_id_seq OWNER TO postgres;

--
-- TOC entry 4984 (class 0 OID 0)
-- Dependencies: 235
-- Name: clientes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.clientes_id_seq OWNED BY public.clientes.id;


--
-- TOC entry 238 (class 1259 OID 24666)
-- Name: estados_cliente; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.estados_cliente (
    id integer NOT NULL,
    nombre character varying(50) NOT NULL,
    descripcion character varying(200),
    fecha_creacion timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.estados_cliente OWNER TO postgres;

--
-- TOC entry 237 (class 1259 OID 24665)
-- Name: estados_cliente_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.estados_cliente_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.estados_cliente_id_seq OWNER TO postgres;

--
-- TOC entry 4985 (class 0 OID 0)
-- Dependencies: 237
-- Name: estados_cliente_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.estados_cliente_id_seq OWNED BY public.estados_cliente.id;


--
-- TOC entry 227 (class 1259 OID 24591)
-- Name: estados_pago; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.estados_pago (
    id integer NOT NULL,
    nombre character varying(20) NOT NULL,
    descripcion character varying(255)
);


ALTER TABLE public.estados_pago OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 24590)
-- Name: estados_pago_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.estados_pago_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.estados_pago_id_seq OWNER TO postgres;

--
-- TOC entry 4986 (class 0 OID 0)
-- Dependencies: 226
-- Name: estados_pago_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.estados_pago_id_seq OWNED BY public.estados_pago.id;


--
-- TOC entry 218 (class 1259 OID 16404)
-- Name: estados_prenda; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.estados_prenda (
    id integer NOT NULL,
    codigo character varying(255) NOT NULL,
    descripcion character varying(255)
);


ALTER TABLE public.estados_prenda OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16409)
-- Name: estados_prenda_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.estados_prenda_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.estados_prenda_id_seq OWNER TO postgres;

--
-- TOC entry 4987 (class 0 OID 0)
-- Dependencies: 219
-- Name: estados_prenda_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.estados_prenda_id_seq OWNED BY public.estados_prenda.id;


--
-- TOC entry 220 (class 1259 OID 16410)
-- Name: estilos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.estilos (
    id integer NOT NULL,
    codigo character varying(255) NOT NULL,
    nombre character varying(255) NOT NULL
);


ALTER TABLE public.estilos OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 16415)
-- Name: estilos_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.estilos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.estilos_id_seq OWNER TO postgres;

--
-- TOC entry 4988 (class 0 OID 0)
-- Dependencies: 221
-- Name: estilos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.estilos_id_seq OWNED BY public.estilos.id;


--
-- TOC entry 234 (class 1259 OID 24644)
-- Name: modalidades_pago; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.modalidades_pago (
    id integer NOT NULL,
    nombre character varying(50) NOT NULL,
    cantidad_cuotas integer NOT NULL,
    descripcion character varying(255)
);


ALTER TABLE public.modalidades_pago OWNER TO postgres;

--
-- TOC entry 233 (class 1259 OID 24643)
-- Name: modalidades_pago_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.modalidades_pago_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.modalidades_pago_id_seq OWNER TO postgres;

--
-- TOC entry 4989 (class 0 OID 0)
-- Dependencies: 233
-- Name: modalidades_pago_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.modalidades_pago_id_seq OWNED BY public.modalidades_pago.id;


--
-- TOC entry 222 (class 1259 OID 16416)
-- Name: prendas_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.prendas_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.prendas_id_seq OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 16417)
-- Name: prendas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.prendas (
    id integer DEFAULT nextval('public.prendas_id_seq'::regclass) NOT NULL,
    categoria_id integer NOT NULL,
    estilo_id integer,
    estado_id integer NOT NULL,
    talla_id integer NOT NULL,
    color character varying(255) NOT NULL,
    precio numeric NOT NULL,
    imagen_real character varying(255),
    imagen_referencial character varying(255),
    codigo character varying(255) NOT NULL,
    updated_by character varying(255),
    updated_at timestamp without time zone,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    created_by text
);


ALTER TABLE public.prendas OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 16424)
-- Name: tallas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tallas (
    id integer NOT NULL,
    nombre character varying(255) NOT NULL
);


ALTER TABLE public.tallas OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 16429)
-- Name: tallas_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tallas_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.tallas_id_seq OWNER TO postgres;

--
-- TOC entry 4990 (class 0 OID 0)
-- Dependencies: 225
-- Name: tallas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tallas_id_seq OWNED BY public.tallas.id;


--
-- TOC entry 232 (class 1259 OID 24624)
-- Name: venta_cuotas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.venta_cuotas (
    id integer NOT NULL,
    id_venta character varying(20),
    numero_cuota character varying(20),
    fecha_vencimiento date NOT NULL,
    monto_cuota numeric(10,2) NOT NULL,
    id_estado_pago integer DEFAULT 1
);


ALTER TABLE public.venta_cuotas OWNER TO postgres;

--
-- TOC entry 231 (class 1259 OID 24623)
-- Name: venta_cuotas_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.venta_cuotas_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.venta_cuotas_id_seq OWNER TO postgres;

--
-- TOC entry 4991 (class 0 OID 0)
-- Dependencies: 231
-- Name: venta_cuotas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.venta_cuotas_id_seq OWNED BY public.venta_cuotas.id;


--
-- TOC entry 230 (class 1259 OID 24612)
-- Name: venta_detalles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.venta_detalles (
    id integer NOT NULL,
    id_venta character varying(20),
    codigo_prenda character varying(50),
    precio_unitario numeric(10,2)
);


ALTER TABLE public.venta_detalles OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 24611)
-- Name: venta_detalles_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.venta_detalles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.venta_detalles_id_seq OWNER TO postgres;

--
-- TOC entry 4992 (class 0 OID 0)
-- Dependencies: 229
-- Name: venta_detalles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.venta_detalles_id_seq OWNED BY public.venta_detalles.id;


--
-- TOC entry 228 (class 1259 OID 24599)
-- Name: ventas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ventas (
    id_venta character varying(20) NOT NULL,
    cliente_id integer NOT NULL,
    fecha_venta date DEFAULT CURRENT_DATE NOT NULL,
    monto_total numeric(10,2) NOT NULL,
    id_estado_pago integer DEFAULT 1,
    id_modalidad integer DEFAULT 1
);


ALTER TABLE public.ventas OWNER TO postgres;

--
-- TOC entry 4743 (class 2604 OID 16430)
-- Name: categorias id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categorias ALTER COLUMN id SET DEFAULT nextval('public.categorias_id_seq'::regclass);


--
-- TOC entry 4757 (class 2604 OID 24662)
-- Name: clientes id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clientes ALTER COLUMN id SET DEFAULT nextval('public.clientes_id_seq'::regclass);


--
-- TOC entry 4760 (class 2604 OID 24669)
-- Name: estados_cliente id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estados_cliente ALTER COLUMN id SET DEFAULT nextval('public.estados_cliente_id_seq'::regclass);


--
-- TOC entry 4749 (class 2604 OID 24594)
-- Name: estados_pago id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estados_pago ALTER COLUMN id SET DEFAULT nextval('public.estados_pago_id_seq'::regclass);


--
-- TOC entry 4744 (class 2604 OID 16431)
-- Name: estados_prenda id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estados_prenda ALTER COLUMN id SET DEFAULT nextval('public.estados_prenda_id_seq'::regclass);


--
-- TOC entry 4745 (class 2604 OID 16432)
-- Name: estilos id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estilos ALTER COLUMN id SET DEFAULT nextval('public.estilos_id_seq'::regclass);


--
-- TOC entry 4756 (class 2604 OID 24647)
-- Name: modalidades_pago id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.modalidades_pago ALTER COLUMN id SET DEFAULT nextval('public.modalidades_pago_id_seq'::regclass);


--
-- TOC entry 4748 (class 2604 OID 16433)
-- Name: tallas id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tallas ALTER COLUMN id SET DEFAULT nextval('public.tallas_id_seq'::regclass);


--
-- TOC entry 4754 (class 2604 OID 24627)
-- Name: venta_cuotas id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.venta_cuotas ALTER COLUMN id SET DEFAULT nextval('public.venta_cuotas_id_seq'::regclass);


--
-- TOC entry 4753 (class 2604 OID 24615)
-- Name: venta_detalles id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.venta_detalles ALTER COLUMN id SET DEFAULT nextval('public.venta_detalles_id_seq'::regclass);


--
-- TOC entry 4954 (class 0 OID 16398)
-- Dependencies: 216
-- Data for Name: categorias; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.categorias (id, codigo, nombre) FROM stdin;
8	BZ	Blazer
9	CH	Chaqueta
10	BD	Body
11	SU	Sudadera
12	TO	Top
13	LC	Licra
14	FL	Falda
2	BL	Blusa
3	ST	Suéter
4	CJ	Conjunto
5	MN	Mono
1	VE	Vestido
15	SH	Short
7	BR	Braga
6	TB	Traje de baño
\.


--
-- TOC entry 4974 (class 0 OID 24659)
-- Dependencies: 236
-- Data for Name: clientes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.clientes (id, nombre, apellido, telefono, id_estado, fecha_creacion) FROM stdin;
2	NORCARLY	\N	\N	1	2026-02-22 13:57:48.344872
3	CLARIBEL	\N	\N	1	2026-02-22 13:57:48.344872
4	YOGLEIDYS	\N	\N	1	2026-02-22 13:57:48.344872
5	KEILA	\N	\N	1	2026-02-22 13:57:48.344872
6	KISBEL	\N	\N	1	2026-02-22 13:57:48.344872
7	MAYELA	\N	\N	1	2026-02-22 13:57:48.344872
8	NAYIBET	\N	\N	1	2026-02-22 13:57:48.344872
9	GREICY	\N	\N	1	2026-02-22 13:57:48.344872
1	NILSEN	MARTINEZ	04241987215	1	2026-02-22 13:57:48.344872
\.


--
-- TOC entry 4976 (class 0 OID 24666)
-- Dependencies: 238
-- Data for Name: estados_cliente; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.estados_cliente (id, nombre, descripcion, fecha_creacion) FROM stdin;
1	ACTIVO	Cliente activo que puede realizar compras	2026-02-21 23:48:10.313847
2	INACTIVO	Cliente inactivo temporalmente	2026-02-21 23:48:10.313847
3	SUSPENDIDO	Cliente suspendido por incumplimientos	2026-02-21 23:48:10.313847
4	MOROSO	Cliente con pagos pendientes	2026-02-21 23:48:10.313847
5	PENDIENTE	Cliente en proceso de verificación	2026-02-21 23:48:10.313847
6	VIP	Cliente con beneficios especiales	2026-02-21 23:48:10.313847
7	BLOQUEADO	Cliente bloqueado permanentemente	2026-02-21 23:48:10.313847
\.


--
-- TOC entry 4965 (class 0 OID 24591)
-- Dependencies: 227
-- Data for Name: estados_pago; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.estados_pago (id, nombre, descripcion) FROM stdin;
1	Pendiente	El cliente aún no ha realizado el pago
2	Pagado	Pago completado totalmente
3	Atrasado	La fecha de vencimiento ha pasado sin recibir el pago
4	Parcial	El cliente hizo un abono pero aún tiene saldo
\.


--
-- TOC entry 4956 (class 0 OID 16404)
-- Dependencies: 218
-- Data for Name: estados_prenda; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.estados_prenda (id, codigo, descripcion) FROM stdin;
1	DISPONIBLE	Prenda disponible para la venta
2	APARTADA	Prenda reservada por un cliente
3	VENDIDA	Prenda ya vendida
\.


--
-- TOC entry 4958 (class 0 OID 16410)
-- Dependencies: 220
-- Data for Name: estilos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.estilos (id, codigo, nombre) FROM stdin;
3	DEP	Deportivo
1	CAS	Casual
2	FOR	Formal
4	PAR	2 pz
5	ENT	Entero
\.


--
-- TOC entry 4972 (class 0 OID 24644)
-- Dependencies: 234
-- Data for Name: modalidades_pago; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.modalidades_pago (id, nombre, cantidad_cuotas, descripcion) FROM stdin;
1	Pago Completo	1	Venta liquidada en un solo pago
2	Plan 2 Cuotas	2	Venta dividida en dos pagos quincenales
3	Plan 4 Cuotas	4	Venta dividida en cuatro pagos semanales
\.


--
-- TOC entry 4961 (class 0 OID 16417)
-- Dependencies: 223
-- Data for Name: prendas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.prendas (id, categoria_id, estilo_id, estado_id, talla_id, color, precio, imagen_real, imagen_referencial, codigo, updated_by, updated_at, created_at, created_by) FROM stdin;
1	6	4	1	4	AZUL	19	https://raw.githubusercontent.com/nilsenmr/imagenes/main/TB-PAR-0001-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/TB-PAR-0001.jpeg	TB-PAR-0001	\N	\N	2026-02-21 04:31:01.962003	excel_import
2	6	4	1	4	MARRÓN	19	https://raw.githubusercontent.com/nilsenmr/imagenes/main/TB-PAR-0002-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/TB-PAR-0002.jpeg	TB-PAR-0002	\N	\N	2026-02-21 04:31:01.966617	excel_import
3	6	4	1	4	NEGRO	19	https://raw.githubusercontent.com/nilsenmr/imagenes/main/TB-PAR-0003-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/TB-PAR-0003.jpeg	TB-PAR-0003	\N	\N	2026-02-21 04:31:01.968712	excel_import
4	6	4	1	5	AZUL	19	https://raw.githubusercontent.com/nilsenmr/imagenes/main/TB-PAR-0004-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/TB-PAR-0004.jpeg	TB-PAR-0004	\N	\N	2026-02-21 04:31:01.97051	excel_import
5	6	4	1	5	VERDE	19	https://raw.githubusercontent.com/nilsenmr/imagenes/main/TB-PAR-0005-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/TB-PAR-0005.jpeg	TB-PAR-0005	\N	\N	2026-02-21 04:31:01.972708	excel_import
6	6	4	3	2	GRIS	19	https://raw.githubusercontent.com/nilsenmr/imagenes/main/TB-PAR-0006-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/TB-PAR-0006.jpeg	TB-PAR-0006	\N	\N	2026-02-21 04:31:01.974995	excel_import
7	6	5	1	2	NEGRO	19	https://raw.githubusercontent.com/nilsenmr/imagenes/main/TB-ENT-0007-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/TB-ENT-0007.jpeg	TB-ENT-0007	\N	\N	2026-02-21 04:31:01.977988	excel_import
8	6	4	3	2	ROSADO	19	https://raw.githubusercontent.com/nilsenmr/imagenes/main/TB-PAR-0008-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/TB-PAR-0008.jpeg	TB-PAR-0008	\N	\N	2026-02-21 04:31:01.980254	excel_import
9	6	4	3	2	ROSADO	19	https://raw.githubusercontent.com/nilsenmr/imagenes/main/TB-PAR-0009-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/TB-PAR-0009.jpeg	TB-PAR-0009	\N	\N	2026-02-21 04:31:01.982463	excel_import
10	6	5	3	2	MARRÓN	19	https://raw.githubusercontent.com/nilsenmr/imagenes/main/TB-ENT-0010-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/TB-ENT-0010.jpeg	TB-ENT-0010	\N	\N	2026-02-21 04:31:01.985045	excel_import
11	6	4	1	2	ROJO/AZUL	19	https://raw.githubusercontent.com/nilsenmr/imagenes/main/TB-PAR-0011-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/TB-PAR-0011.jpeg	TB-PAR-0011	\N	\N	2026-02-21 04:31:01.98742	excel_import
12	6	4	1	2	MELON	19	https://raw.githubusercontent.com/nilsenmr/imagenes/main/TB-PAR-0012-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/TB-PAR-0012.jpeg	TB-PAR-0012	\N	\N	2026-02-21 04:31:01.989628	excel_import
13	6	4	1	2	VERDE	19	https://raw.githubusercontent.com/nilsenmr/imagenes/main/TB-PAR-0013-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/TB-PAR-0013.jpeg	TB-PAR-0013	\N	\N	2026-02-21 04:31:01.992131	excel_import
14	6	5	1	2	GUAYABA	19	https://raw.githubusercontent.com/nilsenmr/imagenes/main/TB-ENT-0014-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/TB-ENT-0014.jpeg	TB-ENT-0014	\N	\N	2026-02-21 04:31:01.994463	excel_import
15	6	4	1	3	VINOTINTO	19	https://raw.githubusercontent.com/nilsenmr/imagenes/main/TB-PAR-0015-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/TB-PAR-0015.jpeg	TB-PAR-0015	\N	\N	2026-02-21 04:31:01.996653	excel_import
16	6	4	1	3	BLANCO/NEGRO	19	https://raw.githubusercontent.com/nilsenmr/imagenes/main/TB-PAR-0016-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/TB-PAR-0016.jpeg	TB-PAR-0016	\N	\N	2026-02-21 04:31:01.998909	excel_import
17	6	5	1	3	AZUL	19	https://raw.githubusercontent.com/nilsenmr/imagenes/main/TB-ENT-0017-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/TB-ENT-0017.jpeg	TB-ENT-0017	\N	\N	2026-02-21 04:31:02.001292	excel_import
18	6	4	1	3	ROSADO	19	https://raw.githubusercontent.com/nilsenmr/imagenes/main/TB-PAR-0018-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/TB-PAR-0018.jpeg	TB-PAR-0018	\N	\N	2026-02-21 04:31:02.003511	excel_import
19	6	4	1	3	NEGRO	19	https://raw.githubusercontent.com/nilsenmr/imagenes/main/TB-PAR-0019-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/TB-PAR-0019.jpeg	TB-PAR-0019	\N	\N	2026-02-21 04:31:02.006041	excel_import
20	6	5	3	3	AZUL	19	https://raw.githubusercontent.com/nilsenmr/imagenes/main/TB-ENT-0020-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/TB-ENT-0020.jpeg	TB-ENT-0020	\N	\N	2026-02-21 04:31:02.008445	excel_import
21	6	4	1	3	MARRÓN	19	https://raw.githubusercontent.com/nilsenmr/imagenes/main/TB-PAR-0021-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/TB-PAR-0021.jpeg	TB-PAR-0021	\N	\N	2026-02-21 04:31:02.010643	excel_import
22	6	4	1	3	FUCSIA	19	https://raw.githubusercontent.com/nilsenmr/imagenes/main/TB-PAR-0022-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/TB-PAR-0022.jpeg	TB-PAR-0022	\N	\N	2026-02-21 04:31:02.012789	excel_import
23	6	4	1	3	NARANJA	19	https://raw.githubusercontent.com/nilsenmr/imagenes/main/TB-PAR-0023-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/TB-PAR-0023.jpeg	TB-PAR-0023	\N	\N	2026-02-21 04:31:02.014984	excel_import
24	6	4	1	3	NEGRO	19	https://raw.githubusercontent.com/nilsenmr/imagenes/main/TB-PAR-0024-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/TB-PAR-0024.jpeg	TB-PAR-0024	\N	\N	2026-02-21 04:31:02.017155	excel_import
25	6	4	1	3	AZUL	19	https://raw.githubusercontent.com/nilsenmr/imagenes/main/TB-PAR-0025-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/TB-PAR-0025.jpeg	TB-PAR-0025	\N	\N	2026-02-21 04:31:02.019298	excel_import
26	6	4	1	3	BLANCO/NEGRO	19	https://raw.githubusercontent.com/nilsenmr/imagenes/main/TB-PAR-0026-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/TB-PAR-0026.jpeg	TB-PAR-0026	\N	\N	2026-02-21 04:31:02.021473	excel_import
27	6	4	1	3	BLANCO/NEGRO	19	https://raw.githubusercontent.com/nilsenmr/imagenes/main/TB-PAR-0027-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/TB-PAR-0027.jpeg	TB-PAR-0027	\N	\N	2026-02-21 04:31:02.023608	excel_import
28	6	4	1	2	BLANCO/FLORES	19	https://raw.githubusercontent.com/nilsenmr/imagenes/main/TB-PAR-0028-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/TB-PAR-0028.jpeg	TB-PAR-0028	\N	\N	2026-02-21 04:31:02.026451	excel_import
29	6	5	1	1	NEGRO	19	https://raw.githubusercontent.com/nilsenmr/imagenes/main/TB-ENT-0029-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/TB-ENT-0029.jpeg	TB-ENT-0029	\N	\N	2026-02-21 04:31:02.028567	excel_import
30	6	5	1	4	BLANCO/ESTAMPADO	19	https://raw.githubusercontent.com/nilsenmr/imagenes/main/TB-ENT-0030-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/TB-ENT-0030.jpeg	TB-ENT-0030	admin_web	2026-02-21 14:41:32.827	2026-02-21 04:31:02.031112	excel_import
\.


--
-- TOC entry 4962 (class 0 OID 16424)
-- Dependencies: 224
-- Data for Name: tallas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tallas (id, nombre) FROM stdin;
1	XS
2	S
3	M
4	L
5	XL
6	XXL
7	3XL
8	4XL
9	U
\.


--
-- TOC entry 4970 (class 0 OID 24624)
-- Dependencies: 232
-- Data for Name: venta_cuotas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.venta_cuotas (id, id_venta, numero_cuota, fecha_vencimiento, monto_cuota, id_estado_pago) FROM stdin;
\.


--
-- TOC entry 4968 (class 0 OID 24612)
-- Dependencies: 230
-- Data for Name: venta_detalles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.venta_detalles (id, id_venta, codigo_prenda, precio_unitario) FROM stdin;
\.


--
-- TOC entry 4966 (class 0 OID 24599)
-- Dependencies: 228
-- Data for Name: ventas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ventas (id_venta, cliente_id, fecha_venta, monto_total, id_estado_pago, id_modalidad) FROM stdin;
\.


--
-- TOC entry 4993 (class 0 OID 0)
-- Dependencies: 217
-- Name: categorias_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.categorias_id_seq', 15, true);


--
-- TOC entry 4994 (class 0 OID 0)
-- Dependencies: 235
-- Name: clientes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.clientes_id_seq', 9, true);


--
-- TOC entry 4995 (class 0 OID 0)
-- Dependencies: 237
-- Name: estados_cliente_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.estados_cliente_id_seq', 7, true);


--
-- TOC entry 4996 (class 0 OID 0)
-- Dependencies: 226
-- Name: estados_pago_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.estados_pago_id_seq', 4, true);


--
-- TOC entry 4997 (class 0 OID 0)
-- Dependencies: 219
-- Name: estados_prenda_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.estados_prenda_id_seq', 1, false);


--
-- TOC entry 4998 (class 0 OID 0)
-- Dependencies: 221
-- Name: estilos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.estilos_id_seq', 5, true);


--
-- TOC entry 4999 (class 0 OID 0)
-- Dependencies: 233
-- Name: modalidades_pago_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.modalidades_pago_id_seq', 3, true);


--
-- TOC entry 5000 (class 0 OID 0)
-- Dependencies: 222
-- Name: prendas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.prendas_id_seq', 30, true);


--
-- TOC entry 5001 (class 0 OID 0)
-- Dependencies: 225
-- Name: tallas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tallas_id_seq', 9, true);


--
-- TOC entry 5002 (class 0 OID 0)
-- Dependencies: 231
-- Name: venta_cuotas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.venta_cuotas_id_seq', 1, false);


--
-- TOC entry 5003 (class 0 OID 0)
-- Dependencies: 229
-- Name: venta_detalles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.venta_detalles_id_seq', 1, false);


--
-- TOC entry 4763 (class 2606 OID 24783)
-- Name: categorias categorias_codigo_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categorias
    ADD CONSTRAINT categorias_codigo_key UNIQUE (codigo);


--
-- TOC entry 4765 (class 2606 OID 16437)
-- Name: categorias categorias_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categorias
    ADD CONSTRAINT categorias_pkey PRIMARY KEY (id);


--
-- TOC entry 4795 (class 2606 OID 24664)
-- Name: clientes clientes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clientes
    ADD CONSTRAINT clientes_pkey PRIMARY KEY (id);


--
-- TOC entry 4797 (class 2606 OID 24674)
-- Name: estados_cliente estados_cliente_nombre_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estados_cliente
    ADD CONSTRAINT estados_cliente_nombre_key UNIQUE (nombre);


--
-- TOC entry 4799 (class 2606 OID 24672)
-- Name: estados_cliente estados_cliente_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estados_cliente
    ADD CONSTRAINT estados_cliente_pkey PRIMARY KEY (id);


--
-- TOC entry 4783 (class 2606 OID 24598)
-- Name: estados_pago estados_pago_nombre_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estados_pago
    ADD CONSTRAINT estados_pago_nombre_key UNIQUE (nombre);


--
-- TOC entry 4785 (class 2606 OID 24596)
-- Name: estados_pago estados_pago_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estados_pago
    ADD CONSTRAINT estados_pago_pkey PRIMARY KEY (id);


--
-- TOC entry 4767 (class 2606 OID 24761)
-- Name: estados_prenda estados_prenda_codigo_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estados_prenda
    ADD CONSTRAINT estados_prenda_codigo_key UNIQUE (codigo);


--
-- TOC entry 4769 (class 2606 OID 16441)
-- Name: estados_prenda estados_prenda_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estados_prenda
    ADD CONSTRAINT estados_prenda_pkey PRIMARY KEY (id);


--
-- TOC entry 4771 (class 2606 OID 24745)
-- Name: estilos estilos_codigo_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estilos
    ADD CONSTRAINT estilos_codigo_key UNIQUE (codigo);


--
-- TOC entry 4773 (class 2606 OID 16445)
-- Name: estilos estilos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estilos
    ADD CONSTRAINT estilos_pkey PRIMARY KEY (id);


--
-- TOC entry 4793 (class 2606 OID 24651)
-- Name: modalidades_pago modalidades_pago_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.modalidades_pago
    ADD CONSTRAINT modalidades_pago_pkey PRIMARY KEY (id);


--
-- TOC entry 4775 (class 2606 OID 24720)
-- Name: prendas prendas_codigo_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.prendas
    ADD CONSTRAINT prendas_codigo_key UNIQUE (codigo);


--
-- TOC entry 4777 (class 2606 OID 16449)
-- Name: prendas prendas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.prendas
    ADD CONSTRAINT prendas_pkey PRIMARY KEY (id);


--
-- TOC entry 4779 (class 2606 OID 24692)
-- Name: tallas tallas_nombre_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tallas
    ADD CONSTRAINT tallas_nombre_key UNIQUE (nombre);


--
-- TOC entry 4781 (class 2606 OID 16453)
-- Name: tallas tallas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tallas
    ADD CONSTRAINT tallas_pkey PRIMARY KEY (id);


--
-- TOC entry 4791 (class 2606 OID 24630)
-- Name: venta_cuotas venta_cuotas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.venta_cuotas
    ADD CONSTRAINT venta_cuotas_pkey PRIMARY KEY (id);


--
-- TOC entry 4789 (class 2606 OID 24617)
-- Name: venta_detalles venta_detalles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.venta_detalles
    ADD CONSTRAINT venta_detalles_pkey PRIMARY KEY (id);


--
-- TOC entry 4787 (class 2606 OID 24605)
-- Name: ventas ventas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ventas
    ADD CONSTRAINT ventas_pkey PRIMARY KEY (id_venta);


--
-- TOC entry 4810 (class 2606 OID 24676)
-- Name: clientes clientes_id_estado_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clientes
    ADD CONSTRAINT clientes_id_estado_fkey FOREIGN KEY (id_estado) REFERENCES public.estados_cliente(id);


--
-- TOC entry 4804 (class 2606 OID 24606)
-- Name: ventas fk_estado; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ventas
    ADD CONSTRAINT fk_estado FOREIGN KEY (id_estado_pago) REFERENCES public.estados_pago(id);


--
-- TOC entry 4808 (class 2606 OID 24636)
-- Name: venta_cuotas fk_estado_cuota; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.venta_cuotas
    ADD CONSTRAINT fk_estado_cuota FOREIGN KEY (id_estado_pago) REFERENCES public.estados_pago(id);


--
-- TOC entry 4805 (class 2606 OID 24653)
-- Name: ventas fk_modalidad; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ventas
    ADD CONSTRAINT fk_modalidad FOREIGN KEY (id_modalidad) REFERENCES public.modalidades_pago(id);


--
-- TOC entry 4806 (class 2606 OID 24721)
-- Name: venta_detalles fk_prenda_codigo; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.venta_detalles
    ADD CONSTRAINT fk_prenda_codigo FOREIGN KEY (codigo_prenda) REFERENCES public.prendas(codigo) ON UPDATE CASCADE;


--
-- TOC entry 4809 (class 2606 OID 24631)
-- Name: venta_cuotas fk_venta_cuotas; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.venta_cuotas
    ADD CONSTRAINT fk_venta_cuotas FOREIGN KEY (id_venta) REFERENCES public.ventas(id_venta) ON DELETE CASCADE;


--
-- TOC entry 4807 (class 2606 OID 24618)
-- Name: venta_detalles fk_venta_detalles; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.venta_detalles
    ADD CONSTRAINT fk_venta_detalles FOREIGN KEY (id_venta) REFERENCES public.ventas(id_venta) ON DELETE CASCADE;


--
-- TOC entry 4800 (class 2606 OID 16454)
-- Name: prendas prendas_categoria_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.prendas
    ADD CONSTRAINT prendas_categoria_id_fkey FOREIGN KEY (categoria_id) REFERENCES public.categorias(id);


--
-- TOC entry 4801 (class 2606 OID 16459)
-- Name: prendas prendas_estado_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.prendas
    ADD CONSTRAINT prendas_estado_id_fkey FOREIGN KEY (estado_id) REFERENCES public.estados_prenda(id);


--
-- TOC entry 4802 (class 2606 OID 16464)
-- Name: prendas prendas_estilo_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.prendas
    ADD CONSTRAINT prendas_estilo_id_fkey FOREIGN KEY (estilo_id) REFERENCES public.estilos(id);


--
-- TOC entry 4803 (class 2606 OID 16469)
-- Name: prendas prendas_talla_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.prendas
    ADD CONSTRAINT prendas_talla_id_fkey FOREIGN KEY (talla_id) REFERENCES public.tallas(id);


-- Completed on 2026-02-23 21:46:57

--
-- PostgreSQL database dump complete
--

\unrestrict 0b0HjLTGKNnIMWkiMqhZbThhVloMWywAl3LtS8avkTeoy4nDZHrdZ59lFPdU24e

