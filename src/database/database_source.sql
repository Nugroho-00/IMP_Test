--
-- PostgreSQL database dump
--

-- Dumped from database version 14.5
-- Dumped by pg_dump version 14.2

-- Started on 2023-04-05 08:17:12

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
-- TOC entry 5 (class 2615 OID 16407)
-- Name: data_test; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA data_test;


ALTER SCHEMA data_test OWNER TO postgres;

--
-- TOC entry 3 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: Nugroho
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO "Nugroho";

--
-- TOC entry 3329 (class 0 OID 0)
-- Dependencies: 3
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: Nugroho
--

COMMENT ON SCHEMA public IS 'standard public schema';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 211 (class 1259 OID 16449)
-- Name: auth; Type: TABLE; Schema: data_test; Owner: postgres
--

CREATE TABLE data_test.auth (
    id integer NOT NULL,
    username character varying(255),
    password character varying(255),
    created_at timestamp without time zone DEFAULT now(),
    updated_at timestamp without time zone DEFAULT now()
);


ALTER TABLE data_test.auth OWNER TO postgres;

--
-- TOC entry 210 (class 1259 OID 16448)
-- Name: auth_id_seq; Type: SEQUENCE; Schema: data_test; Owner: postgres
--

CREATE SEQUENCE data_test.auth_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE data_test.auth_id_seq OWNER TO postgres;

--
-- TOC entry 3330 (class 0 OID 0)
-- Dependencies: 210
-- Name: auth_id_seq; Type: SEQUENCE OWNED BY; Schema: data_test; Owner: postgres
--

ALTER SEQUENCE data_test.auth_id_seq OWNED BY data_test.auth.id;


--
-- TOC entry 213 (class 1259 OID 16469)
-- Name: users; Type: TABLE; Schema: data_test; Owner: postgres
--

CREATE TABLE data_test.users (
    id integer NOT NULL,
    id_profile integer,
    fullname character varying(255),
    created_at timestamp without time zone DEFAULT now(),
    updated_at timestamp without time zone DEFAULT now()
);


ALTER TABLE data_test.users OWNER TO postgres;

--
-- TOC entry 212 (class 1259 OID 16468)
-- Name: users_id_seq; Type: SEQUENCE; Schema: data_test; Owner: postgres
--

CREATE SEQUENCE data_test.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE data_test.users_id_seq OWNER TO postgres;

--
-- TOC entry 3331 (class 0 OID 0)
-- Dependencies: 212
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: data_test; Owner: postgres
--

ALTER SEQUENCE data_test.users_id_seq OWNED BY data_test.users.id;


--
-- TOC entry 3170 (class 2604 OID 16452)
-- Name: auth id; Type: DEFAULT; Schema: data_test; Owner: postgres
--

ALTER TABLE ONLY data_test.auth ALTER COLUMN id SET DEFAULT nextval('data_test.auth_id_seq'::regclass);


--
-- TOC entry 3173 (class 2604 OID 16472)
-- Name: users id; Type: DEFAULT; Schema: data_test; Owner: postgres
--

ALTER TABLE ONLY data_test.users ALTER COLUMN id SET DEFAULT nextval('data_test.users_id_seq'::regclass);


--
-- TOC entry 3321 (class 0 OID 16449)
-- Dependencies: 211
-- Data for Name: auth; Type: TABLE DATA; Schema: data_test; Owner: postgres
--

