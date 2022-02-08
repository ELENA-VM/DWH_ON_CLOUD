DROP SEQUENCE ce_addresses_seq;

CREATE SEQUENCE ce_addresses_seq
  START WITH 1
  INCREMENT BY 1;
  
ALTER TABLE ce_addresses
    ADD DEFAULT NEXT VALUE FOR ce_addresses_seq
    FOR ADDRESS_ID;