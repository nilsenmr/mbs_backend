--
-- PostgreSQL database dump
--

\restrict 6QKOf6TAjnfrUf00oU7hjSMJ4kAPJqvU5nEicPWeozcZU6FPNiwnSCqahSEgx4Q

-- Dumped from database version 16.10
-- Dumped by pg_dump version 16.10

-- Started on 2026-08-15 11:17:03

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
    fecha_creacion timestamp without time zone DEFAULT ((CURRENT_TIMESTAMP AT TIME ZONE 'UTC'::text) AT TIME ZONE 'VET'::text),
    fecha_actualizacion timestamp without time zone
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
    created_by character varying(255)
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
    id_modalidad integer DEFAULT 1,
    obs character varying(255),
    monto_descuento numeric(10,2)
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
16	PT	Pantalon
\.


--
-- TOC entry 4974 (class 0 OID 24659)
-- Dependencies: 236
-- Data for Name: clientes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.clientes (id, nombre, apellido, telefono, id_estado, fecha_creacion, fecha_actualizacion) FROM stdin;
21	REINA	BDV	04127232963	1	2026-06-03 23:33:40.628031	2026-08-15 10:52:39.619361
13	ANGELICA	VECINA	04241713578	1	2026-04-02 20:25:00.315405	2026-08-15 10:54:52.952142
7	MAYELA	\N	\N	1	2026-02-22 13:57:48.344872	2026-02-22 13:57:48.344872
1	NILSEN	MARTINEZ	04241987215	1	2026-02-22 13:57:48.344872	2026-03-28 11:04:16.646564
12	JUVENAL	\N	04241321343	1	2026-03-28 17:43:01.372266	\N
15	CREATIVO CN	\N	\N	1	2026-05-28 22:00:49.495312	\N
17	SHASCMEDY	\N	04265188687	1	2026-05-30 15:34:50.97677	\N
20	ADRIÁN	BDV	\N	1	2026-06-03 23:33:22.673369	2026-06-03 23:33:53.099748
22	MARISER	AMAYA	\N	1	2026-06-22 00:01:30.237837	\N
23	SINDY	BDV	\N	1	2026-07-08 21:23:53.127192	\N
24	ANNIA	ANDRADE	\N	1	2026-07-14 18:55:54.073594	\N
25	MEISBOL	NARANJO	\N	1	2026-07-26 15:52:13.855323	\N
26	YERUBI	\N	\N	1	2026-07-28 17:56:16.010634	\N
27	YEUSERT	BDV	\N	1	2026-08-04 21:33:28.438121	\N
28	GABRIELA	ANGELICA	\N	1	2026-08-04 21:34:27.389644	\N
29	JENNIFER	ANGELICA	\N	1	2026-08-04 21:34:50.062839	2026-08-04 21:59:33.089007
30	KRISBEL	BDV	\N	1	2026-08-07 23:22:18.579019	2026-08-11 21:14:38.950482
31	IMNA	CHARALLAVE (MAMÁ JESSER)	\N	1	2026-08-11 21:19:57.393195	\N
5	KEILA	BDV	04125820464	1	2026-02-22 13:57:48.344872	2026-08-15 10:46:50.225078
4	YOGLEIDYS	BDV	04128259293	1	2026-02-22 13:57:48.344872	2026-08-15 10:48:00.044067
3	CLARIBEL	BDV	04142638082	1	2026-02-22 13:57:48.344872	2026-08-15 10:48:17.525629
2	NORCARLY	BDV	04126032715	1	2026-02-22 13:57:48.344872	2026-08-15 10:48:34.736162
6	KISBEL	BDV	04143385964	1	2026-02-22 13:57:48.344872	2026-08-15 10:48:54.044046
8	NAYIBET	BDV	04123963208	1	2026-02-22 13:57:48.344872	2026-08-15 10:49:15.900925
9	GREICY	BDV	04242213700	1	2026-02-22 13:57:48.344872	2026-08-15 10:49:30.963014
10	ENEIDA	BDV	04125413203	1	2026-02-24 19:05:58.584619	2026-08-15 10:49:50.607395
11	ADONAYS	ZAMBRANO	04127186408	1	2026-03-15 18:59:58.865467	2026-08-15 10:50:09.623787
14	ANDREINA	ANDRADE	04241602712	1	2026-04-08 11:29:47.09495	2026-08-15 10:50:49.120747
16	CARLA	PISO 2 BDV	04242788345	1	2026-05-29 18:54:41.734581	2026-08-15 10:51:09.119403
18	DAMARYS	BDV	04142684205	1	2026-06-01 13:16:25.88916	2026-08-15 10:51:24.809572
19	MARBELLA	BDV	04120461207	1	2026-06-02 23:57:22.185806	2026-08-15 10:52:09.688875
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
2	6	4	1	4	MARRÓN	19	https://raw.githubusercontent.com/nilsenmr/imagenes/main/TB-PAR-0002-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/TB-PAR-0002.jpeg	TB-PAR-0002	\N	\N	2026-02-21 04:31:01.966617	excel_import
5	6	4	1	5	VERDE	19	https://raw.githubusercontent.com/nilsenmr/imagenes/main/TB-PAR-0005-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/TB-PAR-0005.jpeg	TB-PAR-0005	\N	\N	2026-02-21 04:31:01.972708	excel_import
6	6	4	3	2	GRIS	19	https://raw.githubusercontent.com/nilsenmr/imagenes/main/TB-PAR-0006-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/TB-PAR-0006.jpeg	TB-PAR-0006	\N	\N	2026-02-21 04:31:01.974995	excel_import
8	6	4	3	2	ROSADO	19	https://raw.githubusercontent.com/nilsenmr/imagenes/main/TB-PAR-0008-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/TB-PAR-0008.jpeg	TB-PAR-0008	\N	\N	2026-02-21 04:31:01.980254	excel_import
9	6	4	3	2	ROSADO	19	https://raw.githubusercontent.com/nilsenmr/imagenes/main/TB-PAR-0009-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/TB-PAR-0009.jpeg	TB-PAR-0009	\N	\N	2026-02-21 04:31:01.982463	excel_import
10	6	5	3	2	MARRÓN	19	https://raw.githubusercontent.com/nilsenmr/imagenes/main/TB-ENT-0010-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/TB-ENT-0010.jpeg	TB-ENT-0010	\N	\N	2026-02-21 04:31:01.985045	excel_import
11	6	4	1	2	ROJO/AZUL	19	https://raw.githubusercontent.com/nilsenmr/imagenes/main/TB-PAR-0011-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/TB-PAR-0011.jpeg	TB-PAR-0011	\N	\N	2026-02-21 04:31:01.98742	excel_import
14	6	5	1	2	GUAYABA	19	https://raw.githubusercontent.com/nilsenmr/imagenes/main/TB-ENT-0014-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/TB-ENT-0014.jpeg	TB-ENT-0014	\N	\N	2026-02-21 04:31:01.994463	excel_import
15	6	4	1	3	VINOTINTO	19	https://raw.githubusercontent.com/nilsenmr/imagenes/main/TB-PAR-0015-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/TB-PAR-0015.jpeg	TB-PAR-0015	\N	\N	2026-02-21 04:31:01.996653	excel_import
16	6	4	1	3	BLANCO/NEGRO	19	https://raw.githubusercontent.com/nilsenmr/imagenes/main/TB-PAR-0016-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/TB-PAR-0016.jpeg	TB-PAR-0016	\N	\N	2026-02-21 04:31:01.998909	excel_import
17	6	5	1	3	AZUL	19	https://raw.githubusercontent.com/nilsenmr/imagenes/main/TB-ENT-0017-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/TB-ENT-0017.jpeg	TB-ENT-0017	\N	\N	2026-02-21 04:31:02.001292	excel_import
20	6	5	3	3	AZUL	19	https://raw.githubusercontent.com/nilsenmr/imagenes/main/TB-ENT-0020-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/TB-ENT-0020.jpeg	TB-ENT-0020	\N	\N	2026-02-21 04:31:02.008445	excel_import
22	6	4	1	3	FUCSIA	19	https://raw.githubusercontent.com/nilsenmr/imagenes/main/TB-PAR-0022-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/TB-PAR-0022.jpeg	TB-PAR-0022	\N	\N	2026-02-21 04:31:02.012789	excel_import
28	6	4	1	2	BLANCO/FLORES	19	https://raw.githubusercontent.com/nilsenmr/imagenes/main/TB-PAR-0028-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/TB-PAR-0028.jpeg	TB-PAR-0028	\N	\N	2026-02-21 04:31:02.026451	excel_import
29	6	5	1	1	NEGRO	19	https://raw.githubusercontent.com/nilsenmr/imagenes/main/TB-ENT-0029-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/TB-ENT-0029.jpeg	TB-ENT-0029	\N	\N	2026-02-21 04:31:02.028567	excel_import
27	6	4	1	3	BLANCO/NEGRO	19	https://raw.githubusercontent.com/nilsenmr/imagenes/main/TB-PAR-0027-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/TB-PAR-0027.jpeg	TB-PAR-0027	admin_web	2026-02-23 22:10:35.536	2026-02-21 04:31:02.023608	excel_import
26	6	4	1	3	BLANCO/NEGRO	19	https://raw.githubusercontent.com/nilsenmr/imagenes/main/TB-PAR-0026-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/TB-PAR-0026.jpeg	TB-PAR-0026	admin_web	2026-02-23 22:11:20.567	2026-02-21 04:31:02.021473	excel_import
13	6	4	1	2	ESTAMPADO/VERDE	19	https://raw.githubusercontent.com/nilsenmr/imagenes/main/TB-PAR-0013-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/TB-PAR-0013.jpeg	TB-PAR-0013	admin_web	2026-02-23 22:36:16.599	2026-02-21 04:31:01.992131	excel_import
18	6	4	1	3	ROSADO/NEGRO	19	https://raw.githubusercontent.com/nilsenmr/imagenes/main/TB-PAR-0018-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/TB-PAR-0018.jpeg	TB-PAR-0018	admin_web	2026-02-23 22:36:03.595	2026-02-21 04:31:02.003511	excel_import
21	6	4	1	3	MARRÓN/NEGRO	19	https://raw.githubusercontent.com/nilsenmr/imagenes/main/TB-PAR-0021-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/TB-PAR-0021.jpeg	TB-PAR-0021	admin_web	2026-02-23 22:35:51.84	2026-02-21 04:31:02.010643	excel_import
12	6	4	1	2	ROSA VIEJA	19	https://raw.githubusercontent.com/nilsenmr/imagenes/main/TB-PAR-0012-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/TB-PAR-0012.jpeg	TB-PAR-0012	admin_web	2026-02-23 22:36:29.436	2026-02-21 04:31:01.989628	excel_import
7	6	5	1	2	ESTAMPADO/NEGRO	19	https://raw.githubusercontent.com/nilsenmr/imagenes/main/TB-ENT-0007-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/TB-ENT-0007.jpeg	TB-ENT-0007	admin_web	2026-02-23 22:36:37.675	2026-02-21 04:31:01.977988	excel_import
1	6	4	1	4	ESTAMPADO/AZUL	19	https://raw.githubusercontent.com/nilsenmr/imagenes/main/TB-PAR-0001-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/TB-PAR-0001.jpeg	TB-PAR-0001	admin_web	2026-02-23 22:36:46.245	2026-02-21 04:31:01.962003	excel_import
30	6	5	1	4	AZUL/ESTAMPADO	19	https://raw.githubusercontent.com/nilsenmr/imagenes/main/TB-ENT-0030-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/TB-ENT-0030.jpeg	TB-ENT-0030	admin_web	2026-03-15 19:48:01.42	2026-02-21 04:31:02.031112	excel_import
25	6	4	1	3	AZUL/FUCSIA	19	https://raw.githubusercontent.com/nilsenmr/imagenes/main/TB-PAR-0025-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/TB-PAR-0025.jpeg	TB-PAR-0025	admin_web	2026-02-23 22:34:41.828	2026-02-21 04:31:02.019298	excel_import
24	6	4	1	3	NEGRO	19	https://raw.githubusercontent.com/nilsenmr/imagenes/main/TB-PAR-0024-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/TB-PAR-0024.jpeg	TB-PAR-0024	admin_web	2026-02-23 22:35:14.325	2026-02-21 04:31:02.017155	excel_import
53	9	3	1	4	CREMA	22	https://raw.githubusercontent.com/nilsenmr/imagenes/main/CH-DEP-0004-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/CH-DEP-0004.jpeg	CH-DEP-0004	\N	\N	2026-03-18 23:34:33.788959	excel_import
3	6	4	3	4	NEGRO	19	https://raw.githubusercontent.com/nilsenmr/imagenes/main/TB-PAR-0003-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/TB-PAR-0003.jpeg	TB-PAR-0003	\N	\N	2026-02-21 04:31:01.968712	excel_import
50	9	3	3	4	BLANCO	22	https://raw.githubusercontent.com/nilsenmr/imagenes/main/CH-DEP-0001-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/CH-DEP-0001.jpeg	CH-DEP-0001	\N	\N	2026-03-18 23:34:33.773732	excel_import
31	6	4	1	3	MELON	19	https://raw.githubusercontent.com/nilsenmr/imagenes/main/TB-PAR-0031-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/TB-PAR-0031.jpeg	TB-PAR-0031	\N	\N	2026-03-14 20:45:17.165714	excel_import
32	6	4	1	2	MARRÓN	19	https://raw.githubusercontent.com/nilsenmr/imagenes/main/TB-PAR-0032-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/TB-PAR-0032.jpeg	TB-PAR-0032	\N	\N	2026-03-14 20:45:17.197854	excel_import
33	6	4	1	2	AZUL/TURQUESA	19	https://raw.githubusercontent.com/nilsenmr/imagenes/main/TB-PAR-0033-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/TB-PAR-0033.jpeg	TB-PAR-0033	\N	\N	2026-03-14 20:45:17.199168	excel_import
34	6	4	1	2	NEGRO/FLORES	19	https://raw.githubusercontent.com/nilsenmr/imagenes/main/TB-PAR-0034-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/TB-PAR-0034.jpeg	TB-PAR-0034	\N	\N	2026-03-14 20:45:17.200309	excel_import
35	6	4	1	3	FUCSIA	19	https://raw.githubusercontent.com/nilsenmr/imagenes/main/TB-PAR-0035-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/TB-PAR-0035.jpeg	TB-PAR-0035	\N	\N	2026-03-14 20:45:17.201476	excel_import
36	6	5	1	2	BLANCO	19	https://raw.githubusercontent.com/nilsenmr/imagenes/main/TB-ENT-0036-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/TB-ENT-0036.jpeg	TB-ENT-0036	\N	\N	2026-03-14 20:45:17.202744	excel_import
37	6	5	1	2	AZUL	19	https://raw.githubusercontent.com/nilsenmr/imagenes/main/TB-ENT-0037-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/TB-ENT-0037.jpeg	TB-ENT-0037	\N	\N	2026-03-14 20:45:17.204844	excel_import
39	6	5	1	3	AZUL/CIELO	19	https://raw.githubusercontent.com/nilsenmr/imagenes/main/TB-ENT-0039-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/TB-ENT-0039.jpeg	TB-ENT-0039	\N	\N	2026-03-14 20:45:17.207897	excel_import
40	6	5	1	3	BLANCO	19	https://raw.githubusercontent.com/nilsenmr/imagenes/main/TB-ENT-0040-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/TB-ENT-0040.jpeg	TB-ENT-0040	\N	\N	2026-03-14 20:45:17.209116	excel_import
41	6	5	1	1	BLANCO/NEGRO	19	https://raw.githubusercontent.com/nilsenmr/imagenes/main/TB-ENT-0041-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/TB-ENT-0041.jpeg	TB-ENT-0041	\N	\N	2026-03-14 20:45:17.21029	excel_import
42	6	5	1	3	NEGRO	19	https://raw.githubusercontent.com/nilsenmr/imagenes/main/TB-ENT-0042-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/TB-ENT-0042.jpeg	TB-ENT-0042	\N	\N	2026-03-14 20:45:17.211559	excel_import
43	6	4	1	2	LILA	19	https://raw.githubusercontent.com/nilsenmr/imagenes/main/TB-PAR-0043-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/TB-PAR-0043.jpeg	TB-PAR-0043	\N	\N	2026-03-14 20:45:17.212822	excel_import
44	6	4	1	1	ROSADO/DEGRADADO	19	https://raw.githubusercontent.com/nilsenmr/imagenes/main/TB-PAR-0044-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/TB-PAR-0044.jpeg	TB-PAR-0044	\N	\N	2026-03-14 20:45:17.21394	excel_import
47	11	3	3	3	BLANCO	22	https://raw.githubusercontent.com/nilsenmr/imagenes/main/SU-DEP-0002-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/SU-DEP-0002.jpeg	SU-DEP-0002	admin_web	2026-03-28 16:51:56.485	2026-03-15 20:10:46.753098	excel_import
45	6	4	1	3	AZUL/ESTAMPADO	19	https://raw.githubusercontent.com/nilsenmr/imagenes/main/TB-PAR-0045-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/TB-PAR-0045.jpeg	TB-PAR-0045	admin_web	2026-03-14 20:50:15.542	2026-03-14 20:45:17.214969	excel_import
49	11	3	1	5	MORADO	22	https://raw.githubusercontent.com/nilsenmr/imagenes/main/SU-DEP-0004-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/SU-DEP-0004.jpeg	SU-DEP-0004	admin_web	2026-03-15 20:18:14.543	2026-03-15 20:10:46.758243	excel_import
48	11	3	1	5	BLANCO	22	https://raw.githubusercontent.com/nilsenmr/imagenes/main/SU-DEP-0003-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/SU-DEP-0003.jpeg	SU-DEP-0003	admin_web	2026-03-15 20:18:21.081	2026-03-15 20:10:46.755876	excel_import
38	6	5	3	5	VERDE	19	https://raw.githubusercontent.com/nilsenmr/imagenes/main/TB-ENT-0038-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/TB-ENT-0038.jpeg	TB-ENT-0038	\N	\N	2026-03-14 20:45:17.206753	excel_import
46	11	3	3	5	NEGRO	22	https://raw.githubusercontent.com/nilsenmr/imagenes/main/SU-DEP-0001-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/SU-DEP-0001.jpeg	SU-DEP-0001	admin_web	2026-03-15 20:18:32.557	2026-03-15 20:10:46.730732	excel_import
52	9	3	1	5	VERDE	22	https://raw.githubusercontent.com/nilsenmr/imagenes/main/CH-DEP-0003-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/CH-DEP-0003.jpeg	CH-DEP-0003	\N	\N	2026-03-18 23:34:33.786927	excel_import
51	9	3	3	2	BLANCO	22	https://raw.githubusercontent.com/nilsenmr/imagenes/main/CH-DEP-0002-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/CH-DEP-0002.jpeg	CH-DEP-0002	\N	\N	2026-03-18 23:34:33.784681	excel_import
23	6	4	3	3	NARANJA/FLORES	19	https://raw.githubusercontent.com/nilsenmr/imagenes/main/TB-PAR-0023-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/TB-PAR-0023.jpeg	TB-PAR-0023	admin_web	2026-04-08 11:29:28.738	2026-02-21 04:31:02.014984	excel_import
54	9	3	1	5	VERDE	22	https://raw.githubusercontent.com/nilsenmr/imagenes/main/CH-DEP-0005-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/CH-DEP-0005.jpeg	CH-DEP-0005	\N	\N	2026-03-18 23:34:33.792018	excel_import
55	9	3	3	3	VERDE	22	https://raw.githubusercontent.com/nilsenmr/imagenes/main/CH-DEP-0006-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/CH-DEP-0006.jpeg	CH-DEP-0006	\N	\N	2026-03-18 23:34:33.795617	excel_import
56	9	3	1	3	NEGRO	22	https://raw.githubusercontent.com/nilsenmr/imagenes/main/CH-DEP-0007-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/CH-DEP-0007.jpeg	CH-DEP-0007	\N	\N	2026-03-18 23:34:33.797819	excel_import
57	9	3	1	2	BLANCO/ROSADO	22	https://raw.githubusercontent.com/nilsenmr/imagenes/main/CH-DEP-0008-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/CH-DEP-0008.jpeg	CH-DEP-0008	\N	\N	2026-03-18 23:34:33.799768	excel_import
58	9	3	1	3	NEGRO	22	https://raw.githubusercontent.com/nilsenmr/imagenes/main/CH-DEP-0009-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/CH-DEP-0009.jpeg	CH-DEP-0009	\N	\N	2026-03-18 23:34:33.802094	excel_import
60	9	3	1	3	AZUL/BLANCO	22	https://raw.githubusercontent.com/nilsenmr/imagenes/main/CH-DEP-0011-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/CH-DEP-0011.jpeg	CH-DEP-0011	\N	\N	2026-03-18 23:34:33.806555	excel_import
61	9	3	1	4	AZUL/CIELO	22	https://raw.githubusercontent.com/nilsenmr/imagenes/main/CH-DEP-0012-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/CH-DEP-0012.jpeg	CH-DEP-0012	\N	\N	2026-03-18 23:34:33.808709	excel_import
63	9	3	1	3	AZUL/MARINO	22	https://raw.githubusercontent.com/nilsenmr/imagenes/main/CH-DEP-0014-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/CH-DEP-0014.jpeg	CH-DEP-0014	\N	\N	2026-03-18 23:34:33.812999	excel_import
59	9	3	1	3	GRIS/PLOMO	22	https://raw.githubusercontent.com/nilsenmr/imagenes/main/CH-DEP0010-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/CH-DEP-0010.jpeg	CH-DEP-0010	admin_web	2026-03-19 00:05:11.576	2026-03-18 23:34:33.804584	excel_import
65	1	3	1	5	ROSADO	25	https://raw.githubusercontent.com/nilsenmr/imagenes/main/VE-DEP-0002-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/VE-DEP-0002.jpeg	VE-DEP-0002	\N	\N	2026-03-20 12:32:50.936564	excel_import
66	1	3	1	4	BLANCO/DEGRADADO	25	https://raw.githubusercontent.com/nilsenmr/imagenes/main/VE-DEP-0003-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/VE-DEP-0003.jpeg	VE-DEP-0003	\N	\N	2026-03-20 12:32:50.938817	excel_import
68	1	1	1	3	COLORIDO	25	https://raw.githubusercontent.com/nilsenmr/imagenes/main/VE-CAS-0005-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/VE-CAS-0005.jpeg	VE-CAS-0005	\N	\N	2026-03-20 12:32:50.942477	excel_import
69	1	1	1	3	GRIS	25	https://raw.githubusercontent.com/nilsenmr/imagenes/main/VE-CAS-0006-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/VE-CAS-0006.jpeg	VE-CAS-0006	\N	\N	2026-03-20 12:32:50.94434	excel_import
71	1	2	1	5	VERDE/OLIVA	28	https://raw.githubusercontent.com/nilsenmr/imagenes/main/VE-FOR-0008-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/VE-FOR-0008.jpeg	VE-FOR-0008	\N	\N	2026-03-20 12:32:50.948724	excel_import
72	1	2	1	5	NEGRO/TRANSPARENCIA	28	https://raw.githubusercontent.com/nilsenmr/imagenes/main/VE-FOR-0009-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/VE-FOR-0009.jpeg	VE-FOR-0009	\N	\N	2026-03-20 12:32:50.950363	excel_import
73	1	2	1	3	CREMA	28	https://raw.githubusercontent.com/nilsenmr/imagenes/main/VE-FOR-0010-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/VE-FOR-0010.jpeg	VE-FOR-0010	\N	\N	2026-03-20 12:32:50.952399	excel_import
74	1	2	1	2	NEGRO/MATERNAL	28	https://raw.githubusercontent.com/nilsenmr/imagenes/main/VE-FOR-0011-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/VE-FOR-0011.jpeg	VE-FOR-0011	\N	\N	2026-03-20 12:32:50.954324	excel_import
75	1	3	1	5	ROSADO	25	https://raw.githubusercontent.com/nilsenmr/imagenes/main/VE-DEP-0012-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/VE-DEP-0012.jpeg	VE-DEP-0012	\N	\N	2026-03-20 12:32:50.956188	excel_import
76	1	2	1	2	CHAMPAGNE	28	https://raw.githubusercontent.com/nilsenmr/imagenes/main/VE-FOR-0013-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/VE-FOR-0013.jpeg	VE-FOR-0013	\N	\N	2026-03-20 12:32:50.957988	excel_import
77	1	1	1	2	CREMA	25	https://raw.githubusercontent.com/nilsenmr/imagenes/main/VE-CAS-0014-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/VE-CAS-0014.jpeg	VE-CAS-0014	\N	\N	2026-03-20 12:32:50.959539	excel_import
78	1	2	1	2	MARRON	28	https://raw.githubusercontent.com/nilsenmr/imagenes/main/VE-FOR-0015-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/VE-FOR-0015.jpeg	VE-FOR-0015	\N	\N	2026-03-20 12:32:50.961106	excel_import
79	1	2	1	3	NEGRO	28	https://raw.githubusercontent.com/nilsenmr/imagenes/main/VE-FOR-0016-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/VE-FOR-0016.jpeg	VE-FOR-0016	\N	\N	2026-03-20 12:32:50.962708	excel_import
80	1	1	1	3	BLANCO/CORAZON	25	https://raw.githubusercontent.com/nilsenmr/imagenes/main/VE-CAS-0017-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/VE-CAS-0017.jpeg	VE-CAS-0017	\N	\N	2026-03-20 12:32:50.964267	excel_import
81	1	2	1	4	AZUL	28	https://raw.githubusercontent.com/nilsenmr/imagenes/main/VE-FOR-0018-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/VE-FOR-0018.jpeg	VE-FOR-0018	\N	\N	2026-03-20 12:32:50.965623	excel_import
82	1	1	1	4	CREMA	25	https://raw.githubusercontent.com/nilsenmr/imagenes/main/VE-CAS-0019-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/VE-CAS-0019.jpeg	VE-CAS-0019	\N	\N	2026-03-20 12:32:50.966947	excel_import
67	1	3	3	2	ROSADO	25	https://raw.githubusercontent.com/nilsenmr/imagenes/main/VE-DEP-0004-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/VE-DEP-0004.jpeg	VE-DEP-0004	\N	\N	2026-03-20 12:32:50.940765	excel_import
70	1	2	3	5	ROJO	28	https://raw.githubusercontent.com/nilsenmr/imagenes/main/VE-FOR-0007-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/VE-FOR-0007.jpeg	VE-FOR-0007	\N	\N	2026-03-20 12:32:50.946419	excel_import
64	1	3	3	1	BLANCO	25	https://raw.githubusercontent.com/nilsenmr/imagenes/main/VE-DEP-0001-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/VE-DEP-0001.jpeg	VE-DEP-0001	\N	\N	2026-03-20 12:32:50.915314	excel_import
62	9	3	3	4	BLANCO	22	https://raw.githubusercontent.com/nilsenmr/imagenes/main/CH-DEP-0013-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/CH-DEP-0013.jpeg	CH-DEP-0013	\N	\N	2026-03-18 23:34:33.810838	excel_import
84	1	2	1	4	ROJO	28	https://raw.githubusercontent.com/nilsenmr/imagenes/main/VE-FOR-0021-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/VE-FOR-0021.jpeg	VE-FOR-0021	\N	\N	2026-03-20 12:32:50.970309	excel_import
85	1	2	1	4	NEGRO/CREMA	28	https://raw.githubusercontent.com/nilsenmr/imagenes/main/VE-FOR-0022-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/VE-FOR-0022.jpeg	VE-FOR-0022	\N	\N	2026-03-20 12:32:50.971786	excel_import
86	1	1	1	1	NEGRO	25	https://raw.githubusercontent.com/nilsenmr/imagenes/main/VE-CAS-0023-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/VE-CAS-0023.jpeg	VE-CAS-0023	\N	\N	2026-03-20 12:32:50.973536	excel_import
87	1	2	1	2	NEGRO/BLANCO	28	https://raw.githubusercontent.com/nilsenmr/imagenes/main/VE-FOR-0024-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/VE-FOR-0024.jpeg	VE-FOR-0024	\N	\N	2026-03-20 12:32:50.97497	excel_import
88	1	2	1	5	VERDE/MANZANA	28	https://raw.githubusercontent.com/nilsenmr/imagenes/main/VE-FOR-0025-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/VE-FOR-0025.jpeg	VE-FOR-0025	\N	\N	2026-03-20 12:32:50.976363	excel_import
89	1	2	1	4	NEGRO/BRILLO	28	https://raw.githubusercontent.com/nilsenmr/imagenes/main/VE-FOR-0026-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/VE-FOR-0026.jpeg	VE-FOR-0026	\N	\N	2026-03-20 12:32:50.978043	excel_import
91	1	2	1	3	ROSADO/MATERNAL	28	https://raw.githubusercontent.com/nilsenmr/imagenes/main/VE-FOR-0028-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/VE-FOR-0028.jpeg	VE-FOR-0028	\N	\N	2026-03-20 12:32:50.981254	excel_import
93	1	1	1	5	VERDE/CUADROS	25	https://raw.githubusercontent.com/nilsenmr/imagenes/main/VE-CAS-0030-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/VE-CAS-0030.jpeg	VE-CAS-0030	\N	\N	2026-03-20 12:32:50.984225	excel_import
94	1	2	1	5	BLANCO	28	https://raw.githubusercontent.com/nilsenmr/imagenes/main/VE-FOR-0031-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/VE-FOR-0031.jpeg	VE-FOR-0031	\N	\N	2026-03-20 12:32:50.985775	excel_import
97	14	3	1	4	BLANCO	20	https://raw.githubusercontent.com/nilsenmr/imagenes/main/FL-DEP-0001-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/FL-DEP-0001.jpeg	FL-DEP-0001	\N	\N	2026-03-21 16:06:59.102632	excel_import
98	14	3	1	2	BLANCO	20	https://raw.githubusercontent.com/nilsenmr/imagenes/main/FL-DEP-0002-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/FL-DEP-0002.jpeg	FL-DEP-0002	\N	\N	2026-03-21 16:06:59.146763	excel_import
99	14	3	1	3	LILA	20	https://raw.githubusercontent.com/nilsenmr/imagenes/main/FL-DEP-0003-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/FL-DEP-0003.jpeg	FL-DEP-0003	\N	\N	2026-03-21 16:06:59.15068	excel_import
101	14	3	1	3	NEGRO/BLANCO	20	https://raw.githubusercontent.com/nilsenmr/imagenes/main/FL-DEP-0005-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/FL-DEP-0005.jpeg	FL-DEP-0005	\N	\N	2026-03-21 16:06:59.156974	excel_import
102	14	3	1	2	ROJO	20	https://raw.githubusercontent.com/nilsenmr/imagenes/main/FL-DEP-0006-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/FL-DEP-0006.jpeg	FL-DEP-0006	\N	\N	2026-03-21 16:06:59.160367	excel_import
103	14	3	1	2	VERDE/BLANCO	20	https://raw.githubusercontent.com/nilsenmr/imagenes/main/FL-DEP-0007-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/FL-DEP-0007.jpeg	FL-DEP-0007	\N	\N	2026-03-21 16:06:59.163953	excel_import
104	14	3	1	5	BLANCO	20	https://raw.githubusercontent.com/nilsenmr/imagenes/main/FL-DEP-0008-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/FL-DEP-0008.jpeg	FL-DEP-0008	\N	\N	2026-03-21 16:06:59.166062	excel_import
105	14	1	1	2	ROJO/ESTAMPADO	18	https://raw.githubusercontent.com/nilsenmr/imagenes/main/FL-CAS-0009-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/FL-CAS-0009.jpeg	FL-CAS-0009	\N	\N	2026-03-26 22:12:23.133436	excel_import
106	14	1	1	2	CREMA	18	https://raw.githubusercontent.com/nilsenmr/imagenes/main/FL-CAS-0010-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/FL-CAS-0010.jpeg	FL-CAS-0010	\N	\N	2026-03-26 22:12:23.158959	excel_import
107	14	1	1	4	HUESO	18	https://raw.githubusercontent.com/nilsenmr/imagenes/main/FL-CAS-0011-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/FL-CAS-0011.jpeg	FL-CAS-0011	\N	\N	2026-03-26 22:12:23.162669	excel_import
108	14	1	1	1	GRIS	18	https://raw.githubusercontent.com/nilsenmr/imagenes/main/FL-CAS-0012-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/FL-CAS-0012.jpeg	FL-CAS-0012	\N	\N	2026-03-26 22:12:23.164541	excel_import
109	14	1	1	3	CREMA/MINIFALDA	18	https://raw.githubusercontent.com/nilsenmr/imagenes/main/FL-CAS-0013-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/FL-CAS-0013.jpeg	FL-CAS-0013	\N	\N	2026-03-26 22:12:23.166649	excel_import
110	14	1	1	1	VERDE	18	https://raw.githubusercontent.com/nilsenmr/imagenes/main/FL-CAS-0014-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/FL-CAS-0014.jpeg	FL-CAS-0014	\N	\N	2026-03-26 22:12:23.168838	excel_import
111	14	1	1	2	BLANCO/VERDE	18	https://raw.githubusercontent.com/nilsenmr/imagenes/main/FL-CAS-0015-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/FL-CAS-0015.jpeg	FL-CAS-0015	\N	\N	2026-03-26 22:12:23.17116	excel_import
112	14	1	1	3	NEGRO	18	https://raw.githubusercontent.com/nilsenmr/imagenes/main/FL-CAS-0016-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/FL-CAS-0016.jpeg	FL-CAS-0016	\N	\N	2026-03-26 22:12:23.173003	excel_import
113	15	3	1	5	NEGRO	18	https://raw.githubusercontent.com/nilsenmr/imagenes/main/SH-DEP-0001-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/SH-DEP-0001.jpeg	SH-DEP-0001	\N	\N	2026-03-26 22:33:40.530862	excel_import
95	1	1	3	2	GRIS	25	https://raw.githubusercontent.com/nilsenmr/imagenes/main/VE-CAS-0032-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/VE-CAS-0032.jpeg	VE-CAS-0032	\N	\N	2026-03-20 12:32:50.987535	excel_import
83	1	2	3	3	NEGRO	28	https://raw.githubusercontent.com/nilsenmr/imagenes/main/VE-FOR-0020-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/VE-FOR-0020.jpeg	VE-FOR-0020	\N	\N	2026-03-20 12:32:50.968435	excel_import
90	1	2	3	3	NEGRO	28	https://raw.githubusercontent.com/nilsenmr/imagenes/main/VE-FOR-0027-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/VE-FOR-0027.jpeg	VE-FOR-0027	\N	\N	2026-03-20 12:32:50.979559	excel_import
92	1	1	3	4	BLANCO	25	https://raw.githubusercontent.com/nilsenmr/imagenes/main/VE-CAS-0029-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/VE-CAS-0029.jpeg	VE-CAS-0029	\N	\N	2026-03-20 12:32:50.982708	excel_import
114	15	3	1	3	FUCSIA	18	https://raw.githubusercontent.com/nilsenmr/imagenes/main/SH-DEP-0002-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/SH-DEP-0002.jpeg	SH-DEP-0002	\N	\N	2026-03-26 22:33:40.537717	excel_import
115	15	3	1	4	NARANJA	18	https://raw.githubusercontent.com/nilsenmr/imagenes/main/SH-DEP-0003-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/SH-DEP-0003.jpeg	SH-DEP-0003	\N	\N	2026-03-26 22:33:40.542082	excel_import
116	15	3	1	2	BLANCO	18	https://raw.githubusercontent.com/nilsenmr/imagenes/main/SH-DEP-0004-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/SH-DEP-0004.jpeg	SH-DEP-0004	\N	\N	2026-03-26 22:33:40.544847	excel_import
117	15	3	1	2	BLANCO	18	https://raw.githubusercontent.com/nilsenmr/imagenes/main/SH-DEP-0005-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/SH-DEP-0005.jpeg	SH-DEP-0005	\N	\N	2026-03-26 22:33:40.548097	excel_import
118	15	3	1	5	NEGRO	18	https://raw.githubusercontent.com/nilsenmr/imagenes/main/SH-DEP-0006-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/SH-DEP-0006.jpeg	SH-DEP-0006	\N	\N	2026-03-26 22:33:40.550608	excel_import
119	15	1	1	3	CREMA	15	https://raw.githubusercontent.com/nilsenmr/imagenes/main/SH-CAS-0007-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/SH-CAS-0007.jpeg	SH-CAS-0007	\N	\N	2026-03-26 22:33:40.553064	excel_import
120	15	3	1	4	ROSADO	18	https://raw.githubusercontent.com/nilsenmr/imagenes/main/SH-DEP-0008-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/SH-DEP-0008.jpeg	SH-DEP-0008	\N	\N	2026-03-26 22:33:40.555303	excel_import
121	15	3	1	3	VERDE/NEON	18	https://raw.githubusercontent.com/nilsenmr/imagenes/main/SH-DEP-0009-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/SH-DEP-0009.jpeg	SH-DEP-0009	\N	\N	2026-03-26 22:33:40.557586	excel_import
122	15	3	1	3	CORAL	18	https://raw.githubusercontent.com/nilsenmr/imagenes/main/SH-DEP-0010-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/SH-DEP-0010.jpeg	SH-DEP-0010	\N	\N	2026-03-26 22:33:40.559792	excel_import
126	12	3	1	4	VERDE	18	https://raw.githubusercontent.com/nilsenmr/imagenes/main/TO-DEP-0005-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/TO-DEP-0005.jpeg	TO-DEP-0005	\N	\N	2026-03-26 22:50:00.182168	excel_import
127	12	3	1	3	ROSADO	18	https://raw.githubusercontent.com/nilsenmr/imagenes/main/TO-DEP-0006-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/TO-DEP-0006.jpeg	TO-DEP-0006	\N	\N	2026-03-26 22:50:00.184313	excel_import
128	12	3	1	2	NEGRO	18	https://raw.githubusercontent.com/nilsenmr/imagenes/main/TO-DEP-0010-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/TO-DEP-0010.jpeg	TO-DEP-0010	\N	\N	2026-03-26 22:50:00.187758	excel_import
129	12	3	1	3	LILA	18	https://raw.githubusercontent.com/nilsenmr/imagenes/main/TO-DEP-0011-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/TO-DEP-0011.jpeg	TO-DEP-0011	\N	\N	2026-03-26 22:50:00.189956	excel_import
130	12	3	1	4	MORADO	18	https://raw.githubusercontent.com/nilsenmr/imagenes/main/TO-DEP-0007-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/TO-DEP-0007.jpeg	TO-DEP-0007	\N	\N	2026-03-26 23:02:41.190877	excel_import
135	10	1	1	3	GRIS	24	https://raw.githubusercontent.com/nilsenmr/imagenes/main/BD-CAS-0003-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/BD-CAS-0003.jpeg	BD-CAS-0003	\N	\N	2026-03-26 23:31:10.247616	excel_import
136	10	1	1	3	NEGRO	24	https://raw.githubusercontent.com/nilsenmr/imagenes/main/BD-CAS-0004-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/BD-CAS-0004.jpeg	BD-CAS-0004	\N	\N	2026-03-26 23:31:10.25029	excel_import
138	13	3	1	4	NEGRO	18	https://raw.githubusercontent.com/nilsenmr/imagenes/main/LC-DEP-0001-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/LC-DEP-0001.jpeg	LC-DEP-0001	\N	\N	2026-03-26 23:51:22.574785	excel_import
140	13	3	1	3	MARRÓN	18	https://raw.githubusercontent.com/nilsenmr/imagenes/main/LC-DEP-0003-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/LC-DEP-0003.jpeg	LC-DEP-0003	\N	\N	2026-03-26 23:51:22.583842	excel_import
142	13	3	1	5	NEGRO	18	https://raw.githubusercontent.com/nilsenmr/imagenes/main/LC-DEP-0005-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/LC-DEP-0005.jpeg	LC-DEP-0005	\N	\N	2026-03-26 23:51:22.588701	excel_import
143	13	3	1	4	NEGRO	18	https://raw.githubusercontent.com/nilsenmr/imagenes/main/LC-DEP-0008-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/LC-DEP-0008.jpeg	LC-DEP-0008	\N	\N	2026-03-26 23:51:22.590772	excel_import
96	1	1	3	2	GRIS	25	https://raw.githubusercontent.com/nilsenmr/imagenes/main/VE-CAS-0033-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/VE-CAS-0033.jpeg	VE-CAS-0033	admin_web	2026-03-27 00:09:01.841	2026-03-20 12:32:50.989116	excel_import
133	10	1	1	3	VERDE	24	https://raw.githubusercontent.com/nilsenmr/imagenes/main/BD-CAS-0001-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/BD-CAS-0001.jpeg	BD-CAS-0001	admin_web	2026-03-28 15:10:27.581	2026-03-26 23:31:10.240525	excel_import
132	12	3	1	2	NEGRO	18	https://raw.githubusercontent.com/nilsenmr/imagenes/main/TO-DEP-0009-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/TO-DEP-0009.jpeg	TO-DEP-0009	admin_web	2026-03-28 12:24:32.339	2026-03-26 23:02:41.197948	excel_import
141	13	3	3	5	NEGRO	18	https://raw.githubusercontent.com/nilsenmr/imagenes/main/LC-DEP-0004-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/LC-DEP-0004.jpeg	LC-DEP-0004	\N	\N	2026-03-26 23:51:22.586584	excel_import
131	12	3	1	2	NEGRO	18	https://raw.githubusercontent.com/nilsenmr/imagenes/main/TO-DEP-0008-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/TO-DEP-0008.jpeg	TO-DEP-0008	admin_web	2026-03-28 12:24:23.857	2026-03-26 23:02:41.195794	excel_import
125	12	3	1	2	NARANJA	18	https://raw.githubusercontent.com/nilsenmr/imagenes/main/TO-DEP-0004-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/TO-DEP-0004.jpeg	TO-DEP-0004	admin_web	2026-03-28 12:28:46.858	2026-03-26 22:50:00.179958	excel_import
134	10	1	3	4	NEGRO	24	https://raw.githubusercontent.com/nilsenmr/imagenes/main/BD-CAS-0002-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/BD-CAS-0002.jpeg	BD-CAS-0002	admin_web	2026-06-04 00:16:40.949	2026-03-26 23:31:10.245047	excel_import
139	13	3	3	5	NEGRO	18	https://raw.githubusercontent.com/nilsenmr/imagenes/main/LC-DEP-0002-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/LC-DEP-0002.jpeg	LC-DEP-0002	\N	\N	2026-03-26 23:51:22.580539	excel_import
137	10	1	3	4	NEGRO	24	https://raw.githubusercontent.com/nilsenmr/imagenes/main/BD-CAS-0005-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/BD-CAS-0005.jpeg	BD-CAS-0005	admin_web	2026-06-01 12:42:22.999	2026-03-26 23:31:10.252785	excel_import
144	13	3	3	3	NEGRO	18	https://raw.githubusercontent.com/nilsenmr/imagenes/main/LC-DEP-0007-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/LC-DEP-0007.jpeg	LC-DEP-0007	\N	\N	2026-03-28 16:51:14.737254	sistema
4	6	4	3	5	AZUL	19	https://raw.githubusercontent.com/nilsenmr/imagenes/main/TB-PAR-0004-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/TB-PAR-0004.jpeg	TB-PAR-0004	\N	\N	2026-02-21 04:31:01.97051	excel_import
146	7	3	1	2	NEGRO	25	https://raw.githubusercontent.com/nilsenmr/imagenes/main/BR-DEP-0002-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/BR-DEP-0002.jpeg	BR-DEP-0002	\N	\N	2026-05-08 23:47:42.912362	excel_import
147	7	3	1	1	CREMA	25	https://raw.githubusercontent.com/nilsenmr/imagenes/main/BR-DEP-0003-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/BR-DEP-0003.jpeg	BR-DEP-0003	\N	\N	2026-05-08 23:47:42.914328	excel_import
148	7	3	1	5	AZUL	25	https://raw.githubusercontent.com/nilsenmr/imagenes/main/BR-DEP-0004-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/BR-DEP-0004.jpeg	BR-DEP-0004	\N	\N	2026-05-08 23:47:42.916007	excel_import
149	7	3	1	2	NEGRO	25	https://raw.githubusercontent.com/nilsenmr/imagenes/main/BR-DEP-0005-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/BR-DEP-0005.jpeg	BR-DEP-0005	\N	\N	2026-05-08 23:47:42.917475	excel_import
150	7	1	1	2	FUCSIA/FLORES	25	https://raw.githubusercontent.com/nilsenmr/imagenes/main/BR-CAS-0006-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/BR-CAS-0006.jpeg	BR-CAS-0006	\N	\N	2026-05-08 23:47:42.919071	excel_import
151	7	1	1	3	BLANCO	25	https://raw.githubusercontent.com/nilsenmr/imagenes/main/BR-CAS-0007-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/BR-CAS-0007.jpeg	BR-CAS-0007	\N	\N	2026-05-08 23:47:42.920823	excel_import
152	7	3	1	4	NEGRO/BLANCO	25	https://raw.githubusercontent.com/nilsenmr/imagenes/main/BR-DEP-0008-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/BR-DEP-0008.jpeg	BR-DEP-0008	\N	\N	2026-05-08 23:47:42.922242	excel_import
154	7	1	1	1	NEGRO/FLORES	25	https://raw.githubusercontent.com/nilsenmr/imagenes/main/BR-CAS-0010-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/BR-CAS-0010.jpeg	BR-CAS-0010	\N	\N	2026-05-08 23:47:42.925582	excel_import
155	7	1	1	2	NEGRO	25	https://raw.githubusercontent.com/nilsenmr/imagenes/main/BR-CAS-0011-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/BR-CAS-0011.jpeg	BR-CAS-0011	\N	\N	2026-05-08 23:47:42.927214	excel_import
156	7	1	1	2	NEGRO/BLANCO	25	https://raw.githubusercontent.com/nilsenmr/imagenes/main/BR-CAS-0012-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/BR-CAS-0012.jpeg	BR-CAS-0012	\N	\N	2026-05-08 23:47:42.928891	excel_import
158	7	1	1	3	NEGRO	25	https://raw.githubusercontent.com/nilsenmr/imagenes/main/BR-CAS-0014-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/BR-CAS-0014.jpeg	BR-CAS-0014	\N	\N	2026-05-08 23:47:42.93226	excel_import
159	7	1	1	3	CREMA	25	https://raw.githubusercontent.com/nilsenmr/imagenes/main/BR-CAS-0015-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/BR-CAS-0015.jpeg	BR-CAS-0015	\N	\N	2026-05-08 23:47:42.933852	excel_import
160	7	1	1	3	NEGRO	25	https://raw.githubusercontent.com/nilsenmr/imagenes/main/BR-CAS-0016-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/BR-CAS-0016.jpeg	BR-CAS-0016	\N	\N	2026-05-08 23:47:42.935632	excel_import
161	7	1	3	5	CREMA/MATERNAL	25	https://raw.githubusercontent.com/nilsenmr/imagenes/main/BR-CAS-0017-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/BR-CAS-0017.jpeg	BR-CAS-0017	\N	\N	2026-05-08 23:47:42.937428	excel_import
162	7	1	3	5	VERDE/OLIVA	25	https://raw.githubusercontent.com/nilsenmr/imagenes/main/BR-CAS-0018-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/BR-CAS-0018.jpeg	BR-CAS-0018	\N	\N	2026-05-08 23:47:42.938806	excel_import
163	7	1	1	2	MOSTAZA	25	https://raw.githubusercontent.com/nilsenmr/imagenes/main/BR-CAS-0019-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/BR-CAS-0019.jpeg	BR-CAS-0019	\N	\N	2026-05-08 23:47:42.940204	excel_import
164	7	1	1	3	MARRON/RAYAS	25	https://raw.githubusercontent.com/nilsenmr/imagenes/main/BR-CAS-0020-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/BR-CAS-0020.jpeg	BR-CAS-0020	\N	\N	2026-05-08 23:47:42.941546	excel_import
165	7	1	1	4	MARRON/ESTAMPADO	25	https://raw.githubusercontent.com/nilsenmr/imagenes/main/BR-CAS-0021-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/BR-CAS-0021.jpeg	BR-CAS-0021	\N	\N	2026-05-08 23:47:42.942987	excel_import
123	12	3	1	2	AMARILLO	18	https://raw.githubusercontent.com/nilsenmr/imagenes/main/TO-DEP-0001-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/TO-DEP-0001.jpeg	TO-DEP-0001	admin_web	2026-03-28 15:23:12.607	2026-03-26 22:50:00.171971	excel_import
124	12	3	1	5	BLANCO	18	https://raw.githubusercontent.com/nilsenmr/imagenes/main/TO-DEP-0003-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/TO-DEP-0003.jpeg	TO-DEP-0003	admin_web	2026-03-28 15:23:18.314	2026-03-26 22:50:00.177669	excel_import
167	1	1	1	2	BLANCO	23	https://raw.githubusercontent.com/nilsenmr/imagenes/main/VE-CAS-0034-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/VE-CAS-0034.jpeg	VE-CAS-0034	\N	\N	2026-05-23 14:31:15.175511	excel_import
168	1	1	1	5	NEGRO/DORADO	25	https://raw.githubusercontent.com/nilsenmr/imagenes/main/VE-CAS-0035-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/VE-CAS-0035.jpeg	VE-CAS-0035	\N	\N	2026-05-23 14:31:15.264127	excel_import
145	7	1	3	1	AZUL	25	https://raw.githubusercontent.com/nilsenmr/imagenes/main/BR-CAS-0001-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/BR-CAS-0001.jpeg	BR-CAS-0001	\N	\N	2026-05-08 23:47:42.894724	excel_import
169	1	1	3	3	BLANCO/NEGRO	25	https://raw.githubusercontent.com/nilsenmr/imagenes/main/VE-CAS-0036-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/VE-CAS-0036.jpeg	VE-CAS-0036	admin_web	2026-05-23 15:12:59.76	2026-05-23 14:31:15.269365	excel_import
166	7	1	1	5	AZUL/MARINO	25	https://raw.githubusercontent.com/nilsenmr/imagenes/main/BR-CAS-0022-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/BR-CAS-0022.jpeg	BR-CAS-0022	admin_web	2026-06-04 00:15:12.449	2026-05-08 23:47:42.944759	excel_import
157	7	1	3	3	CREMA	25	https://raw.githubusercontent.com/nilsenmr/imagenes/main/BR-CAS-0013-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/BR-CAS-0013.jpeg	BR-CAS-0013	\N	\N	2026-05-08 23:47:42.930741	excel_import
153	7	3	3	2	NEGRO/ROJO	25	https://raw.githubusercontent.com/nilsenmr/imagenes/main/BR-DEP-0009-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/BR-DEP-0009.jpeg	BR-DEP-0009	\N	\N	2026-05-08 23:47:42.923821	excel_import
170	1	1	1	3	BLANCO	28	https://raw.githubusercontent.com/nilsenmr/imagenes/main/VE-CAS-0037-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/VE-CAS-0037.jpeg	VE-CAS-0037	\N	\N	2026-05-23 14:31:15.275278	excel_import
171	1	2	1	4	BEIGE	28	https://raw.githubusercontent.com/nilsenmr/imagenes/main/VE-FOR-0038-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/VE-FOR-0038.jpeg	VE-FOR-0038	\N	\N	2026-05-23 14:31:15.286381	excel_import
172	1	1	1	4	LADRILLO/ESTAMPADO	28	https://raw.githubusercontent.com/nilsenmr/imagenes/main/VE-CAS-0039-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/VE-CAS-0039.jpeg	VE-CAS-0039	\N	\N	2026-05-23 14:31:15.289805	excel_import
173	1	1	1	3	NEGRO	23	https://raw.githubusercontent.com/nilsenmr/imagenes/main/VE-CAS-0040-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/VE-CAS-0040.jpeg	VE-CAS-0040	\N	\N	2026-05-23 14:31:15.29317	excel_import
175	1	1	1	3	BEIGE	28	https://raw.githubusercontent.com/nilsenmr/imagenes/main/VE-CAS-0042-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/VE-CAS-0042.jpeg	VE-CAS-0042	\N	\N	2026-05-23 14:31:15.311215	excel_import
177	2	3	1	5	BLANCO	20	https://raw.githubusercontent.com/nilsenmr/imagenes/main/BL-DEP-0002-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/BL-DEP-0002.jpeg	BL-DEP-0002	\N	\N	2026-05-23 16:28:39.389602	excel_import
178	2	1	1	5	CREMA/RAYAS	20	https://raw.githubusercontent.com/nilsenmr/imagenes/main/BL-CAS-0003-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/BL-CAS-0003.jpeg	BL-CAS-0003	\N	\N	2026-05-23 16:28:39.394435	excel_import
181	2	3	1	2	NEGRO	15	https://raw.githubusercontent.com/nilsenmr/imagenes/main/BL-DEP-0006-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/BL-DEP-0006.jpeg	BL-DEP-0006	\N	\N	2026-05-23 16:28:39.403282	excel_import
183	2	1	1	2	NEGRO	20	https://raw.githubusercontent.com/nilsenmr/imagenes/main/BL-CAS-0009-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/BL-CAS-0009.jpeg	BL-CAS-0009	\N	\N	2026-05-23 16:28:39.410418	excel_import
185	2	1	1	3	NEGRO	20	https://raw.githubusercontent.com/nilsenmr/imagenes/main/BL-CAS-0011-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/BL-CAS-0011.jpeg	BL-CAS-0011	\N	\N	2026-05-23 16:28:39.415535	excel_import
186	2	1	1	3	NEGRO	15	https://raw.githubusercontent.com/nilsenmr/imagenes/main/BL-CAS-0012-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/BL-CAS-0012.jpeg	BL-CAS-0012	\N	\N	2026-05-23 16:28:39.418531	excel_import
189	2	1	1	3	FUCSIA	15	https://raw.githubusercontent.com/nilsenmr/imagenes/main/BL-CAS-0015-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/BL-CAS-0015.jpeg	BL-CAS-0015	\N	\N	2026-05-23 16:28:39.42687	excel_import
191	2	1	1	3	NEGRO	15	https://raw.githubusercontent.com/nilsenmr/imagenes/main/BL-CAS-0017-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/BL-CAS-0017.jpeg	BL-CAS-0017	\N	\N	2026-05-23 16:28:39.432905	excel_import
194	2	1	1	4	MELON	20	https://raw.githubusercontent.com/nilsenmr/imagenes/main/BL-CAS-0020-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/BL-CAS-0020.jpeg	BL-CAS-0020	\N	\N	2026-05-23 16:28:39.44092	excel_import
196	2	1	1	2	BLANCO/VERDE	20	https://raw.githubusercontent.com/nilsenmr/imagenes/main/BL-CAS-0022-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/BL-CAS-0022.jpeg	BL-CAS-0022	\N	\N	2026-05-23 16:28:39.452952	excel_import
197	2	1	1	4	VERDE OSCURO	20	https://raw.githubusercontent.com/nilsenmr/imagenes/main/BL-CAS-0023-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/BL-CAS-0023.jpeg	BL-CAS-0023	\N	\N	2026-05-23 16:28:39.45574	excel_import
198	2	1	1	4	NEGRA	20	https://raw.githubusercontent.com/nilsenmr/imagenes/main/BL-CAS-0024-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/BL-CAS-0024.jpeg	BL-CAS-0024	\N	\N	2026-05-23 16:28:39.458643	excel_import
200	2	1	1	4	NEGRA	15	https://raw.githubusercontent.com/nilsenmr/imagenes/main/BL-CAS-0025-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/BL-CAS-0025.jpeg	BL-CAS-0025	\N	\N	2026-05-24 11:39:21.291793	excel_import
193	2	1	3	3	BLANCO/FLORES	15	https://raw.githubusercontent.com/nilsenmr/imagenes/main/BL-CAS-0019-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/BL-CAS-0019.jpeg	BL-CAS-0019	admin_web	2026-05-31 12:50:06.516	2026-05-23 16:28:39.438243	excel_import
187	2	1	1	3	BLANCO	20	https://raw.githubusercontent.com/nilsenmr/imagenes/main/BL-CAS-0013-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/BL-CAS-0013.jpeg	BL-CAS-0013	admin_web	2026-05-31 12:49:59.876	2026-05-23 16:28:39.421311	excel_import
190	2	1	3	3	BLANCO/FLORES	20	https://raw.githubusercontent.com/nilsenmr/imagenes/main/BL-CAS-0016-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/BL-CAS-0016.jpeg	BL-CAS-0016	admin_web	2026-05-29 18:54:22.214	2026-05-23 16:28:39.429647	excel_import
195	2	1	3	2	CREMA	20	https://raw.githubusercontent.com/nilsenmr/imagenes/main/BL-CAS-0021-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/BL-CAS-0021.jpeg	BL-CAS-0021	\N	\N	2026-05-23 16:28:39.443117	excel_import
192	2	1	1	3	TERRACOTA	15	https://raw.githubusercontent.com/nilsenmr/imagenes/main/BL-CAS-0018-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/BL-CAS-0018.jpeg	BL-CAS-0018	admin_web	2026-05-31 12:49:54.034	2026-05-23 16:28:39.435572	excel_import
180	2	1	3	3	BLANCO	20	https://raw.githubusercontent.com/nilsenmr/imagenes/main/BL-CAS-0005-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/BL-CAS-0005.jpeg	BL-CAS-0005	admin_web	2026-05-29 19:01:36.372	2026-05-23 16:28:39.40057	excel_import
179	2	1	1	3	CREMA	20	https://raw.githubusercontent.com/nilsenmr/imagenes/main/BL-CAS-0004-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/BL-CAS-0004.jpeg	BL-CAS-0004	admin_web	2026-05-31 12:49:45.6	2026-05-23 16:28:39.397453	excel_import
199	2	1	3	10	MARRON	20	https://raw.githubusercontent.com/nilsenmr/imagenes/main/BL-CAS-0007-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/BL-CAS-0007.jpeg	BL-CAS-0007	admin_web	2026-05-31 14:54:46.564	2026-05-24 10:28:19.221508	excel_import
176	2	3	1	3	BLANCO	20	https://raw.githubusercontent.com/nilsenmr/imagenes/main/BL-DEP-0001-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/BL-DEP-0001.jpeg	BL-DEP-0001	admin_web	2026-06-01 23:17:02.444	2026-05-23 16:28:39.356716	excel_import
188	2	1	3	3	ANIMAL PRINT	12	https://raw.githubusercontent.com/nilsenmr/imagenes/main/BL-CAS-0014-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/BL-CAS-0014.jpeg	BL-CAS-0014	admin_web	2026-07-26 15:28:04.172	2026-05-23 16:28:39.424137	excel_import
201	2	1	3	4	BLANCO	15	https://raw.githubusercontent.com/nilsenmr/imagenes/main/BL-CAS-0026-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/BL-CAS-0026.jpeg	BL-CAS-0026	\N	\N	2026-05-24 11:39:21.298295	excel_import
203	2	1	3	4	CREMA	15	https://raw.githubusercontent.com/nilsenmr/imagenes/main/BL-CAS-0028-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/BL-CAS-0028.jpeg	BL-CAS-0028	\N	\N	2026-05-24 11:39:21.304761	excel_import
205	2	1	1	4	NEGRO	15	https://raw.githubusercontent.com/nilsenmr/imagenes/main/BL-CAS-0030-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/BL-CAS-0030.jpeg	BL-CAS-0030	\N	\N	2026-05-24 11:39:21.309392	excel_import
206	2	1	1	5	NEGRO	15	https://raw.githubusercontent.com/nilsenmr/imagenes/main/BL-CAS-0031-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/BL-CAS-0031.jpeg	BL-CAS-0031	\N	\N	2026-05-24 11:39:21.311466	excel_import
208	2	1	1	1	ZEBRA	15	https://raw.githubusercontent.com/nilsenmr/imagenes/main/BL-CAS-0033-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/BL-CAS-0033.jpeg	BL-CAS-0033	\N	\N	2026-05-24 11:39:21.31841	excel_import
209	2	1	1	2	NEGRO	15	https://raw.githubusercontent.com/nilsenmr/imagenes/main/BL-CAS-0034-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/BL-CAS-0034.jpeg	BL-CAS-0034	\N	\N	2026-05-24 11:39:21.320583	excel_import
210	2	1	1	5	NEGRO	15	https://raw.githubusercontent.com/nilsenmr/imagenes/main/BL-CAS-0035-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/BL-CAS-0035.jpeg	BL-CAS-0035	\N	\N	2026-05-24 11:39:21.323208	excel_import
211	2	1	1	5	MOSTAZA	15	https://raw.githubusercontent.com/nilsenmr/imagenes/main/BL-CAS-0036-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/BL-CAS-0036.jpeg	BL-CAS-0036	\N	\N	2026-05-24 11:39:21.325515	excel_import
212	2	1	1	5	CUADROS	20	https://raw.githubusercontent.com/nilsenmr/imagenes/main/BL-CAS-0037-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/BL-CAS-0037.jpeg	BL-CAS-0037	\N	\N	2026-05-24 11:39:21.328314	excel_import
214	2	1	3	2	VERDE/MENTA	15	https://raw.githubusercontent.com/nilsenmr/imagenes/main/BL-CAS-0039-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/BL-CAS-0039.jpeg	BL-CAS-0039	\N	\N	2026-05-24 11:39:21.333331	excel_import
215	2	3	1	3	VERDE/RAYAS	15	https://raw.githubusercontent.com/nilsenmr/imagenes/main/BL-DEP-0040-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/BL-DEP-0040.jpeg	BL-DEP-0040	\N	\N	2026-05-24 11:39:21.335889	excel_import
231	1	1	1	6	BLANCO	28	https://raw.githubusercontent.com/nilsenmr/imagenes/main/VE-CAS-0044-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/VE-CAS-0044.jpeg	VE-CAS-0044	admin_web	2026-07-09 19:10:45.327	2026-05-24 14:08:15.573053	sistema
217	2	3	3	2	BLANCO	20	https://raw.githubusercontent.com/nilsenmr/imagenes/main/BL-DEP-0042-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/BL-DEP-0042.jpeg	BL-DEP-0042	\N	\N	2026-05-24 11:39:21.340582	excel_import
204	2	1	3	4	NEGRO	15	https://raw.githubusercontent.com/nilsenmr/imagenes/main/BL-CAS-0029-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/BL-CAS-0029.jpeg	BL-CAS-0029	admin_web	2026-05-29 19:01:44.56	2026-05-24 11:39:21.307199	excel_import
207	2	1	1	2	NEGRO/FLORES	15	https://raw.githubusercontent.com/nilsenmr/imagenes/main/BL-CAS-0032-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/BL-CAS-0032.jpeg	BL-CAS-0032	admin_web	2026-05-31 12:50:13.624	2026-05-24 11:39:21.31528	excel_import
202	2	1	3	4	NEGRO/FLORES	20	https://raw.githubusercontent.com/nilsenmr/imagenes/main/BL-CAS-0027-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/BL-CAS-0027.jpeg	BL-CAS-0027	\N	\N	2026-05-24 11:39:21.302424	excel_import
213	2	1	3	5	RAYAS	20	https://raw.githubusercontent.com/nilsenmr/imagenes/main/BL-CAS-0038-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/BL-CAS-0038.jpeg	BL-CAS-0038	admin_web	2026-05-31 12:50:18.773	2026-05-24 11:39:21.330643	excel_import
230	1	1	1	6	NEGRO/AZUL	28	https://raw.githubusercontent.com/nilsenmr/imagenes/main/VE-CAS-0043-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/VE-CAS-0043.jpeg	VE-CAS-0043	admin_web	2026-07-09 19:10:38.922	2026-05-24 14:07:25.454037	sistema
233	2	1	1	3	NEGRO	20	https://raw.githubusercontent.com/nilsenmr/imagenes/main/BL-CAS-0044-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/BL-CAS-0044.jpeg	BL-CAS-0044	\N	\N	2026-05-24 15:18:05.00635	excel_import
234	2	1	1	3	BLANCO/VINOTINTO	15	https://raw.githubusercontent.com/nilsenmr/imagenes/main/BL-CAS-0045-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/BL-CAS-0045.jpeg	BL-CAS-0045	\N	\N	2026-05-24 15:18:05.011241	excel_import
235	2	1	1	5	VINOTINTO	15	https://raw.githubusercontent.com/nilsenmr/imagenes/main/BL-CAS-0046-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/BL-CAS-0046.jpeg	BL-CAS-0046	\N	\N	2026-05-24 15:18:05.014216	excel_import
245	2	1	1	7	BLANCO/ESTAMPADO	20	https://raw.githubusercontent.com/nilsenmr/imagenes/main/BL-CAS-0048-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/BL-CAS-0048.jpeg	BL-CAS-0048	admin_web	2026-05-24 17:51:30.524	2026-05-24 17:51:09.688837	excel_import
246	2	1	1	7	BEIGE/MARRON	20	https://raw.githubusercontent.com/nilsenmr/imagenes/main/BL-CAS-0049-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/BL-CAS-0049.jpeg	BL-CAS-0049	admin_web	2026-05-24 17:52:46.283	2026-05-24 17:51:09.695515	excel_import
174	1	1	1	2	BEIGE/MARRON	23	https://raw.githubusercontent.com/nilsenmr/imagenes/main/VE-CAS-0041-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/VE-CAS-0041.jpeg	VE-CAS-0041	admin_web	2026-06-01 12:42:27.92	2026-05-23 14:31:15.300341	excel_import
248	2	1	1	7	ROSADO/FUCSIA	20	https://raw.githubusercontent.com/nilsenmr/imagenes/main/BL-CAS-0051-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/BL-CAS-0051.jpeg	BL-CAS-0051	admin_web	2026-05-24 17:53:10.654	2026-05-24 17:51:09.700769	excel_import
250	9	1	1	2	MARRON/CUADROS	25	https://raw.githubusercontent.com/nilsenmr/imagenes/main/CH-CAS-0017-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/CH-CAS-0017.jpeg	CH-CAS-0017	\N	\N	2026-05-28 21:52:10.686409	excel_import
247	2	1	3	8	BLANCO/ESTAMPADO	20	https://raw.githubusercontent.com/nilsenmr/imagenes/main/BL-CAS-0050-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/BL-CAS-0050.jpeg	BL-CAS-0050	admin_web	2026-05-24 17:52:59.842	2026-05-24 17:51:09.698124	excel_import
19	6	4	3	3	NEGRO	19	https://raw.githubusercontent.com/nilsenmr/imagenes/main/TB-PAR-0019-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/TB-PAR-0019.jpeg	TB-PAR-0019	\N	\N	2026-02-21 04:31:02.006041	excel_import
237	2	1	3	6	AZUL/TORTUGA	20	https://raw.githubusercontent.com/nilsenmr/imagenes/main/BL-CAS-0052-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/BL-CAS-0052.jpeg	BL-CAS-0052	\N	\N	2026-05-24 15:18:05.0285	excel_import
232	2	1	3	3	BLANCO	15	https://raw.githubusercontent.com/nilsenmr/imagenes/main/BL-CAS-0043-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/BL-CAS-0043.jpeg	BL-CAS-0043	admin_web	2026-05-29 19:01:28.46	2026-05-24 15:18:04.997404	excel_import
184	2	1	3	3	BLANCO/VERDE	20	https://raw.githubusercontent.com/nilsenmr/imagenes/main/BL-CAS-0010-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/BL-CAS-0010.jpeg	BL-CAS-0010	admin_web	2026-05-29 19:01:18.782	2026-05-23 16:28:39.413134	excel_import
182	2	1	3	5	VINOTINTO	20	https://raw.githubusercontent.com/nilsenmr/imagenes/main/BL-CAS-0008-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/BL-CAS-0008.jpeg	BL-CAS-0008	admin_web	2026-05-29 19:01:10.942	2026-05-23 16:28:39.407809	excel_import
251	2	1	1	6	ESTAMPADO ZAFARI	20	https://raw.githubusercontent.com/nilsenmr/imagenes/main/BL-CAS-0054-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/BL-CAS-0054.jpeg	BL-CAS-0054	\N	\N	2026-05-30 11:43:37.702494	excel_import
252	2	1	1	6	BLANCO	20	https://raw.githubusercontent.com/nilsenmr/imagenes/main/BL-CAS-0055-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/BL-CAS-0055.jpeg	BL-CAS-0055	\N	\N	2026-05-30 11:43:37.741805	excel_import
238	2	1	3	6	ESTAMPADO/RETRO	20	https://raw.githubusercontent.com/nilsenmr/imagenes/main/BL-CAS-0053-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/BL-CAS-0053.jpeg	BL-CAS-0053	\N	\N	2026-05-24 15:18:05.032585	excel_import
254	2	1	3	6	AZUL	20	https://raw.githubusercontent.com/nilsenmr/imagenes/main/BL-CAS-0056-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/BL-CAS-0056.jpeg	BL-CAS-0056	\N	\N	2026-05-31 14:48:14.689146	sistema
216	2	1	3	3	NEGRO	22	https://raw.githubusercontent.com/nilsenmr/imagenes/main/BL-CAS-0041-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/BL-CAS-0041.jpeg	BL-CAS-0041	admin_web	2026-05-24 17:55:46.371	2026-05-24 11:39:21.338233	excel_import
255	2	1	1	4	ROJO/AZUL/CUADROS	20	https://raw.githubusercontent.com/nilsenmr/imagenes/main/BL-CAS-0057-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/BL-CAS-0057.jpeg	BL-CAS-0057	\N	\N	2026-06-07 22:58:32.583773	excel_import
256	2	1	1	2	BLANCO	20	https://raw.githubusercontent.com/nilsenmr/imagenes/main/BL-CAS-0058-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/BL-CAS-0058.jpeg	BL-CAS-0058	\N	\N	2026-06-07 22:58:32.751515	excel_import
257	2	1	1	4	NEGRO	20	https://raw.githubusercontent.com/nilsenmr/imagenes/main/BL-CAS-0059-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/BL-CAS-0059.jpeg	BL-CAS-0059	\N	\N	2026-06-07 22:58:32.76838	excel_import
258	2	1	1	5	MARRON	20	https://raw.githubusercontent.com/nilsenmr/imagenes/main/BL-CAS-0060-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/BL-CAS-0060.jpeg	BL-CAS-0060	\N	\N	2026-06-07 22:58:32.791868	excel_import
259	2	1	3	6	NEGRO/ESTAMPADO	20	https://raw.githubusercontent.com/nilsenmr/imagenes/main/BL-CAS-0061-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/BL-CAS-0061.jpeg	BL-CAS-0061	\N	\N	2026-06-07 22:58:32.817996	excel_import
249	9	1	3	3	NEGRO	25	https://raw.githubusercontent.com/nilsenmr/imagenes/main/CH-CAS-0016-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/CH-CAS-0016.jpeg	CH-CAS-0016	\N	\N	2026-05-28 21:52:10.638726	excel_import
236	2	1	3	2	BLANCO	15	https://raw.githubusercontent.com/nilsenmr/imagenes/main/BL-CAS-0047-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/BL-CAS-0047.jpeg	BL-CAS-0047	\N	\N	2026-05-24 15:18:05.017043	excel_import
243	9	3	3	5	BLANCO	25	https://raw.githubusercontent.com/nilsenmr/imagenes/main/CH-DEP-0015-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/CH-DEP-0015.jpeg	CH-DEP-0015	\N	\N	2026-05-24 15:35:20.868	sistema
261	2	1	1	5	ESTAMPADO/FLORES	20	https://raw.githubusercontent.com/nilsenmr/imagenes/main/BL-CAS-0063-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/BL-CAS-0063.jpeg	BL-CAS-0063	\N	\N	2026-06-07 22:58:35.065229	excel_import
262	1	1	1	5	AZUL/BLANCO	25	https://raw.githubusercontent.com/nilsenmr/imagenes/main/VE-CAS-0045-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/VE-CAS-0045.jpeg	VE-CAS-0045	\N	\N	2026-06-07 23:05:19.062584	excel_import
266	1	1	1	4	NEGRO/ESTAMPADO	25	https://raw.githubusercontent.com/nilsenmr/imagenes/main/VE-CAS-0049-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/VE-CAS-0049.jpeg	VE-CAS-0049	\N	\N	2026-06-07 23:05:19.184944	excel_import
267	1	2	1	3	ROSADO	28	https://raw.githubusercontent.com/nilsenmr/imagenes/main/VE-FOR-0050-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/VE-FOR-0050.jpeg	VE-FOR-0050	\N	\N	2026-06-07 23:05:19.197496	excel_import
265	1	1	3	1	BLANCO	25	https://raw.githubusercontent.com/nilsenmr/imagenes/main/VE-CAS-0048-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/VE-CAS-0048.jpeg	VE-CAS-0048	\N	\N	2026-06-07 23:05:19.169945	excel_import
270	9	1	1	5	MARRON/CUADROS	30	https://raw.githubusercontent.com/nilsenmr/imagenes/main/CH-CAS-0018-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/CH-CAS-0018.jpeg	CH-CAS-0018	admin_web	2026-06-16 20:53:32.387	2026-06-16 20:53:09.635999	sistema
271	3	1	1	5	ROSADO	20	https://raw.githubusercontent.com/nilsenmr/imagenes/main/ST-CAS-0001-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/ST-CAS-0001.jpeg	ST-CAS-0001	\N	\N	2026-06-16 21:56:45.220896	excel_import
276	3	1	1	4	CREMA	20	https://raw.githubusercontent.com/nilsenmr/imagenes/main/ST-CAS-0006-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/ST-CAS-0006.jpeg	ST-CAS-0006	\N	\N	2026-06-16 21:56:45.243122	excel_import
277	3	1	1	7	MORADO/ESTAMPADO	20	https://raw.githubusercontent.com/nilsenmr/imagenes/main/ST-CAS-0007-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/ST-CAS-0007.jpeg	ST-CAS-0007	\N	\N	2026-06-16 21:56:45.245359	excel_import
278	3	1	1	10	BLANCO	20	https://raw.githubusercontent.com/nilsenmr/imagenes/main/ST-CAS-0008-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/ST-CAS-0008.jpeg	ST-CAS-0008	\N	\N	2026-06-16 21:56:45.24759	excel_import
280	3	1	1	3	VERDE/GRINCH	20	https://raw.githubusercontent.com/nilsenmr/imagenes/main/ST-CAS-0010-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/ST-CAS-0010.jpeg	ST-CAS-0010	\N	\N	2026-06-16 21:56:45.252557	excel_import
282	3	1	1	3	NEGRO	20	https://raw.githubusercontent.com/nilsenmr/imagenes/main/ST-CAS-0012-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/ST-CAS-0012.jpeg	ST-CAS-0012	\N	\N	2026-06-16 21:56:45.256909	excel_import
283	3	1	1	3	GRIS	20	https://raw.githubusercontent.com/nilsenmr/imagenes/main/ST-CAS-0013-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/ST-CAS-0013.jpeg	ST-CAS-0013	\N	\N	2026-06-16 21:56:45.259665	excel_import
284	3	1	1	1	NEGRO	20	https://raw.githubusercontent.com/nilsenmr/imagenes/main/ST-CAS-0014-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/ST-CAS-0014.jpeg	ST-CAS-0014	\N	\N	2026-06-16 21:56:45.262182	excel_import
285	3	1	1	4	BLANCO	20	https://raw.githubusercontent.com/nilsenmr/imagenes/main/ST-CAS-0015-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/ST-CAS-0015.jpeg	ST-CAS-0015	\N	\N	2026-06-16 21:56:45.263937	excel_import
287	3	1	1	4	NEGRO	20	https://raw.githubusercontent.com/nilsenmr/imagenes/main/ST-CAS-0017-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/ST-CAS-0017.jpeg	ST-CAS-0017	\N	\N	2026-06-16 21:56:45.268146	excel_import
272	3	1	3	3	BLANCO	20	https://raw.githubusercontent.com/nilsenmr/imagenes/main/ST-CAS-0002-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/ST-CAS-0002.jpeg	ST-CAS-0002	\N	\N	2026-06-16 21:56:45.233818	excel_import
264	1	1	3	5	ROJO	25	https://raw.githubusercontent.com/nilsenmr/imagenes/main/VE-CAS-0047-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/VE-CAS-0047.jpeg	VE-CAS-0047	admin_web	2026-08-01 22:09:58.799	2026-06-07 23:05:19.154088	excel_import
260	2	1	3	5	NEGRO	20	https://raw.githubusercontent.com/nilsenmr/imagenes/main/BL-CAS-0062-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/BL-CAS-0062.jpeg	BL-CAS-0062	\N	\N	2026-06-07 22:58:32.838157	excel_import
286	3	1	3	3	ROSA/VIEJA	20	https://raw.githubusercontent.com/nilsenmr/imagenes/main/ST-CAS-0016-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/ST-CAS-0016.jpeg	ST-CAS-0016	\N	\N	2026-06-16 21:56:45.266024	excel_import
263	1	1	3	4	ESTAMPADO/COLORES	25	https://raw.githubusercontent.com/nilsenmr/imagenes/main/VE-CAS-0046-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/VE-CAS-0046.jpeg	VE-CAS-0046	\N	\N	2026-06-07 23:05:19.135857	excel_import
274	3	1	1	6	NEGRO	20	https://raw.githubusercontent.com/nilsenmr/imagenes/main/ST-CAS-0004-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/ST-CAS-0004.jpeg	ST-CAS-0004	admin_web	2026-07-09 19:11:17.812	2026-06-16 21:56:45.238673	excel_import
288	3	1	3	1	BLANCO	20	https://raw.githubusercontent.com/nilsenmr/imagenes/main/ST-CAS-0018-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/ST-CAS-0018.jpeg	ST-CAS-0018	\N	\N	2026-06-16 21:56:45.270457	excel_import
281	3	1	3	3	AZUL/CIELO	20	https://raw.githubusercontent.com/nilsenmr/imagenes/main/ST-CAS-0011-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/ST-CAS-0011.jpeg	ST-CAS-0011	\N	\N	2026-06-16 21:56:45.254772	excel_import
279	3	1	3	5	GRIS	20	https://raw.githubusercontent.com/nilsenmr/imagenes/main/ST-CAS-0009-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/ST-CAS-0009.jpeg	ST-CAS-0009	\N	\N	2026-06-16 21:56:45.249955	excel_import
273	3	1	3	4	AZUL	18	https://raw.githubusercontent.com/nilsenmr/imagenes/main/ST-CAS-0003-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/ST-CAS-0003.jpeg	ST-CAS-0003	\N	\N	2026-06-16 21:56:45.236659	excel_import
268	1	2	3	4	NEGRO	28	https://raw.githubusercontent.com/nilsenmr/imagenes/main/VE-FOR-0051-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/VE-FOR-0051.jpeg	VE-FOR-0051	\N	\N	2026-06-07 23:05:19.219869	excel_import
269	7	3	3	3	NEGRO	20	https://raw.githubusercontent.com/nilsenmr/imagenes/main/BR-DEP-0023-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/BR-DEP-0023.jpeg	BR-DEP-0023	\N	\N	2026-06-08 17:45:51.935497	sistema
289	3	1	1	2	GRIS	20	https://raw.githubusercontent.com/nilsenmr/imagenes/main/ST-CAS-0019-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/ST-CAS-0019.jpeg	ST-CAS-0019	\N	\N	2026-06-16 21:56:45.272385	excel_import
290	3	1	1	8	BLANCO/NAVIDAD	20	https://raw.githubusercontent.com/nilsenmr/imagenes/main/ST-CAS-0020-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/ST-CAS-0020.jpeg	ST-CAS-0020	\N	\N	2026-06-16 21:56:45.274293	excel_import
293	2	1	1	4	VERDE	20	https://raw.githubusercontent.com/nilsenmr/imagenes/main/BL-CAS-0065-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/BL-CAS-0065.jpeg	BL-CAS-0065	\N	\N	2026-06-21 23:26:08.364847	excel_import
294	2	1	1	3	AZUL	20	https://raw.githubusercontent.com/nilsenmr/imagenes/main/BL-CAS-0066-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/BL-CAS-0066.jpeg	BL-CAS-0066	\N	\N	2026-06-21 23:26:08.371817	excel_import
296	4	3	1	2	TURQUESA	25	https://raw.githubusercontent.com/nilsenmr/imagenes/main/CJ-DEP-0001-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/CJ-DEP-0001.jpeg	CJ-DEP-0001	\N	\N	2026-06-21 23:37:01.915244	excel_import
297	4	3	3	3	GRIS	35	https://raw.githubusercontent.com/nilsenmr/imagenes/main/CJ-DEP-0002-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/CJ-DEP-0002.jpeg	CJ-DEP-0002	\N	\N	2026-06-21 23:37:01.91967	excel_import
298	4	1	1	4	NEGRO	25	https://raw.githubusercontent.com/nilsenmr/imagenes/main/CJ-CAS-0003-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/CJ-CAS-0003.jpeg	CJ-CAS-0003	\N	\N	2026-06-21 23:37:01.921489	excel_import
301	4	1	1	2	NEGRO/ESTAMPADO	35	https://raw.githubusercontent.com/nilsenmr/imagenes/main/CJ-CAS-0006-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/CJ-CAS-0006.jpeg	CJ-CAS-0006	\N	\N	2026-06-21 23:37:01.926335	excel_import
302	4	1	1	5	BEIGE/ESTAMPADO	35	https://raw.githubusercontent.com/nilsenmr/imagenes/main/CJ-CAS-0007-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/CJ-CAS-0007.jpeg	CJ-CAS-0007	\N	\N	2026-06-21 23:37:01.928322	excel_import
303	4	1	1	2	BLANCO/ESTAMPADO	35	https://raw.githubusercontent.com/nilsenmr/imagenes/main/CJ-CAS-0008-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/CJ-CAS-0008.jpeg	CJ-CAS-0008	\N	\N	2026-06-21 23:37:01.929767	excel_import
292	2	1	3	5	NEGRO	20	https://raw.githubusercontent.com/nilsenmr/imagenes/main/BL-CAS-0064-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/BL-CAS-0064.jpeg	BL-CAS-0064	\N	\N	2026-06-21 23:21:22.868869	sistema
306	3	1	1	7	ESTAMPADO/TIGRE	20	https://raw.githubusercontent.com/nilsenmr/imagenes/main/ST-CAS-0022-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/ST-CAS-0022.jpeg	ST-CAS-0022	\N	\N	2026-06-22 21:58:45.180177	sistema
308	14	1	1	5	BEIGE	15	https://raw.githubusercontent.com/nilsenmr/imagenes/main/FL-CAS-0017-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/FL-CAS-0017.jpeg	FL-CAS-0017	\N	\N	2026-06-22 22:00:29.095677	sistema
309	1	1	1	3	BLANCO	20	https://raw.githubusercontent.com/nilsenmr/imagenes/main/VE-CAS-0052-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/VE-CAS-0052.jpeg	VE-CAS-0052	admin_web	2026-06-22 22:03:13.735	2026-06-22 22:01:11.740072	sistema
310	1	1	1	3	ROSADO	20	https://raw.githubusercontent.com/nilsenmr/imagenes/main/VE-CAS-0053-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/VE-CAS-0053.jpeg	VE-CAS-0053	admin_web	2026-06-22 22:03:26.754	2026-06-22 22:01:34.731645	sistema
311	1	1	1	2	BEIGE/LADRILLO	20	https://raw.githubusercontent.com/nilsenmr/imagenes/main/VE-CAS-0054-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/VE-CAS-0054.jpeg	VE-CAS-0054	\N	\N	2026-06-22 22:03:46.013766	sistema
312	2	1	1	4	BLANCO/ESTAMPADO	20	https://raw.githubusercontent.com/nilsenmr/imagenes/main/BL-CAS-0068-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/BL-CAS-0068.jpeg	BL-CAS-0068	\N	\N	2026-06-22 22:04:21.298644	sistema
300	4	1	1	2	BLANCO/PELUCHE	16	https://raw.githubusercontent.com/nilsenmr/imagenes/main/CJ-CAS-0005-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/CJ-CAS-0005.jpeg	CJ-CAS-0005	admin_web	2026-07-13 22:57:45.252	2026-06-21 23:37:01.924658	excel_import
316	1	3	1	3	BLANCO	25	https://raw.githubusercontent.com/nilsenmr/imagenes/main/VE-DEP-0058-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/VE-DEP-0058.jpeg	VE-DEP-0058	\N	\N	2026-07-04 16:32:18.361415	sistema
319	15	3	1	3	BLANCO	18	https://raw.githubusercontent.com/nilsenmr/imagenes/main/SH-DEP-0013-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/SH-DEP-0012.jpeg	SH-DEP-0012	\N	\N	2026-07-04 16:35:01.373635	sistema
307	3	1	3	4	ROSADO	20	https://raw.githubusercontent.com/nilsenmr/imagenes/main/ST-CAS-0023-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/ST-CAS-0023.jpeg	ST-CAS-0023	\N	\N	2026-06-22 21:59:34.117836	sistema
304	4	1	3	5	MARRON/ESTAMPADO	35	https://raw.githubusercontent.com/nilsenmr/imagenes/main/CJ-CAS-0009-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/CJ-CAS-0009.jpeg	CJ-CAS-0009	\N	\N	2026-06-21 23:37:01.934496	excel_import
291	3	1	3	3	ROJO/NEGRO	20	https://raw.githubusercontent.com/nilsenmr/imagenes/main/ST-CAS-0021-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/ST-CAS-0021.jpeg	ST-CAS-0021	\N	\N	2026-06-16 21:56:45.276132	excel_import
314	1	3	3	5	NEGRO	25	https://raw.githubusercontent.com/nilsenmr/imagenes/main/VE-DEP-0056-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/VE-DEP-0056.jpeg	VE-DEP-0056	\N	\N	2026-07-04 16:30:30.696766	sistema
315	1	3	3	5	NEGRO	25	https://raw.githubusercontent.com/nilsenmr/imagenes/main/VE-DEP-0057-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/VE-DEP-0057.jpeg	VE-DEP-0057	\N	\N	2026-07-04 16:30:47.685968	sistema
313	1	1	3	1	BLANCO	28	https://raw.githubusercontent.com/nilsenmr/imagenes/main/VE-CAS-0055-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/VE-CAS-0055.jpeg	VE-CAS-0055	\N	\N	2026-07-04 16:29:58.782883	sistema
305	4	1	3	5	BEIGE/PERLAS	35	https://raw.githubusercontent.com/nilsenmr/imagenes/main/CJ-CAS-0010-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/CJ-CAS-0010.jpeg	CJ-CAS-0010	\N	\N	2026-06-21 23:37:01.93626	excel_import
295	2	1	3	4	BLANCO	20	https://raw.githubusercontent.com/nilsenmr/imagenes/main/BL-CAS-0067-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/BL-CAS-0067.jpeg	BL-CAS-0067	\N	\N	2026-06-21 23:26:08.373744	excel_import
299	4	1	3	3	CREMA	28	https://raw.githubusercontent.com/nilsenmr/imagenes/main/CJ-CAS-0004-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/CJ-CAS-0004.jpeg	CJ-CAS-0004	admin_web	2026-08-11 21:21:28.821	2026-06-21 23:37:01.923085	excel_import
318	15	1	1	4	HUESO	15	https://raw.githubusercontent.com/nilsenmr/imagenes/main/SH-CAS-0012-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/SH-CAS-0011.jpeg	SH-CAS-0011	\N	\N	2026-07-04 16:34:43.23532	sistema
320	13	3	1	4	NEGRO	18	https://raw.githubusercontent.com/nilsenmr/imagenes/main/LC-DEP-0009-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/LC-DEP-0009.jpeg	LC-DEP-0009	\N	\N	2026-07-04 16:48:43.933319	sistema
321	9	3	1	3	BLANCO	22	https://raw.githubusercontent.com/nilsenmr/imagenes/main/CH-DEP-0019-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/CH-DEP-0019.jpeg	CH-DEP-0019	\N	\N	2026-07-04 16:51:07.599848	sistema
322	16	1	1	2	BEIGE	18	https://raw.githubusercontent.com/nilsenmr/imagenes/main/PT-CAS-0001-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/PT-CAS-0001.jpeg	PT-CAS-0001	\N	\N	2026-07-04 17:05:49.671107	excel_import
323	16	1	1	5	MORADO	18	https://raw.githubusercontent.com/nilsenmr/imagenes/main/PT-CAS-0002-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/PT-CAS-0002.jpeg	PT-CAS-0002	\N	\N	2026-07-04 17:05:49.678683	excel_import
324	16	1	1	2	GRIS/RAYAS	18	https://raw.githubusercontent.com/nilsenmr/imagenes/main/PT-CAS-0003-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/PT-CAS-0003.jpeg	PT-CAS-0003	\N	\N	2026-07-04 17:05:49.681086	excel_import
325	16	1	1	1	BLANCO/ESTAMPADO	18	https://raw.githubusercontent.com/nilsenmr/imagenes/main/PT-CAS-0004-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/PT-CAS-0004.jpeg	PT-CAS-0004	\N	\N	2026-07-04 17:05:49.682983	excel_import
326	16	1	1	2	ROJO	18	https://raw.githubusercontent.com/nilsenmr/imagenes/main/PT-CAS-0005-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/PT-CAS-0005.jpeg	PT-CAS-0005	\N	\N	2026-07-04 17:05:49.684709	excel_import
327	16	1	1	4	NEGRO/CUERINA	18	https://raw.githubusercontent.com/nilsenmr/imagenes/main/PT-CAS-0006-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/PT-CAS-0006.jpeg	PT-CAS-0006	\N	\N	2026-07-04 17:05:49.686279	excel_import
328	16	1	1	2	NEGRO	18	https://raw.githubusercontent.com/nilsenmr/imagenes/main/PT-CAS-0007-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/PT-CAS-0007.jpeg	PT-CAS-0007	\N	\N	2026-07-04 17:05:49.688165	excel_import
329	16	1	1	3	NEGRO	18	https://raw.githubusercontent.com/nilsenmr/imagenes/main/PT-CAS-0008-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/PT-CAS-0008.jpeg	PT-CAS-0008	\N	\N	2026-07-04 17:05:49.689433	excel_import
330	5	3	1	4	NEGRO	18	https://raw.githubusercontent.com/nilsenmr/imagenes/main/MN-DEP-0001-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/MN-DEP-0001.jpeg	MN-DEP-0001	\N	\N	2026-07-04 17:36:18.34297	excel_import
331	5	3	1	5	CAQUI	18	https://raw.githubusercontent.com/nilsenmr/imagenes/main/MN-DEP-0002-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/MN-DEP-0002.jpeg	MN-DEP-0002	\N	\N	2026-07-04 17:36:18.347024	excel_import
332	5	3	1	2	BEIGE/NEGRO/CUADROS	18	https://raw.githubusercontent.com/nilsenmr/imagenes/main/MN-DEP-0003-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/MN-DEP-0003.jpeg	MN-DEP-0003	\N	\N	2026-07-04 17:36:18.3487	excel_import
333	5	3	1	2	BLANCO/NAVIDAD	18	https://raw.githubusercontent.com/nilsenmr/imagenes/main/MN-DEP-0004-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/MN-DEP-0004.jpeg	MN-DEP-0004	\N	\N	2026-07-04 17:36:18.350087	excel_import
335	5	3	1	3	ROJO	18	https://raw.githubusercontent.com/nilsenmr/imagenes/main/MN-DEP-0006-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/MN-DEP-0006.jpeg	MN-DEP-0006	\N	\N	2026-07-04 17:36:18.353565	excel_import
336	5	3	1	3	CREMA	18	https://raw.githubusercontent.com/nilsenmr/imagenes/main/MN-DEP-0007-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/MN-DEP-0007.jpeg	MN-DEP-0007	\N	\N	2026-07-04 17:36:18.354884	excel_import
338	5	3	1	3	GRIS	18	https://raw.githubusercontent.com/nilsenmr/imagenes/main/MN-DEP-0009-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/MN-DEP-0009.jpeg	MN-DEP-0009	\N	\N	2026-07-04 17:36:18.35692	excel_import
340	3	3	1	10	CREMA	20	https://raw.githubusercontent.com/nilsenmr/imagenes/main/ST-DEP-0024-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/ST-DEP-0024.jpeg	ST-DEP-0024	\N	\N	2026-07-04 18:43:56.944996	excel_import
341	3	3	1	8	CREMA	20	https://raw.githubusercontent.com/nilsenmr/imagenes/main/ST-DEP-0025-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/ST-DEP-0025.jpeg	ST-DEP-0025	\N	\N	2026-07-04 18:43:56.950202	excel_import
342	3	3	1	6	CREMA	20	https://raw.githubusercontent.com/nilsenmr/imagenes/main/ST-DEP-0026-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/ST-DEP-0026.jpeg	ST-DEP-0026	\N	\N	2026-07-04 18:43:56.953085	excel_import
343	3	3	1	8	CREMA	20	https://raw.githubusercontent.com/nilsenmr/imagenes/main/ST-DEP-0027-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/ST-DEP-0027.jpeg	ST-DEP-0027	\N	\N	2026-07-04 18:43:56.956179	excel_import
344	9	1	1	2	MOSTAZA	30	https://raw.githubusercontent.com/nilsenmr/imagenes/main/CH-CAS-0020-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/CH-CAS-0020.jpeg	CH-CAS-0020	\N	\N	2026-07-09 18:13:36.625207	sistema
345	9	1	1	2	MARRÓN/BEIGE	30	https://raw.githubusercontent.com/nilsenmr/imagenes/main/CH-CAS-0021-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/CH-CAS-0021.jpeg	CH-CAS-0021	\N	\N	2026-07-09 18:14:28.410685	sistema
346	9	1	1	2	VERDE	30	https://raw.githubusercontent.com/nilsenmr/imagenes/main/CH-CAS-0022-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/CH-CAS-0022.jpeg	CH-CAS-0022	\N	\N	2026-07-09 18:14:54.712576	sistema
334	5	3	3	3	ROSADO	18	https://raw.githubusercontent.com/nilsenmr/imagenes/main/MN-DEP-0005-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/MN-DEP-0005.jpeg	MN-DEP-0005	\N	\N	2026-07-04 17:36:18.351656	excel_import
339	5	3	3	5	NEGRO	18	https://raw.githubusercontent.com/nilsenmr/imagenes/main/MN-DEP-0010-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/MN-DEP-0010.jpeg	MN-DEP-0010	\N	\N	2026-07-04 17:36:18.360122	excel_import
347	9	1	3	2	GRIS	30	https://raw.githubusercontent.com/nilsenmr/imagenes/main/CH-CAS-0023-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/CH-CAS-0023.jpeg	CH-CAS-0023	\N	\N	2026-07-09 18:15:27.280956	sistema
349	9	1	3	3	CREMA	30	https://raw.githubusercontent.com/nilsenmr/imagenes/main/CH-CAS-0025-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/CH-CAS-0025.jpeg	CH-CAS-0025	admin_web	2026-07-26 16:37:17.18	2026-07-09 18:29:45.778828	sistema
337	5	3	3	4	BLANCO	18	https://raw.githubusercontent.com/nilsenmr/imagenes/main/MN-DEP-0008-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/MN-DEP-0008.jpeg	MN-DEP-0008	\N	\N	2026-07-04 17:36:18.355929	excel_import
350	9	1	1	2	GRIS	30	https://raw.githubusercontent.com/nilsenmr/imagenes/main/CH-CAS-0026-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/CH-CAS-0026.jpeg	CH-CAS-0026	\N	\N	2026-07-09 18:30:30.283039	sistema
351	1	1	1	3	BEIGE/ESTAMPADO	25	https://raw.githubusercontent.com/nilsenmr/imagenes/main/VE-CAS-0059-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/VE-CAS-0059.jpeg	VE-CAS-0059	\N	\N	2026-07-09 18:33:01.475937	sistema
353	2	1	1	3	CREMA	20	https://raw.githubusercontent.com/nilsenmr/imagenes/main/BL-CAS-0070-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/BL-CAS-0070.jpeg	BL-CAS-0070	\N	\N	2026-07-09 18:33:55.646537	sistema
348	9	1	3	4	MARRÓN	30	https://raw.githubusercontent.com/nilsenmr/imagenes/main/CH-CAS-0024-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/CH-CAS-0024.jpeg	CH-CAS-0024	admin_web	2026-07-09 20:37:35.337	2026-07-09 18:15:45.099025	sistema
275	3	1	3	3	FUCSIA	20	https://raw.githubusercontent.com/nilsenmr/imagenes/main/ST-CAS-0005-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/ST-CAS-0005.jpeg	ST-CAS-0005	\N	\N	2026-06-16 21:56:45.241048	excel_import
352	2	1	1	2	BEIGE/TEJIDA/NEGRO	18	https://raw.githubusercontent.com/nilsenmr/imagenes/main/BL-CAS-0069-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/BL-CAS-0069.jpeg	BL-CAS-0069	admin_web	2026-07-13 23:13:16.918	2026-07-09 18:33:38.172252	sistema
100	14	3	3	2	ROSADO/BLANCO	20	https://raw.githubusercontent.com/nilsenmr/imagenes/main/FL-DEP-0004-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/FL-DEP-0004.jpeg	FL-DEP-0004	\N	\N	2026-03-21 16:06:59.153757	excel_import
354	1	1	3	4	BLANCO	28	https://raw.githubusercontent.com/nilsenmr/imagenes/main/VE-CAS-0060-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/VE-CAS-0060.jpeg	VE-CAS-0060	\N	\N	2026-07-26 15:25:48.716204	sistema
355	2	1	1	3	ROSADO	15	https://raw.githubusercontent.com/nilsenmr/imagenes/main/BL-CAS-0071-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/BL-CAS-0071.jpeg	BL-CAS-0071	\N	\N	2026-07-26 18:24:36.288816	excel_import
357	2	1	1	5	NEGRO	20	https://raw.githubusercontent.com/nilsenmr/imagenes/main/BL-CAS-0073-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/BL-CAS-0073.jpeg	BL-CAS-0073	\N	\N	2026-07-26 18:24:36.298554	excel_import
358	2	1	1	5	BLANCO/ESTAMPADO	20	https://raw.githubusercontent.com/nilsenmr/imagenes/main/BL-CAS-0074-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/BL-CAS-0074.jpeg	BL-CAS-0074	\N	\N	2026-07-26 18:24:36.30046	excel_import
359	2	1	1	5	BLANCO/MITAD/ESTAMPADO	20	https://raw.githubusercontent.com/nilsenmr/imagenes/main/BL-CAS-0075-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/BL-CAS-0075.jpeg	BL-CAS-0075	\N	\N	2026-07-26 18:24:36.302821	excel_import
360	2	1	1	5	AZUL/FLORES	20	https://raw.githubusercontent.com/nilsenmr/imagenes/main/BL-CAS-0076-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/BL-CAS-0076.jpeg	BL-CAS-0076	\N	\N	2026-07-26 18:24:36.304854	excel_import
361	2	1	1	5	CUADRADOS	20	https://raw.githubusercontent.com/nilsenmr/imagenes/main/BL-CAS-0077-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/BL-CAS-0077.jpeg	BL-CAS-0077	\N	\N	2026-07-26 18:24:36.306724	excel_import
362	2	1	1	10	BLANCO/ESTAMPADO	20	https://raw.githubusercontent.com/nilsenmr/imagenes/main/BL-CAS-0078-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/BL-CAS-0078.jpeg	BL-CAS-0078	\N	\N	2026-07-26 18:24:36.308548	excel_import
363	9	1	1	3	MARRÓN	25	https://raw.githubusercontent.com/nilsenmr/imagenes/main/CH-CAS-0027-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/CH-CAS-0027.jpeg	CH-CAS-0027	\N	\N	2026-07-26 18:30:05.993062	sistema
364	9	1	1	10	VERDE	25	https://raw.githubusercontent.com/nilsenmr/imagenes/main/CH-CAS-0028-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/CH-CAS-0028.jpeg	CH-CAS-0028	\N	\N	2026-07-26 18:30:19.977017	sistema
365	9	1	1	10	MARRÓN/CUADRO	30	https://raw.githubusercontent.com/nilsenmr/imagenes/main/CH-CAS-0029-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/CH-CAS-0029.jpeg	CH-CAS-0029	\N	\N	2026-07-26 18:33:51.267385	sistema
367	9	1	1	10	BLANCO	30	https://raw.githubusercontent.com/nilsenmr/imagenes/main/CH-CAS-0031-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/CH-CAS-0031.jpeg	CH-CAS-0031	\N	\N	2026-07-26 18:34:32.134511	sistema
368	7	1	1	3	NEGRO	20	https://raw.githubusercontent.com/nilsenmr/imagenes/main/BR-CAS-0024-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/BR-CAS-0024.jpeg	BR-CAS-0024	\N	\N	2026-07-26 18:38:28.35994	sistema
369	7	1	1	4	ROJO	25	https://raw.githubusercontent.com/nilsenmr/imagenes/main/BR-CAS-0025-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/BR-CAS-0025.jpeg	BR-CAS-0025	\N	\N	2026-07-26 18:38:50.404064	sistema
370	7	1	1	2	NEGRO/RAYAS	25	https://raw.githubusercontent.com/nilsenmr/imagenes/main/BR-CAS-0026-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/BR-CAS-0026.jpeg	BR-CAS-0026	\N	\N	2026-07-26 18:39:09.072787	sistema
371	1	2	1	3	NEGRO	28	https://raw.githubusercontent.com/nilsenmr/imagenes/main/VE-FOR-0061-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/VE-FOR-0061.jpeg	VE-FOR-0061	\N	\N	2026-07-26 23:35:05.166756	excel_import
372	1	1	1	3	NEGRO ESTAMPADO	25	https://raw.githubusercontent.com/nilsenmr/imagenes/main/VE-CAS-0062-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/VE-CAS-0062.jpeg	VE-CAS-0062	\N	\N	2026-07-26 23:35:05.19339	excel_import
373	1	1	1	4	FLORES	25	https://raw.githubusercontent.com/nilsenmr/imagenes/main/VE-CAS-0063-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/VE-CAS-0063.jpeg	VE-CAS-0063	\N	\N	2026-07-26 23:35:05.201081	excel_import
374	1	1	1	2	GIRASOLES	28	https://raw.githubusercontent.com/nilsenmr/imagenes/main/VE-CAS-0064-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/VE-CAS-0064.jpeg	VE-CAS-0064	\N	\N	2026-07-26 23:35:05.203129	excel_import
366	9	1	3	7	MARRÓN	30	https://raw.githubusercontent.com/nilsenmr/imagenes/main/CH-CAS-0030-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/CH-CAS-0030.jpeg	CH-CAS-0030	\N	\N	2026-07-26 18:34:12.738733	sistema
356	2	1	3	2	BLANCO/RAYAS/COLORES	15	https://raw.githubusercontent.com/nilsenmr/imagenes/main/BL-CAS-0072-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/BL-CAS-0072.jpeg	BL-CAS-0072	\N	\N	2026-07-26 18:24:36.296614	excel_import
375	1	1	1	2	NEGRO/DORADO	25	https://raw.githubusercontent.com/nilsenmr/imagenes/main/VE-CAS-0065-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/VE-CAS-0065.jpeg	VE-CAS-0065	\N	\N	2026-07-26 23:35:05.207016	excel_import
376	1	2	1	3	ROJO	28	https://raw.githubusercontent.com/nilsenmr/imagenes/main/VE-FOR-0066-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/VE-FOR-0066.jpeg	VE-FOR-0066	\N	\N	2026-07-26 23:35:05.217142	excel_import
378	1	1	1	5	NEGRO	25	https://raw.githubusercontent.com/nilsenmr/imagenes/main/VE-CAS-0068-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/VE-CAS-0068.jpeg	VE-CAS-0068	\N	\N	2026-07-26 23:35:05.231308	excel_import
379	1	1	1	2	BLANCO	25	https://raw.githubusercontent.com/nilsenmr/imagenes/main/VE-CAS-0069-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/VE-CAS-0069.jpeg	VE-CAS-0069	\N	\N	2026-07-26 23:35:05.238503	excel_import
380	1	1	1	2	NEGRO	28	https://raw.githubusercontent.com/nilsenmr/imagenes/main/VE-CAS-0070-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/VE-CAS-0070.jpeg	VE-CAS-0070	\N	\N	2026-07-26 23:35:05.243927	excel_import
377	1	2	1	4	BEIGE	28	https://raw.githubusercontent.com/nilsenmr/imagenes/main/VE-FOR-0067-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/VE-FOR-0067.jpeg	VE-FOR-0067	admin_web	2026-07-26 23:57:16.257	2026-07-26 23:35:05.221332	excel_import
381	4	1	1	2	ANIMAL PRINT	35	https://raw.githubusercontent.com/nilsenmr/imagenes/main/CJ-CAS-0011-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/CJ-CAS-0011.jpeg	CJ-CAS-0011	\N	\N	2026-07-28 20:47:57.010334	excel_import
382	4	1	1	2	NEGRO/ATRIGRADO	35	https://raw.githubusercontent.com/nilsenmr/imagenes/main/CJ-CAS-0012-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/CJ-CAS-0012.jpeg	CJ-CAS-0012	\N	\N	2026-07-28 20:47:57.023315	excel_import
383	4	1	1	2	NEGRO/ESTAMPADO	35	https://raw.githubusercontent.com/nilsenmr/imagenes/main/CJ-CAS-0013-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/CJ-CAS-0013.jpeg	CJ-CAS-0013	\N	\N	2026-07-28 20:47:57.025895	excel_import
384	4	1	1	5	AMARILLO	35	https://raw.githubusercontent.com/nilsenmr/imagenes/main/CJ-CAS-0014-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/CJ-CAS-0014.jpeg	CJ-CAS-0014	\N	\N	2026-07-28 20:47:57.027925	excel_import
386	4	3	1	2	NEGRO/CREMA	35	https://raw.githubusercontent.com/nilsenmr/imagenes/main/CJ-DEP-0016-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/CJ-DEP-0016.jpeg	CJ-DEP-0016	\N	\N	2026-07-28 20:47:57.031419	excel_import
387	4	1	1	2	VERDE OLIVA	35	https://raw.githubusercontent.com/nilsenmr/imagenes/main/CJ-CAS-0017-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/CJ-CAS-0017.jpeg	CJ-CAS-0017	\N	\N	2026-07-28 20:47:57.033327	excel_import
388	4	1	1	3	AZUL CIELO	35	https://raw.githubusercontent.com/nilsenmr/imagenes/main/CJ-CAS-0018-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/CJ-CAS-0018.jpeg	CJ-CAS-0018	\N	\N	2026-07-28 20:47:57.035073	excel_import
389	4	1	1	5	FUCSIA	35	https://raw.githubusercontent.com/nilsenmr/imagenes/main/CJ-CAS-0019-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/CJ-CAS-0019.jpeg	CJ-CAS-0019	\N	\N	2026-07-28 20:47:57.037909	excel_import
390	4	1	1	3	ROJO	35	https://raw.githubusercontent.com/nilsenmr/imagenes/main/CJ-CAS-0020-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/CJ-CAS-0020.jpeg	CJ-CAS-0020	\N	\N	2026-07-28 20:47:57.039883	excel_import
391	4	1	1	5	AZUL /ESTAMPADO	35	https://raw.githubusercontent.com/nilsenmr/imagenes/main/CJ-CAS-0021-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/CJ-CAS-0021.jpeg	CJ-CAS-0021	\N	\N	2026-07-28 20:47:57.041485	excel_import
392	4	1	1	2	VERDE GRAMA	35	https://raw.githubusercontent.com/nilsenmr/imagenes/main/CJ-CAS-0022-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/CJ-CAS-0022.jpeg	CJ-CAS-0022	\N	\N	2026-07-28 20:47:57.043551	excel_import
394	4	1	1	2	ROJO/FALDA	35	https://raw.githubusercontent.com/nilsenmr/imagenes/main/CJ-CAS-0024-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/CJ-CAS-0024.jpeg	CJ-CAS-0024	\N	\N	2026-07-28 20:47:57.046848	excel_import
395	4	1	1	2	CREMA/FALDA	35	https://raw.githubusercontent.com/nilsenmr/imagenes/main/CJ-CAS-0025-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/CJ-CAS-0025.jpeg	CJ-CAS-0025	\N	\N	2026-07-28 20:47:57.048286	excel_import
393	4	3	1	2	NEGRO/ROSA	35	https://raw.githubusercontent.com/nilsenmr/imagenes/main/CJ-DEP-0023-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/CJ-DEP-0023.jpeg	CJ-DEP-0023	admin_web	2026-07-28 20:57:55.344	2026-07-28 20:47:57.045348	excel_import
385	4	1	3	4	VERDE/BLANCO	35	https://raw.githubusercontent.com/nilsenmr/imagenes/main/CJ-CAS-0015-real.jpeg	https://raw.githubusercontent.com/nilsenmr/imagenes/main/CJ-CAS-0015.jpeg	CJ-CAS-0015	\N	\N	2026-07-28 20:47:57.029691	excel_import
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
7	3XL
8	4XL
9	U
10	2XL
6	1XL
\.


