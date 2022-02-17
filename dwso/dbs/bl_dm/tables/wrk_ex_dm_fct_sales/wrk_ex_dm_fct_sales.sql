DROP TABLE IF EXISTS wrk_ex_dm_fct_sales;

CREATE TABLE wrk_ex_dm_fct_sales (
    sales_id              VARCHAR(50) NOT NULL,
    source_entity         VARCHAR(30) NOT NULL,
    source_system         VARCHAR(30) NOT NULL,
    book_surr_id          BIGINT NOT NULL,
    date_id               DATE NOT NULL,
    customer_surr_id      BIGINT NOT NULL,
    employee_surr_id      BIGINT NOT NULL,
    store_surr_id         BIGINT NOT NULL,
    address_surr_id       BIGINT NOT NULL,
    type_payment_surr_id  BIGINT NOT NULL,
    quantity              BIGINT NOT NULL,
    sale_amount           NUMERIC(10, 2) NOT NULL,
    num_invoice           VARCHAR(20) NOT NULL,
    update_dt             DATE NOT NULL,
    insert_dt             DATE NOT NULL
) ON ps_DateFct(date_id);

