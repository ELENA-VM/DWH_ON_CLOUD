CREATE OR ALTER PROCEDURE ld_sa_type_stores
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION;

		TRUNCATE TABLE ext_type_stores;

		BULK INSERT ext_type_stores
		FROM 'input/type_stores.csv'
		WITH (DATA_SOURCE = 'AzureBlobStorageDataSourceETL',
			  FIRSTROW = 2,
			  FORMAT = 'CSV');

		MERGE INTO sa_type_stores target              
		  USING (SELECT TYPE_STORE_ID,
							TYPE_STORE
					 FROM ext_type_stores) source       
			  ON (target.TYPE_STORE_ID = source.TYPE_STORE_ID) 
        
			  WHEN MATCHED 
			  AND IIF(target.TYPE_STORE = upper(source.TYPE_STORE), 0, 1) > 0 THEN
					UPDATE SET target.TYPE_STORE = upper(source.TYPE_STORE),
							   target.UPDATE_DT  = GETDATE()
        
			  WHEN NOT MATCHED BY TARGET THEN 
					INSERT (TYPE_STORE_ID, TYPE_STORE, INSERT_DT, UPDATE_DT) 
					VALUES (source.TYPE_STORE_ID, upper(source.TYPE_STORE), GETDATE(), GETDATE()); 
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
END

