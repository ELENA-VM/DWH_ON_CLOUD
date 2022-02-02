DROP TABLE IF EXISTS ce_type_stores;

CREATE TABLE ce_type_stores (
    type_store_id      BIGINT NOT NULL,
    type_store_src_id  VARCHAR(50) NOT NULL,
    source_entity      VARCHAR(30) NOT NULL,
    source_system      VARCHAR(30) NOT NULL,
    type_store         VARCHAR(30) NOT NULL,
    update_dt          DATE NOT NULL,
    insert_dt          DATE NOT NULL
);

ALTER TABLE ce_type_stores ADD CONSTRAINT ce_stores_type_pk PRIMARY KEY ( type_store_id );
