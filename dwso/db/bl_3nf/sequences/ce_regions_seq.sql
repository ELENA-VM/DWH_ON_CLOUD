DROP SEQUENCE ce_regions_seq;

CREATE SEQUENCE ce_regions_seq
  START WITH 1
  INCREMENT BY 1;
  
ALTER TABLE ce_regions
    ADD DEFAULT NEXT VALUE FOR ce_regions_seq
    FOR REGION_ID;