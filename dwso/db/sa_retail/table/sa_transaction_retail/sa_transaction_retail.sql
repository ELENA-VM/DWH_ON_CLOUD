DROP TABLE IF EXISTS sa_transaction_retail;

CREATE TABLE sa_transaction_retail
(
  SALE_ID VARCHAR(4000),
  INVOICE VARCHAR(4000),
  STORE_ID VARCHAR(4000),
  QUANTITY VARCHAR(4000),
  PRICE VARCHAR(4000),
  CUSTOMER_ID VARCHAR(4000),
  INVOICE_DATE VARCHAR(4000),
  SALE_AMOUNT VARCHAR(4000),
  ADDRESS_ID VARCHAR(4000),
  EMPLOYEE_ID VARCHAR(4000),
  TYPE_PAYMENT_ID VARCHAR(4000),
  BOOK_ID VARCHAR(4000),
  INSERT_DT DATE DEFAULT GETDATE(),
  UPDATE_DT DATE DEFAULT GETDATE()
);