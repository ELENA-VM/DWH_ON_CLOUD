CREATE OR ALTER VIEW v_incr_sales
AS
( 
    SELECT
            trim('"' from satr.sale_id) sale_id,
            'RETAIL' SOURCE_SYSTEM,
            'SA_TRANSACTION_RETAIL' SOURCE_ENTITY,
            COALESCE(ceb.book_id, -1) book_id,
            COALESCE(TRY_CONVERT(DATE, substring(satr.invoice_date, 1, 10)), GETDATE()) invoice_date,
            COALESCE(cec.customer_id, -1) customer_id,
            COALESCE(cee.employee_id, -1) employee_id,
            COALESCE(ces.store_id, -1) store_id,
            COALESCE(ceadr.address_id, -1) address_id,
            COALESCE(ctp.type_payment_id, -1) type_payment_id,
            COALESCE(CAST(satr.quantity AS INTEGER), 0) quantity,
            CAST(satr.sale_amount AS NUMERIC(10, 2)) sale_amount,
            trim('"' from satr.invoice) invoice
    FROM sa_transaction_retail satr
    LEFT JOIN ce_stores ces ON trim('"' from satr.store_id) = ces.store_src_id
    LEFT JOIN ce_addresses ceadr ON satr.address_id = ceadr.address_src_id
    LEFT JOIN ce_employees cee ON trim('"' from satr.employee_id) = cee.employee_src_id
    LEFT JOIN ce_type_payments ctp ON satr.type_payment_id = ctp.type_payment_src_id
    LEFT JOIN ce_books ceb ON satr.book_id = ceb.book_src_id 
          AND ceb.start_dt <= COALESCE(TRY_CONVERT(DATE, substring(satr.invoice_date, 1, 10)), GETDATE())
          AND ceb.end_dt   >= COALESCE(TRY_CONVERT(DATE, substring(satr.invoice_date, 1, 10)), GETDATE())
    LEFT JOIN ce_customers cec ON satr.customer_id = cec.customer_src_id 
          AND cec.SOURCE_SYSTEM = 'RETAIL'         
    WHERE satr.insert_dt > 
        ( SELECT previous_loaded_date
          FROM prm_mta_incremental_load 
          WHERE sa_table_name = 'SA_TRANSACTION' )
       OR satr.update_dt > 
        ( SELECT previous_loaded_date 
          FROM prm_mta_incremental_load 
          WHERE sa_table_name = 'SA_TRANSACTION' )

    UNION ALL
    
    SELECT  trim('"' from sats.sale_id) sale_id,
            'STOCK' SOURCE_SYSTEM,
            'SA_TRANSACTION_STOCK' SOURCE_ENTITY,
            COALESCE(ceb.book_id, -1) book_id,
            COALESCE(TRY_CONVERT(DATE, substring(sats.invoice_date, 1, 10)), GETDATE()) invoice_date,
            COALESCE(cec.customer_id, -1) customer_id,
            COALESCE(cee.employee_id, -1) employee_id,
            COALESCE(ces.store_id, -1) store_id,
            COALESCE(ceadr.address_id, -1) address_id,
            COALESCE(ctp.type_payment_id, -1) type_payment_id,
            COALESCE(CAST(sats.quantity AS INTEGER), 0) quantity,  
            CAST(sats.sale_amount AS NUMERIC(10, 2)) sale_amount,  
            trim('"' from sats.invoice) invoice
    FROM sa_transaction_stock sats
    LEFT JOIN ce_stores ces ON trim('"' from sats.store_id) = ces.store_src_id
    LEFT JOIN ce_addresses ceadr ON sats.address_id = ceadr.address_src_id
    LEFT JOIN ce_employees cee ON trim('"' from sats.employee_id) = cee.employee_src_id
    LEFT JOIN ce_type_payments ctp ON sats.type_payment_id = ctp.type_payment_src_id
    LEFT JOIN ce_books ceb ON sats.book_id = ceb.book_src_id 
          AND ceb.start_dt <= COALESCE(TRY_CONVERT(DATE, substring(sats.invoice_date, 1, 10)), GETDATE())
          AND ceb.end_dt   >= COALESCE(TRY_CONVERT(DATE, substring(sats.invoice_date, 1, 10)), GETDATE()) 
    LEFT JOIN ce_customers cec ON sats.customer_id = cec.customer_src_id 
          AND cec.SOURCE_SYSTEM = 'STOCK'
          
    WHERE sats.insert_dt > 
        ( SELECT previous_loaded_date
          FROM prm_mta_incremental_load 
          WHERE sa_table_name = 'SA_TRANSACTION' )
       OR sats.update_dt > 
        ( SELECT previous_loaded_date 
          FROM prm_mta_incremental_load 
          WHERE sa_table_name = 'SA_TRANSACTION' )
);         
               
                