--
-- TOC entry 4970 (class 0 OID 24624)
-- Dependencies: 232
-- Data for Name: venta_cuotas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.venta_cuotas (id, id_venta, numero_cuota, fecha_vencimiento, monto_cuota, id_estado_pago) FROM stdin;
1	V2803-001	1 de 4	2026-04-03	10.00	2
2	V2803-001	2 de 4	2026-04-10	10.00	2
87	V0408-004	1 de 2	2026-08-07	26.50	2
83	V0208-001	1 de 4	2026-08-08	22.00	2
84	V0208-001	2 de 4	2026-08-15	22.00	2
5	V1204-001	1 de 2	2026-04-28	22.00	2
6	V1204-001	2 de 2	2026-05-13	22.00	2
7	V1204-002	1 de 4	2026-04-17	6.25	2
8	V1204-002	2 de 4	2026-04-24	6.25	2
3	V2803-001	3 de 4	2026-04-17	10.00	2
4	V2803-001	4 de 4	2026-04-24	10.00	2
22	V0106-001	2 de 4	2026-06-12	9.50	2
82	V3007-001	2 de 2	2026-08-14	17.50	3
9	V1204-002	3 de 4	2026-05-01	6.25	2
10	V1204-002	4 de 4	2026-05-08	6.25	2
77	V2607-002	1 de 4	2026-08-02	5.25	2
47	V1407-001	1 de 2	2026-07-17	17.50	2
11	V2305-001	1 de 2	2026-05-26	12.50	2
36	V2206-003	2 de 2	2026-07-17	10.00	2
37	V2206-005	1 de 2	2026-07-10	12.50	2
38	V2206-005	2 de 2	2026-07-17	12.50	2
78	V2607-002	2 de 4	2026-08-09	5.25	2
13	V2805-001	1 de 2	2026-06-18	12.00	2
18	V2905-002	2 de 4	2026-06-12	22.50	2
19	V2905-002	3 de 4	2026-06-19	22.50	2
23	V0106-001	3 de 4	2026-06-19	9.50	2
79	V2607-002	3 de 4	2026-08-16	5.25	2
80	V2607-002	4 de 4	2026-08-23	5.25	2
29	V0406-003	1 de 2	2026-06-19	11.00	2
27	V0406-001	1 de 2	2026-06-19	10.00	2
88	V0408-004	2 de 2	2026-08-14	26.50	3
31	V1506-001	1 de 4	2026-06-18	12.50	2
33	V1506-001	3 de 4	2026-07-17	12.50	2
34	V1506-001	4 de 4	2026-07-17	12.50	2
32	V1506-001	2 de 4	2026-06-18	12.50	2
45	V1307-001	1 de 2	2026-07-17	15.00	2
41	V1107-001	1 de 4	2026-07-17	23.75	2
21	V0106-001	1 de 4	2026-06-05	9.50	2
90	V0408-005	2 de 2	2026-08-14	24.00	3
17	V2905-002	1 de 4	2026-06-05	22.50	2
25	V0206-001	1 de 2	2026-06-05	7.50	2
48	V1407-001	2 de 2	2026-07-24	17.50	2
26	V0206-001	2 de 2	2026-06-12	7.50	2
15	V2905-001	1 de 2	2026-06-13	10.00	2
12	V2305-001	2 de 2	2026-06-10	12.50	2
42	V1107-001	2 de 4	2026-07-24	23.75	2
46	V1307-001	2 de 2	2026-07-24	15.00	2
28	V0406-001	2 de 2	2026-06-26	10.00	2
91	V0708-001	1 de 2	2026-08-14	32.50	2
24	V0106-001	4 de 4	2026-06-26	9.50	2
16	V2905-001	2 de 2	2026-06-26	10.00	2
49	V2607-001	1 de 4	2026-07-27	27.63	2
50	V2607-001	2 de 4	2026-07-31	27.63	2
20	V2905-002	4 de 4	2026-06-26	22.50	2
43	V1107-001	3 de 4	2026-07-31	23.75	2
51	V2607-001	3 de 4	2026-08-03	27.63	2
35	V2206-003	1 de 2	2026-07-10	10.00	2
30	V0406-003	2 de 2	2026-06-26	11.00	2
14	V2805-001	2 de 2	2026-06-26	12.00	2
39	V0907-001	1 de 2	2026-07-24	10.00	2
40	V0907-001	2 de 2	2026-08-08	10.00	2
52	V2607-001	4 de 4	2026-08-07	27.63	2
85	V0208-001	3 de 4	2026-08-22	22.00	1
86	V0208-001	4 de 4	2026-08-29	22.00	1
92	V0708-001	2 de 2	2026-08-21	32.50	1
44	V1107-001	4 de 4	2026-08-07	23.75	3
81	V3007-001	1 de 2	2026-08-07	17.50	2
89	V0408-005	1 de 2	2026-08-07	24.00	2
\.


