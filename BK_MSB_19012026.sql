--
-- PostgreSQL database dump
--

\restrict jtTEniwjcFYle1MF6x3AhFByGDszQgV9fP1Lyn9aPXk955siK4g3ukRsE69CNIY

-- Dumped from database version 16.10 (Ubuntu 16.10-0ubuntu0.24.04.1)
-- Dumped by pg_dump version 16.10

-- Started on 2026-01-19 20:59:12

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 216 (class 1259 OID 24577)
-- Name: categorias; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.categorias (
    id integer NOT NULL,
    codigo text NOT NULL,
    nombre text NOT NULL
);


ALTER TABLE public.categorias OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 24576)
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
-- TOC entry 3457 (class 0 OID 0)
-- Dependencies: 215
-- Name: categorias_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.categorias_id_seq OWNED BY public.categorias.id;


--
-- TOC entry 218 (class 1259 OID 24604)
-- Name: estados_prenda; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.estados_prenda (
    id integer NOT NULL,
    codigo text NOT NULL,
    descripcion text
);


ALTER TABLE public.estados_prenda OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 24603)
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
-- TOC entry 3458 (class 0 OID 0)
-- Dependencies: 217
-- Name: estados_prenda_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.estados_prenda_id_seq OWNED BY public.estados_prenda.id;


--
-- TOC entry 222 (class 1259 OID 24626)
-- Name: estilos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.estilos (
    id integer NOT NULL,
    codigo text NOT NULL,
    nombre text NOT NULL
);


ALTER TABLE public.estilos OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 24625)
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
-- TOC entry 3459 (class 0 OID 0)
-- Dependencies: 221
-- Name: estilos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.estilos_id_seq OWNED BY public.estilos.id;


--
-- TOC entry 223 (class 1259 OID 24711)
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
-- TOC entry 224 (class 1259 OID 24752)
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
-- TOC entry 220 (class 1259 OID 24615)
-- Name: tallas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tallas (
    id integer NOT NULL,
    nombre text NOT NULL
);


ALTER TABLE public.tallas OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 24614)
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
-- TOC entry 3460 (class 0 OID 0)
-- Dependencies: 219
-- Name: tallas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tallas_id_seq OWNED BY public.tallas.id;


--
-- TOC entry 3269 (class 2604 OID 24580)
-- Name: categorias id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categorias ALTER COLUMN id SET DEFAULT nextval('public.categorias_id_seq'::regclass);


--
-- TOC entry 3270 (class 2604 OID 24607)
-- Name: estados_prenda id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estados_prenda ALTER COLUMN id SET DEFAULT nextval('public.estados_prenda_id_seq'::regclass);


--
-- TOC entry 3272 (class 2604 OID 24629)
-- Name: estilos id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estilos ALTER COLUMN id SET DEFAULT nextval('public.estilos_id_seq'::regclass);


--
-- TOC entry 3271 (class 2604 OID 24618)
-- Name: tallas id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tallas ALTER COLUMN id SET DEFAULT nextval('public.tallas_id_seq'::regclass);


--
-- TOC entry 3443 (class 0 OID 24577)
-- Dependencies: 216
-- Data for Name: categorias; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.categorias (id, codigo, nombre) FROM stdin;
1	VS	Vestidos
2	BL	Blusas
3	ST	Suéteres
4	CJ	Conjuntos
5	MN	Monos
6	TB	Traje de banos
7	BR	Bragas
8	BZ	Blazer
9	CH	Chaqueta
10	BD	Body
\.


--
-- TOC entry 3445 (class 0 OID 24604)
-- Dependencies: 218
-- Data for Name: estados_prenda; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.estados_prenda (id, codigo, descripcion) FROM stdin;
1	DISPONIBLE	Prenda disponible para la venta
2	APARTADA	Prenda reservada por un cliente
3	VENDIDA	Prenda ya vendida
\.


--
-- TOC entry 3449 (class 0 OID 24626)
-- Dependencies: 222
-- Data for Name: estilos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.estilos (id, codigo, nombre) FROM stdin;
1	CASUAL	Casual
2	FORMAL	Formal
3	DEP	Deportivo
\.


--
-- TOC entry 3451 (class 0 OID 24752)
-- Dependencies: 224
-- Data for Name: prendas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.prendas (id, categoria_id, estilo_id, estado_id, talla_id, color, precio, imagen_real, imagen_referencial, codigo, updated_by, updated_at, created_at, created_by) FROM stdin;
2	2	1	1	2	Negro	59.99	https://mi-bucket.com/real.jpg	https://mi-bucket.com/ref.jpg	BL-CASUAL-2	\N	\N	2025-10-12 23:15:31.353957	sistema
3	3	2	1	3	Negro	59.99	https://mi-bucket.com/real.jpg	https://mi-bucket.com/ref.jpg	ST-FORMAL-1	sistema	2025-11-18 23:49:33.26	2025-11-18 23:37:50.270621	sistema
1	2	1	1	4	Negro	59.99	https://mi-bucket.com/real.jpg	https://mi-bucket.com/ref.jpg	BL-CASUAL-1	sistema	2025-11-18 23:51:27.877	2025-10-12 23:14:42.238974	sistema
4	3	3	1	4	Negro	34.99	https://mi-bucket.com/real.jpg	https://mi-bucket.com/ref.jpg	ST-DEP-0001	\N	\N	2026-01-20 00:01:56.051351	sistema
5	3	3	1	3	Blanco	34.99	https://mi-bucket.com/real.jpg	https://mi-bucket.com/ref.jpg	ST-DEP-2	\N	\N	2026-01-20 00:04:40.62271	sistema
6	3	3	1	6	Rojo	39.99	https://mi-bucket.com/real.jpg	https://mi-bucket.com/ref.jpg	ST-DEP-3	\N	\N	2026-01-20 00:16:01.102955	sistema
7	3	3	1	1	Verde	39.99	https://mi-bucket.com/real.jpg	https://mi-bucket.com/ref.jpg	ST-DEP-0004	\N	\N	2026-01-20 00:18:16.378725	sistema
8	5	3	1	4	Negro	19.99	https://mi-bucket.com/real.jpg	https://mi-bucket.com/ref.jpg	MN-DEP-0001	\N	\N	2026-01-20 00:30:30.361671	sistema
\.


