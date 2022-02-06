CREATE OR ALTER PROCEDURE ld_ce_posts AS 
BEGIN
    MERGE INTO ce_posts target              
    USING (SELECT POST_ID,
                  POST_NAME
           FROM SA_POSTS ) source       
        ON (target.POST_SRC_ID = source.POST_ID AND
            target.SOURCE_SYSTEM = 'RETAIL' AND
            target.SOURCE_ENTITY = 'SA_POSTS') 
        
    WHEN MATCHED 
	AND (target.POST_NAME <> source.POST_NAME)	
	THEN
        UPDATE SET target.POST_NAME = source.POST_NAME,
                   target.UPDATE_DT  = GETDATE()
        
    WHEN NOT MATCHED THEN 
        INSERT (POST_ID, POST_SRC_ID, POST_NAME, SOURCE_SYSTEM, SOURCE_ENTITY, update_dt, insert_dt) 
        VALUES (default, source.POST_ID, source.POST_NAME, 'RETAIL', 'SA_POSTS', GETDATE(), GETDATE()); 
END; 