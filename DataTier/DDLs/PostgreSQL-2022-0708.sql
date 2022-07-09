--
-- PostgreSQL database dump
--

--
-- TOC entry 2 (class 3079 OID 20582)
-- Name: pgcrypto; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pgcrypto WITH SCHEMA public;

--
-- TOC entry 3999 (class 0 OID 0)
-- Dependencies: 2
-- Name: EXTENSION pgcrypto; Type: COMMENT; Schema: -; Owner:
--

COMMENT ON EXTENSION pgcrypto IS 'cryptographic functions';

--
-- TOC entry 205 (class 1259 OID 20364)
-- Name: PersonIdentity_PersonIdentityID_seq; Type: SEQUENCE; Schema: public; Owner: test_dsynth
--

CREATE SEQUENCE "PersonIdentity_PersonIdentityID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;



--
-- TOC entry 203 (class 1259 OID 20354)
-- Name: Person_PersonID_seq; Type: SEQUENCE; Schema: public; Owner: test_dsynth
--

CREATE SEQUENCE "Person_PersonID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;



SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 211 (class 1259 OID 20822)
-- Name: crossmaps; Type: TABLE; Schema: public; Owner: test_dsynth
--

CREATE TABLE crossmaps (
                           crossmapid bigint NOT NULL,
                           crossmapdesc character varying(49),
                           createddate timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
                           statusid smallint DEFAULT 1,
                           industrystd character varying(10),
                           organization character varying(38),
                           application character varying(38)
);


--
-- TOC entry 213 (class 1259 OID 20837)
-- Name: crossmaps_dtl; Type: TABLE; Schema: public; Owner: test_dsynth
--

CREATE TABLE crossmaps_dtl (
                               crossmapdtlid bigint NOT NULL,
                               dataattributeid smallint,
                               statusid integer DEFAULT 1,
                               createddate timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
                               crossmapid bigint,
                               crossmapfield character varying(20)
);



--
-- TOC entry 212 (class 1259 OID 20835)
-- Name: crossmaps_dtl_seq; Type: SEQUENCE; Schema: public; Owner: test_dsynth
--

CREATE SEQUENCE crossmaps_dtl_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;



--
-- TOC entry 4000 (class 0 OID 0)
-- Dependencies: 212
-- Name: crossmaps_dtl_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: test_dsynth
--

ALTER SEQUENCE crossmaps_dtl_seq OWNED BY crossmaps_dtl.crossmapdtlid;


--
-- TOC entry 216 (class 1259 OID 20925)
-- Name: crossmaps_person_dtl_seq; Type: SEQUENCE; Schema: public; Owner: test_dsynth
--

CREATE SEQUENCE crossmaps_person_dtl_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 217 (class 1259 OID 20927)
-- Name: crossmaps_person_dtl; Type: TABLE; Schema: public; Owner: test_dsynth
--

CREATE TABLE crossmaps_person_dtl (
                                      crossmapspersondtlid bigint DEFAULT nextval('crossmaps_person_dtl_seq'::regclass) NOT NULL,
                                      crossmapsdtlid bigint,
                                      dataattributeid smallint,
                                      statusid integer DEFAULT 1,
                                      keydatavalueid bigint,
                                      createddate timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
                                      personidentityid bigint
);



--
-- TOC entry 210 (class 1259 OID 20820)
-- Name: crossmapshdr_crossmapid_seq; Type: SEQUENCE; Schema: public; Owner: test_dsynth
--

CREATE SEQUENCE crossmapshdr_crossmapid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;



--
-- TOC entry 4001 (class 0 OID 0)
-- Dependencies: 210
-- Name: crossmapshdr_crossmapid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: test_dsynth
--


--
-- TOC entry 204 (class 1259 OID 20356)
-- Name: personidentities; Type: TABLE; Schema: public; Owner: test_dsynth
--

CREATE TABLE personidentities (
                                  personidentityid bigint DEFAULT nextval('"Person_PersonID_seq"'::regclass) NOT NULL,
                                  application character varying(38),
                                  organization character varying(38),
                                  createddate timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
                                  statusid smallint DEFAULT 1,
                                  sha256 character(64)
);


