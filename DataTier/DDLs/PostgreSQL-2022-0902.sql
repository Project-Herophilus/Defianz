--
-- PostgreSQL database dump
--

-- Dumped from database version 12.8
-- Dumped by pg_dump version 12.3

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
-- Name: pgcrypto; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pgcrypto WITH SCHEMA public;


--
-- Name: EXTENSION pgcrypto; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pgcrypto IS 'cryptographic functions';


--
-- Name: PersonIdentity_PersonIdentityID_seq; Type: SEQUENCE; Schema: public; Owner: test_dsynth
--

CREATE SEQUENCE public."PersonIdentity_PersonIdentityID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."PersonIdentity_PersonIdentityID_seq" OWNER TO test_dsynth;

--
-- Name: Person_PersonID_seq; Type: SEQUENCE; Schema: public; Owner: test_dsynth
--

CREATE SEQUENCE public."Person_PersonID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Person_PersonID_seq" OWNER TO test_dsynth;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: crossmaps; Type: TABLE; Schema: public; Owner: test_dsynth
--

CREATE TABLE public.crossmaps (
    crossmapid bigint NOT NULL,
    crossmapdesc character varying(49),
    createddate timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    statusid smallint DEFAULT 1,
    industrystd character varying(10),
    organization character varying(38),
    application character varying(38)
);


ALTER TABLE public.crossmaps OWNER TO test_dsynth;

--
-- Name: crossmaps_dtl; Type: TABLE; Schema: public; Owner: test_dsynth
--

CREATE TABLE public.crossmaps_dtl (
    crossmapdtlid bigint NOT NULL,
    dataattributeid smallint,
    statusid integer DEFAULT 1,
    createddate timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    crossmapid bigint,
    crossmapfield character varying(20)
);


ALTER TABLE public.crossmaps_dtl OWNER TO test_dsynth;

--
-- Name: crossmaps_dtl_seq; Type: SEQUENCE; Schema: public; Owner: test_dsynth
--

CREATE SEQUENCE public.crossmaps_dtl_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.crossmaps_dtl_seq OWNER TO test_dsynth;

--
-- Name: crossmaps_dtl_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: test_dsynth
--

ALTER SEQUENCE public.crossmaps_dtl_seq OWNED BY public.crossmaps_dtl.crossmapdtlid;


--
-- Name: crossmaps_person_dtl_seq; Type: SEQUENCE; Schema: public; Owner: test_dsynth
--

CREATE SEQUENCE public.crossmaps_person_dtl_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.crossmaps_person_dtl_seq OWNER TO test_dsynth;

--
-- Name: crossmaps_person_dtl; Type: TABLE; Schema: public; Owner: test_dsynth
--

CREATE TABLE public.crossmaps_person_dtl (
    crossmapspersondtlid bigint DEFAULT nextval('public.crossmaps_person_dtl_seq'::regclass) NOT NULL,
    crossmapsdtlid bigint,
    dataattributeid smallint,
    statusid integer DEFAULT 1,
    keydatavalueid bigint,
    createddate timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    personidentityid bigint
);


ALTER TABLE public.crossmaps_person_dtl OWNER TO test_dsynth;

--
-- Name: crossmapshdr_crossmapid_seq; Type: SEQUENCE; Schema: public; Owner: test_dsynth
--

CREATE SEQUENCE public.crossmapshdr_crossmapid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.crossmapshdr_crossmapid_seq OWNER TO test_dsynth;

--
-- Name: crossmapshdr_crossmapid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: test_dsynth
--

ALTER SEQUENCE public.crossmapshdr_crossmapid_seq OWNED BY public.crossmaps.crossmapid;


--
-- Name: personidentities; Type: TABLE; Schema: public; Owner: test_dsynth
--

CREATE TABLE public.personidentities (
    personidentityid bigint DEFAULT nextval('public."Person_PersonID_seq"'::regclass) NOT NULL,
    application character varying(38),
    organization character varying(38),
    createddate timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    statusid smallint DEFAULT 1,
    sha256 character(64)
);


ALTER TABLE public.personidentities OWNER TO test_dsynth;

--
-- Name: refdata_dataattributes; Type: TABLE; Schema: public; Owner: test_dsynth
--

CREATE TABLE public.refdata_dataattributes (
    platformdataattributesid integer NOT NULL,
    dataattributename character varying(50) DEFAULT 'NULL'::character varying,
    createddate timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    statusid integer DEFAULT 1,
    createduser character varying(20) DEFAULT 'NULL'::character varying,
    endpoint character varying(50)
);


ALTER TABLE public.refdata_dataattributes OWNER TO test_dsynth;

--
-- Name: refdata_dataattributes_platformdataattributesid_seq; Type: SEQUENCE; Schema: public; Owner: test_dsynth
--

CREATE SEQUENCE public.refdata_dataattributes_platformdataattributesid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.refdata_dataattributes_platformdataattributesid_seq OWNER TO test_dsynth;

