CREATE OR ALTER PROCEDURE ld_ce_countries AS 
BEGIN  
	BEGIN TRY
		BEGIN TRANSACTION;
		MERGE INTO ce_countries target              
		USING (SELECT trim('"' from sac.COUNTRY_ID) COUNTRY_ID,
					  trim('"' from sac.COUNTRY) COUNTRY,
					  COALESCE(bcr.REGION_ID, -1) REGION_ID
			   FROM sa_countries sac 
			   LEFT JOIN ce_regions bcr ON sac.REGION_ID = bcr.REGION_SRC_ID
			   AND bcr.SOURCE_SYSTEM = 'RETAIL'
			   AND bcr.SOURCE_ENTITY = 'SA_REGIONS'
			 ) source       
			ON (target.COUNTRY_SRC_ID = source.COUNTRY_ID AND
				target.SOURCE_SYSTEM = 'RETAIL' AND
				target.SOURCE_ENTITY = 'SA_COUNTRIES') 
        
		WHEN MATCHED 
		AND (IIF(target.COUNTRY = source.COUNTRY, 0, 1) +
			 IIF(target.REGION_SURR_ID = source.REGION_ID, 0, 1)) > 0
		THEN
			UPDATE SET target.COUNTRY = source.COUNTRY,
					   target.REGION_SURR_ID = source.REGION_ID,
					   target.UPDATE_DT = GETDATE()

		WHEN NOT MATCHED THEN 
			INSERT (COUNTRY_ID, COUNTRY_SRC_ID, COUNTRY, region_surr_id, SOURCE_SYSTEM, SOURCE_ENTITY, update_dt, insert_dt) 
			VALUES (default, trim('"' from source.COUNTRY_ID), trim('"' from source.COUNTRY), source.REGION_ID, 'RETAIL', 'SA_COUNTRIES', GETDATE(), GETDATE()); 
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