--
-- TOC entry 215 (class 1259 OID 20869)
-- Name: refdata_dataattributes; Type: TABLE; Schema: public; Owner: test_dsynth
--

CREATE TABLE refdata_dataattributes (
                                        platformdataattributesid integer NOT NULL,
                                        dataattributename character varying(50) DEFAULT 'NULL'::character varying,
                                        createddate timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
                                        statusid integer DEFAULT 1,
                                        createduser character varying(20) DEFAULT 'NULL'::character varying
);


--
-- TOC entry 214 (class 1259 OID 20867)
-- Name: refdata_dataattributes_platformdataattributesid_seq; Type: SEQUENCE; Schema: public; Owner: test_dsynth
--

CREATE SEQUENCE refdata_dataattributes_platformdataattributesid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;



--
-- TOC entry 4002 (class 0 OID 0)
-- Dependencies: 214
-- Name: refdata_dataattributes_platformdataattributesid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: test_dsynth
--

ALTER SEQUENCE refdata_dataattributes_platformdataattributesid_seq OWNED BY refdata_dataattributes.platformdataattributesid;


--
-- TOC entry 206 (class 1259 OID 20374)
-- Name: refdata_idenitifiertype_identifiertypeID_seq; Type: SEQUENCE; Schema: public; Owner: test_dsynth
--

CREATE SEQUENCE "refdata_idenitifiertype_identifiertypeID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 207 (class 1259 OID 20376)
-- Name: refdata_identitytype; Type: TABLE; Schema: public; Owner: test_dsynth
--

CREATE TABLE refdata_identitytype (
                                      "identitytypeID" smallint DEFAULT nextval('"refdata_idenitifiertype_identifiertypeID_seq"'::regclass) NOT NULL,
                                      identityname character varying(35),
                                      "createdDate" timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
                                      "statusID" smallint DEFAULT 1
);


--
-- TOC entry 209 (class 1259 OID 20386)
-- Name: refdata_statuses; Type: TABLE; Schema: public; Owner: test_dsynth
--

