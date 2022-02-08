DROP SEQUENCE ce_post_seq;

CREATE SEQUENCE ce_post_seq
  START WITH 1
  INCREMENT BY 1;
  
ALTER TABLE ce_posts
    ADD DEFAULT NEXT VALUE FOR ce_post_seq
    FOR POST_ID;