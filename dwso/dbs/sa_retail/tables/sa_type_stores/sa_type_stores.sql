DROP TABLE IF EXISTS sa_type_stores;

CREATE TABLE sa_type_stores
(
  TYPE_STORE_ID VARCHAR(4000),
  TYPE_STORE VARCHAR(4000),
  INSERT_DT DATE DEFAULT GETDATE(),
  UPDATE_DT DATE DEFAULT GETDATE()
);
