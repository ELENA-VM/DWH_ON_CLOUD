CREATE OR ALTER PROCEDURE ld_sa_countries AS
BEGIN    
	TRUNCATE TABLE ext_country;

	BULK INSERT ext_country
	FROM 'storagecontainermev/country.csv'
	WITH (DATA_SOURCE = 'AzureBlobStorageDataSourceETL',
	      FIRSTROW = 2,
		  FORMAT = 'CSV');

     MERGE INTO sa_countries target              
     USING (SELECT COUNTRY_ID,
                   COUNTRY,
                   REGION_ID
            FROM ext_country) source       
         ON (target.COUNTRY_ID = source.COUNTRY_ID) 
         
     WHEN MATCHED 
	 AND ( IIF(target.COUNTRY = upper(source.COUNTRY), 0, 1) +
           IIF(target.REGION_ID = source.REGION_ID, 0, 1) ) > 0
	 THEN
         UPDATE SET target.COUNTRY = upper(source.COUNTRY),
                    target.REGION_ID = source.REGION_ID, 
                    target.UPDATE_DT  = GETDATE()
         
     WHEN NOT MATCHED 
	 AND source.COUNTRY IS NOT NULL 
	 THEN 
         INSERT (COUNTRY_ID, COUNTRY, REGION_ID, INSERT_DT, UPDATE_DT) 
         VALUES (source.COUNTRY_ID, upper(source.COUNTRY), source.REGION_ID, GETDATE(), GETDATE());
END;