--
-- TOC entry 4968 (class 0 OID 24612)
-- Dependencies: 230
-- Data for Name: venta_detalles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.venta_detalles (id, id_venta, codigo_prenda, precio_unitario) FROM stdin;
1	V2803-001	SU-DEP-0002	22.00
2	V2803-001	LC-DEP-0007	18.00
3	V2803-002	TB-PAR-0004	19.00
4	V2803-002	TB-ENT-0038	19.00
5	V0204-001	LC-DEP-0004	18.00
6	V0804-001	TB-PAR-0023	19.00
7	V1204-001	CH-DEP-0001	22.00
8	V1204-001	CH-DEP-0002	22.00
9	V1204-002	VE-DEP-0004	25.00
12	V2805-002	BL-CAS-0050	20.00
13	V2905-001	BL-CAS-0016	20.00
14	V2905-002	BL-CAS-0029	15.00
15	V2905-002	BL-CAS-0005	20.00
16	V2905-002	BL-CAS-0043	15.00
17	V2905-002	BL-CAS-0010	20.00
18	V2905-002	BL-CAS-0008	20.00
19	V3005-001	BL-CAS-0053	20.00
20	V3005-001	BL-CAS-0021	20.00
21	V3105-001	BL-CAS-0056	20.00
22	V3105-001	BL-CAS-0007	20.00
23	V0106-001	TB-PAR-0003	19.00
24	V0106-001	TB-PAR-0019	19.00
25	V0206-001	BL-CAS-0019	15.00
26	V0406-001	BL-CAS-0052	20.00
10	V2305-001	VE-CAS-0036	25.00
11	V2805-001	BD-CAS-0002	24.00
27	V0406-002	BL-CAS-0027	20.00
28	V0406-003	BL-CAS-0041	22.00
29	V0606-001	VE-FOR-0007	28.00
30	V1506-001	BR-CAS-0001	25.00
31	V1506-001	VE-CAS-0048	25.00
32	V1706-001	BL-CAS-0038	20.00
33	V1706-001	BL-CAS-0061	20.00
34	V1706-002	VE-CAS-0047	25.00
35	V2206-001	ST-CAS-0002	20.00
36	V2206-002	BL-CAS-0062	20.00
37	V2206-002	BL-CAS-0064	20.00
38	V2206-003	ST-CAS-0016	20.00
39	V2206-004	VE-CAS-0046	25.00
40	V2206-005	VE-DEP-0001	25.00
41	V0907-001	ST-CAS-0023	20.00
42	V1107-001	VE-CAS-0032	25.00
43	V1107-001	BR-CAS-0013	25.00
44	V1107-001	CH-CAS-0016	25.00
45	V1107-001	ST-CAS-0018	20.00
46	V1307-001	CH-CAS-0024	30.00
47	V1307-002	ST-CAS-0011	20.00
48	V1307-002	ST-CAS-0005	20.00
49	V1407-001	CJ-CAS-0009	35.00
50	V1407-002	ST-CAS-0021	20.00
52	V1407-003	MN-DEP-0010	18.00
51	V1407-003	ST-CAS-0003	18.00
53	V2207-001	VE-DEP-0056	25.00
54	V2607-001	FL-DEP-0004	20.00
55	V2607-001	VE-CAS-0060	28.00
56	V2607-001	CH-CAS-0023	30.00
57	V2607-001	BL-CAS-0014	12.00
58	V2607-001	VE-DEP-0057	25.00
59	V2607-001	BL-CAS-0047	15.00
66	V2607-002	CH-CAS-0025	30.00
67	V2807-001	CH-CAS-0030	30.00
68	V3007-001	CJ-CAS-0015	35.00
69	V0208-001	VE-CAS-0047	25.00
70	V0208-001	VE-CAS-0055	28.00
71	V0208-001	CJ-CAS-0010	35.00
72	V0408-001	BL-CAS-0072	15.00
73	V0408-002	VE-FOR-0020	28.00
74	V0408-003	ST-CAS-0009	20.00
75	V0408-004	VE-FOR-0027	28.00
76	V0408-004	BR-DEP-0009	25.00
77	V0408-005	VE-FOR-0051	28.00
78	V0408-005	BL-DEP-0042	20.00
79	V0708-001	LC-DEP-0002	18.00
80	V0708-001	CH-DEP-0013	22.00
81	V0708-001	CH-DEP-0015	25.00
82	V0708-002	MN-DEP-0005	18.00
83	V1108-001	BR-DEP-0023	20.00
84	V1108-002	VE-CAS-0029	25.00
85	V1108-002	MN-DEP-0008	18.00
86	V1108-002	BD-CAS-0005	24.00
87	V1108-002	CJ-CAS-0004	28.00
88	V1508-001	BL-CAS-0067	20.00
\.


