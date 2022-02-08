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
	
	declare @NumPart integer = 0;

	SELECT @NumPart = p.partition_number
	FROM sys.tables AS t  
	JOIN sys.indexes AS i ON t.object_id = i.object_id  
	JOIN sys.partitions AS p  ON i.object_id = p.object_id AND i.index_id = p.index_id   
	JOIN  sys.partition_schemes AS s ON i.data_space_id = s.data_space_id  
	JOIN sys.partition_functions AS f ON s.function_id = f.function_id  
	LEFT JOIN sys.partition_range_values AS r ON f.function_id = r.function_id and r.boundary_id = p.partition_number  
	WHERE i.type <= 1 AND t.name = 'wrk_ex_dm_fct_sales' 
	AND convert(varchar, r.value, 112) = convert(varchar, @p_date_period, 112);

	DECLARE @SqlStr varchar(200) = ' ALTER TABLE wrk_ex_dm_fct_sales SWITCH PARTITION ' + CAST(@NumPart as varchar) + ' TO fct_sales PARTITION '+ CAST(@NumPart as varchar) + ';'
	ALTER TABLE wrk_ex_dm_fct_sales SWITCH PARTITION @NumPart TO fct_sales PARTITION @NumPart;					
	--EXEC @SqlStr;
END;

