CREATE OR ALTER PROCEDURE ld_ce_authors AS 
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION;
		MERGE INTO ce_authors target              
		USING (SELECT AUTHOR_ID,
					  COALESCE(trim('"' from trim(';' from AUTHOR_NAME)), 'NA') AUTHOR_NAME  
			   FROM sa_authors ) source       
			ON (target.AUTHOR_SRC_ID = source.AUTHOR_ID AND
				target.SOURCE_SYSTEM = 'RETAIL' AND 
				target.SOURCE_ENTITY = 'SA_AUTHORS') 
        
		WHEN MATCHED 
		AND (target.AUTHOR_NAME <> source.AUTHOR_NAME)
		THEN
			UPDATE SET target.AUTHOR_NAME = source.AUTHOR_NAME,
					   target.UPDATE_DT = GETDATE()
        
		WHEN NOT MATCHED THEN 
			INSERT (AUTHOR_ID, AUTHOR_SRC_ID, AUTHOR_NAME, SOURCE_SYSTEM, SOURCE_ENTITY, update_dt, insert_dt) 
			VALUES (default, source.AUTHOR_ID, COALESCE(trim('"' from trim(';' from source.AUTHOR_NAME)), 'NA'), 'RETAIL', 'SA_AUTHORS', GETDATE(), GETDATE()); 
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