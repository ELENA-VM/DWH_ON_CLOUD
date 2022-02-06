CREATE OR ALTER PROCEDURE ld_sa_regions AS
BEGIN   
	TRUNCATE TABLE ext_regions;

	BULK INSERT ext_regions
	FROM 'storagecontainermev/region.csv'
	WITH (DATA_SOURCE = 'AzureBlobStorageDataSourceETL',
	      FIRSTROW = 2,
		  FORMAT = 'CSV');

     MERGE INTO sa_regions target              
     USING (SELECT REGION_ID,
                   REGION_NAME
            FROM ext_regions) source       
         ON (target.REGION_ID = source.REGION_ID) 
         
     WHEN MATCHED 
	 AND IIF(target.REGION_NAME = upper(source.REGION_NAME), 0, 1) > 0 
	 THEN
         UPDATE SET target.REGION_NAME = upper(source.REGION_NAME),
                    target.UPDATE_DT  = GETDATE()
         
     WHEN NOT MATCHED THEN 
         INSERT (REGION_ID, REGION_NAME, INSERT_DT, UPDATE_DT) 
         VALUES (source.REGION_ID, upper(source.REGION_NAME), GETDATE(), GETDATE());
END; 