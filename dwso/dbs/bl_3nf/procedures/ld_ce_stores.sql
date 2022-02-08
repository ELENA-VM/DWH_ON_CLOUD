CREATE OR ALTER PROCEDURE ld_ce_stores AS 
BEGIN      
	BEGIN TRY
		BEGIN TRANSACTION;
		MERGE INTO ce_stores target              
		USING (SELECT sast.STORE_ID,
					  sast.STORE_NAME,
					  COALESCE(cets.type_store_id, -1) type_store_id
			   FROM sa_stores sast 
			   LEFT JOIN ce_type_stores cets ON sast.STORE_TYPE_ID = cets.TYPE_STORE_SRC_ID
			   AND cets.SOURCE_SYSTEM = 'RETAIL'
			   AND cets.SOURCE_ENTITY = 'SA_TYPE_STORES'
			   ) source       
			ON (target.STORE_SRC_ID = source.STORE_ID AND
				target.SOURCE_SYSTEM = 'RETAIL' AND
				target.SOURCE_ENTITY = 'SA_STORES') 
        
		WHEN MATCHED 
		AND (IIF(target.STORE_NAME = source.STORE_NAME, 0, 1) + 
			 IIF(target.STORE_TYPE_SURR_ID = source.STORE_ID, 0, 1)) > 0
	
		THEN
			UPDATE SET target.STORE_NAME = source.STORE_NAME,
					   target.STORE_TYPE_SURR_ID = source.type_store_id,
					   target.UPDATE_DT = GETDATE()
        
		WHEN NOT MATCHED THEN 
			INSERT (STORE_ID, STORE_SRC_ID, STORE_NAME, STORE_TYPE_SURR_ID, SOURCE_SYSTEM, SOURCE_ENTITY, update_dt, insert_dt) 
			VALUES (default, source.STORE_ID, source.STORE_NAME, source.TYPE_STORE_ID, 'RETAIL', 'SA_STORES', GETDATE(), GETDATE()); 
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