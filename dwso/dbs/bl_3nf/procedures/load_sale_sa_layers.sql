CREATE OR ALTER PROCEDURE load_sale_sa_layers @p_date_period  date
AS
BEGIN
     
     TRUNCATE TABLE wrk_ex_ce_sales;
     
     INSERT INTO wrk_ex_ce_sales (sales_src_id, SOURCE_SYSTEM, SOURCE_ENTITY, book_surr_id, date_sale, customer_surr_id, employee_surr_id, store_surr_id, 
                                  address_surr_id, type_payment_surr_id, quantity, sale_amount, num_invoice, update_dt, insert_dt) 
     SELECT
            trim('"' from satr.sale_id) sale_id,
            'RETAIL',
            'SA_TRANSACTION_RETAIL',
            COALESCE(ceb.book_id, -1) book_id,
            CAST(substring(satr.invoice_date, 1, 10) AS DATE) invoice_date,
            COALESCE(cec.customer_id, -1) customer_id,
            COALESCE(cee.employee_id, -1) employee_id,
            COALESCE(ces.store_id, -1) store_id,
            COALESCE(ceadr.address_id, -1) address_id,
            COALESCE(ctp.type_payment_id, -1) type_payment_id,
            COALESCE(CAST(satr.quantity AS INTEGER), 0) quantity,
            CAST(satr.sale_amount AS NUMERIC(10, 2)) sale_amount,
            trim('"' from satr.invoice) invoice,
            GETDATE(),
            GETDATE()
            FROM sa_transaction_retail satr
            LEFT JOIN ce_stores ces ON trim('"' from satr.store_id) = ces.store_src_id
            LEFT JOIN ce_addresses ceadr ON satr.address_id = ceadr.address_src_id
            LEFT JOIN ce_employees cee ON trim('"' from satr.employee_id) = cee.employee_src_id
            LEFT JOIN ce_type_payments ctp ON satr.type_payment_id = ctp.type_payment_src_id
            LEFT JOIN ce_books ceb ON satr.book_id = ceb.book_src_id 
                  AND ceb.start_dt <= CAST(substring(satr.invoice_date, 1, 10) AS DATE)
                  AND ceb.end_dt   >= CAST(substring(satr.invoice_date, 1, 10) AS DATE)
            LEFT JOIN ce_customers cec ON satr.customer_id = cec.customer_src_id 
                  AND cec.SOURCE_SYSTEM = 'RETAIL'         
            WHERE CAST(substring(satr.invoice_date, 1, 10) AS DATE) >= @p_date_period
              AND CAST(substring(satr.invoice_date, 1, 10) AS DATE) < DATEADD(month, 1, @p_date_period)
    UNION ALL
    
    SELECT  trim('"' from sats.sale_id) sale_id,
            'STOCK',
            'SA_TRANSACTION_STOCK',
            COALESCE(ceb.book_id, -1) book_id,
            CAST(substring(sats.invoice_date, 1, 10) AS DATE) invoice_date,
            COALESCE(cec.customer_id, -1) customer_id,
            COALESCE(cee.employee_id, -1) employee_id,
            COALESCE(ces.store_id, -1) store_id,
            COALESCE(ceadr.address_id, -1) address_id,
            COALESCE(ctp.type_payment_id, -1) type_payment_id,
            COALESCE(CAST(sats.quantity AS INTEGER), 0) quantity,  
            CAST(sats.sale_amount AS NUMERIC(10, 2)) sale_amount,  
            trim('"' from sats.invoice) invoice,                
            GETDATE(),
            GETDATE()
    FROM sa_transaction_stock sats
    LEFT JOIN ce_stores ces ON trim('"' from sats.store_id) = ces.store_src_id
    LEFT JOIN ce_addresses ceadr ON sats.address_id = ceadr.address_src_id
    LEFT JOIN ce_employees cee ON trim('"' from sats.employee_id) = cee.employee_src_id
    LEFT JOIN ce_type_payments ctp ON sats.type_payment_id = ctp.type_payment_src_id
    LEFT JOIN ce_books ceb ON sats.book_id = ceb.book_src_id 
          AND ceb.start_dt <= CAST(substring(sats.invoice_date, 1, 10) AS DATE)
          AND ceb.end_dt   >= CAST(substring(sats.invoice_date, 1, 10) AS DATE)      
		  
    LEFT JOIN ce_customers cec ON sats.customer_id = cec.customer_src_id 
          AND cec.SOURCE_SYSTEM = 'STOCK'
    WHERE CAST(substring(sats.invoice_date, 1, 10) AS DATE) >= @p_date_period
      AND CAST(substring(sats.invoice_date, 1, 10) AS DATE) < DATEADD(month, 1, @p_date_period);        

END;