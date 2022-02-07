CREATE OR ALTER PROCEDURE load_sale_bl_3nf_layer @p_date_period date
AS
BEGIN    
    TRUNCATE TABLE wrk_ex_dm_fct_sales;
    
    INSERT INTO wrk_ex_dm_fct_sales (sales_id, source_system, source_entity,                    
               book_surr_id, date_id, customer_surr_id, employee_surr_id, 
               store_surr_id, address_surr_id, type_payment_surr_id, 
               quantity, sale_amount, num_invoice, update_dt, insert_dt  ) 
    SELECT ces.sales_src_id,
           'BL_3NF',
           'CE_SALES',
           dm_book.book_surr_id,
           dm_dt.DATE_ID,
           dm_cust.customer_surr_id,
           dm_em.employee_surr_id,    
           dm_st.store_surr_id,    
           dm_ad.address_surr_id,    
           dm_tp.type_payment_surr_id,
           ces.quantity,
           ces.sale_amount,
           ces.num_invoice,
           GETDATE(),
           GETDATE()
    FROM ce_sales ces
           JOIN dim_books_scd dm_book ON ces.book_surr_id = dm_book.book_id
           JOIN dim_dates dm_dt ON ces.date_sale = dm_dt.DATE_ID
           JOIN dim_customers dm_cust ON ces.customer_surr_id = dm_cust.customer_id
           JOIN dim_employees dm_em ON ces.employee_surr_id = dm_em.employee_id
           JOIN dim_stores dm_st ON ces.store_surr_id = dm_st.store_id
           JOIN dim_addresses dm_ad ON ces.address_surr_id = dm_ad.address_id
           JOIN dim_type_payments dm_tp ON ces.type_payment_surr_id = dm_tp.type_payment_id
    WHERE ces.date_sale >= @p_date_period
      AND ces.date_sale < DATEADD(month, 1, @p_date_period);

	DECLARE @SqlStr varchar = ' ALTER TABLE wrk_ex_dm_fct_sales SWITCH PARTITION ' 
							+ CAST(year(@p_date_period) AS VARCHAR) + IIF(len(month(@p_date_period))= 1, '0', '') 
							+ CAST(month(@p_date_period) as varchar) + '01 TO fct_sales PARTITION '
							+ CAST(year(@p_date_period) AS VARCHAR) + IIF(len(month(@p_date_period))= 1, '0', '') 
							+ CAST(month(@p_date_period) as varchar) + '01 TO fct_sales PARTITION '+ '01 WITH (TRUNCATE_TARGET = ON);'
	
	EXEC @SqlStr;
END;
