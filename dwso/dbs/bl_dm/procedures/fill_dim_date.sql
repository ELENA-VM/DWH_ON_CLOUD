create or alter PROCEDURE fill_dim_date 
AS 
BEGIN
   DECLARE @start_date date = DATEFROMPARTS( '2019', '1', '1' ) , 
		   @end_date date = DATEFROMPARTS ( '2024', '1', '1' );

    DECLARE @tmp_date date = @start_date;

    WHILE (@tmp_date <= @end_date)
    BEGIN
        INSERT INTO DIM_DATES(DATE_ID, DAY_NAME, DAY_NUMBER_IN_WEEK, DAY_NUMBER_IN_MONTH, 
                              CALENDAR_WEEK_NUMBER, CALENDAR_MONTH_NUMBER, CALENDAR_QUARTER_NUMBER,
                              DAYS_IN_CAL_YEAR, YEAR_NUM)                             
        SELECT @tmp_date,
               DATENAME(weekday, @tmp_date),
               DATEPART(weekday, @tmp_date),
               day(@tmp_date),
               DATEPART(week, @tmp_date),
               month(@tmp_date),
               DATEPART(QUARTER, @tmp_date),
               DATEPART(dayofyear, @tmp_date),
               year(@tmp_date);                   

        SET @tmp_date = DATEADD(day, 1, @tmp_date);
    END;   
END;