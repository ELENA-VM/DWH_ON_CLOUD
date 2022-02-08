CREATE OR ALTER PROCEDURE ld_incr_sale_from_sa_layers AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION;
		INSERT INTO ce_sales (sales_src_id, SOURCE_SYSTEM, SOURCE_ENTITY, book_surr_id,
							  date_sale, customer_surr_id, employee_surr_id, store_surr_id, 
							  address_surr_id, type_payment_surr_id, quantity,                     
							  sale_amount, num_invoice, update_dt, insert_dt) 
    
		SELECT vs.sale_id, vs.SOURCE_SYSTEM, vs.SOURCE_ENTITY, vs.book_id, 
			   vs.invoice_date, vs.customer_id, vs.employee_id, vs.store_id,
			   vs.address_id, vs.type_payment_id, vs.quantity, vs.sale_amount,
			   vs.invoice, GETDATE(), GETDATE()
		FROM v_incr_sales vs;
    
		UPDATE prm_mta_incremental_load
		SET previous_loaded_date = GETDATE()
		WHERE sa_table_name = 'SA_TRANSACTION';    
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