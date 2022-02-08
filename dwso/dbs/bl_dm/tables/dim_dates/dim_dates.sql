DROP TABLE IF EXISTS dim_dates;
CREATE TABLE dim_dates (
    date_id                  DATE NOT NULL,
    day_name                 VARCHAR(20) NOT NULL,
    day_number_in_week       INTEGER NOT NULL,
    day_number_in_month      INTEGER NOT NULL,
    calendar_week_number     INTEGER NOT NULL,
    calendar_month_number    INTEGER NOT NULL,
    calendar_quarter_number  INTEGER NOT NULL,
    days_in_cal_year         INTEGER NOT NULL,
    year_num                 INTEGER NOT NULL
);

ALTER TABLE dim_dates ADD CONSTRAINT dim_time_pk PRIMARY KEY ( date_id );