CREATE OR ALTER PROCEDURE ld_sa_stores AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION;
		TRUNCATE TABLE ext_stores;

		BULK INSERT ext_stores
		FROM 'storagecontainermev/stores.csv'
		WITH (DATA_SOURCE = 'AzureBlobStorageDataSourceETL',
			  FIRSTROW = 2,
			  FORMAT = 'CSV');

		MERGE INTO sa_stores target              
		USING (SELECT STORE_ID,              
					  STORE_NAME,
					  STORE_TYPE_ID         
			   FROM ext_stores) source       
			ON (target.STORE_ID = source.STORE_ID)   
         
		WHEN MATCHED 
		AND ( IIF(target.STORE_NAME = upper(source.STORE_NAME), 0, 1) +
			  IIF(target.STORE_TYPE_ID = source.STORE_TYPE_ID, 0, 1) ) > 0 
		THEN
			UPDATE SET target.STORE_NAME = upper(source.STORE_NAME),
					   target.STORE_TYPE_ID = source.STORE_TYPE_ID, 
					   target.IS_CPROCESSED = 'N',
					   target.UPDATE_DT  = GETDATE()
         
		WHEN NOT MATCHED THEN 
			INSERT (STORE_ID, STORE_NAME, STORE_TYPE_ID, IS_CPROCESSED, INSERT_DT, UPDATE_DT) 
			VALUES (source.STORE_ID, upper(source.STORE_NAME), source.STORE_TYPE_ID, 'N', GETDATE(), GETDATE());
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