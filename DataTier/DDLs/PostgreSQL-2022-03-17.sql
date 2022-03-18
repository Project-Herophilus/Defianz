--
-- Name: personidentity; Type: TABLE; Schema: public; Owner: test_dsynth
--

CREATE TABLE public.personidentity (
    personidentityid bigint NOT NULL,
    application character varying(38),
    organization character varying(38),
    createddate timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    statusid smallint DEFAULT 1,
    sha256 character(64) NOT NULL
);


ALTER TABLE public.personidentity OWNER TO test_dsynth;

--
-- Name: personidentity_personidentityid_seq; Type: SEQUENCE; Schema: public; Owner: test_dsynth
--

CREATE SEQUENCE public.personidentity_personidentityid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.personidentity_personidentityid_seq OWNER TO test_dsynth;

--
-- Name: personidentity_personidentityid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: test_dsynth
--

ALTER SEQUENCE public.personidentity_personidentityid_seq OWNED BY public.personidentity.personidentityid;


--
-- Name: refdata_status; Type: TABLE; Schema: public; Owner: test_dsynth
--

CREATE TABLE public.refdata_status (
    statusid integer NOT NULL,
    statusdescription character varying(45),
    createddate timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.refdata_status OWNER TO test_dsynth;

--
-- Name: refdata_status_statusid_seq; Type: SEQUENCE; Schema: public; Owner: test_dsynth
--

CREATE SEQUENCE public.refdata_status_statusid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.refdata_status_statusid_seq OWNER TO test_dsynth;

--
-- Name: refdata_status_statusid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: test_dsynth
--

ALTER SEQUENCE public.refdata_status_statusid_seq OWNED BY public.refdata_status.statusid;


--
-- Name: personidentity personidentityid; Type: DEFAULT; Schema: public; Owner: test_dsynth
--

ALTER TABLE ONLY public.personidentity ALTER COLUMN personidentityid SET DEFAULT nextval('public.personidentity_personidentityid_seq'::regclass);


--
-- Name: refdata_status statusid; Type: DEFAULT; Schema: public; Owner: test_dsynth
--

ALTER TABLE ONLY public.refdata_status ALTER COLUMN statusid SET DEFAULT nextval('public.refdata_status_statusid_seq'::regclass);


--
-- Name: personidentity personidentity_pkey; Type: CONSTRAINT; Schema: public; Owner: test_dsynth
--

ALTER TABLE ONLY public.personidentity
    ADD CONSTRAINT personidentity_pkey PRIMARY KEY (personidentityid);


--
-- Name: refdata_status refdata_status_pkey; Type: CONSTRAINT; Schema: public; Owner: test_dsynth
--

ALTER TABLE ONLY public.refdata_status
    ADD CONSTRAINT refdata_status_pkey PRIMARY KEY (statusid);


--
-- Name: personidentity_sha256_idx; Type: INDEX; Schema: public; Owner: test_dsynth
--

CREATE UNIQUE INDEX personidentity_sha256_idx ON public.personidentity USING btree (sha256);


--
-- Name: personidentity personidentity_statusid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: test_dsynth
--

ALTER TABLE ONLY public.personidentity
    ADD CONSTRAINT personidentity_statusid_fkey FOREIGN KEY (statusid) REFERENCES public.refdata_status(statusid);


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM rdsadmin;
REVOKE ALL ON SCHEMA public FROM PUBLIC;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


