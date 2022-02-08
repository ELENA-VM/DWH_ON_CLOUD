DROP TABLE IF EXISTS dim_books_scd;

CREATE TABLE dim_books_scd (
    book_surr_id         BIGINT NOT NULL,
    book_id              BIGINT NOT NULL,
    source_system        VARCHAR(30) NOT NULL,
    source_entity        VARCHAR(30) NOT NULL,
    isbn                 VARCHAR(20) NOT NULL,
    publisher            VARCHAR(100) NOT NULL,
    book_title           VARCHAR(300) NOT NULL,
    year_of_publication  INTEGER  NOT NULL,
    author_id            BIGINT NOT NULL,
    author               VARCHAR(150) NOT NULL,
    category_id          BIGINT NOT NULL,
    category_name        VARCHAR(30) NOT NULL,
    sub_category_id      BIGINT NOT NULL,
    sub_category         VARCHAR(100) NOT NULL,
    start_dt             DATE NOT NULL,
    end_dt               DATE NOT NULL,
    is_active            VARCHAR(4) NOT NULL,
    update_dt            DATE NOT NULL,
    insert_dt            DATE NOT NULL
);

ALTER TABLE dim_books_scd ADD CONSTRAINT dim_book_scd_pk PRIMARY KEY ( book_surr_id, start_dt );