CREATE OR ALTER PROCEDURE ld_ce_sales_from_stock AS 
BEGIN
    MERGE INTO ce_sales target              
    USING ( SELECT  trim('"' from sats.sale_id) sale_id,
                    trim('"' from sats.invoice) invoice,
                    COALESCE(ces.store_id, -1) store_id,
                    COALESCE(CAST(sats.quantity AS INTEGER), 0) quantity,
                    COALESCE(cec.customer_id, -1) customer_id,
                    CAST(substring(sats.invoice_date, 1, 10) AS DATE) invoice_date,
                    CAST(sats.sale_amount AS NUMERIC(10, 2)) sale_amount,
                    COALESCE(ceadr.address_id, -1) address_id,
                    COALESCE(cee.employee_id, -1) employee_id,
                    COALESCE(ctp.type_payment_id, -1) type_payment_id,
                    COALESCE(ceb.book_id, -1) book_id
                FROM sa_transaction_stock sats
                LEFT JOIN ce_stores ces ON trim('"' from sats.store_id) = ces.store_src_id
                LEFT JOIN ce_addresses ceadr ON sats.address_id = ceadr.address_src_id
                LEFT JOIN ce_employees cee ON trim('"' from sats.employee_id) = cee.employee_src_id
                LEFT JOIN ce_type_payments ctp ON sats.type_payment_id = ctp.type_payment_src_id
                LEFT JOIN ce_books ceb ON sats.book_id = ceb.book_src_id 
                      AND ceb.start_dt <= CAST(substring(sats.invoice_date, 1, 10) AS DATE )
                      AND ceb.end_dt   >= CAST(substring(sats.invoice_date, 1, 10) AS DATE)         
                LEFT JOIN ce_customers cec ON sats.customer_id = cec.customer_src_id 
                     AND cec.SOURCE_SYSTEM = 'STOCK' ) source       
        ON (target.sales_src_id = source.sale_id AND
			target.SOURCE_SYSTEM = 'STOCK' AND
			target.SOURCE_ENTITY = 'SA_TRANSACTION_STOCK')        
        
    WHEN MATCHED
	AND (IIF(target.num_invoice = source.invoice, 0, 1) +
         IIF(target.store_surr_id = source.store_id, 0, 1) +
         IIF(target.quantity = source.quantity, 0, 1) +
         IIF(target.customer_surr_id = source.customer_id, 0, 1) + 
         IIF(target.date_sale = source.invoice_date, 0, 1) +
         IIF(target.sale_amount = source.sale_amount, 0, 1) +
         IIF(target.address_surr_id = source.address_id, 0, 1) +
         IIF(target.employee_surr_id = source.employee_id, 0, 1) +
         IIF(target.type_payment_surr_id = source.type_payment_id, 0, 1) +
         IIF(target.book_surr_id = source.book_id, 0, 1)) > 0
	THEN
        UPDATE SET target.num_invoice = source.invoice,
                   target.store_surr_id = source.store_id,                       
                   target.quantity = source.quantity,
                   target.customer_surr_id = source.customer_id,
                   target.date_sale = source.invoice_date,
                   target.sale_amount = source.sale_amount,
                   target.address_surr_id = source.address_id,
                   target.employee_surr_id = source.employee_id,
                   target.type_payment_surr_id = source.type_payment_id,
                   target.book_surr_id = source.book_id,
                   target.UPDATE_DT = GETDATE()
        
    WHEN NOT MATCHED THEN 
        INSERT (sales_src_id, SOURCE_SYSTEM, SOURCE_ENTITY,  book_surr_id, date_sale, employee_surr_id, store_surr_id, customer_surr_id,
                address_surr_id, type_payment_surr_id, quantity, num_invoice, update_dt, insert_dt, sale_amount )
                
        VALUES (source.sale_id, 'STOCK', 'SA_TRANSACTION_STOCK', source.book_id, source.invoice_date, source.employee_id, source.store_id, source.customer_id,
                source.address_id, source.type_payment_id, source.quantity, source.invoice, GETDATE() , GETDATE(), source.sale_amount);
END;