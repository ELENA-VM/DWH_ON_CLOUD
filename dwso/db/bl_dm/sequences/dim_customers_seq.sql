drop SEQUENCE dim_customers_seq;

CREATE SEQUENCE dim_customers_seq
  START WITH 1
  INCREMENT BY 1;
  
ALTER TABLE dim_customers
    ADD DEFAULT NEXT VALUE FOR dim_customers_seq
    FOR customer_surr_id;
