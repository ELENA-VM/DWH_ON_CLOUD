CREATE OR ALTER PROCEDURE ld_incr_ce_stores AS 
BEGIN      
    MERGE INTO ce_stores target              
    USING (SELECT *
           FROM v_incr_stores) source       
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
    
 --   UPDATE sa_stores
 --   SET IS_CPROCESSED = 'Y';
END;  