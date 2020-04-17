--
-- PostgreSQL database dump
--

-- Dumped from database version 12.1
-- Dumped by pg_dump version 12.1

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
-- Name: categories; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.categories (
    id integer NOT NULL,
    category text
);


ALTER TABLE public.categories OWNER TO postgres;

--
-- Name: categories_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.categories_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.categories_id_seq OWNER TO postgres;

--
-- Name: categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.categories_id_seq OWNED BY public.categories.id;


--
-- Name: history; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.history (
    historyid integer NOT NULL,
    id integer NOT NULL,
    userid integer,
    productid integer,
    productqty integer,
    productprice integer,
    buyhistory timestamp without time zone
);


ALTER TABLE public.history OWNER TO postgres;

--
-- Name: history_historyid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.history_historyid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.history_historyid_seq OWNER TO postgres;

--
-- Name: history_historyid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.history_historyid_seq OWNED BY public.history.historyid;


--
-- Name: history_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.history_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.history_id_seq OWNER TO postgres;

--
-- Name: history_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.history_id_seq OWNED BY public.history.id;


--
-- Name: products; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.products (
    id integer NOT NULL,
    product_name text,
    quantity integer,
    category_id integer,
    description text,
    price numeric,
    imgurl text,
    is_deleted boolean
);


ALTER TABLE public.products OWNER TO postgres;

--
-- Name: products_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.products_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.products_id_seq OWNER TO postgres;

--
-- Name: products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.products_id_seq OWNED BY public.products.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id integer NOT NULL,
    username text,
    password text,
    email text,
    birthday text,
    credit_limit integer,
    job text,
    address text,
    interests text,
    is_admin boolean,
    is_deleted boolean
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: categories id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories ALTER COLUMN id SET DEFAULT nextval('public.categories_id_seq'::regclass);


--
-- Name: history historyid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.history ALTER COLUMN historyid SET DEFAULT nextval('public.history_historyid_seq'::regclass);


--
-- Name: history id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.history ALTER COLUMN id SET DEFAULT nextval('public.history_id_seq'::regclass);


