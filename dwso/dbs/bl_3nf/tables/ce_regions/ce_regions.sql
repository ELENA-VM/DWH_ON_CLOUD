DROP TABLE IF EXISTS ce_regions;

CREATE TABLE ce_regions (
    region_id      BIGINT NOT NULL,
    region_src_id  VARCHAR(50) NOT NULL,
    source_entity  VARCHAR(30) NOT NULL,
    source_system  VARCHAR(30) NOT NULL,
    region         VARCHAR(50) NOT NULL,
    update_dt      DATE NOT NULL,
    insert_dt      DATE NOT NULL
);

ALTER TABLE ce_regions ADD CONSTRAINT ce_region_pk PRIMARY KEY ( region_id );