DROP SEQUENCE ce_authors_seq;

CREATE SEQUENCE ce_authors_seq
  START WITH 1
  INCREMENT BY 1;

ALTER TABLE ce_authors
    ADD DEFAULT NEXT VALUE FOR ce_authors_seq
    FOR AUTHOR_ID;