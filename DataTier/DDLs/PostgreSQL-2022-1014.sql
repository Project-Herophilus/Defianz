-- public.refdata_statuses definition

-- Drop table

-- DROP TABLE public.refdata_statuses;

CREATE TABLE public.refdata_statuses (
                                         "statusID" smallserial NOT NULL,
                                         statusdescription varchar(45) NULL,
                                         createddate timestamp NULL DEFAULT CURRENT_TIMESTAMP,
                                         CONSTRAINT refdata_statuses_pk PRIMARY KEY ("statusID")
);


-- public.person definition

-- Drop table

-- DROP TABLE public.person;

CREATE TABLE public.person (
                               "PersonID" int8 NOT NULL DEFAULT nextval('"Person_PersonID_seq"'::regclass),
                               "Application" varchar(38) NULL,
                               "Organization" varchar(38) NULL,
                               "CreatedDate" timestamp NULL DEFAULT CURRENT_TIMESTAMP,
                               "StatusID" int2 NULL DEFAULT 1,
                               CONSTRAINT person_pk PRIMARY KEY ("PersonID"),
                               CONSTRAINT fk_person_status FOREIGN KEY ("StatusID") REFERENCES public.refdata_statuses("statusID")
);


-- public.personassociation definition

-- Drop table

-- DROP TABLE public.personassociation;

CREATE TABLE public.personassociation (
                                          "PersonAssociationID" bigserial NOT NULL,
                                          "PersonID" int8 NULL,
                                          "AttributeID" int2 NULL,
                                          "AttributeValue" varchar(25) NULL,
                                          "CreatedDate" timestamp NULL DEFAULT CURRENT_TIMESTAMP,
                                          "StatusID" int2 NULL DEFAULT 1,
                                          CONSTRAINT personassociation_pk PRIMARY KEY ("PersonAssociationID"),
                                          CONSTRAINT fk_personassociation_person FOREIGN KEY ("PersonID") REFERENCES public.person("PersonID"),
                                          CONSTRAINT fk_personassociation_status FOREIGN KEY ("StatusID") REFERENCES public.refdata_statuses("statusID")
);


-- public.refdata_idenitifiertype definition

-- Drop table

-- DROP TABLE public.refdata_idenitifiertype;

CREATE TABLE public.refdata_idenitifiertype (
                                                "identifiertypeID" smallserial NOT NULL,
                                                identifiername varchar(35) NULL,
                                                "createdDate" timestamp NULL DEFAULT CURRENT_TIMESTAMP,
                                                "statusID" int2 NULL DEFAULT 1,
                                                CONSTRAINT refdata_idenitifiertype_pk PRIMARY KEY ("identifiertypeID"),
                                                CONSTRAINT fk_refdataidenitifiertype_status FOREIGN KEY ("statusID") REFERENCES public.refdata_statuses("statusID")
);


-- public.personidentity definition

-- Drop table

-- DROP TABLE public.personidentity;

CREATE TABLE public.personidentity (
                                       "PersonIdentityID" int8 NOT NULL DEFAULT nextval('"PersonIdentity_PersonIdentityID_seq"'::regclass),
                                       "PersonID" int8 NULL,
                                       "IdentifierValue" varchar(25) NULL,
                                       "IdentifierTypeID" int2 NULL,
                                       "CreatedDate" timestamp NULL DEFAULT CURRENT_TIMESTAMP,
                                       "ModifiedDate" timestamp NULL,
                                       "StatusID" int2 NULL DEFAULT 1,
                                       CONSTRAINT personidentity_pk PRIMARY KEY ("PersonIdentityID"),
                                       CONSTRAINT fk_personidentity_identifiertype FOREIGN KEY ("IdentifierTypeID") REFERENCES public.refdata_idenitifiertype("identifiertypeID"),
                                       CONSTRAINT fk_personidentity_person FOREIGN KEY ("PersonID") REFERENCES public.person("PersonID"),
                                       CONSTRAINT fk_personidentity_status FOREIGN KEY ("StatusID") REFERENCES public.refdata_statuses("statusID")
);