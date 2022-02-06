DROP SEQUENCE ce_employees_seq;

CREATE SEQUENCE ce_employees_seq
  START WITH 1
  INCREMENT BY 1;
  
ALTER TABLE ce_employees
    ADD DEFAULT NEXT VALUE FOR ce_employees_seq
    FOR EMPLOYEE_ID;