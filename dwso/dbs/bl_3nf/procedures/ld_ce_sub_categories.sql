CREATE OR ALTER PROCEDURE ld_ce_sub_categories AS 
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION;
		MERGE INTO ce_sub_categories target              
		USING ( SELECT DISTINCT SUB_CATEGORY_ID,
					   COALESCE(trim('"' from (trim(';' from SUB_CATEGORY))) , 'NA') SUB_CATEGORY,
					   COALESCE(cecat.category_id, -1) category_id
				FROM sa_books
				LEFT JOIN ce_categories cecat ON cecat.category_name = sa_books.CATEGORY               
				WHERE SUB_CATEGORY_ID is not null  			
				-- IIF(ltrim(SUB_CATEGORY_ID,'1234567890'), null, 0, 1) = 0 and
					  -- IIF(ltrim(SUB_CATEGORY,'1234567890'), null, 0, 1) = 1 and				  
					  ) source       
			ON (target.SUB_CATEGORY_SRC_ID = source.SUB_CATEGORY_ID AND
				target.SOURCE_SYSTEM = 'RETAIL' AND 
				target.SOURCE_ENTITY = 'SA_BOOKS') 
        
		WHEN MATCHED 
		AND (target.SUB_CATEGORY <> source.SUB_CATEGORY)
		THEN
			UPDATE SET target.SUB_CATEGORY = source.SUB_CATEGORY,
					   target.UPDATE_DT = GETDATE()
        
		WHEN NOT MATCHED THEN 
			INSERT (SUB_CATEGORY_ID, SUB_CATEGORY_SRC_ID, SUB_CATEGORY, category_surr_id, SOURCE_SYSTEM, SOURCE_ENTITY, update_dt, insert_dt) 
			VALUES (default, source.SUB_CATEGORY_ID, source.SUB_CATEGORY, source.category_id, 'RETAIL', 'SA_BOOKS', GETDATE(), GETDATE());
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