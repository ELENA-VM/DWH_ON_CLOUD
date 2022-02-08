DROP TABLE IF EXISTS ce_posts;

CREATE TABLE ce_posts (
    post_id        BIGINT NOT NULL,
    post_src_id    VARCHAR(50) NOT NULL,
    source_entity  VARCHAR(30) NOT NULL,
    source_system  VARCHAR(30) NOT NULL,
    post_name      VARCHAR(50) NOT NULL,
    update_dt      DATE NOT NULL,
    insert_dt      DATE NOT NULL
);

ALTER TABLE ce_posts ADD CONSTRAINT ce_post_pk PRIMARY KEY ( post_id );