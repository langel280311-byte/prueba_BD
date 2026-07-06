--
-- PostgreSQL database dump
--

\restrict n3LI08rIKH80qR86qcwu0A0GPkI4xteSZ1jhFaJdb9PgtweIeXL1uXybbAiQGYx

-- Dumped from database version 16.14 (Debian 16.14-1.pgdg13+1)
-- Dumped by pg_dump version 16.14 (Ubuntu 16.14-0ubuntu0.24.04.1)

-- Started on 2026-07-06 11:01:13 -05

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

DROP DATABASE prueba;
--
-- TOC entry 3485 (class 1262 OID 32778)
-- Name: prueba; Type: DATABASE; Schema: -; Owner: -
--

CREATE DATABASE prueba WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.utf8';


\unrestrict n3LI08rIKH80qR86qcwu0A0GPkI4xteSZ1jhFaJdb9PgtweIeXL1uXybbAiQGYx
\connect prueba
\restrict n3LI08rIKH80qR86qcwu0A0GPkI4xteSZ1jhFaJdb9PgtweIeXL1uXybbAiQGYx

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
-- TOC entry 221 (class 1259 OID 32947)
-- Name: bodega; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.bodega (
    id integer NOT NULL,
    nombre character varying(150) NOT NULL,
    ciudad character varying(100) NOT NULL
);


--
-- TOC entry 220 (class 1259 OID 32946)
-- Name: bodega_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.bodega_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3486 (class 0 OID 0)
-- Dependencies: 220
-- Name: bodega_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.bodega_id_seq OWNED BY public.bodega.id;


--
-- TOC entry 223 (class 1259 OID 32956)
-- Name: categorias; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.categorias (
    id integer NOT NULL,
    nombre character varying(100) NOT NULL
);


--
-- TOC entry 222 (class 1259 OID 32955)
-- Name: categorias_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.categorias_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3487 (class 0 OID 0)
-- Dependencies: 222
-- Name: categorias_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.categorias_id_seq OWNED BY public.categorias.id;


--
-- TOC entry 216 (class 1259 OID 32870)
-- Name: ciudad; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.ciudad (
    id integer NOT NULL,
    nombre character varying(100) NOT NULL
);


--
-- TOC entry 215 (class 1259 OID 32869)
-- Name: ciudad_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.ciudad_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3488 (class 0 OID 0)
-- Dependencies: 215
-- Name: ciudad_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.ciudad_id_seq OWNED BY public.ciudad.id;


--
-- TOC entry 227 (class 1259 OID 32982)
-- Name: compras; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.compras (
    id integer NOT NULL,
    proveedor character varying(100) NOT NULL,
    producto character varying(100) NOT NULL,
    precio_unitario integer DEFAULT 0,
    cantidad integer DEFAULT 0,
    orden character varying(50)
);


--
-- TOC entry 226 (class 1259 OID 32981)
-- Name: compras_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.compras_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3489 (class 0 OID 0)
-- Dependencies: 226
-- Name: compras_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.compras_id_seq OWNED BY public.compras.id;


--
-- TOC entry 217 (class 1259 OID 32934)
-- Name: dataset_riwisupply; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.dataset_riwisupply (
    "MovementDate" character varying(50),
    "SupplierName" character varying(50),
    "SupplierCity" character varying(50),
    "Warehouse" character varying(50),
    "WarehouseCity" character varying(50),
    "ProductName" character varying(50),
    "Category" character varying(50),
    "Quantity" integer,
    "UnitPrice" integer,
    "MovementType" character varying(50),
    "PurchaseOrder" character varying(50)
);


--
-- TOC entry 219 (class 1259 OID 32938)
-- Name: productos; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.productos (
    id integer NOT NULL,
    nombre character varying(200) NOT NULL,
    precio_unitario numeric(10,2) NOT NULL,
    stock integer DEFAULT 0,
    CONSTRAINT productos_precio_unitario_check CHECK ((precio_unitario > (0)::numeric))
);


--
-- TOC entry 218 (class 1259 OID 32937)
-- Name: productos_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.productos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3490 (class 0 OID 0)
-- Dependencies: 218
-- Name: productos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.productos_id_seq OWNED BY public.productos.id;


--
-- TOC entry 225 (class 1259 OID 32965)
-- Name: proveedor; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.proveedor (
    id integer NOT NULL,
    nombre character varying(100) NOT NULL,
    ciudad character varying(50)
);


