DROP TABLE IF EXISTS dim_addresses

CREATE TABLE dim_addresses (
    address_surr_id  BIGINT NOT NULL,
    address_id       VARCHAR(50) NOT NULL,
    source_system    VARCHAR(30) NOT NULL,
    source_entity    VARCHAR(30) NOT NULL,
    address          VARCHAR(50) NOT NULL,
    postal_code      VARCHAR(20) NOT NULL,
    city_id          BIGINT NOT NULL,
    city             VARCHAR(50) NOT NULL,
    country_id       BIGINT NOT NULL,
    country          VARCHAR(50) NOT NULL,
    region_id        BIGINT NOT NULL,
    region           VARCHAR(50) NOT NULL,
    update_dt        DATE NOT NULL,
    insert_dt        DATE NOT NULL
);

ALTER TABLE dim_addresses ADD CONSTRAINT dim_address_pk PRIMARY KEY ( address_surr_id );