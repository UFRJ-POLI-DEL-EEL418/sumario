--
-- PostgreSQL database dump
--

-- Dumped from database version 9.4.8
-- Dumped by pg_dump version 9.4.8
-- Started on 2016-06-15 01:21:18

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

DROP DATABASE IF EXISTS bibliopdf;
--
-- TOC entry 2047 (class 1262 OID 19168)
-- Name: bibliopdf; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE bibliopdf WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C' LC_CTYPE = 'C';


ALTER DATABASE bibliopdf OWNER TO postgres;

\connect bibliopdf

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- TOC entry 7 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO postgres;

--
-- TOC entry 2048 (class 0 OID 0)
-- Dependencies: 7
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA public IS 'standard public schema';


--
-- TOC entry 1 (class 3079 OID 11855)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2050 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 173 (class 1259 OID 19169)
-- Name: dadoscatalogo; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE dadoscatalogo (
    patrimonio integer NOT NULL,
    titulo text,
    autoria text,
    veiculo text,
    data_publicacao timestamp without time zone,
    nomearquivo text,
    nomeoriginalarquivo text
);


ALTER TABLE dadoscatalogo OWNER TO postgres;

--
-- TOC entry 174 (class 1259 OID 19175)
-- Name: dadoscatalogo_patrimonio_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE dadoscatalogo_patrimonio_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE dadoscatalogo_patrimonio_seq OWNER TO postgres;

--
-- TOC entry 2051 (class 0 OID 0)
-- Dependencies: 174
-- Name: dadoscatalogo_patrimonio_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE dadoscatalogo_patrimonio_seq OWNED BY dadoscatalogo.patrimonio;


--
-- TOC entry 175 (class 1259 OID 19177)
-- Name: palavras_chave; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE palavras_chave (
    serialpalchave integer NOT NULL,
    palchave text,
    patrimonio integer,
    palchavenormal text
);


ALTER TABLE palavras_chave OWNER TO postgres;

--
-- TOC entry 176 (class 1259 OID 19183)
-- Name: palavras_chave_serial_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE palavras_chave_serial_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE palavras_chave_serial_seq OWNER TO postgres;

--
-- TOC entry 2052 (class 0 OID 0)
-- Dependencies: 176
-- Name: palavras_chave_serial_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE palavras_chave_serial_seq OWNED BY palavras_chave.serialpalchave;


--
-- TOC entry 179 (class 1259 OID 19958)
-- Name: palavrasautorianormal_serial_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE palavrasautorianormal_serial_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE palavrasautorianormal_serial_seq OWNER TO postgres;

--
-- TOC entry 180 (class 1259 OID 19960)
-- Name: palavrasautorianormal; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE palavrasautorianormal (
    serialpalautoria integer DEFAULT nextval('palavrasautorianormal_serial_seq'::regclass) NOT NULL,
    palavra_autoria_normal text,
    patrimonio integer
);


ALTER TABLE palavrasautorianormal OWNER TO postgres;

--
-- TOC entry 177 (class 1259 OID 19185)
-- Name: palavrastitulonormal; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE palavrastitulonormal (
    serialpaltitulo integer NOT NULL,
    palavra_titulo_normal text,
    patrimonio integer
);


ALTER TABLE palavrastitulonormal OWNER TO postgres;

--
-- TOC entry 178 (class 1259 OID 19191)
-- Name: palavrastitulonormal_serial_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE palavrastitulonormal_serial_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE palavrastitulonormal_serial_seq OWNER TO postgres;

--
-- TOC entry 2053 (class 0 OID 0)
-- Dependencies: 178
-- Name: palavrastitulonormal_serial_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE palavrastitulonormal_serial_seq OWNED BY palavrastitulonormal.serialpaltitulo;


--
-- TOC entry 181 (class 1259 OID 19984)
-- Name: palavrasveiculonormal_serial_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE palavrasveiculonormal_serial_seq
    START WITH 10
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE palavrasveiculonormal_serial_seq OWNER TO postgres;

--
-- TOC entry 182 (class 1259 OID 19986)
-- Name: palavrasveiculonormal; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE palavrasveiculonormal (
    serialpalveiculo integer DEFAULT nextval('palavrasveiculonormal_serial_seq'::regclass) NOT NULL,
    palavra_veiculo_normal text,
    patrimonio integer
);


ALTER TABLE palavrasveiculonormal OWNER TO postgres;

