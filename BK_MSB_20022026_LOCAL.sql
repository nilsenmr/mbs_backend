--
-- PostgreSQL database dump
--

\restrict Llvyb2rCygleX5c6WmQjQKXBcCKeZImj24z76K2n0yMkbMAnxoTcn4fasPMWNY3

-- Dumped from database version 16.10
-- Dumped by pg_dump version 16.10

-- Started on 2026-02-20 22:16:37

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
-- TOC entry 4955 (class 0 OID 0)
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
    codigo text NOT NULL,
    nombre text NOT NULL
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
-- TOC entry 4956 (class 0 OID 0)
-- Dependencies: 217
-- Name: categorias_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.categorias_id_seq OWNED BY public.categorias.id;


--
-- TOC entry 227 (class 1259 OID 24591)
-- Name: estados_pago; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.estados_pago (
    id integer NOT NULL,
    nombre character varying(20) NOT NULL,
    descripcion text
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
-- TOC entry 4957 (class 0 OID 0)
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
    codigo text NOT NULL,
    descripcion text
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
-- TOC entry 4958 (class 0 OID 0)
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
    codigo text NOT NULL,
    nombre text NOT NULL
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
-- TOC entry 4959 (class 0 OID 0)
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
    descripcion text
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
-- TOC entry 4960 (class 0 OID 0)
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
    color text NOT NULL,
    precio numeric NOT NULL,
    imagen_real text,
    imagen_referencial text,
    codigo text NOT NULL,
    updated_by text,
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
    nombre text NOT NULL
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
-- TOC entry 4961 (class 0 OID 0)
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
-- TOC entry 4962 (class 0 OID 0)
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
-- TOC entry 4963 (class 0 OID 0)
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
-- TOC entry 4733 (class 2604 OID 16430)
-- Name: categorias id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categorias ALTER COLUMN id SET DEFAULT nextval('public.categorias_id_seq'::regclass);


--
-- TOC entry 4739 (class 2604 OID 24594)
-- Name: estados_pago id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estados_pago ALTER COLUMN id SET DEFAULT nextval('public.estados_pago_id_seq'::regclass);


--
-- TOC entry 4734 (class 2604 OID 16431)
-- Name: estados_prenda id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estados_prenda ALTER COLUMN id SET DEFAULT nextval('public.estados_prenda_id_seq'::regclass);


--
-- TOC entry 4735 (class 2604 OID 16432)
-- Name: estilos id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estilos ALTER COLUMN id SET DEFAULT nextval('public.estilos_id_seq'::regclass);


--
-- TOC entry 4746 (class 2604 OID 24647)
-- Name: modalidades_pago id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.modalidades_pago ALTER COLUMN id SET DEFAULT nextval('public.modalidades_pago_id_seq'::regclass);


--
-- TOC entry 4738 (class 2604 OID 16433)
-- Name: tallas id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tallas ALTER COLUMN id SET DEFAULT nextval('public.tallas_id_seq'::regclass);


--
-- TOC entry 4744 (class 2604 OID 24627)
-- Name: venta_cuotas id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.venta_cuotas ALTER COLUMN id SET DEFAULT nextval('public.venta_cuotas_id_seq'::regclass);


--
-- TOC entry 4743 (class 2604 OID 24615)
-- Name: venta_detalles id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.venta_detalles ALTER COLUMN id SET DEFAULT nextval('public.venta_detalles_id_seq'::regclass);


--
-- TOC entry 4931 (class 0 OID 16398)
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
-- TOC entry 4942 (class 0 OID 24591)
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
-- TOC entry 4933 (class 0 OID 16404)
-- Dependencies: 218
-- Data for Name: estados_prenda; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.estados_prenda (id, codigo, descripcion) FROM stdin;
1	DISPONIBLE	Prenda disponible para la venta
2	APARTADA	Prenda reservada por un cliente
3	VENDIDA	Prenda ya vendida
\.


--
-- TOC entry 4935 (class 0 OID 16410)
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
-- TOC entry 4949 (class 0 OID 24644)
-- Dependencies: 234
-- Data for Name: modalidades_pago; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.modalidades_pago (id, nombre, cantidad_cuotas, descripcion) FROM stdin;
1	Pago Completo	1	Venta liquidada en un solo pago
2	Plan 2 Cuotas	2	Venta dividida en dos pagos quincenales
3	Plan 4 Cuotas	4	Venta dividida en cuatro pagos semanales
\.


--
-- TOC entry 4938 (class 0 OID 16417)
-- Dependencies: 223
-- Data for Name: prendas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.prendas (id, categoria_id, estilo_id, estado_id, talla_id, color, precio, imagen_real, imagen_referencial, codigo, updated_by, updated_at, created_at, created_by) FROM stdin;
\.


--
-- TOC entry 4939 (class 0 OID 16424)
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
-- TOC entry 4947 (class 0 OID 24624)
-- Dependencies: 232
-- Data for Name: venta_cuotas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.venta_cuotas (id, id_venta, numero_cuota, fecha_vencimiento, monto_cuota, id_estado_pago) FROM stdin;
\.


--
-- TOC entry 4945 (class 0 OID 24612)
-- Dependencies: 230
-- Data for Name: venta_detalles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.venta_detalles (id, id_venta, codigo_prenda, precio_unitario) FROM stdin;
\.


--
-- TOC entry 4943 (class 0 OID 24599)
-- Dependencies: 228
-- Data for Name: ventas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ventas (id_venta, cliente_id, fecha_venta, monto_total, id_estado_pago, id_modalidad) FROM stdin;
\.


--
-- TOC entry 4964 (class 0 OID 0)
-- Dependencies: 217
-- Name: categorias_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.categorias_id_seq', 15, true);


--
-- TOC entry 4965 (class 0 OID 0)
-- Dependencies: 226
-- Name: estados_pago_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.estados_pago_id_seq', 4, true);


--
-- TOC entry 4966 (class 0 OID 0)
-- Dependencies: 219
-- Name: estados_prenda_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.estados_prenda_id_seq', 3, true);


--
-- TOC entry 4967 (class 0 OID 0)
-- Dependencies: 221
-- Name: estilos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.estilos_id_seq', 5, true);


--
-- TOC entry 4968 (class 0 OID 0)
-- Dependencies: 233
-- Name: modalidades_pago_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.modalidades_pago_id_seq', 3, true);


--
-- TOC entry 4969 (class 0 OID 0)
-- Dependencies: 222
-- Name: prendas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.prendas_id_seq', 1, false);


--
-- TOC entry 4970 (class 0 OID 0)
-- Dependencies: 225
-- Name: tallas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tallas_id_seq', 9, true);


--
-- TOC entry 4971 (class 0 OID 0)
-- Dependencies: 231
-- Name: venta_cuotas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.venta_cuotas_id_seq', 1, false);


--
-- TOC entry 4972 (class 0 OID 0)
-- Dependencies: 229
-- Name: venta_detalles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.venta_detalles_id_seq', 1, false);


--
-- TOC entry 4748 (class 2606 OID 16435)
-- Name: categorias categorias_codigo_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categorias
    ADD CONSTRAINT categorias_codigo_key UNIQUE (codigo);


--
-- TOC entry 4750 (class 2606 OID 16437)
-- Name: categorias categorias_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categorias
    ADD CONSTRAINT categorias_pkey PRIMARY KEY (id);


--
-- TOC entry 4768 (class 2606 OID 24598)
-- Name: estados_pago estados_pago_nombre_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estados_pago
    ADD CONSTRAINT estados_pago_nombre_key UNIQUE (nombre);


--
-- TOC entry 4770 (class 2606 OID 24596)
-- Name: estados_pago estados_pago_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estados_pago
    ADD CONSTRAINT estados_pago_pkey PRIMARY KEY (id);


--
-- TOC entry 4752 (class 2606 OID 16439)
-- Name: estados_prenda estados_prenda_codigo_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estados_prenda
    ADD CONSTRAINT estados_prenda_codigo_key UNIQUE (codigo);


--
-- TOC entry 4754 (class 2606 OID 16441)
-- Name: estados_prenda estados_prenda_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estados_prenda
    ADD CONSTRAINT estados_prenda_pkey PRIMARY KEY (id);


--
-- TOC entry 4756 (class 2606 OID 16443)
-- Name: estilos estilos_codigo_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estilos
    ADD CONSTRAINT estilos_codigo_key UNIQUE (codigo);


--
-- TOC entry 4758 (class 2606 OID 16445)
-- Name: estilos estilos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estilos
    ADD CONSTRAINT estilos_pkey PRIMARY KEY (id);


--
-- TOC entry 4778 (class 2606 OID 24651)
-- Name: modalidades_pago modalidades_pago_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.modalidades_pago
    ADD CONSTRAINT modalidades_pago_pkey PRIMARY KEY (id);


--
-- TOC entry 4760 (class 2606 OID 16447)
-- Name: prendas prendas_codigo_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.prendas
    ADD CONSTRAINT prendas_codigo_key UNIQUE (codigo);


--
-- TOC entry 4762 (class 2606 OID 16449)
-- Name: prendas prendas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.prendas
    ADD CONSTRAINT prendas_pkey PRIMARY KEY (id);


--
-- TOC entry 4764 (class 2606 OID 16451)
-- Name: tallas tallas_nombre_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tallas
    ADD CONSTRAINT tallas_nombre_key UNIQUE (nombre);


--
-- TOC entry 4766 (class 2606 OID 16453)
-- Name: tallas tallas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tallas
    ADD CONSTRAINT tallas_pkey PRIMARY KEY (id);


--
-- TOC entry 4776 (class 2606 OID 24630)
-- Name: venta_cuotas venta_cuotas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.venta_cuotas
    ADD CONSTRAINT venta_cuotas_pkey PRIMARY KEY (id);


--
-- TOC entry 4774 (class 2606 OID 24617)
-- Name: venta_detalles venta_detalles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.venta_detalles
    ADD CONSTRAINT venta_detalles_pkey PRIMARY KEY (id);


--
-- TOC entry 4772 (class 2606 OID 24605)
-- Name: ventas ventas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ventas
    ADD CONSTRAINT ventas_pkey PRIMARY KEY (id_venta);


--
-- TOC entry 4783 (class 2606 OID 24606)
-- Name: ventas fk_estado; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ventas
    ADD CONSTRAINT fk_estado FOREIGN KEY (id_estado_pago) REFERENCES public.estados_pago(id);


--
-- TOC entry 4786 (class 2606 OID 24636)
-- Name: venta_cuotas fk_estado_cuota; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.venta_cuotas
    ADD CONSTRAINT fk_estado_cuota FOREIGN KEY (id_estado_pago) REFERENCES public.estados_pago(id);


--
-- TOC entry 4784 (class 2606 OID 24653)
-- Name: ventas fk_modalidad; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ventas
    ADD CONSTRAINT fk_modalidad FOREIGN KEY (id_modalidad) REFERENCES public.modalidades_pago(id);


--
-- TOC entry 4787 (class 2606 OID 24631)
-- Name: venta_cuotas fk_venta_cuotas; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.venta_cuotas
    ADD CONSTRAINT fk_venta_cuotas FOREIGN KEY (id_venta) REFERENCES public.ventas(id_venta) ON DELETE CASCADE;


--
-- TOC entry 4785 (class 2606 OID 24618)
-- Name: venta_detalles fk_venta_detalles; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.venta_detalles
    ADD CONSTRAINT fk_venta_detalles FOREIGN KEY (id_venta) REFERENCES public.ventas(id_venta) ON DELETE CASCADE;


--
-- TOC entry 4779 (class 2606 OID 16454)
-- Name: prendas prendas_categoria_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.prendas
    ADD CONSTRAINT prendas_categoria_id_fkey FOREIGN KEY (categoria_id) REFERENCES public.categorias(id);


--
-- TOC entry 4780 (class 2606 OID 16459)
-- Name: prendas prendas_estado_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.prendas
    ADD CONSTRAINT prendas_estado_id_fkey FOREIGN KEY (estado_id) REFERENCES public.estados_prenda(id);


--
-- TOC entry 4781 (class 2606 OID 16464)
-- Name: prendas prendas_estilo_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.prendas
    ADD CONSTRAINT prendas_estilo_id_fkey FOREIGN KEY (estilo_id) REFERENCES public.estilos(id);


--
-- TOC entry 4782 (class 2606 OID 16469)
-- Name: prendas prendas_talla_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.prendas
    ADD CONSTRAINT prendas_talla_id_fkey FOREIGN KEY (talla_id) REFERENCES public.tallas(id);


-- Completed on 2026-02-20 22:16:37

--
-- PostgreSQL database dump complete
--

\unrestrict Llvyb2rCygleX5c6WmQjQKXBcCKeZImj24z76K2n0yMkbMAnxoTcn4fasPMWNY3

