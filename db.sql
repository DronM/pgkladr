/*Структура базы данных Postgresql для классификатора адресов KLADR
*/

-- Database: kladr

-- DROP DATABASE kladr;

CREATE DATABASE kladr
  WITH OWNER = postgres
       ENCODING = 'UTF8'
       TABLESPACE = pg_default
       LC_COLLATE = 'ru_RU.UTF-8'
       LC_CTYPE = 'ru_RU.UTF-8'
       CONNECTION LIMIT = -1;
GRANT ALL ON DATABASE kladr TO postgres;
GRANT CONNECT, TEMPORARY ON DATABASE kladr TO public;
GRANT SELECT ON ALL TABLES IN SCHEMA public TO PUBLIC;


-- Table: altnames

-- DROP TABLE altnames;

CREATE TABLE altnames
(
  oldcode character varying(19),
  newcode character varying(19),
  level character varying(1)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE altnames OWNER TO postgres;

-- Table: doma

-- DROP TABLE doma;

CREATE TABLE doma
(
  name character varying(40),
  korp character varying(10),
  socr character varying(10),
  code character varying(19),
  index character varying(6),
  gninmb character varying(4),
  uno character varying(4),
  ocatd character varying(11)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE doma
  OWNER TO postgres;
GRANT ALL ON TABLE doma TO postgres;

-- Index: doma_code

-- DROP INDEX doma_code;

CREATE INDEX doma_code
  ON doma
  USING btree
  (code COLLATE pg_catalog."default");

-- Index: doma_lower_name_

-- DROP INDEX doma_lower_name_;

CREATE INDEX doma_lower_name_
  ON doma
  USING btree
  (lower(name::text) COLLATE pg_catalog."default");




-- Table: flat

-- DROP TABLE flat;

CREATE TABLE flat
(
  code character varying(23),
  np character varying(4),
  gninmb character varying(4),
  name character varying(40),
  index character varying(6),
  uno character varying(4)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE flat
  OWNER TO postgres;
GRANT ALL ON TABLE flat TO postgres;

-- Index: flat_code

-- DROP INDEX flat_code;

CREATE INDEX flat_code
  ON flat
  USING btree
  (code COLLATE pg_catalog."default");

-- Index: flat_lower_name_

-- DROP INDEX flat_lower_name_;

CREATE INDEX flat_lower_name_
  ON flat
  USING btree
  (lower(name::text) COLLATE pg_catalog."default");


-- Table: kladr

-- DROP TABLE kladr;

CREATE TABLE kladr
(
  name character varying(40),
  socr character varying(10),
  code character varying(13),
  index character varying(6),
  gninmb character varying(4),
  uno character varying(4),
  ocatd character varying(11),
  status character varying(1)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE kladr
  OWNER TO postgres;
GRANT ALL ON TABLE kladr TO postgres;

-- Index: kladr_code

-- DROP INDEX kladr_code;

CREATE INDEX kladr_code
  ON kladr
  USING btree
  (code COLLATE pg_catalog."default");

-- Index: kladr_lower_name_

-- DROP INDEX kladr_lower_name_;

CREATE INDEX kladr_lower_name_
  ON kladr
  USING btree
  (lower(name::text) COLLATE pg_catalog."default");

-- Table: socrbase

-- DROP TABLE socrbase;

CREATE TABLE socrbase
(
  level character varying(5),
  scname character varying(10),
  socrname character varying(29),
  kod_t_st character varying(3)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE socrbase
  OWNER TO postgres;
GRANT ALL ON TABLE socrbase TO postgres;


-- Table: street

-- DROP TABLE street;

CREATE TABLE street
(
  name character varying(40),
  socr character varying(10),
  code character varying(17),
  index character varying(6),
  gninmb character varying(4),
  uno character varying(4),
  ocatd character varying(11)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE street
  OWNER TO postgres;
GRANT ALL ON TABLE street TO postgres;

-- Index: street_lower_name_

-- DROP INDEX street_lower_name_;

CREATE INDEX street_lower_name_
  ON street
  USING btree
  (lower(name::text) COLLATE pg_catalog."default");


-- Table: update_date

-- DROP TABLE update_date;

CREATE TABLE update_date
(
  date_time timestamp without time zone NOT NULL,
  CONSTRAINT update_date_pkey PRIMARY KEY (date_time)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE update_date
  OWNER TO postgres;

