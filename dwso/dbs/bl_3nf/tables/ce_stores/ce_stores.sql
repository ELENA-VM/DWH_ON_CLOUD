DROP TABLE IF EXISTS ce_stores;

CREATE TABLE ce_stores (
    store_id            BIGINT NOT NULL,
    store_src_id        VARCHAR(50) NOT NULL, 
    source_system       VARCHAR(30) NOT NULL,
    source_entity       VARCHAR(30) NOT NULL,
    store_name          VARCHAR(50) NOT NULL,
    store_type_surr_id  BIGINT	NOT NULL,
    update_dt           DATE NOT NULL,
    insert_dt           DATE NOT NULL
);

ALTER TABLE ce_stores ADD CONSTRAINT ce_store_scd_pk PRIMARY KEY ( store_id );

ALTER TABLE ce_stores
    ADD CONSTRAINT ce_store_ce_store_type_fk FOREIGN KEY ( store_type_surr_id )
        REFERENCES ce_type_stores ( type_store_id );