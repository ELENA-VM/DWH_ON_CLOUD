CREATE OR ALTER PROCEDURE ld_sa_customers_stock AS
BEGIN
	TRUNCATE TABLE ext_stock_customers;

	BULK INSERT ext_stock_customers
	FROM 'storagecontainermev/customer_stock.csv'
	WITH (DATA_SOURCE = 'AzureBlobStorageDataSourceETL',
	      FIRSTROW = 2,
		  FORMAT = 'CSV');
		  
    MERGE INTO sa_customers_stock target              
    USING (SELECT CUSTOMER_ID,              
                  NAME_OF_ORGANIZATION,
                  HEAD_OF_ORGANIZATION,
                  EMAIL,
                  IBAN,
                  ADDRESS_ID              
           FROM ext_stock_customers) source       
        ON (target.CUSTOMER_ID = source.CUSTOMER_ID)   
        
    WHEN MATCHED 
	AND (IIF(target.NAME_OF_ORGANIZATION = upper(source.NAME_OF_ORGANIZATION), 0, 1) + 
         IIF(target.HEAD_OF_ORGANIZATION = upper(source.HEAD_OF_ORGANIZATION), 0, 1) + 
         IIF(target.EMAIL = upper(source.EMAIL), 0, 1) + 
         IIF(target.IBAN = source.IBAN, 0, 1) + 
         IIF(target.ADDRESS_ID = source.ADDRESS_ID, 0, 1) ) >0 
	THEN
        UPDATE SET target.NAME_OF_ORGANIZATION = upper(source.NAME_OF_ORGANIZATION),
                   target.HEAD_OF_ORGANIZATION = upper(source.HEAD_OF_ORGANIZATION),
                   target.EMAIL = upper(source.EMAIL),
                   target.IBAN = source.IBAN,               
                   target.ADDRESS_ID = source.ADDRESS_ID, 
                   target.UPDATE_DT  = GETDATE()
        
    WHEN NOT MATCHED
	AND source.NAME_OF_ORGANIZATION IS NOT NULL
	THEN 
        INSERT (CUSTOMER_ID, NAME_OF_ORGANIZATION, HEAD_OF_ORGANIZATION, EMAIL, IBAN, ADDRESS_ID, INSERT_DT, UPDATE_DT) 
        VALUES (source.CUSTOMER_ID, upper(source.NAME_OF_ORGANIZATION), upper(source.HEAD_OF_ORGANIZATION), upper(source.EMAIL), source.IBAN, source.ADDRESS_ID, GETDATE(), GETDATE());
END; 