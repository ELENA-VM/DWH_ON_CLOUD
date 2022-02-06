CREATE OR ALTER PROCEDURE ld_sa_cities AS
BEGIN   
	TRUNCATE TABLE ext_cities;

	BULK INSERT ext_cities
	FROM 'storagecontainermev/city.csv'
	WITH (DATA_SOURCE = 'AzureBlobStorageDataSourceETL',
	      FIRSTROW = 2,
		  FORMAT = 'CSV');

     MERGE INTO sa_cities target              
     USING (SELECT CITY_ID,
                   CITY,
                   COUNTRY_ID
            FROM ext_cities) source       
         ON (target.CITY_ID = source.CITY_ID) 
         
     WHEN MATCHED 
	 AND ( IIF(target.CITY = upper(source.CITY), 0, 1) +
           IIF(target.COUNTRY_ID = source.COUNTRY_ID, 0, 1) ) > 0 
	 THEN
         UPDATE SET target.CITY = upper(source.CITY),
                    target.COUNTRY_ID = source.COUNTRY_ID, 
                    target.UPDATE_DT  = GETDATE()
 
         
     WHEN NOT MATCHED THEN 
         INSERT (CITY_ID, CITY, COUNTRY_ID, INSERT_DT, UPDATE_DT) 
         VALUES (source.CITY_ID, upper(source.CITY), source.COUNTRY_ID, GETDATE(), GETDATE());
END;