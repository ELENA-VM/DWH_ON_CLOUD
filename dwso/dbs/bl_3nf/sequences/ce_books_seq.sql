DROP SEQUENCE ce_books_seq;

CREATE SEQUENCE ce_books_seq
  START WITH 1
  INCREMENT BY 1;
  
ALTER TABLE ce_books
    ADD DEFAULT NEXT VALUE FOR ce_books_seq
    FOR book_id;