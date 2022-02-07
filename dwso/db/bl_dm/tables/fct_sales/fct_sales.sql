CREATE PARTITION FUNCTION pf_DateFct (date)  
AS RANGE RIGHT FOR VALUES ('20200201', '20200301', '20200401', '20200501', '20200601', '20200701', '20200801',  '20200901', '20201001', '20201101', '20201201',
						   '20210201', '20210301', '20210401', '20210501', '20210601', '20210701', '20210801',  '20210901', '20211001', '20211101', '20211201',
						   '20220201', '20220301', '20220401', '20220501', '20220601', '20220701', '20220801',  '20220901', '20221001', '20221101', '20221201',
						   '20230201');
			   
CREATE PARTITION SCHEME ps_DateFct
AS PARTITION pf_DateFct ALL TO ([PRIMARY]);		

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