DROP SEQUENCE ce_categories_seq;

CREATE SEQUENCE ce_categories_seq
  START WITH 1
  INCREMENT BY 1;
  
ALTER TABLE ce_categories
    ADD DEFAULT NEXT VALUE FOR ce_categories_seq
    FOR CATEGORY_ID;