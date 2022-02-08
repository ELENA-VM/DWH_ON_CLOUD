CREATE OR ALTER PROCEDURE ld_sa_address AS
BEGIN  
	BEGIN TRY
		BEGIN TRANSACTION;
		TRUNCATE TABLE ext_address;

		BULK INSERT ext_address
		FROM 'storagecontainermev/address.csv'
		WITH (DATA_SOURCE = 'AzureBlobStorageDataSourceETL',
			  FIRSTROW = 2,
			  FIELDTERMINATOR =',')

		MERGE INTO sa_address target              
		USING (SELECT ADDRESS_ID,
					  ADDRESS,
					  ADDRESS2,
					  DISTRICT,
					  CITY_ID,
					  POSTAL_CODE
			   FROM ext_address) source       
			ON (target.ADDRESS_ID = source.ADDRESS_ID) 
        
		WHEN MATCHED 
		AND (IIF(target.ADDRESS = upper(source.ADDRESS), 0, 1) + 
			 IIF(target.ADDRESS2 = upper(source.ADDRESS2), 0, 1) +
			 IIF(target.DISTRICT = upper(source.DISTRICT), 0, 1) + 
			 IIF(target.POSTAL_CODE = upper(source.POSTAL_CODE), 0, 1) +
			 IIF(target.CITY_ID = source.CITY_ID, 0, 1) ) > 0 
	 
		THEN
			UPDATE SET target.ADDRESS = upper(source.ADDRESS),
					   target.ADDRESS2 = upper(source.ADDRESS2), 
					   target.DISTRICT = upper(source.DISTRICT),
					   target.CITY_ID = source.CITY_ID,
					   target.POSTAL_CODE = source.POSTAL_CODE,
					   target.UPDATE_DT  = GETDATE()
         
		WHEN NOT MATCHED THEN 
			INSERT (ADDRESS_ID, ADDRESS, ADDRESS2, DISTRICT, CITY_ID, POSTAL_CODE, INSERT_DT, UPDATE_DT) 
			VALUES (source.ADDRESS_ID, upper(source.ADDRESS), upper(source.ADDRESS2), upper(source.DISTRICT), source.CITY_ID, source.POSTAL_CODE, GETDATE(), GETDATE());
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