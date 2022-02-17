DROP PARTITION FUNCTION pf_DateFctSale;

CREATE PARTITION FUNCTION pf_DateFctSale (date)  
AS RANGE LEFT FOR VALUES ('2020-01-31', '2020-02-29', '2020-03-31', '2020-04-30', '2020-05-31', '2020-06-30', '2020-07-31', '2020-08-31', '2020-09-30', '2020-10-31', '2020-11-30', '2020-12-31',
						  '2021-01-31', '2021-02-28', '2021-03-31', '2021-04-30', '2021-05-31', '2021-06-30', '2021-07-31', '2021-08-31', '2021-09-30', '2021-10-31', '2021-11-30', '2021-12-31',
						  '2022-01-31', '2022-02-28', '2022-03-31', '2022-04-30', '2022-05-31', '2022-06-30', '2022-07-31', '2022-08-31', '2022-09-30', '2022-10-31', '2022-11-30', '2022-12-31',
						  '2023-01-31');

DROP PARTITION SCHEME ps_DateFct;

CREATE PARTITION SCHEME ps_DateFct
AS PARTITION pf_DateFctSale ALL TO ([PRIMARY]);		



DROP TABLE IF EXISTS fct_sales;

CREATE TABLE fct_sales (
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

ALTER TABLE fct_sales
    ADD CONSTRAINT fct_sales_dim_address_fk FOREIGN KEY ( address_surr_id )
        REFERENCES dim_addresses ( address_surr_id );

ALTER TABLE fct_sales
    ADD CONSTRAINT fct_sales_dim_book_fk FOREIGN KEY ( book_surr_id )
        REFERENCES dim_books_scd ( book_surr_id );
		
ALTER TABLE fct_sales
    ADD CONSTRAINT fct_sales_dim_customer_fk FOREIGN KEY ( customer_surr_id )
        REFERENCES dim_customers ( customer_surr_id );

ALTER TABLE fct_sales
    ADD CONSTRAINT fct_sales_dim_employee_scd_fk FOREIGN KEY ( employee_surr_id )
        REFERENCES dim_employees ( employee_surr_id );
		
ALTER TABLE fct_sales
    ADD CONSTRAINT fct_sales_dim_store_fk FOREIGN KEY ( store_surr_id )
        REFERENCES dim_stores ( store_surr_id );

ALTER TABLE fct_sales
    ADD CONSTRAINT fct_sales_dim_time_fk FOREIGN KEY ( date_id )
        REFERENCES dim_dates ( date_id );
		
ALTER TABLE fct_sales
    ADD CONSTRAINT fct_sales_dim_type_payment_fk FOREIGN KEY ( type_payment_surr_id )
        REFERENCES dim_type_payments ( type_payment_surr_id );