--
-- TOC entry 224 (class 1259 OID 32964)
-- Name: proveedor_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.proveedor_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3491 (class 0 OID 0)
-- Dependencies: 224
-- Name: proveedor_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.proveedor_id_seq OWNED BY public.proveedor.id;


--
-- TOC entry 3299 (class 2604 OID 32950)
-- Name: bodega id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bodega ALTER COLUMN id SET DEFAULT nextval('public.bodega_id_seq'::regclass);


--
-- TOC entry 3300 (class 2604 OID 32959)
-- Name: categorias id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.categorias ALTER COLUMN id SET DEFAULT nextval('public.categorias_id_seq'::regclass);


--
-- TOC entry 3296 (class 2604 OID 32873)
-- Name: ciudad id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ciudad ALTER COLUMN id SET DEFAULT nextval('public.ciudad_id_seq'::regclass);


--
-- TOC entry 3302 (class 2604 OID 32985)
-- Name: compras id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.compras ALTER COLUMN id SET DEFAULT nextval('public.compras_id_seq'::regclass);


--
-- TOC entry 3297 (class 2604 OID 32941)
-- Name: productos id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.productos ALTER COLUMN id SET DEFAULT nextval('public.productos_id_seq'::regclass);


--
-- TOC entry 3301 (class 2604 OID 32968)
-- Name: proveedor id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.proveedor ALTER COLUMN id SET DEFAULT nextval('public.proveedor_id_seq'::regclass);


--
-- TOC entry 3473 (class 0 OID 32947)
-- Dependencies: 221
-- Data for Name: bodega; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.bodega VALUES (1, 'Bodega Central', 'Barranquilla');
INSERT INTO public.bodega VALUES (2, 'Bod. Central', 'Barranquila');
INSERT INTO public.bodega VALUES (3, 'Centro Logistico Norte', 'Cartagena');
INSERT INTO public.bodega VALUES (4, 'Bodega Costa', 'Santa Marta');


--
-- TOC entry 3475 (class 0 OID 32956)
-- Dependencies: 223
-- Data for Name: categorias; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.categorias VALUES (1, 'Consumible');
INSERT INTO public.categorias VALUES (2, 'Herramientas');
INSERT INTO public.categorias VALUES (3, 'Elementos Protección');
INSERT INTO public.categorias VALUES (4, 'Herramienta');
INSERT INTO public.categorias VALUES (5, 'EPP');
INSERT INTO public.categorias VALUES (6, 'Consumibles');


--
-- TOC entry 3468 (class 0 OID 32870)
-- Dependencies: 216
-- Data for Name: ciudad; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.ciudad VALUES (1, 'Ctg');
INSERT INTO public.ciudad VALUES (2, 'Barranquila');
INSERT INTO public.ciudad VALUES (3, 'Cartagena');
INSERT INTO public.ciudad VALUES (4, 'Sta Marta');
INSERT INTO public.ciudad VALUES (5, 'Barranquilla');
INSERT INTO public.ciudad VALUES (6, 'B/quilla');


