SET NOCOUNT ON
   DECLARE @tablename nvarchar(50),
		   @CMD NVARCHAR(100),
		   @count_row integer

   TRUNCATE TABLE wrk_test_results;

   DECLARE tables_cursor CURSOR FOR
      SELECT name 
	  FROM sysobjects 
	  WHERE type = 'U' 
	  AND (name like 'dim_%' or name like 'fct_%')
	  order by 1

   OPEN tables_cursor
   FETCH NEXT FROM tables_cursor INTO @tablename

   WHILE (@@fetch_status <> -1)
   BEGIN
     Set @CMD = N'select @count_row = count(*) from ' + @tablename + ' '
     EXEC sp_executesql @CMD, N'@count_row integer output', @count_row = @count_row output

    INSERT INTO wrk_test_results          
     VALUES ('BL_DM', @tablename, @count_row, GETDATE()) 
	 
     FETCH NEXT FROM tables_cursor INTO @tablename
   END
   DEALLOCATE tables_cursor
SET NOCOUNT OFF