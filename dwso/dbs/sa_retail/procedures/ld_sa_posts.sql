CREATE OR ALTER PROCEDURE ld_sa_posts AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION;
		TRUNCATE TABLE ext_posts;

		BULK INSERT ext_posts
		FROM 'storagecontainermev/post.csv'
		WITH (DATA_SOURCE = 'AzureBlobStorageDataSourceETL',
			  FIRSTROW = 2,
			  FORMAT = 'CSV');

		 MERGE INTO sa_posts target              
		 USING (SELECT POST_ID,
					   POST_NAME
				FROM ext_posts) source       
			 ON (target.POST_ID = source.POST_ID) 
         
		 WHEN MATCHED 
		 AND IIF(target.POST_NAME = upper(source.POST_NAME), 0, 1) > 0
		 THEN
			 UPDATE SET target.POST_NAME = upper(source.POST_NAME),
						target.UPDATE_DT  = GETDATE()
         
		 WHEN NOT MATCHED 
		 AND source.POST_ID IS NOT NULL
		 THEN 
			 INSERT (POST_ID, POST_NAME, INSERT_DT, UPDATE_DT) 
			 VALUES (source.POST_ID, upper(source.POST_NAME), GETDATE(), GETDATE()); 
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
   