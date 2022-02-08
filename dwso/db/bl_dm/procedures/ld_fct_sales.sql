CREATE OR ALTER PROCEDURE ld_fct_sales AS 
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION;
		MERGE INTO fct_sales target              
		USING (
				SELECT ces.sales_src_id,
					   dm_book.book_surr_id,
					   dm_dt.DATE_ID,
					   dm_cust.customer_surr_id,
					   dm_em.employee_surr_id,    
					   dm_st.store_surr_id,    
					   dm_ad.address_surr_id,    
					   dm_tp.type_payment_surr_id,
					   ces.quantity,
					   ces.sale_amount,
					   ces.num_invoice
				FROM ce_sales ces
				JOIN dim_books_scd dm_book ON ces.book_surr_id = dm_book.book_id
				JOIN dim_dates dm_dt ON ces.date_sale = dm_dt.DATE_ID
				JOIN dim_customers dm_cust ON ces.customer_surr_id = dm_cust.customer_id
				JOIN dim_employees dm_em ON ces.employee_surr_id = dm_em.employee_id
				JOIN dim_stores dm_st ON ces.store_surr_id = dm_st.store_id
				JOIN dim_addresses dm_ad ON ces.address_surr_id = dm_ad.address_id
				JOIN dim_type_payments dm_tp ON ces.type_payment_surr_id = dm_tp.type_payment_id
			) source       
			ON (target.sales_id = source.sales_src_id AND
				target.source_system = 'BL_3NF' AND
				target.source_entity = 'CE_SALES') 
        
		WHEN MATCHED 
		AND (IIF(target.book_surr_id = source.book_surr_id, 0, 1) +
			 IIF(target.date_id = source.date_id, 0, 1) + 
			 IIF(target.customer_surr_id = source.customer_surr_id, 0, 1) +   
			 IIF(target.employee_surr_id = source.employee_surr_id, 0, 1) +
			 IIF(target.store_surr_id = source.store_surr_id, 0, 1) +
			 IIF(target.address_surr_id = source.address_surr_id, 0, 1) + 
			 IIF(target.type_payment_surr_id = source.type_payment_surr_id, 0, 1) +
			 IIF(target.quantity = source.quantity, 0, 1) + 
			 IIF(target.sale_amount = source.sale_amount, 0, 1) +
			 IIF(target.num_invoice = source.num_invoice, 0, 1) ) > 1
	
		THEN
			UPDATE SET target.book_surr_id = source.book_surr_id, 
					   target.date_id = source.date_id, 
					   target.customer_surr_id = source.customer_surr_id, 
					   target.employee_surr_id = source.employee_surr_id,                        
					   target.store_surr_id = source.store_surr_id, 
					   target.address_surr_id = source.address_surr_id, 
					   target.type_payment_surr_id = source.type_payment_surr_id, 
					   target.quantity = source.quantity,                          
					   target.sale_amount = source.sale_amount, 
					   target.num_invoice = source.num_invoice,
					   target.UPDATE_DT  = GETDATE()

		WHEN NOT MATCHED THEN 
			INSERT (sales_id, source_system, source_entity, book_surr_id, date_id, customer_surr_id, employee_surr_id, 
					store_surr_id, address_surr_id, type_payment_surr_id, quantity, sale_amount, num_invoice, update_dt, insert_dt)

			VALUES (source.sales_src_id, 'BL_3NF', 'CE_SALES',
					source.book_surr_id , source.date_id, source.customer_surr_id, source.employee_surr_id,
					source.store_surr_id, source.address_surr_id, source.type_payment_surr_id,
					source.quantity, source.sale_amount, source.num_invoice, GETDATE(), GETDATE()); 
COMMIT TRANSACTION;
	END TRY
	BEGIN CATCH
        SELECT  
            ERROR_NUMBER() AS ErrorNumber  
            ,ERROR_PROCEDURE() AS ErrorProcedure  
            ,ERROR_LINE() AS ErrorLine  
            ,ERROR_MESSAGE() AS ErrorMessage;  
		ROLLBACK TRANSACTION;
    END CATCH
END;