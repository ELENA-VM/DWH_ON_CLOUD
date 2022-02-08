DROP SEQUENCE dim_addresses_seq;

CREATE SEQUENCE dim_addresses_seq
  START WITH 1
  INCREMENT BY 1;

ALTER TABLE dim_addresses
    ADD DEFAULT NEXT VALUE FOR dim_addresses_seq
    FOR address_surr_id;