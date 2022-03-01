CREATE TABLE personassociation (
                                   "PersonAssociationID" serial NOT NULL,
                                   "PersonID" bigint,
                                   "AttributeID" smallint,
                                   "AttributeValue" varchar(25),
                                   "CreatedDate" timestamp DEFAULT CURRENT_TIMESTAMP,
                                   "StatusID" smallint DEFAULT 1,
                                   PRIMARY KEY ("PersonAssociationID")
);

create sequence "Person_PersonID_seq";
CREATE TABLE personidentity (
                                "PersonIdentityID" bigint DEFAULT nextval('"Person_PersonID_seq"'::regclass) NOT NULL,
                                "Application" varchar(38),
                                "Organization" varchar(38),
                                "CreatedDate" timestamp DEFAULT CURRENT_TIMESTAMP,
                                "StatusID" smallint DEFAULT 1,
                                "KeyIdentifier" varchar(25),
                                PRIMARY KEY ("PersonIdentityID")
);

create sequence "PersonIdentity_PersonIdentityID_seq";
CREATE TABLE personidentitydtl (
                                   "PersonIdentityDtlID" bigint DEFAULT nextval('"PersonIdentity_PersonIdentityID_seq"'::regclass) NOT NULL,
                                   "IdentifierValue" varchar(25),
                                   "IdentifierTypeID" smallint,
                                   "CreatedDate" timestamp DEFAULT CURRENT_TIMESTAMP,
                                   "ModifiedDate" timestamp,
                                   "StatusID" smallint DEFAULT 1,
                                   "PersonIdentityID" bigint,
                                   PRIMARY KEY ("PersonIdentityDtlID")
);

create sequence "refdata_idenitifiertype_identifiertypeID_seq";
CREATE TABLE refdata_identitytype (
                                      "identitytypeID" smallint DEFAULT nextval('"refdata_idenitifiertype_identifiertypeID_seq"'::regclass) NOT NULL,
                                      identityname varchar(35),
                                      "createdDate" timestamp DEFAULT CURRENT_TIMESTAMP,
                                      "statusID" smallint DEFAULT 1,
                                      PRIMARY KEY ("identitytypeID")
);

CREATE TABLE refdata_statuses (
                                  "statusID" serial NOT NULL,
                                  statusdescription varchar(45),
                                  createddate timestamp DEFAULT CURRENT_TIMESTAMP,
                                  PRIMARY KEY ("statusID")
);

ALTER TABLE personassociation
    ADD FOREIGN KEY ("PersonID")
        REFERENCES personidentity ("PersonIdentityID");

ALTER TABLE personassociation
    ADD FOREIGN KEY ("StatusID")
        REFERENCES refdata_statuses ("statusID");



ALTER TABLE personidentity
    ADD FOREIGN KEY ("StatusID")
        REFERENCES refdata_statuses ("statusID");



ALTER TABLE personidentitydtl
    ADD FOREIGN KEY ("PersonIdentityID")
        REFERENCES personidentity ("PersonIdentityID");

ALTER TABLE personidentitydtl
    ADD FOREIGN KEY ("IdentifierTypeID")
        REFERENCES refdata_identitytype ("identitytypeID");

ALTER TABLE personidentitydtl
    ADD FOREIGN KEY ("StatusID")
        REFERENCES refdata_statuses ("statusID");



ALTER TABLE refdata_identitytype
    ADD FOREIGN KEY ("statusID")
        REFERENCES refdata_statuses ("statusID");



CREATE UNIQUE INDEX personassociation_pk ON personassociation USING btree ("PersonAssociationID");

CREATE UNIQUE INDEX personidentifier_pk ON personidentity USING btree ("PersonIdentityID");

CREATE UNIQUE INDEX personidentity_pk ON personidentitydtl USING btree ("PersonIdentityDtlID");

CREATE UNIQUE INDEX refdata_idenitifiertype_pk ON refdata_identitytype USING btree ("identitytypeID");

CREATE UNIQUE INDEX refdata_statuses_pk ON refdata_statuses USING btree ("statusID");

