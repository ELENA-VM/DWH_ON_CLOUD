DROP SEQUENCE dim_books_scd_seq;

CREATE SEQUENCE dim_books_scd_seq
  START WITH 1
  INCREMENT BY 1;

ALTER TABLE dim_books_scd
    ADD DEFAULT NEXT VALUE FOR dim_books_scd_seq
    FOR book_surr_id;