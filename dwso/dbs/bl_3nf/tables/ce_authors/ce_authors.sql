DROP TABLE IF EXISTS ce_authors;

CREATE TABLE ce_authors (
    author_id      BIGINT NOT NULL,
    author_src_id  VARCHAR(50) NOT NULL,
    source_entity  VARCHAR(30) NOT NULL,
    source_system  VARCHAR(30) NOT NULL,
    author_name    VARCHAR(150) NOT NULL,
    update_dt      DATE NOT NULL,
    insert_dt      DATE NOT NULL
);

ALTER TABLE ce_authors ADD CONSTRAINT ce_author_pk PRIMARY KEY ( author_id );