--
-- TOC entry 1910 (class 2604 OID 19193)
-- Name: patrimonio; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY dadoscatalogo ALTER COLUMN patrimonio SET DEFAULT nextval('dadoscatalogo_patrimonio_seq'::regclass);


--
-- TOC entry 1911 (class 2604 OID 19194)
-- Name: serialpalchave; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY palavras_chave ALTER COLUMN serialpalchave SET DEFAULT nextval('palavras_chave_serial_seq'::regclass);


--
-- TOC entry 1912 (class 2604 OID 19195)
-- Name: serialpaltitulo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY palavrastitulonormal ALTER COLUMN serialpaltitulo SET DEFAULT nextval('palavrastitulonormal_serial_seq'::regclass);


--
-- TOC entry 1920 (class 2606 OID 19197)
-- Name: palavras_chave_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY palavras_chave
    ADD CONSTRAINT palavras_chave_pk PRIMARY KEY (serialpalchave);


--
-- TOC entry 1926 (class 2606 OID 19968)
-- Name: palavrasautorianormal_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY palavrasautorianormal
    ADD CONSTRAINT palavrasautorianormal_pk PRIMARY KEY (serialpalautoria);


--
-- TOC entry 1923 (class 2606 OID 19199)
-- Name: palavrastitulonormal_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY palavrastitulonormal
    ADD CONSTRAINT palavrastitulonormal_pk PRIMARY KEY (serialpaltitulo);


--
-- TOC entry 1929 (class 2606 OID 19994)
-- Name: palavrasveiculonormal_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY palavrasveiculonormal
    ADD CONSTRAINT palavrasveiculonormal_pk PRIMARY KEY (serialpalveiculo);


--
-- TOC entry 1917 (class 2606 OID 19201)
-- Name: patrimonio_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY dadoscatalogo
    ADD CONSTRAINT patrimonio_pk PRIMARY KEY (patrimonio);


--
-- TOC entry 1915 (class 1259 OID 19983)
-- Name: ndx_data_publicacao; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX ndx_data_publicacao ON dadoscatalogo USING btree (data_publicacao);


--
-- TOC entry 1924 (class 1259 OID 19974)
-- Name: ndx_palavra_autoria_normal; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX ndx_palavra_autoria_normal ON palavrasautorianormal USING btree (palavra_autoria_normal COLLATE "C");


--
-- TOC entry 1921 (class 1259 OID 19202)
-- Name: ndx_palavra_titulo_normal; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX ndx_palavra_titulo_normal ON palavrastitulonormal USING btree (palavra_titulo_normal COLLATE "C");


--
-- TOC entry 1927 (class 1259 OID 20000)
-- Name: ndx_palavra_veiculo_normal; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX ndx_palavra_veiculo_normal ON palavrasveiculonormal USING btree (palavra_veiculo_normal COLLATE "C");


--
-- TOC entry 1918 (class 1259 OID 19975)
-- Name: ndx_palchavenormal; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX ndx_palchavenormal ON palavras_chave USING btree (palchavenormal COLLATE "C");


--
-- TOC entry 1930 (class 2606 OID 19203)
-- Name: patrimonio_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY palavras_chave
    ADD CONSTRAINT patrimonio_fk FOREIGN KEY (patrimonio) REFERENCES dadoscatalogo(patrimonio) ON DELETE CASCADE;


--
-- TOC entry 1931 (class 2606 OID 19208)
-- Name: patrimonio_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY palavrastitulonormal
    ADD CONSTRAINT patrimonio_fk FOREIGN KEY (patrimonio) REFERENCES dadoscatalogo(patrimonio) ON DELETE CASCADE;


--
-- TOC entry 1932 (class 2606 OID 19969)
-- Name: patrimonio_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY palavrasautorianormal
    ADD CONSTRAINT patrimonio_fk FOREIGN KEY (patrimonio) REFERENCES dadoscatalogo(patrimonio) ON DELETE CASCADE;


--
-- TOC entry 1933 (class 2606 OID 19995)
-- Name: patrimonio_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY palavrasveiculonormal
    ADD CONSTRAINT patrimonio_fk FOREIGN KEY (patrimonio) REFERENCES dadoscatalogo(patrimonio) ON DELETE CASCADE;


--
-- TOC entry 2049 (class 0 OID 0)
-- Dependencies: 7
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2016-06-15 01:21:21

--
-- PostgreSQL database dump complete
--