--
-- Name: refdata_dataattributes_platformdataattributesid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: test_dsynth
--

ALTER SEQUENCE public.refdata_dataattributes_platformdataattributesid_seq OWNED BY public.refdata_dataattributes.platformdataattributesid;


--
-- Name: refdata_idenitifiertype_identifiertypeID_seq; Type: SEQUENCE; Schema: public; Owner: test_dsynth
--

CREATE SEQUENCE public."refdata_idenitifiertype_identifiertypeID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."refdata_idenitifiertype_identifiertypeID_seq" OWNER TO test_dsynth;

--
-- Name: refdata_identitytype; Type: TABLE; Schema: public; Owner: test_dsynth
--

CREATE TABLE public.refdata_identitytype (
    "identitytypeID" smallint DEFAULT nextval('public."refdata_idenitifiertype_identifiertypeID_seq"'::regclass) NOT NULL,
    identityname character varying(35),
    "createdDate" timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    "statusID" smallint DEFAULT 1
);


ALTER TABLE public.refdata_identitytype OWNER TO test_dsynth;

--
-- Name: refdata_statuses; Type: TABLE; Schema: public; Owner: test_dsynth
--

CREATE TABLE public.refdata_statuses (
    statusid integer NOT NULL,
    statusdescription character varying(45),
    createddate timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.refdata_statuses OWNER TO test_dsynth;

--
-- Name: refdata_statuses_statusID_seq; Type: SEQUENCE; Schema: public; Owner: test_dsynth
--

CREATE SEQUENCE public."refdata_statuses_statusID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."refdata_statuses_statusID_seq" OWNER TO test_dsynth;

--
-- Name: refdata_statuses_statusID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: test_dsynth
--

ALTER SEQUENCE public."refdata_statuses_statusID_seq" OWNED BY public.refdata_statuses.statusid;


--
-- Name: crossmaps crossmapid; Type: DEFAULT; Schema: public; Owner: test_dsynth
--

ALTER TABLE ONLY public.crossmaps ALTER COLUMN crossmapid SET DEFAULT nextval('public.crossmapshdr_crossmapid_seq'::regclass);


--
-- Name: crossmaps_dtl crossmapdtlid; Type: DEFAULT; Schema: public; Owner: test_dsynth
--

ALTER TABLE ONLY public.crossmaps_dtl ALTER COLUMN crossmapdtlid SET DEFAULT nextval('public.crossmaps_dtl_seq'::regclass);


--
-- Name: refdata_dataattributes platformdataattributesid; Type: DEFAULT; Schema: public; Owner: test_dsynth
--

ALTER TABLE ONLY public.refdata_dataattributes ALTER COLUMN platformdataattributesid SET DEFAULT nextval('public.refdata_dataattributes_platformdataattributesid_seq'::regclass);


--
-- Name: refdata_statuses statusid; Type: DEFAULT; Schema: public; Owner: test_dsynth
--

ALTER TABLE ONLY public.refdata_statuses ALTER COLUMN statusid SET DEFAULT nextval('public."refdata_statuses_statusID_seq"'::regclass);


--
-- Name: crossmaps crossmaps_pk; Type: CONSTRAINT; Schema: public; Owner: test_dsynth
--

ALTER TABLE ONLY public.crossmaps
    ADD CONSTRAINT crossmaps_pk PRIMARY KEY (crossmapid);


--
-- Name: crossmaps_person_dtl crossmapsdataattributedtl_pk; Type: CONSTRAINT; Schema: public; Owner: test_dsynth
--

ALTER TABLE ONLY public.crossmaps_person_dtl
    ADD CONSTRAINT crossmapsdataattributedtl_pk PRIMARY KEY (crossmapspersondtlid);


--
-- Name: crossmaps_dtl crossmapsdtl_pk; Type: CONSTRAINT; Schema: public; Owner: test_dsynth
--

ALTER TABLE ONLY public.crossmaps_dtl
    ADD CONSTRAINT crossmapsdtl_pk PRIMARY KEY (crossmapdtlid);


--
-- Name: personidentities personidentity_pkey; Type: CONSTRAINT; Schema: public; Owner: test_dsynth
--

ALTER TABLE ONLY public.personidentities
    ADD CONSTRAINT personidentity_pkey PRIMARY KEY (personidentityid);


--
-- Name: refdata_dataattributes refdata_dataattributes_pkey; Type: CONSTRAINT; Schema: public; Owner: test_dsynth
--

ALTER TABLE ONLY public.refdata_dataattributes
    ADD CONSTRAINT refdata_dataattributes_pkey PRIMARY KEY (platformdataattributesid);


--
-- Name: refdata_identitytype refdata_identitytype_pkey; Type: CONSTRAINT; Schema: public; Owner: test_dsynth
--

ALTER TABLE ONLY public.refdata_identitytype
    ADD CONSTRAINT refdata_identitytype_pkey PRIMARY KEY ("identitytypeID");


--
-- Name: refdata_statuses refdata_statuses_pkey; Type: CONSTRAINT; Schema: public; Owner: test_dsynth
--

ALTER TABLE ONLY public.refdata_statuses
    ADD CONSTRAINT refdata_statuses_pkey PRIMARY KEY (statusid);


--
-- Name: personidentifier_pk; Type: INDEX; Schema: public; Owner: test_dsynth
--

CREATE UNIQUE INDEX personidentifier_pk ON public.personidentities USING btree (personidentityid);


--
-- Name: personidentity_index; Type: INDEX; Schema: public; Owner: test_dsynth
--

CREATE INDEX personidentity_index ON public.crossmaps_person_dtl USING btree (personidentityid);


--
-- Name: refdata_idenitifiertype_pk; Type: INDEX; Schema: public; Owner: test_dsynth
--

CREATE UNIQUE INDEX refdata_idenitifiertype_pk ON public.refdata_identitytype USING btree ("identitytypeID");


--
-- Name: refdata_statuses_pk; Type: INDEX; Schema: public; Owner: test_dsynth
--

CREATE UNIQUE INDEX refdata_statuses_pk ON public.refdata_statuses USING btree (statusid);


--
-- Name: crossmaps fk_crossmaps_statuses; Type: FK CONSTRAINT; Schema: public; Owner: test_dsynth
--

ALTER TABLE ONLY public.crossmaps
    ADD CONSTRAINT fk_crossmaps_statuses FOREIGN KEY (statusid) REFERENCES public.refdata_statuses(statusid);


--
-- Name: crossmaps_dtl fk_crossmapsdtl_crossmaps; Type: FK CONSTRAINT; Schema: public; Owner: test_dsynth
--

ALTER TABLE ONLY public.crossmaps_dtl
    ADD CONSTRAINT fk_crossmapsdtl_crossmaps FOREIGN KEY (crossmapid) REFERENCES public.crossmaps(crossmapid);


--
-- Name: crossmaps_dtl fk_crossmapsdtl_dataattribute; Type: FK CONSTRAINT; Schema: public; Owner: test_dsynth
--

ALTER TABLE ONLY public.crossmaps_dtl
    ADD CONSTRAINT fk_crossmapsdtl_dataattribute FOREIGN KEY (dataattributeid) REFERENCES public.refdata_dataattributes(platformdataattributesid);


--
-- Name: crossmaps_person_dtl fk_crossmapsdtl_dataattribute; Type: FK CONSTRAINT; Schema: public; Owner: test_dsynth
--

ALTER TABLE ONLY public.crossmaps_person_dtl
    ADD CONSTRAINT fk_crossmapsdtl_dataattribute FOREIGN KEY (dataattributeid) REFERENCES public.refdata_dataattributes(platformdataattributesid);


--
-- Name: crossmaps_person_dtl fk_crossmapsdtl_dataattributedtl; Type: FK CONSTRAINT; Schema: public; Owner: test_dsynth
--

ALTER TABLE ONLY public.crossmaps_person_dtl
    ADD CONSTRAINT fk_crossmapsdtl_dataattributedtl FOREIGN KEY (personidentityid) REFERENCES public.personidentities(personidentityid);


--
-- Name: crossmaps_dtl fk_crossmapsdtl_statuses; Type: FK CONSTRAINT; Schema: public; Owner: test_dsynth
--

ALTER TABLE ONLY public.crossmaps_dtl
    ADD CONSTRAINT fk_crossmapsdtl_statuses FOREIGN KEY (statusid) REFERENCES public.refdata_statuses(statusid);


--
-- Name: crossmaps_person_dtl fk_crossmapsdtl_statuses; Type: FK CONSTRAINT; Schema: public; Owner: test_dsynth
--

ALTER TABLE ONLY public.crossmaps_person_dtl
    ADD CONSTRAINT fk_crossmapsdtl_statuses FOREIGN KEY (statusid) REFERENCES public.refdata_statuses(statusid);


--
-- Name: personidentities personidentity_StatusID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: test_dsynth
--

ALTER TABLE ONLY public.personidentities
    ADD CONSTRAINT "personidentity_StatusID_fkey" FOREIGN KEY (statusid) REFERENCES public.refdata_statuses(statusid);


--
-- Name: refdata_dataattributes refdata_dataattributes_statusid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: test_dsynth
--

ALTER TABLE ONLY public.refdata_dataattributes
    ADD CONSTRAINT refdata_dataattributes_statusid_fkey FOREIGN KEY (statusid) REFERENCES public.refdata_statuses(statusid);


--
-- Name: refdata_identitytype refdata_identitytype_statusID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: test_dsynth
--

ALTER TABLE ONLY public.refdata_identitytype
    ADD CONSTRAINT "refdata_identitytype_statusID_fkey" FOREIGN KEY ("statusID") REFERENCES public.refdata_statuses(statusid);


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM rdsadmin;
REVOKE ALL ON SCHEMA public FROM PUBLIC;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