CREATE TABLE refdata_statuses (
                                  statusid integer NOT NULL,
                                  statusdescription character varying(45),
                                  createddate timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


--
-- TOC entry 208 (class 1259 OID 20384)
-- Name: refdata_statuses_statusID_seq; Type: SEQUENCE; Schema: public; Owner: test_dsynth
--

CREATE SEQUENCE "refdata_statuses_statusID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 4003 (class 0 OID 0)
-- Dependencies: 208
-- Name: refdata_statuses_statusID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: test_dsynth
--


--
-- TOC entry 3825 (class 2604 OID 20825)
-- Name: crossmaps crossmapid; Type: DEFAULT; Schema: public; Owner: test_dsynth
--

ALTER TABLE ONLY crossmaps ALTER COLUMN crossmapid SET DEFAULT nextval('crossmapshdr_crossmapid_seq'::regclass);


--
-- TOC entry 3828 (class 2604 OID 20840)
-- Name: crossmaps_dtl crossmapdtlid; Type: DEFAULT; Schema: public; Owner: test_dsynth
--

ALTER TABLE ONLY crossmaps_dtl ALTER COLUMN crossmapdtlid SET DEFAULT nextval('crossmaps_dtl_seq'::regclass);


--
-- TOC entry 3831 (class 2604 OID 20872)
-- Name: refdata_dataattributes platformdataattributesid; Type: DEFAULT; Schema: public; Owner: test_dsynth
--

ALTER TABLE ONLY refdata_dataattributes ALTER COLUMN platformdataattributesid SET DEFAULT nextval('refdata_dataattributes_platformdataattributesid_seq'::regclass);


--
-- TOC entry 3823 (class 2604 OID 20389)
-- Name: refdata_statuses statusid; Type: DEFAULT; Schema: public; Owner: test_dsynth
--

ALTER TABLE ONLY refdata_statuses ALTER COLUMN statusid SET DEFAULT nextval('"refdata_statuses_statusID_seq"'::regclass);


--
-- TOC entry 3849 (class 2606 OID 20829)
-- Name: crossmaps crossmaps_pk; Type: CONSTRAINT; Schema: public; Owner: test_dsynth
--

ALTER TABLE ONLY crossmaps
    ADD CONSTRAINT crossmaps_pk PRIMARY KEY (crossmapid);


--
-- TOC entry 3855 (class 2606 OID 20934)
-- Name: crossmaps_person_dtl crossmapsdataattributedtl_pk; Type: CONSTRAINT; Schema: public; Owner: test_dsynth
--

ALTER TABLE ONLY crossmaps_person_dtl
    ADD CONSTRAINT crossmapsdataattributedtl_pk PRIMARY KEY (crossmapspersondtlid);


--
-- TOC entry 3851 (class 2606 OID 20844)
-- Name: crossmaps_dtl crossmapsdtl_pk; Type: CONSTRAINT; Schema: public; Owner: test_dsynth
--

ALTER TABLE ONLY crossmaps_dtl
    ADD CONSTRAINT crossmapsdtl_pk PRIMARY KEY (crossmapdtlid);


--
-- TOC entry 3841 (class 2606 OID 20363)
-- Name: personidentities personidentity_pkey; Type: CONSTRAINT; Schema: public; Owner: test_dsynth
--

ALTER TABLE ONLY personidentities
    ADD CONSTRAINT personidentity_pkey PRIMARY KEY (personidentityid);


--
-- TOC entry 3853 (class 2606 OID 20878)
-- Name: refdata_dataattributes refdata_dataattributes_pkey; Type: CONSTRAINT; Schema: public; Owner: test_dsynth
--

ALTER TABLE ONLY refdata_dataattributes
    ADD CONSTRAINT refdata_dataattributes_pkey PRIMARY KEY (platformdataattributesid);


--
-- TOC entry 3844 (class 2606 OID 20383)
-- Name: refdata_identitytype refdata_identitytype_pkey; Type: CONSTRAINT; Schema: public; Owner: test_dsynth
--

ALTER TABLE ONLY refdata_identitytype
    ADD CONSTRAINT refdata_identitytype_pkey PRIMARY KEY ("identitytypeID");


--
-- TOC entry 3847 (class 2606 OID 20392)
-- Name: refdata_statuses refdata_statuses_pkey; Type: CONSTRAINT; Schema: public; Owner: test_dsynth
--

ALTER TABLE ONLY refdata_statuses
    ADD CONSTRAINT refdata_statuses_pkey PRIMARY KEY (statusid);


--
-- TOC entry 3839 (class 1259 OID 20429)
-- Name: personidentifier_pk; Type: INDEX; Schema: public; Owner: test_dsynth
--

CREATE UNIQUE INDEX personidentifier_pk ON personidentities USING btree (personidentityid);


--
-- TOC entry 3856 (class 1259 OID 21138)
-- Name: personidentity_index; Type: INDEX; Schema: public; Owner: test_dsynth
--

CREATE INDEX personidentity_index ON crossmaps_person_dtl USING btree (personidentityid);


--
-- TOC entry 3842 (class 1259 OID 20431)
-- Name: refdata_idenitifiertype_pk; Type: INDEX; Schema: public; Owner: test_dsynth
--

CREATE UNIQUE INDEX refdata_idenitifiertype_pk ON refdata_identitytype USING btree ("identitytypeID");


--
-- TOC entry 3845 (class 1259 OID 20432)
-- Name: refdata_statuses_pk; Type: INDEX; Schema: public; Owner: test_dsynth
--

CREATE UNIQUE INDEX refdata_statuses_pk ON refdata_statuses USING btree (statusid);


--
-- TOC entry 3859 (class 2606 OID 20830)
-- Name: crossmaps fk_crossmaps_statuses; Type: FK CONSTRAINT; Schema: public; Owner: test_dsynth
--

ALTER TABLE ONLY crossmaps
    ADD CONSTRAINT fk_crossmaps_statuses FOREIGN KEY (statusid) REFERENCES refdata_statuses(statusid);


--
-- TOC entry 3861 (class 2606 OID 20850)
-- Name: crossmaps_dtl fk_crossmapsdtl_crossmaps; Type: FK CONSTRAINT; Schema: public; Owner: test_dsynth
--

ALTER TABLE ONLY crossmaps_dtl
    ADD CONSTRAINT fk_crossmapsdtl_crossmaps FOREIGN KEY (crossmapid) REFERENCES crossmaps(crossmapid);


--
-- TOC entry 3862 (class 2606 OID 20884)
-- Name: crossmaps_dtl fk_crossmapsdtl_dataattribute; Type: FK CONSTRAINT; Schema: public; Owner: test_dsynth
--

ALTER TABLE ONLY crossmaps_dtl
    ADD CONSTRAINT fk_crossmapsdtl_dataattribute FOREIGN KEY (dataattributeid) REFERENCES refdata_dataattributes(platformdataattributesid);


--
-- TOC entry 3864 (class 2606 OID 20935)
-- Name: crossmaps_person_dtl fk_crossmapsdtl_dataattribute; Type: FK CONSTRAINT; Schema: public; Owner: test_dsynth
--

ALTER TABLE ONLY crossmaps_person_dtl
    ADD CONSTRAINT fk_crossmapsdtl_dataattribute FOREIGN KEY (dataattributeid) REFERENCES refdata_dataattributes(platformdataattributesid);


--
-- TOC entry 3866 (class 2606 OID 20954)
-- Name: crossmaps_person_dtl fk_crossmapsdtl_dataattributedtl; Type: FK CONSTRAINT; Schema: public; Owner: test_dsynth
--

ALTER TABLE ONLY crossmaps_person_dtl
    ADD CONSTRAINT fk_crossmapsdtl_dataattributedtl FOREIGN KEY (personidentityid) REFERENCES personidentities(personidentityid);


--
-- TOC entry 3860 (class 2606 OID 20845)
-- Name: crossmaps_dtl fk_crossmapsdtl_statuses; Type: FK CONSTRAINT; Schema: public; Owner: test_dsynth
--

ALTER TABLE ONLY crossmaps_dtl
    ADD CONSTRAINT fk_crossmapsdtl_statuses FOREIGN KEY (statusid) REFERENCES refdata_statuses(statusid);


--
-- TOC entry 3865 (class 2606 OID 20940)
-- Name: crossmaps_person_dtl fk_crossmapsdtl_statuses; Type: FK CONSTRAINT; Schema: public; Owner: test_dsynth
--

ALTER TABLE ONLY crossmaps_person_dtl
    ADD CONSTRAINT fk_crossmapsdtl_statuses FOREIGN KEY (statusid) REFERENCES refdata_statuses(statusid);


--
-- TOC entry 3857 (class 2606 OID 20403)
-- Name: personidentities personidentity_StatusID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: test_dsynth
--

ALTER TABLE ONLY personidentities
    ADD CONSTRAINT "personidentity_StatusID_fkey" FOREIGN KEY (statusid) REFERENCES refdata_statuses(statusid);


--
-- TOC entry 3863 (class 2606 OID 20879)
-- Name: refdata_dataattributes refdata_dataattributes_statusid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: test_dsynth
--

ALTER TABLE ONLY refdata_dataattributes
    ADD CONSTRAINT refdata_dataattributes_statusid_fkey FOREIGN KEY (statusid) REFERENCES refdata_statuses(statusid);


--
-- TOC entry 3858 (class 2606 OID 20423)
-- Name: refdata_identitytype refdata_identitytype_statusID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: test_dsynth
--

ALTER TABLE ONLY refdata_identitytype
    ADD CONSTRAINT "refdata_identitytype_statusID_fkey" FOREIGN KEY ("statusID") REFERENCES refdata_statuses(statusid);


-- Completed on 2022-07-09 01:02:03 CDT

--
-- PostgreSQL database dump complete
--

