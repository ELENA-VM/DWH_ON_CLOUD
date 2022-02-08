DROP SEQUENCE ce_sub_categories_seq;

CREATE SEQUENCE ce_sub_categories_seq
  START WITH 1
  INCREMENT BY 1;
  
ALTER TABLE ce_sub_categories
    ADD DEFAULT NEXT VALUE FOR ce_sub_categories_seq
    FOR SUB_CATEGORY_ID;