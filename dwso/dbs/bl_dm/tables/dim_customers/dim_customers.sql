DROP TABLE IF EXISTS dim_customers;

CREATE TABLE dim_customers (
    customer_surr_id      BIGINT NOT NULL,
    customer_id           BIGINT NOT NULL,
    source_system         VARCHAR(30) NOT NULL,
    source_entity         VARCHAR(30) NOT NULL,
    type_customer         BIGINT NOT NULL,
    first_name            VARCHAR(50) NOT NULL,
    last_name             VARCHAR(50) NOT NULL,
    gender                VARCHAR(20) NOT NULL,
    date_of_birth         DATE NOT NULL,
    name_of_organization  VARCHAR(100) NOT NULL,
    email                 VARCHAR(50) NOT NULL,
    head_of_organization  VARCHAR(50) NOT NULL,
    iban                  VARCHAR(50) NOT NULL,
    address_id            NUMERIC NOT NULL,
    address               VARCHAR(50) NOT NULL,
    postal_code           VARCHAR(20)  NOT NULL,
    city_id               BIGINT NOT NULL,
    city                  VARCHAR(50)  NOT NULL,
    country_id            BIGINT NOT NULL,
    country               VARCHAR(50)  NOT NULL,
    region_id             BIGINT NOT NULL,
    region                VARCHAR(50)  NOT NULL,
    update_dt             DATE NOT NULL,
    insert_dt             DATE NOT NULL
);

ALTER TABLE dim_customers ADD CONSTRAINT dim_customer_pk PRIMARY KEY ( customer_surr_id );