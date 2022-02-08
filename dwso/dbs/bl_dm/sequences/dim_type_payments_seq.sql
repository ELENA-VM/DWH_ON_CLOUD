drop SEQUENCE dim_type_payments_seq;

CREATE SEQUENCE dim_type_payments_seq
  START WITH 1
  INCREMENT BY 1;

ALTER TABLE dim_type_payments
    ADD DEFAULT NEXT VALUE FOR dim_type_payments_seq
    FOR type_payment_surr_id;