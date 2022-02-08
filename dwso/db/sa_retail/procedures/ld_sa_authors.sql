CREATE OR ALTER PROCEDURE ld_sa_authors AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION;
		TRUNCATE TABLE ext_authors;

		BULK INSERT ext_authors
		FROM 'storagecontainermev/author.csv'
		WITH (DATA_SOURCE = 'AzureBlobStorageDataSourceETL',
			  FIRSTROW = 2,
			  FIELDTERMINATOR =',');

		MERGE INTO sa_authors target              
		USING (SELECT AUTHOR_ID,
					  AUTHOR_NAME
			   FROM ext_authors) source       
			ON (target.AUTHOR_ID = source.AUTHOR_ID) 
         
		WHEN MATCHED 
		AND IIF(target.AUTHOR_NAME = upper(source.AUTHOR_NAME), 0, 1) > 0
		THEN
			UPDATE SET target.AUTHOR_NAME = upper(source.AUTHOR_NAME),
					   target.UPDATE_DT  = GETDATE()

		WHEN NOT MATCHED THEN 
			INSERT (AUTHOR_ID, AUTHOR_NAME, INSERT_DT, UPDATE_DT) 
			VALUES (source.AUTHOR_ID, upper(source.AUTHOR_NAME), GETDATE(), GETDATE()); 
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