DROP SEQUENCE ce_countries_seq;

CREATE SEQUENCE ce_countries_seq
  START WITH 1
  INCREMENT BY 1;

ALTER TABLE ce_countries
    ADD DEFAULT NEXT VALUE FOR ce_countries_seq
    FOR COUNTRY_ID;
