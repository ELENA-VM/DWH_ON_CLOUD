DROP TABLE IF EXISTS ce_type_payments;

CREATE TABLE ce_type_payments (
    type_payment_id      BIGINT NOT NULL,
    type_payment_src_id  VARCHAR(50) NOT NULL,
    source_system        VARCHAR(30) NOT NULL,
    source_entity        VARCHAR(30) NOT NULL,
    type_payment         VARCHAR(30) NOT NULL,
    update_dt            DATE NOT NULL,
    insert_dt            DATE NOT NULL
);

ALTER TABLE ce_type_payments ADD CONSTRAINT ce_type_payment_pk PRIMARY KEY ( type_payment_id );