--
-- TOC entry 3447 (class 0 OID 24615)
-- Dependencies: 220
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
-- TOC entry 3461 (class 0 OID 0)
-- Dependencies: 215
-- Name: categorias_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.categorias_id_seq', 10, true);


--
-- TOC entry 3462 (class 0 OID 0)
-- Dependencies: 217
-- Name: estados_prenda_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.estados_prenda_id_seq', 3, true);


--
-- TOC entry 3463 (class 0 OID 0)
-- Dependencies: 221
-- Name: estilos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.estilos_id_seq', 3, true);


--
-- TOC entry 3464 (class 0 OID 0)
-- Dependencies: 223
-- Name: prendas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.prendas_id_seq', 8, true);


--
-- TOC entry 3465 (class 0 OID 0)
-- Dependencies: 219
-- Name: tallas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tallas_id_seq', 9, true);


--
-- TOC entry 3276 (class 2606 OID 24586)
-- Name: categorias categorias_codigo_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categorias
    ADD CONSTRAINT categorias_codigo_key UNIQUE (codigo);


--
-- TOC entry 3278 (class 2606 OID 24584)
-- Name: categorias categorias_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categorias
    ADD CONSTRAINT categorias_pkey PRIMARY KEY (id);


--
-- TOC entry 3280 (class 2606 OID 24613)
-- Name: estados_prenda estados_prenda_codigo_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estados_prenda
    ADD CONSTRAINT estados_prenda_codigo_key UNIQUE (codigo);


--
-- TOC entry 3282 (class 2606 OID 24611)
-- Name: estados_prenda estados_prenda_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estados_prenda
    ADD CONSTRAINT estados_prenda_pkey PRIMARY KEY (id);


--
-- TOC entry 3288 (class 2606 OID 24635)
-- Name: estilos estilos_codigo_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estilos
    ADD CONSTRAINT estilos_codigo_key UNIQUE (codigo);


--
-- TOC entry 3290 (class 2606 OID 24633)
-- Name: estilos estilos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estilos
    ADD CONSTRAINT estilos_pkey PRIMARY KEY (id);


--
-- TOC entry 3292 (class 2606 OID 24761)
-- Name: prendas prendas_codigo_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.prendas
    ADD CONSTRAINT prendas_codigo_key UNIQUE (codigo);


--
-- TOC entry 3294 (class 2606 OID 24759)
-- Name: prendas prendas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.prendas
    ADD CONSTRAINT prendas_pkey PRIMARY KEY (id);


--
-- TOC entry 3284 (class 2606 OID 24624)
-- Name: tallas tallas_nombre_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tallas
    ADD CONSTRAINT tallas_nombre_key UNIQUE (nombre);


--
-- TOC entry 3286 (class 2606 OID 24622)
-- Name: tallas tallas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tallas
    ADD CONSTRAINT tallas_pkey PRIMARY KEY (id);


--
-- TOC entry 3295 (class 2606 OID 24762)
-- Name: prendas prendas_categoria_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.prendas
    ADD CONSTRAINT prendas_categoria_id_fkey FOREIGN KEY (categoria_id) REFERENCES public.categorias(id);


--
-- TOC entry 3296 (class 2606 OID 24772)
-- Name: prendas prendas_estado_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.prendas
    ADD CONSTRAINT prendas_estado_id_fkey FOREIGN KEY (estado_id) REFERENCES public.estados_prenda(id);


--
-- TOC entry 3297 (class 2606 OID 24767)
-- Name: prendas prendas_estilo_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.prendas
    ADD CONSTRAINT prendas_estilo_id_fkey FOREIGN KEY (estilo_id) REFERENCES public.estilos(id);


--
-- TOC entry 3298 (class 2606 OID 24777)
-- Name: prendas prendas_talla_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.prendas
    ADD CONSTRAINT prendas_talla_id_fkey FOREIGN KEY (talla_id) REFERENCES public.tallas(id);


-- Completed on 2026-01-19 20:59:14

--
-- PostgreSQL database dump complete
--

\unrestrict jtTEniwjcFYle1MF6x3AhFByGDszQgV9fP1Lyn9aPXk955siK4g3ukRsE69CNIY

