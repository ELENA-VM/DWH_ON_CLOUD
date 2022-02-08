CREATE OR ALTER PROCEDURE ld_ce_customers_from_retail AS 
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION;
		MERGE INTO ce_customers target              
		USING ( SELECT sacr.CUSTOMER_ID,
					   sacr.FIRST_NAME,
					   sacr.LAST_NAME,
					   sacr.GENDER,
					   CAST(DATE_OF_BIRTH AS DATE) DATE_OF_BIRTH,
					   COALESCE(ceadd.ADDRESS_ID, -1) ADDRESS_ID
				FROM sa_customers_retail sacr
				LEFT JOIN ce_addresses ceadd on sacr.ADDRESS_ID = ceadd.ADDRESS_ID ) source       
			ON (target.CUSTOMER_SRC_ID = source.CUSTOMER_ID AND
				target.SOURCE_SYSTEM = 'RETAIL' AND
				target.SOURCE_ENTITY = 'SA_CUSTOMERS_RETAIL') 
        
		WHEN MATCHED 
		AND (IIF(target.FIRST_NAME = source.FIRST_NAME, 0, 1) +
			 IIF(target.LAST_NAME = source.LAST_NAME, 0, 1) +
			 IIF(target.GENDER = source.GENDER, 0, 1) +
			 IIF(target.DATE_OF_BIRTH = source.DATE_OF_BIRTH, 0, 1) + 
			 IIF(target.address_surr_id = source.ADDRESS_ID, 0, 1)) > 0
		THEN
			UPDATE SET target.FIRST_NAME = source.FIRST_NAME,
					   target.LAST_NAME = source.LAST_NAME,                       
					   target.GENDER = source.GENDER,
					   target.DATE_OF_BIRTH = source.DATE_OF_BIRTH,
					   target.address_surr_id = source.ADDRESS_ID,
					   target.UPDATE_DT = GETDATE()
        
		WHEN NOT MATCHED THEN 
			INSERT (customer_id, customer_src_id, SOURCE_SYSTEM, SOURCE_ENTITY,  type_customer,
					first_name, last_name, gender, date_of_birth, name_of_organization, head_of_organization, iban, email, address_surr_id,
					update_dt, insert_dt) 
        
			VALUES (default, source.customer_id, 'RETAIL', 'SA_CUSTOMERS_RETAIL', 0,
					source.first_name, source.last_name,  source.gender, source.date_of_birth,
					'NA', 'NA', 'NA', 'NA', source.ADDRESS_ID, GETDATE(), GETDATE());
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
