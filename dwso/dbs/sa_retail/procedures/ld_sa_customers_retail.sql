CREATE OR ALTER PROCEDURE ld_sa_customers_retail AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION;
		TRUNCATE TABLE ext_customers;

		BULK INSERT ext_customers
		FROM 'input/customer.csv'
		WITH (DATA_SOURCE = 'AzureBlobStorageDataSourceETL',
			  FIRSTROW = 2,
			  FORMAT = 'CSV'); 

		MERGE INTO sa_customers_retail target              
		USING (SELECT CUSTOMER_ID,              
					  FIRST_NAME,
					  LAST_NAME,
					  GENDER,
					  DATE_OF_BIRTH,
					  ADDRESS_ID                      
			   FROM ext_customers) source       
			ON (target.CUSTOMER_ID = source.CUSTOMER_ID)   
         
		WHEN MATCHED 
		AND ( IIF(target.FIRST_NAME = upper(source.FIRST_NAME), 0, 1) +
			  IIF(target.LAST_NAME = upper(source.LAST_NAME), 0, 1) +
			  IIF(target.GENDER = upper(source.GENDER), 0, 1) +
			  IIF(target.DATE_OF_BIRTH = source.DATE_OF_BIRTH, 0, 1) +
			  IIF(target.ADDRESS_ID = source.ADDRESS_ID, 0, 1) ) > 0
		THEN
			UPDATE SET target.FIRST_NAME = upper(source.FIRST_NAME),
					   target.LAST_NAME = upper(source.LAST_NAME),
					   target.GENDER = upper(source.GENDER),
					   target.DATE_OF_BIRTH = source.DATE_OF_BIRTH,               
					   target.ADDRESS_ID = source.ADDRESS_ID, 
					   target.UPDATE_DT  = GETDATE()
         
		WHEN NOT MATCHED THEN 
			INSERT (CUSTOMER_ID, FIRST_NAME, LAST_NAME, GENDER, DATE_OF_BIRTH, ADDRESS_ID, INSERT_DT, UPDATE_DT) 
			VALUES (source.CUSTOMER_ID, upper(source.FIRST_NAME), upper(source.LAST_NAME), upper(source.GENDER), source.DATE_OF_BIRTH, source.ADDRESS_ID, GETDATE(), GETDATE());
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