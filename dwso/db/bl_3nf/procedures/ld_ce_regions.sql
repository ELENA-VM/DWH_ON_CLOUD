CREATE OR ALTER PROCEDURE ld_ce_regions AS 
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION;
		MERGE INTO ce_regions target              
		USING (SELECT sar.REGION_ID,
					  sar.REGION_NAME
			   FROM sa_regions sar
			   ) source       
			ON (target.REGION_SRC_ID = source.REGION_ID AND
				target.SOURCE_SYSTEM = 'RETAIL' AND
				target.SOURCE_ENTITY = 'SA_REGIONS') 
        
		WHEN MATCHED 
		AND (target.REGION <> source.REGION_NAME)
		THEN
			UPDATE SET target.REGION = source.REGION_NAME,
					   target.UPDATE_DT  = GETDATE()
        
		WHEN NOT MATCHED THEN 
			INSERT (REGION_ID, REGION_SRC_ID, REGION, SOURCE_SYSTEM, SOURCE_ENTITY, update_dt, insert_dt) 
			VALUES (default, source.REGION_ID, source.REGION_NAME, 'RETAIL', 'SA_REGIONS', GETDATE(), GETDATE()); 
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