--
-- TOC entry 3479 (class 0 OID 32982)
-- Dependencies: 227
-- Data for Name: compras; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.compras VALUES (1, 'Aceros del Norte', 'Soldadura E6013', 43746, 33, 'PO-1059');
INSERT INTO public.compras VALUES (2, 'INDUSTRIALES SAS', 'Guante Nitrilo', 23022, 119, 'PO-1035');
INSERT INTO public.compras VALUES (3, 'INDUSTRIALES SAS', 'Guante Nitrilo', 71980, 131, 'PO-1029');
INSERT INTO public.compras VALUES (4, 'Aceros del Norte S.A.S', 'Disco de Corte 4.5', 115388, 148, 'PO-1049');
INSERT INTO public.compras VALUES (5, 'Aceros del Norte', 'Casco Industrial', 108802, 192, 'PO-1083');
INSERT INTO public.compras VALUES (6, 'Aceros del Norte S.A.S', 'Disco Corte 4.5', 118291, 199, 'PO-1023');
INSERT INTO public.compras VALUES (7, 'Aceros del Norte S.A.S', 'Disco de Corte 4.5', 88512, 130, 'PO-1041');
INSERT INTO public.compras VALUES (8, 'INDUSTRIALES SAS', 'Disco de Corte 4.5', 18022, 169, 'PO-1043');
INSERT INTO public.compras VALUES (9, 'Suministros Global SAS', 'Electrodo E6013', 123108, 87, 'PO-1009');
INSERT INTO public.compras VALUES (10, 'Aceros del Norte S.A.S', 'Guantes de Nitrilo', 117524, 160, 'PO-1075');
INSERT INTO public.compras VALUES (11, 'Industriales S.A.S', 'Electrodo E6013', 139836, 40, 'PO-1091');
INSERT INTO public.compras VALUES (12, 'ACEROS NORTE', 'Guantes de Nitrilo', 39944, 175, 'PO-1040');
INSERT INTO public.compras VALUES (13, 'INDUSTRIALES SAS', 'Disco Corte 4.5', 136736, 61, 'PO-1034');
INSERT INTO public.compras VALUES (14, 'Suministros Global SAS', 'Guantes de Nitrilo', 123653, 185, 'PO-1032');
INSERT INTO public.compras VALUES (15, 'Industriales SAS', 'Disco Corte 4.5', 52910, 124, 'PO-1094');
INSERT INTO public.compras VALUES (16, 'Aceros del Norte S.A.S', 'Electrodo E6013', 35506, 27, 'PO-1041');
INSERT INTO public.compras VALUES (17, 'Industriales SAS', 'Guante Nitrilo', 14290, 70, 'PO-1022');
INSERT INTO public.compras VALUES (18, 'Aceros del Norte', 'Electrodo E6013', 37943, 78, 'PO-1036');
INSERT INTO public.compras VALUES (19, 'ACEROS NORTE', 'Disco de Corte 4.5', 89964, 134, 'PO-1035');


