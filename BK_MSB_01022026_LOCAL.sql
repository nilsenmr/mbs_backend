--
-- PostgreSQL database dump
--

\restrict DygLZ1pATlhcEJp5hpZj73zHY0bpKxA5SQwdkONGdSdAHTlmDfm3dLQwZ7lgVI0

-- Dumped from database version 16.10
-- Dumped by pg_dump version 16.10

-- Started on 2026-02-01 13:51:26

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
-- TOC entry 2 (class 3079 OID 16384)
-- Name: adminpack; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS adminpack WITH SCHEMA pg_catalog;


--
-- TOC entry 4897 (class 0 OID 0)
-- Dependencies: 2
-- Name: EXTENSION adminpack; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION adminpack IS 'administrative functions for PostgreSQL';


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
-- TOC entry 4898 (class 0 OID 0)
-- Dependencies: 217
-- Name: categorias_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.categorias_id_seq OWNED BY public.categorias.id;


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
-- TOC entry 4899 (class 0 OID 0)
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
-- TOC entry 4900 (class 0 OID 0)
-- Dependencies: 221
-- Name: estilos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.estilos_id_seq OWNED BY public.estilos.id;


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
-- TOC entry 4901 (class 0 OID 0)
-- Dependencies: 225
-- Name: tallas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tallas_id_seq OWNED BY public.tallas.id;


--
-- TOC entry 4709 (class 2604 OID 16430)
-- Name: categorias id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categorias ALTER COLUMN id SET DEFAULT nextval('public.categorias_id_seq'::regclass);


--
-- TOC entry 4710 (class 2604 OID 16431)
-- Name: estados_prenda id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estados_prenda ALTER COLUMN id SET DEFAULT nextval('public.estados_prenda_id_seq'::regclass);


--
-- TOC entry 4711 (class 2604 OID 16432)
-- Name: estilos id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estilos ALTER COLUMN id SET DEFAULT nextval('public.estilos_id_seq'::regclass);


--
-- TOC entry 4714 (class 2604 OID 16433)
-- Name: tallas id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tallas ALTER COLUMN id SET DEFAULT nextval('public.tallas_id_seq'::regclass);


--
-- TOC entry 4882 (class 0 OID 16398)
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
-- TOC entry 4884 (class 0 OID 16404)
-- Dependencies: 218
-- Data for Name: estados_prenda; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.estados_prenda (id, codigo, descripcion) FROM stdin;
1	DISPONIBLE	Prenda disponible para la venta
2	APARTADA	Prenda reservada por un cliente
3	VENDIDA	Prenda ya vendida
\.


--
-- TOC entry 4886 (class 0 OID 16410)
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
-- TOC entry 4889 (class 0 OID 16417)
-- Dependencies: 223
-- Data for Name: prendas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.prendas (id, categoria_id, estilo_id, estado_id, talla_id, color, precio, imagen_real, imagen_referencial, codigo, updated_by, updated_at, created_at, created_by) FROM stdin;
\.


--
-- TOC entry 4890 (class 0 OID 16424)
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
-- TOC entry 4902 (class 0 OID 0)
-- Dependencies: 217
-- Name: categorias_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.categorias_id_seq', 15, true);


--
-- TOC entry 4903 (class 0 OID 0)
-- Dependencies: 219
-- Name: estados_prenda_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.estados_prenda_id_seq', 3, true);


--
-- TOC entry 4904 (class 0 OID 0)
-- Dependencies: 221
-- Name: estilos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.estilos_id_seq', 5, true);


--
-- TOC entry 4905 (class 0 OID 0)
-- Dependencies: 222
-- Name: prendas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.prendas_id_seq', 1, false);


--
-- TOC entry 4906 (class 0 OID 0)
-- Dependencies: 225
-- Name: tallas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tallas_id_seq', 9, true);


--
-- TOC entry 4716 (class 2606 OID 16435)
-- Name: categorias categorias_codigo_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categorias
    ADD CONSTRAINT categorias_codigo_key UNIQUE (codigo);


--
-- TOC entry 4718 (class 2606 OID 16437)
-- Name: categorias categorias_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categorias
    ADD CONSTRAINT categorias_pkey PRIMARY KEY (id);


--
-- TOC entry 4720 (class 2606 OID 16439)
-- Name: estados_prenda estados_prenda_codigo_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estados_prenda
    ADD CONSTRAINT estados_prenda_codigo_key UNIQUE (codigo);


--
-- TOC entry 4722 (class 2606 OID 16441)
-- Name: estados_prenda estados_prenda_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estados_prenda
    ADD CONSTRAINT estados_prenda_pkey PRIMARY KEY (id);


--
-- TOC entry 4724 (class 2606 OID 16443)
-- Name: estilos estilos_codigo_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estilos
    ADD CONSTRAINT estilos_codigo_key UNIQUE (codigo);


--
-- TOC entry 4726 (class 2606 OID 16445)
-- Name: estilos estilos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estilos
    ADD CONSTRAINT estilos_pkey PRIMARY KEY (id);


--
-- TOC entry 4728 (class 2606 OID 16447)
-- Name: prendas prendas_codigo_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.prendas
    ADD CONSTRAINT prendas_codigo_key UNIQUE (codigo);


--
-- TOC entry 4730 (class 2606 OID 16449)
-- Name: prendas prendas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.prendas
    ADD CONSTRAINT prendas_pkey PRIMARY KEY (id);


--
-- TOC entry 4732 (class 2606 OID 16451)
-- Name: tallas tallas_nombre_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tallas
    ADD CONSTRAINT tallas_nombre_key UNIQUE (nombre);


--
-- TOC entry 4734 (class 2606 OID 16453)
-- Name: tallas tallas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tallas
    ADD CONSTRAINT tallas_pkey PRIMARY KEY (id);


--
-- TOC entry 4735 (class 2606 OID 16454)
-- Name: prendas prendas_categoria_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.prendas
    ADD CONSTRAINT prendas_categoria_id_fkey FOREIGN KEY (categoria_id) REFERENCES public.categorias(id);


--
-- TOC entry 4736 (class 2606 OID 16459)
-- Name: prendas prendas_estado_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.prendas
    ADD CONSTRAINT prendas_estado_id_fkey FOREIGN KEY (estado_id) REFERENCES public.estados_prenda(id);


--
-- TOC entry 4737 (class 2606 OID 16464)
-- Name: prendas prendas_estilo_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.prendas
    ADD CONSTRAINT prendas_estilo_id_fkey FOREIGN KEY (estilo_id) REFERENCES public.estilos(id);


--
-- TOC entry 4738 (class 2606 OID 16469)
-- Name: prendas prendas_talla_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.prendas
    ADD CONSTRAINT prendas_talla_id_fkey FOREIGN KEY (talla_id) REFERENCES public.tallas(id);


-- Completed on 2026-02-01 13:51:27

--
-- PostgreSQL database dump complete
--

\unrestrict DygLZ1pATlhcEJp5hpZj73zHY0bpKxA5SQwdkONGdSdAHTlmDfm3dLQwZ7lgVI0

