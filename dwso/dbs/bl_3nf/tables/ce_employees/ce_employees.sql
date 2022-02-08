DROP TABLE IF EXISTS ce_employees;

CREATE TABLE ce_employees (
    employee_id      BIGINT NOT NULL,
    employee_src_id  VARCHAR(50) NOT NULL,
    source_entity    VARCHAR(30) NOT NULL,
    source_system    VARCHAR(30) NOT NULL,
    store_surr_id    BIGINT NOT NULL,
    first_name       VARCHAR(50) NOT NULL,
    last_name        VARCHAR(50)NOT NULL,
    post_surr_id     BIGINT NOT NULL,
    update_dt        DATE NOT NULL,
    insert_dt        DATE NOT NULL
);

ALTER TABLE ce_employees ADD CONSTRAINT ce_employee_pk PRIMARY KEY ( employee_id );

ALTER TABLE ce_employees
    ADD CONSTRAINT ce_employee_ce_post_fk FOREIGN KEY ( post_surr_id )
        REFERENCES ce_posts ( post_id );

ALTER TABLE ce_employees
    ADD CONSTRAINT ce_employees_ce_stores_fk FOREIGN KEY ( store_surr_id )
        REFERENCES ce_stores ( store_id );

