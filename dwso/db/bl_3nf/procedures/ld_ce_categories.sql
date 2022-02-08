CREATE OR ALTER PROCEDURE ld_ce_categories AS 
BEGIN   
	BEGIN TRY
		BEGIN TRANSACTION;
		MERGE INTO ce_categories target              
		USING (SELECT DISTINCT CATEGORY_ID,
							   CATEGORY   
			   FROM sa_books
			   WHERE CATEGORY_ID in ('1', '2') ) source       
			ON (target.CATEGORY_SRC_ID = source.CATEGORY_ID AND
				target.SOURCE_SYSTEM = 'RETAIL' AND
				target.SOURCE_ENTITY = 'SA_BOOKS') 
        
		WHEN MATCHED 
		AND (target.category_name <> source.CATEGORY)
		THEN
			UPDATE SET target.category_name = source.CATEGORY,
					   target.UPDATE_DT = GETDATE()
        
		WHEN NOT MATCHED THEN 
			INSERT (CATEGORY_ID, CATEGORY_SRC_ID, category_name, SOURCE_SYSTEM, SOURCE_ENTITY, update_dt, insert_dt) 
			VALUES (default, source.CATEGORY_ID, source.CATEGORY, 'RETAIL', 'SA_BOOKS', GETDATE(), GETDATE()); 
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