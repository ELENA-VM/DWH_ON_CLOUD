DROP TABLE IF EXISTS sa_regions;

CREATE TABLE sa_regions
(
  REGION_ID VARCHAR(4000),
  REGION_NAME VARCHAR(4000),
  INSERT_DT DATE DEFAULT GETDATE(),
  UPDATE_DT DATE DEFAULT GETDATE(),
);