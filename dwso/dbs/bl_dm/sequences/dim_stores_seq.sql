DROP SEQUENCE dim_stores_seq;

CREATE SEQUENCE dim_stores_seq
  START WITH 1
  INCREMENT BY 1;

ALTER TABLE dim_stores
    ADD DEFAULT NEXT VALUE FOR dim_stores_seq
    FOR store_surr_id;