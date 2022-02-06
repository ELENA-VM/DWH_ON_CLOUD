CREATE OR ALTER PROCEDURE ld_ce_customers_from_stock AS 
BEGIN
    MERGE INTO ce_customers target              
    USING ( SELECT trim('"' from sacs.CUSTOMER_ID) CUSTOMER_ID,
                   trim('"' from sacs.NAME_OF_ORGANIZATION) NAME_OF_ORGANIZATION,
                   trim('"' from sacs.HEAD_OF_ORGANIZATION) HEAD_OF_ORGANIZATION,
                   sacs.EMAIL,
                   sacs.IBAN,
                   COALESCE(ceadd.ADDRESS_ID, -1) ADDRESS_ID
            FROM sa_customers_stock sacs
            LEFT JOIN ce_addresses ceadd on sacs.ADDRESS_ID = ceadd.ADDRESS_ID  --IIF(ltrim(sacs.ADDRESS_ID,'1234567890') IS NULL, sacs.ADDRESS_ID, -1) = ceadd.ADDRESS_ID 
          ) source       
        ON (target.CUSTOMER_SRC_ID = source.CUSTOMER_ID	AND
			target.SOURCE_SYSTEM = 'STOCK' AND
			target.SOURCE_ENTITY = 'SA_CUSTOMERS_STOCK') 
        
    WHEN MATCHED 
	AND (IIF(target.NAME_OF_ORGANIZATION = source.NAME_OF_ORGANIZATION, 0, 1) +
	     IIF(target.HEAD_OF_ORGANIZATION = source.HEAD_OF_ORGANIZATION, 0, 1) +
	     IIF(target.EMAIL = source.EMAIL, 0, 1) +
	     IIF(target.IBAN = source.IBAN, 0, 1) + 
	     IIF(target.address_surr_id = source.ADDRESS_ID, 0, 1)) > 0	
	
	THEN
        UPDATE SET target.NAME_OF_ORGANIZATION = source.NAME_OF_ORGANIZATION,
                   target.HEAD_OF_ORGANIZATION = source.HEAD_OF_ORGANIZATION,                       
                   target.EMAIL = source.EMAIL,
                   target.IBAN = source.IBAN,
                   target.address_surr_id = source.ADDRESS_ID,
                   target.UPDATE_DT = GETDATE()
        
    WHEN NOT MATCHED THEN 
        INSERT (customer_id, customer_src_id, SOURCE_SYSTEM, SOURCE_ENTITY, type_customer, first_name, last_name, gender, date_of_birth, 
                name_of_organization, head_of_organization, iban, email, address_surr_id, update_dt, insert_dt) 
        
        VALUES (default, source.customer_id, 'STOCK', 'SA_CUSTOMERS_STOCK', 1, 'NA', 'NA', 'NA', CAST('1970-01-01' AS DATE),
                source.name_of_organization, source.head_of_organization, source.iban, source.email,
                 source.ADDRESS_ID, GETDATE(), GETDATE());

END;