--
-- TOC entry 3469 (class 0 OID 32934)
-- Dependencies: 217
-- Data for Name: dataset_riwisupply; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.dataset_riwisupply VALUES ('2026-04-01', 'Aceros del Norte S.A.S', 'Cartagena', 'Bodega Costa', 'Santa Marta', 'Disco de Corte 4.5', 'Herramienta', 148, 115388, 'OUT', 'PO-1049');
INSERT INTO public.dataset_riwisupply VALUES ('2026-02-14', 'Aceros del Norte S.A.S', 'Cartagena', 'Bodega Costa', 'Santa Marta', 'Electrodo E6013', 'Consumible', 27, 35506, 'IN', 'PO-1041');
INSERT INTO public.dataset_riwisupply VALUES ('2026-01-01', 'Industriales SAS', 'Barranquilla', 'Bodega Costa', 'Santa Marta', 'Guante Nitrilo', 'EPP', 70, 14290, 'IN', 'PO-1022');
INSERT INTO public.dataset_riwisupply VALUES ('2026-02-16', 'Aceros del Norte S.A.S', 'Cartagena', 'Centro Logistico Norte', 'Cartagena', 'Guantes de Nitrilo', 'Elementos Protección', 160, 117524, 'IN', 'PO-1075');
INSERT INTO public.dataset_riwisupply VALUES ('2026-02-28', 'Industriales S.A.S', 'Barranquila', 'Bodega Central', 'Barranquilla', 'Electrodo E6013', 'Consumible', 40, 139836, 'OUT', 'PO-1091');
INSERT INTO public.dataset_riwisupply VALUES ('2026-03-06', 'Aceros del Norte S.A.S', 'Cartagena', 'Bod. Central', 'Barranquila', 'Disco de Corte 4.5', 'Herramienta', 130, 88512, 'OUT', 'PO-1041');
INSERT INTO public.dataset_riwisupply VALUES ('2026-01-20', 'Aceros del Norte', 'Cartagena', 'Bodega Central', 'Barranquilla', 'Soldadura E6013', 'Consumibles', 33, 43746, 'OUT', 'PO-1059');
INSERT INTO public.dataset_riwisupply VALUES ('2026-04-13', 'INDUSTRIALES SAS', 'B/quilla', 'Bodega Costa', 'Santa Marta', 'Guante Nitrilo', 'EPP', 119, 23022, 'OUT', 'PO-1035');
INSERT INTO public.dataset_riwisupply VALUES ('2026-04-17', 'Suministros Global SAS', 'Sta Marta', 'Bod. Central', 'Barranquila', 'Guantes de Nitrilo', 'Elementos Protección', 185, 123653, 'IN', 'PO-1032');
INSERT INTO public.dataset_riwisupply VALUES ('2026-02-02', 'Suministros Global SAS', 'Sta Marta', 'Bod. Central', 'Barranquila', 'Electrodo E6013', 'Consumible', 87, 123108, 'OUT', 'PO-1009');
INSERT INTO public.dataset_riwisupply VALUES ('2026-05-23', 'ACEROS NORTE', 'Ctg', 'Bodega Costa', 'Santa Marta', 'Guantes de Nitrilo', 'Elementos Protección', 175, 39944, 'IN', 'PO-1040');
INSERT INTO public.dataset_riwisupply VALUES ('2026-03-19', 'Aceros del Norte S.A.S', 'Cartagena', 'Bod. Central', 'Barranquila', 'Disco Corte 4.5', 'Herramientas', 199, 118291, 'OUT', 'PO-1023');
INSERT INTO public.dataset_riwisupply VALUES ('2026-01-25', 'INDUSTRIALES SAS', 'B/quilla', 'Centro Logistico Norte', 'Cartagena', 'Guante Nitrilo', 'EPP', 131, 71980, 'OUT', 'PO-1029');
INSERT INTO public.dataset_riwisupply VALUES ('2026-03-15', 'ACEROS NORTE', 'Ctg', 'Bodega Costa', 'Santa Marta', 'Disco de Corte 4.5', 'Herramienta', 134, 89964, 'OUT', 'PO-1035');
INSERT INTO public.dataset_riwisupply VALUES ('2026-03-12', 'Industriales SAS', 'Barranquilla', 'Bodega Central', 'Barranquilla', 'Disco Corte 4.5', 'Herramientas', 124, 52910, 'IN', 'PO-1094');
INSERT INTO public.dataset_riwisupply VALUES ('2026-04-26', 'INDUSTRIALES SAS', 'B/quilla', 'Bodega Central', 'Barranquilla', 'Disco Corte 4.5', 'Herramientas', 61, 136736, 'IN', 'PO-1034');
INSERT INTO public.dataset_riwisupply VALUES ('2026-03-03', 'INDUSTRIALES SAS', 'B/quilla', 'Centro Logistico Norte', 'Cartagena', 'Disco de Corte 4.5', 'Herramienta', 169, 18022, 'OUT', 'PO-1043');
INSERT INTO public.dataset_riwisupply VALUES ('2026-03-21', 'Aceros del Norte', 'Cartagena', 'Bodega Costa', 'Santa Marta', 'Casco Industrial', 'EPP', 192, 108802, 'OUT', 'PO-1083');
INSERT INTO public.dataset_riwisupply VALUES ('2026-03-11', 'Aceros del Norte', 'Cartagena', 'Centro Logistico Norte', 'Cartagena', 'Electrodo E6013', 'Consumible', 78, 37943, 'OUT', 'PO-1036');


--
-- TOC entry 3471 (class 0 OID 32938)
-- Dependencies: 219
-- Data for Name: productos; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.productos VALUES (1, 'Guante Nitrilo', 70.00, 14290);
INSERT INTO public.productos VALUES (2, 'Guante Nitrilo', 131.00, 71980);
INSERT INTO public.productos VALUES (3, 'Electrodo E6013', 27.00, 35506);
INSERT INTO public.productos VALUES (4, 'Guante Nitrilo', 119.00, 23022);
INSERT INTO public.productos VALUES (5, 'Guantes de Nitrilo', 175.00, 39944);
INSERT INTO public.productos VALUES (6, 'Disco de Corte 4.5', 134.00, 89964);
INSERT INTO public.productos VALUES (7, 'Electrodo E6013', 40.00, 139836);
INSERT INTO public.productos VALUES (8, 'Guantes de Nitrilo', 160.00, 117524);
INSERT INTO public.productos VALUES (9, 'Disco de Corte 4.5', 148.00, 115388);
INSERT INTO public.productos VALUES (10, 'Guantes de Nitrilo', 185.00, 123653);
INSERT INTO public.productos VALUES (11, 'Soldadura E6013', 33.00, 43746);
INSERT INTO public.productos VALUES (12, 'Electrodo E6013', 78.00, 37943);
INSERT INTO public.productos VALUES (13, 'Disco de Corte 4.5', 169.00, 18022);
INSERT INTO public.productos VALUES (14, 'Disco Corte 4.5', 199.00, 118291);
INSERT INTO public.productos VALUES (15, 'Disco Corte 4.5', 61.00, 136736);
INSERT INTO public.productos VALUES (16, 'Disco Corte 4.5', 124.00, 52910);
INSERT INTO public.productos VALUES (17, 'Electrodo E6013', 87.00, 123108);
INSERT INTO public.productos VALUES (18, 'Casco Industrial', 192.00, 108802);
INSERT INTO public.productos VALUES (19, 'Disco de Corte 4.5', 130.00, 88512);


