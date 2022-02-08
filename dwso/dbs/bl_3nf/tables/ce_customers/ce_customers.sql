drop table if exists ce_customers;

CREATE TABLE ce_customers (
    customer_id           BIGINT NOT NULL,
    customer_src_id       VARCHAR(50) NOT NULL,
    source_system         VARCHAR(30) NOT NULL,
    source_entity         VARCHAR(30) NOT NULL,
    type_customer         INTEGER NOT NULL,
    first_name            VARCHAR(50) NOT NULL,
    last_name             VARCHAR(50) NOT NULL,
    gender                VARCHAR(20) NOT NULL,
    date_of_birth         DATE NOT NULL,
    name_of_organization  VARCHAR(100) NOT NULL,
    head_of_organization  VARCHAR(100) NOT NULL,
    iban                  VARCHAR(50) NOT NULL,
    email                 VARCHAR(50) NOT NULL,
    address_surr_id       BIGINT NOT NULL,
    update_dt             DATE NOT NULL,
    insert_dt             DATE NOT NULL
);

ALTER TABLE ce_customers ADD CONSTRAINT ce_customer_pk PRIMARY KEY ( customer_id );

ALTER TABLE ce_customers
    ADD CONSTRAINT ce_customer_ce_address_fk FOREIGN KEY ( address_surr_id )
        REFERENCES ce_addresses ( address_id );


