DROP TABLE IF EXISTS ce_cities;

CREATE TABLE ce_cities (
    city_id          BIGINT NOT NULL,
    city_src_id      VARCHAR(30) NOT NULL, 
    source_entity    VARCHAR(30) NOT NULL,
    source_system    VARCHAR(30) NOT NULL,
    city             VARCHAR(50) NOT NULL,
    country_surr_id  BIGINT	NOT NULL,
    update_dt        DATE NOT NULL,
    insert_dt        DATE NOT NULL
);

ALTER TABLE ce_cities ADD CONSTRAINT ce_city_pk PRIMARY KEY ( city_id );

ALTER TABLE ce_cities
    ADD CONSTRAINT ce_city_country_fk FOREIGN KEY ( country_surr_id )
        REFERENCES ce_countries ( country_id );