--
-- TOC entry 4966 (class 0 OID 24599)
-- Dependencies: 228
-- Data for Name: ventas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ventas (id_venta, cliente_id, fecha_venta, monto_total, id_estado_pago, id_modalidad, obs, monto_descuento) FROM stdin;
V2206-004	10	2026-06-22	25.00	2	1	\N	\N
V1407-003	11	2026-07-14	36.00	2	1	10$ adicionales + 3$ por cambio de vestido. Total de Venta 49$	\N
V1706-002	11	2026-06-17	25.00	2	1	\N	\N
V2607-001	13	2026-07-26	130.00	2	3	DESCUENTO DEL 15%, TOTAL 110.5, QUEDANDO LAS CUOTAS EN 27.63	110.50
V0406-001	20	2026-06-04	20.00	2	2	\N	\N
V0406-003	4	2026-06-04	22.00	2	2	\N	\N
V2805-001	5	2026-05-28	24.00	2	2	\N	\N
V2207-001	11	2026-07-22	25.00	1	1	\N	\N
V0907-001	23	2026-07-09	20.00	2	2	\N	\N
V2206-001	1	2026-06-22	20.00	2	1	\N	\N
V0106-001	18	2026-05-29	38.00	2	3	\N	\N
V0408-002	10	2026-08-04	28.00	2	1	\N	\N
V2607-002	25	2026-07-26	30.00	2	3	no va a pagar nunca porque es la jefa	21.00
V2905-002	2	2026-05-29	90.00	2	3	\N	\N
V0606-001	12	2026-06-06	28.00	2	1	\N	\N
V0408-003	27	2026-08-04	20.00	2	1	\N	\N
V1407-002	24	2026-07-14	20.00	2	1	\N	\N
V2803-002	12	2026-03-28	38.00	2	1	\N	\N
V0204-001	13	2026-04-02	18.00	2	1	\N	\N
V1706-001	17	2026-06-17	40.00	2	1	\N	\N
V0408-001	16	2026-08-04	15.00	2	1	\N	\N
V2905-001	16	2026-05-29	20.00	2	2	\N	\N
V2206-002	22	2026-06-22	40.00	2	1	\N	\N
V0206-001	19	2026-06-02	15.00	2	2	\N	\N
V2807-001	26	2026-07-28	30.00	2	1	\N	\N
V2305-001	5	2026-05-23	25.00	2	2	\N	\N
V1204-001	3	2026-04-12	44.00	2	2	\N	\N
V0708-002	30	2026-08-07	18.00	2	1	\N	\N
V2206-003	16	2026-06-22	20.00	2	2	\N	\N
V0406-002	21	2026-06-04	20.00	2	1	\N	\N
V1108-002	31	2026-08-11	95.00	1	1	\N	\N
V2803-001	4	2026-03-27	40.00	2	3	\N	\N
V0804-001	14	2026-04-08	19.00	2	1	\N	\N
V0208-001	13	2026-08-02	88.00	4	3	Abonó 50$, resta 38$	\N
V1307-002	10	2026-07-13	40.00	2	1	\N	\N
V1204-002	4	2026-04-10	25.00	2	3	\N	\N
V2805-002	15	2026-05-28	20.00	2	1	\N	\N
V3005-001	17	2026-05-30	40.00	2	1	\N	\N
V3105-001	1	2026-05-31	40.00	2	1	\N	\N
V2206-005	4	2026-06-22	25.00	2	2	\N	\N
V1407-001	18	2026-07-14	35.00	2	2	\N	\N
V1307-001	5	2026-07-13	30.00	2	2	\N	\N
V1108-001	18	2026-08-11	20.00	1	1	\N	\N
V1508-001	18	2026-08-15	20.00	1	1	\N	\N
V0408-005	29	2026-08-04	48.00	3	2	\N	\N
V1506-001	14	2026-06-15	50.00	2	3	\N	\N
V0408-004	28	2026-08-04	53.00	3	2	Abonó en su primera cuota 30$ para la segunda tiene pendiente 23$	\N
V0708-001	27	2026-08-07	65.00	4	2	\N	\N
V1107-001	4	2026-07-11	95.00	3	3	\N	\N
V3007-001	5	2026-07-30	35.00	3	2	\N	\N
\.


--
-- TOC entry 4993 (class 0 OID 0)
-- Dependencies: 217
-- Name: categorias_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.categorias_id_seq', 16, true);


--
-- TOC entry 4994 (class 0 OID 0)
-- Dependencies: 235
-- Name: clientes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.clientes_id_seq', 31, true);


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

SELECT pg_catalog.setval('public.prendas_id_seq', 395, true);


--
-- TOC entry 5001 (class 0 OID 0)
-- Dependencies: 225
-- Name: tallas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tallas_id_seq', 10, true);


--
-- TOC entry 5002 (class 0 OID 0)
-- Dependencies: 231
-- Name: venta_cuotas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.venta_cuotas_id_seq', 92, true);


--
-- TOC entry 5003 (class 0 OID 0)
-- Dependencies: 229
-- Name: venta_detalles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.venta_detalles_id_seq', 88, true);


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


-- Completed on 2026-08-15 11:17:03

--
-- PostgreSQL database dump complete
--

\unrestrict 6QKOf6TAjnfrUf00oU7hjSMJ4kAPJqvU5nEicPWeozcZU6FPNiwnSCqahSEgx4Q

