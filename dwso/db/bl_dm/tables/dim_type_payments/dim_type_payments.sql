DROP TABLE IF EXISTS dim_type_payments;

CREATE TABLE dim_type_payments (
    type_payment_surr_id  BIGINT NOT NULL,
    type_payment_id       BIGINT NOT NULL,
    source_system         VARCHAR(30) NOT NULL,
    source_entity         VARCHAR(30) NOT NULL,
    type_payment          VARCHAR(30) NOT NULL,
    update_dt             DATE  NOT NULL,
    insert_dt             DATE  NOT NULL
);

ALTER TABLE dim_type_payments ADD CONSTRAINT dim_type_payment_pk PRIMARY KEY ( type_payment_surr_id );