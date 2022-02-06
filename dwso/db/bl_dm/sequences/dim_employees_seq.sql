drop SEQUENCE dim_employees_seq;

CREATE SEQUENCE dim_employees_seq
  START WITH 1
  INCREMENT BY 1;

ALTER TABLE dim_employees
    ADD DEFAULT NEXT VALUE FOR dim_employees_seq
    FOR employee_surr_id;