DROP SEQUENCE ce_customers_seq;

CREATE SEQUENCE ce_customers_seq
  START WITH 1
  INCREMENT BY 1;

ALTER TABLE ce_customers
    ADD DEFAULT NEXT VALUE FOR ce_customers_seq
    FOR customer_id;