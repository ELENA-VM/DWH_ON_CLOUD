DROP TABLE IF EXISTS ce_countries;

CREATE TABLE ce_countries (
    country_id      BIGINT NOT NULL,
    country_src_id  VARCHAR(50) NOT NULL,
    source_entity   VARCHAR(30) NOT NULL,
    source_system   VARCHAR(30) NOT NULL,
    country         VARCHAR(50) NOT NULL, 
    region_surr_id  BIGINT	NOT NULL,
    update_dt       DATE NOT NULL,
    insert_dt       DATE NOT NULL
);

ALTER TABLE ce_countries ADD CONSTRAINT ce_country_pk PRIMARY KEY ( country_id );

ALTER TABLE ce_countries
    ADD CONSTRAINT ce_country_ce_region_fk FOREIGN KEY ( region_surr_id )
        REFERENCES ce_regions ( region_id );
