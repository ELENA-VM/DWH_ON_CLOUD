CREATE OR ALTER PROCEDURE ld_ce_sales_by_part 
AS   
BEGIN
	DECLARE @p_start_date date = DATEADD(MONTH, -2, GETDATE()),
			@p_end_date date = DATEADD(MONTH, 10, GETDATE()),
			@tmp_date date = GETDATE();  
	 
    set @tmp_date = datefromparts(year(@p_start_date), month(@p_start_date), 1);

    WHILE (@tmp_date <= @p_end_date)
	BEGIN
        EXEC load_sale_bl_3nf_layer @tmp_date;  

        set @tmp_date = DATEADD(MONTH, 1, @tmp_date);
    END;        
END;