--
-- Name: products id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products ALTER COLUMN id SET DEFAULT nextval('public.products_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.categories (id, category) FROM stdin;
1	mobiles
2	laptops
\.


--
-- Data for Name: history; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.history (historyid, id, userid, productid, productqty, productprice, buyhistory) FROM stdin;
1	1	8	1	11	20	2020-04-11 00:00:00
2	2	8	1	11	20	2020-04-11 00:00:00
3	2	8	5	11	20	2020-04-11 00:00:00
4	3	8	1	11	20	2020-04-11 00:00:00
5	3	8	5	11	20	2020-04-11 00:00:00
6	4	8	6	12	20	2020-04-11 00:00:00
7	5	8	6	12	20	2020-04-11 00:00:00
8	6	8	7	12	20	2020-04-11 00:00:00
9	7	8	3	1	20	2020-04-11 00:00:00
10	8	8	4	11	20	2020-04-11 00:00:00
11	8	8	8	12	20	2020-04-11 00:00:00
12	9	8	5	13	20	2020-04-12 00:00:00
13	10	8	6	17	20	2020-04-12 00:00:00
14	11	8	3	15	20	2020-04-12 00:00:00
15	12	8	4	13	20	2020-04-12 00:00:00
16	13	8	1	12	20	2020-04-12 00:00:00
17	13	8	8	15	20	2020-04-12 00:00:00
18	14	8	6	10	20	2020-04-12 00:00:00
19	14	8	7	15	20	2020-04-12 00:00:00
20	15	8	4	15	20	2020-04-12 00:00:00
21	16	8	4	11	20	2020-04-12 00:00:00
22	17	8	1	12	20	2020-04-12 00:00:00
23	18	8	8	10	20	2020-04-12 00:00:00
24	19	8	3	10	20	2020-04-12 00:00:00
25	19	8	6	5	20	2020-04-12 00:00:00
26	20	8	4	2	20	2020-04-12 00:00:00
27	21	8	7	7	20	2020-04-12 00:00:00
28	22	8	1	6	20	2020-04-12 00:00:00
29	23	8	8	5	20	2020-04-12 00:00:00
30	24	8	5	7	20	2020-04-12 00:00:00
31	25	8	4	3	20	2020-04-12 00:00:00
32	26	8	2	3	20	2020-04-13 00:00:00
33	26	8	6	1	20	2020-04-13 00:00:00
34	27	9	7	2	20	2020-04-13 00:00:00
35	28	9	5	7	20	2020-04-13 00:00:00
36	29	9	1	36	20	2020-04-13 00:00:00
37	30	9	2	5	20	2020-04-13 00:00:00
38	31	9	3	7	20	2020-04-13 00:00:00
39	32	9	1	7	20	2020-04-13 00:00:00
40	32	9	7	2	20	2020-04-13 00:00:00
41	33	9	3	5	20	2020-04-13 00:00:00
42	33	9	7	6	20	2020-04-13 00:00:00
43	34	9	1	2	20	2020-04-13 00:00:00
44	34	9	3	3	20	2020-04-13 00:00:00
45	35	9	5	4	20	2020-04-13 00:00:00
46	35	9	7	5	20	2020-04-13 00:00:00
47	36	9	2	5	20	2020-04-13 00:00:00
48	36	9	3	3	20	2020-04-13 00:00:00
49	37	9	6	1	20	2020-04-13 00:00:00
50	38	9	2	1	20	2020-04-13 00:00:00
51	38	9	7	2	20	2020-04-13 00:00:00
53	40	9	2	1	20	2020-04-14 00:00:00
54	41	9	7	13	20	2020-04-14 00:00:00
55	42	9	3	2	20	2020-04-14 03:05:37.677591
56	43	9	6	5	20	2020-04-14 03:55:10.233611
57	44	9	2	1	20	2020-04-14 03:56:11.04509
58	45	11	7	1	20	2020-04-14 05:10:21.071616
60	47	12	6	1	20	2020-04-14 05:33:36.870452
63	50	13	7	1	20	2020-04-14 07:57:43.258907
66	53	13	6	3	20	2020-04-15 02:25:17.395957
67	53	13	7	3	20	2020-04-15 02:25:17.395957
68	54	13	2	3	20	2020-04-15 02:44:31.601129
69	54	13	3	3	20	2020-04-15 02:44:31.601129
70	54	13	7	1	20	2020-04-15 02:44:31.601129
71	55	13	4	1	20	2020-04-16 04:35:51.407362
72	56	2	5	1	20	2020-04-16 08:38:56.77864
73	56	2	7	1	20	2020-04-16 08:38:56.77864
74	57	2	1	1	20	2020-04-17 08:12:47.698022
75	57	2	8	1	20	2020-04-17 08:12:47.698022
76	58	15	2	4	20	2020-04-17 11:15:27.667039
77	58	15	4	7	20	2020-04-17 11:15:27.667039
78	59	15	8	60	20	2020-04-17 11:18:55.083549
79	60	15	5	4	20	2020-04-17 11:19:35.394414
80	61	15	6	1	20	2020-04-17 11:33:08.13906
81	61	15	9	2	1000	2020-04-17 11:33:08.13906
\.


--
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.products (id, product_name, quantity, category_id, description, price, imgurl, is_deleted) FROM stdin;
1	ay 7aga	384	1	ay 7aga	20.5	images/product_1.jpg	f
3	Galaxy Note 4	447	1	ay 7aga	20.5	images/product_3.jpg	f
7	ay 7aga	429	2	ay 7aga	20.5	images/product_7.jpg	f
2	Galaxy s3	474	1	ay 7aga	20.5	images/product_2.jpg	f
4	Acer	431	2	ay 7aga	20.5	images/product_4.jpg	f
8	ay 7aga	391	1	ay 7aga	20.5	images/product_8.jpg	f
5	Toshiba	437	2	ay 7aga	20.5	images/product_5.jpg	f
6	ay 7aga	426	2	ay 7aga	20.5	images/product_6.jpg	f
9	TV LG	0	2	televesion	1000	https://homepages.cae.wisc.edu/~ece533/images/baboon.png	f
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, username, password, email, birthday, credit_limit, job, address, interests, is_admin, is_deleted) FROM stdin;
3	bfvd	dvsdv	mahmoud.abdelhakim9610@gmail.com	2021-02-02	1000	dscdv	sdvsdv	sdvsd	f	f
4	sdfsd	sdfsd	mahmoud.abdelhakim9610@gmail.com	2020-01-01	1000	sdf	sdf	dsf	f	f
5	rbrdbr	svddv	mahmoud.abdelhakim9610@gmail.com	2020-01-01	1000	sdvsdv	svdsv	sdvsdv	f	f
6	acavcwevrevb	vevevbeb	sdvsv@sdvbb.dvvs	2015-01-01	1000	wevevwv	wevwevw	wvwev	f	f
7	Mahmoud	123	mahmoud.abdelhakim9610@gmail.com	2020-01-01	1000	dsvsd	.lmm	sdbbs	f	f
1	null	null	null	null	920	null	null	null	f	f
9	mostafa	12345	mostafa.elrawy@yahoo.com	1993-02-25	500	mmm	mmm	mmm	f	f
11	mohsen	12345	mostafa.elrawwy@yahoo.com	1990-02-04	980	ss	kkjkj	kjkjjj	f	f
12	kamal	12345	mostafa.elrawwy@yahoo.com	1992-09-26	840	ddd	ddd	ddd	f	f
14	new	new			1000				f	f
10	ahmed	12345			1000				f	f
13	hakim	hakim	udsvgdsbv		260				t	f
2	Mahmoud	vsdvd	mahmoud.abdelhakim9610@gmail.com	2020-01-01	1500	rdbh	dbsb	sdbbs	f	t
16	khaled	khaled	sdvsdv	1992-09-26	500	1992-09-26	dscsdv	sdvsdv	t	f
15	iti40	iti	dsvdv		2980				f	f
\.


--
-- Name: categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.categories_id_seq', 2, true);


--
-- Name: history_historyid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.history_historyid_seq', 81, true);


--
-- Name: history_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.history_id_seq', 61, true);


--
-- Name: products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.products_id_seq', 9, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 16, true);


--
-- Name: categories categories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (id);


--
-- Name: history history_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.history
    ADD CONSTRAINT history_pkey PRIMARY KEY (historyid);


--
-- Name: products products_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: products products_category_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_category_id_fkey FOREIGN KEY (category_id) REFERENCES public.categories(id);


--
-- PostgreSQL database dump complete
--

