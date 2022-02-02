DROP TABLE IF EXISTS dim_employees;

CREATE TABLE dim_employees (
    employee_surr_id  BIGINT NOT NULL,
    employee_id       VARCHAR(50) NOT NULL,
    source_entity     VARCHAR(30) NOT NULL,
    source_system     VARCHAR(30) NOT NULL,
    first_name        VARCHAR(50) NOT NULL,
    last_name         VARCHAR(50) NOT NULL,
    post_id           BIGINT NOT NULL,
    post              VARCHAR(50) NOT NULL,
    store_id          BIGINT NOT NULL,
    store_name        VARCHAR(50) NOT NULL,
    store_type_id     BIGINT NOT NULL,
    store_type        VARCHAR(30) NOT NULL,
    update_dt         DATE NOT NULL,
    insert_dt         DATE NOT NULL
);

ALTER TABLE dim_employees ADD CONSTRAINT dim_employee_pk PRIMARY KEY ( employee_surr_id );