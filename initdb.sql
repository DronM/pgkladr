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

