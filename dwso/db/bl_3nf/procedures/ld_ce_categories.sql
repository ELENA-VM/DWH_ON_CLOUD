CREATE OR ALTER PROCEDURE ld_ce_categories AS 
BEGIN    
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
END;