COPY data_test.auth (id, username, password, created_at, updated_at) FROM stdin;
1	Username1	$2b$10$vmi7wKP3DbtVWlFCqtE7v.skKELrBmwN51aoBd5geOJKpxRkWQ9T2	2023-04-05 07:53:29.081823	2023-04-05 07:53:29.081823
2	Username2	$2b$10$uYgz7R29NeClit0HLDa1VukjBd8r6GetdxJDJ1pzILrqc1VaxQfOC	2023-04-05 07:55:55.373363	2023-04-05 07:55:55.373363
3	Username3	$2b$10$qGDMeHOet7AvY6x2hYco0egy8DY/t.DFXaDRpDyaR8UOcqZ0yDKdi	2023-04-05 07:56:17.379713	2023-04-05 07:56:17.379713
4	Username4	$2b$10$fVuvSOQ47wPrNk1M4uG1u.maa9pD5SdcruNIfUIbVSjduuKi4cSVe	2023-04-05 07:56:40.871774	2023-04-05 07:56:40.871774
5	Username5	$2b$10$o5i5pwqZIS9ekUB8byKY8OZlRm.NWeBIp4B.LjVjX2d5MG0g4Ca4C	2023-04-05 07:58:32.015109	2023-04-05 07:58:32.015109
6	Username6	$2b$10$rG0qU4oQxcrbmWcL/29JtOOk1LFbcvnoKfmaA8aHA9.i5DDlbt7EG	2023-04-05 07:59:00.02871	2023-04-05 07:59:00.02871
7	Username7	$2b$10$l5i.XWpVYkgbD1eQehQHreHIVSlQa8.p3j9w7JRO6QB3pWVTRuEhu	2023-04-05 07:59:42.752908	2023-04-05 07:59:42.752908
8	Username8	$2b$10$7DaGLNDTvzJWYomDY2vUOuQh0BrHwdUsH7ypoS.PKCBPzemXdBmF6	2023-04-05 08:00:05.884036	2023-04-05 08:00:05.884036
9	Username9	$2b$10$g5q7Idc/1QuQcUfz0x8mO.REume1DkEufsBkHPjpP5nqx82/KMwH2	2023-04-05 08:00:41.539894	2023-04-05 08:00:41.539894
10	Username10	$2b$10$Rr2LqS1jXSqKWde8zv5uzesTsXnCRF4s6ZEKe7URLEYHc3lzCdiAa	2023-04-05 08:01:10.559078	2023-04-05 08:01:10.559078
11	Username11	$2b$10$cSZCI84xZJHNx/d5DwLOSeF9NPhDj8kIkGHJpIlSmW9kAdzeU6s/C	2023-04-05 08:01:31.779376	2023-04-05 08:01:31.779376
12	Username12	$2b$10$AYmbO1FilRfHFvBNZL4/H.W6eR0mLAXd35.Hv140JuuR.A50cbfKS	2023-04-05 08:01:51.97178	2023-04-05 08:01:51.97178
13	Username13	$2b$10$kG/EHs7iF9WGIF6fr06FN.LGe.wKCFm0iC2AVVR1Krn2No0YcjCvG	2023-04-05 08:02:12.267714	2023-04-05 08:02:12.267714
14	Username14	$2b$10$RFYZgkrtx807v98FU10r7OWQqfOwfZYKZPBDOYbHHqY..nJ6y8nzq	2023-04-05 08:03:12.544383	2023-04-05 08:03:12.544383
15	Username15	$2b$10$aKBZZ/4v1DIJ.qLMvIA4F.2npXStJoL6f01d7wb69VOBuDrxuaDAW	2023-04-05 08:03:32.785554	2023-04-05 08:03:32.785554
\.


--
-- TOC entry 3323 (class 0 OID 16469)
-- Dependencies: 213
-- Data for Name: users; Type: TABLE DATA; Schema: data_test; Owner: postgres
--

COPY data_test.users (id, id_profile, fullname, created_at, updated_at) FROM stdin;
1	1	Rick Sanchez	2023-04-05 07:53:29.081823	2023-04-05 07:53:29.081823
2	2	Morty Smith	2023-04-05 07:55:55.373363	2023-04-05 07:55:55.373363
3	3	Summer Smith	2023-04-05 07:56:17.379713	2023-04-05 07:56:17.379713
4	4	Beth Smith	2023-04-05 07:56:40.871774	2023-04-05 07:56:40.871774
5	5	Jerry Smith	2023-04-05 07:58:32.015109	2023-04-05 07:58:32.015109
6	6	Abadango Cluster Princess	2023-04-05 07:59:00.02871	2023-04-05 07:59:00.02871
7	7	Abradolf Lincler	2023-04-05 07:59:42.752908	2023-04-05 07:59:42.752908
8	8	Adjudicator Rick	2023-04-05 08:00:05.884036	2023-04-05 08:00:05.884036
9	9	Agency Director	2023-04-05 08:00:41.539894	2023-04-05 08:00:41.539894
10	10	Alan Rails	2023-04-05 08:01:10.559078	2023-04-05 08:01:10.559078
11	11	Albert Einstein	2023-04-05 08:01:31.779376	2023-04-05 08:01:31.779376
12	12	Alexander	2023-04-05 08:01:51.97178	2023-04-05 08:01:51.97178
13	13	Alien Googah	2023-04-05 08:02:12.267714	2023-04-05 08:02:12.267714
14	14	Alien Morty	2023-04-05 08:03:12.544383	2023-04-05 08:03:12.544383
15	15	Alien Rick	2023-04-05 08:03:32.785554	2023-04-05 08:03:32.785554
\.


--
-- TOC entry 3332 (class 0 OID 0)
-- Dependencies: 210
-- Name: auth_id_seq; Type: SEQUENCE SET; Schema: data_test; Owner: postgres
--

SELECT pg_catalog.setval('data_test.auth_id_seq', 15, true);


--
-- TOC entry 3333 (class 0 OID 0)
-- Dependencies: 212
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: data_test; Owner: postgres
--

SELECT pg_catalog.setval('data_test.users_id_seq', 15, true);


--
-- TOC entry 3177 (class 2606 OID 16458)
-- Name: auth auth_pkey; Type: CONSTRAINT; Schema: data_test; Owner: postgres
--

ALTER TABLE ONLY data_test.auth
    ADD CONSTRAINT auth_pkey PRIMARY KEY (id);


--
-- TOC entry 3179 (class 2606 OID 16476)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: data_test; Owner: postgres
--

ALTER TABLE ONLY data_test.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 3180 (class 2606 OID 16477)
-- Name: users fk_auth; Type: FK CONSTRAINT; Schema: data_test; Owner: postgres
--

ALTER TABLE ONLY data_test.users
    ADD CONSTRAINT fk_auth FOREIGN KEY (id_profile) REFERENCES data_test.auth(id) ON DELETE CASCADE;


-- Completed on 2023-04-05 08:17:12

--
-- PostgreSQL database dump complete
--

