CREATE PARTITION FUNCTION pf_Date (date)  
AS RANGE RIGHT FOR VALUES ('20200201', '20200301', '20200401', '20200501', '20200601', '20200701', '20200801',  '20200901', '20201001', '20201101', '20201201',
						   '20210201', '20210301', '20210401', '20210501', '20210601', '20210701', '20210801',  '20210901', '20211001', '20211101', '20211201',
						   '20220201', '20220301', '20220401', '20220501', '20220601', '20220701', '20220801',  '20220901', '20221001', '20221101', '20221201',
						   '20230201');
			   
CREATE PARTITION SCHEME ps_Date
AS PARTITION pf_Date ALL TO ([PRIMARY]);			   
			   
DROP TABLE IF EXISTS ce_sales;

CREATE TABLE ce_sales (
    sales_src_id          VARCHAR(50) NOT NULL,
    source_entity         VARCHAR(30) NOT NULL,
    source_system         VARCHAR(30) NOT NULL,
    book_surr_id          BIGINT  NOT NULL,
    date_sale             DATE NOT NULL,
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
) ON ps_Date(date_sale);

ALTER TABLE ce_sales
    ADD CONSTRAINT ce_sales_ce_book_fk FOREIGN KEY ( book_surr_id )
        REFERENCES ce_books ( book_id );

ALTER TABLE ce_sales
    ADD CONSTRAINT ce_sales_ce_customer_fk FOREIGN KEY ( customer_surr_id )
        REFERENCES ce_customers ( customer_id );

ALTER TABLE ce_sales
    ADD CONSTRAINT ce_sales_ce_employee_fk FOREIGN KEY ( employee_surr_id )
        REFERENCES ce_employees ( employee_id );

ALTER TABLE ce_sales
    ADD CONSTRAINT ce_sales_ce_store_fk FOREIGN KEY ( store_surr_id )
        REFERENCES ce_stores ( store_id );

ALTER TABLE ce_sales
    ADD CONSTRAINT ce_sales_ce_type_payment_fk FOREIGN KEY ( type_payment_surr_id )
        REFERENCES ce_type_payments ( type_payment_id );
