DROP TABLE IF EXISTS sa_customers_stock;

CREATE TABLE sa_customers_stock
(
  CUSTOMER_ID VARCHAR(4000),
  NAME_OF_ORGANIZATION VARCHAR(4000),
  HEAD_OF_ORGANIZATION VARCHAR(4000),
  EMAIL VARCHAR(4000),
  IBAN VARCHAR(4000),
  ADDRESS_ID VARCHAR(4000),
  INSERT_DT DATE DEFAULT GETDATE(),
  UPDATE_DT DATE DEFAULT GETDATE()
);