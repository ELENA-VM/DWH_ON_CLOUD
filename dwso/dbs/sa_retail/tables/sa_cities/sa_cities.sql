DROP TABLE IF EXISTS sa_cities;

CREATE TABLE sa_cities
(
  CITY_ID VARCHAR(4000),
  CITY VARCHAR(4000),
  COUNTRY_ID VARCHAR(4000),
  INSERT_DT DATE DEFAULT GETDATE(),
  UPDATE_DT DATE DEFAULT GETDATE()
);