--
-- TOC entry 3477 (class 0 OID 32965)
-- Dependencies: 225
-- Data for Name: proveedor; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.proveedor VALUES (1, 'Aceros del Norte S.A.S', 'Cartagena');
INSERT INTO public.proveedor VALUES (2, 'Industriales S.A.S', 'Barranquila');
INSERT INTO public.proveedor VALUES (3, 'Suministros Global SAS', 'Sta Marta');
INSERT INTO public.proveedor VALUES (4, 'Aceros del Norte', 'Cartagena');
INSERT INTO public.proveedor VALUES (5, 'INDUSTRIALES SAS', 'B/quilla');
INSERT INTO public.proveedor VALUES (6, 'ACEROS NORTE', 'Ctg');
INSERT INTO public.proveedor VALUES (7, 'Industriales SAS', 'Barranquilla');


--
-- TOC entry 3492 (class 0 OID 0)
-- Dependencies: 220
-- Name: bodega_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.bodega_id_seq', 4, true);


--
-- TOC entry 3493 (class 0 OID 0)
-- Dependencies: 222
-- Name: categorias_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.categorias_id_seq', 6, true);


--
-- TOC entry 3494 (class 0 OID 0)
-- Dependencies: 215
-- Name: ciudad_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.ciudad_id_seq', 7, true);


--
-- TOC entry 3495 (class 0 OID 0)
-- Dependencies: 226
-- Name: compras_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.compras_id_seq', 19, true);


--
-- TOC entry 3496 (class 0 OID 0)
-- Dependencies: 218
-- Name: productos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.productos_id_seq', 19, true);


--
-- TOC entry 3497 (class 0 OID 0)
-- Dependencies: 224
-- Name: proveedor_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.proveedor_id_seq', 7, true);


--
-- TOC entry 3313 (class 2606 OID 32954)
-- Name: bodega bodega_nombre_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bodega
    ADD CONSTRAINT bodega_nombre_key UNIQUE (nombre);


--
-- TOC entry 3315 (class 2606 OID 32952)
-- Name: bodega bodega_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bodega
    ADD CONSTRAINT bodega_pkey PRIMARY KEY (id);


--
-- TOC entry 3317 (class 2606 OID 32963)
-- Name: categorias categorias_nombre_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.categorias
    ADD CONSTRAINT categorias_nombre_key UNIQUE (nombre);


--
-- TOC entry 3319 (class 2606 OID 32961)
-- Name: categorias categorias_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.categorias
    ADD CONSTRAINT categorias_pkey PRIMARY KEY (id);


--
-- TOC entry 3307 (class 2606 OID 32877)
-- Name: ciudad ciudad_nombre_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ciudad
    ADD CONSTRAINT ciudad_nombre_key UNIQUE (nombre);


--
-- TOC entry 3309 (class 2606 OID 32875)
-- Name: ciudad ciudad_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ciudad
    ADD CONSTRAINT ciudad_pkey PRIMARY KEY (id);


--
-- TOC entry 3323 (class 2606 OID 32989)
-- Name: compras compras_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.compras
    ADD CONSTRAINT compras_pkey PRIMARY KEY (id);


--
-- TOC entry 3311 (class 2606 OID 32945)
-- Name: productos productos_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.productos
    ADD CONSTRAINT productos_pkey PRIMARY KEY (id);


--
-- TOC entry 3321 (class 2606 OID 32970)
-- Name: proveedor proveedor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.proveedor
    ADD CONSTRAINT proveedor_pkey PRIMARY KEY (id);


-- Completed on 2026-07-06 11:01:13 -05

--
-- PostgreSQL database dump complete
--

\unrestrict n3LI08rIKH80qR86qcwu0A0GPkI4xteSZ1jhFaJdb9PgtweIeXL1uXybbAiQGYx

