DROP TABLE IF EXISTS ce_categories;

CREATE TABLE ce_categories (
    category_id      BIGINT NOT NULL,
    category_src_id  VARCHAR(50) NOT NULL,
    source_entity    VARCHAR(30) NOT NULL,
    source_system    VARCHAR(30) NOT NULL,
    category_name    VARCHAR(30) NOT NULL,
    update_dt        DATE NOT NULL,
    insert_dt        DATE NOT NULL
);

ALTER TABLE ce_categories ADD CONSTRAINT ce_category_pk PRIMARY KEY ( category_id );