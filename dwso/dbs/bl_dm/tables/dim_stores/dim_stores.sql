DROP TABLE IF EXISTS dim_stores;

CREATE TABLE dim_stores (
    store_surr_id  BIGINT NOT NULL,
    store_id       BIGINT NOT NULL,
    source_system  VARCHAR(30) NOT NULL,
    source_entity  VARCHAR(30) NOT NULL,
    store_name     VARCHAR(50) NOT NULL,
    store_type_id  BIGINT  NOT NULL,
    store_type     VARCHAR(30) NOT NULL,
    update_dt      DATE NOT NULL,
    insert_dt      DATE NOT NULL
);

ALTER TABLE dim_stores ADD CONSTRAINT dim_store_pk PRIMARY KEY ( store_surr_id );