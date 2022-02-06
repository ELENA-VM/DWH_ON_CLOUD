CREATE OR ALTER PROCEDURE ld_ce_employees AS 
BEGIN

    MERGE INTO ce_employees target              
    USING ( SELECT sae.EMPLOYEE_ID,
                   sae.FIRST_NAME,
                   sae.LAST_NAME,
                   COALESCE(cep.POST_ID, -1) POST_ID,
                   COALESCE(ces.STORE_ID, -1) STORE_ID
            FROM sa_employees sae               
            LEFT JOIN ce_posts cep ON sae.POST_ID = cep.post_src_id
            LEFT JOIN ce_stores ces ON sae.STORE_ID = ces.store_src_id ) source       
        ON (target.EMPLOYEE_SRC_ID = source.EMPLOYEE_ID AND
            target.SOURCE_SYSTEM = 'RETAIL' AND
            target.SOURCE_ENTITY = 'SA_EMPLOYEES') 
        
    WHEN MATCHED 
	AND ( IIF(target.FIRST_NAME = source.FIRST_NAME, 0, 1) +
          IIF(target.LAST_NAME = source.LAST_NAME, 0, 1) +
          IIF(target.POST_SURR_ID = source.POST_ID, 0, 1) +
          IIF(target.STORE_SURR_ID = source.STORE_ID, 0, 1) ) > 1  
	THEN
        UPDATE SET target.FIRST_NAME = source.FIRST_NAME,
                   target.LAST_NAME = source.LAST_NAME,
                   target.POST_SURR_ID = source.POST_ID,
                   target.STORE_SURR_ID = source.STORE_ID,                       
                   target.UPDATE_DT = GETDATE()
        
    WHEN NOT MATCHED THEN 
        INSERT (EMPLOYEE_ID, EMPLOYEE_SRC_ID, SOURCE_SYSTEM, SOURCE_ENTITY, 
                STORE_SURR_ID, FIRST_NAME, LAST_NAME, POST_SURR_ID, update_dt, insert_dt) 
        VALUES (default, source.EMPLOYEE_ID, 'RETAIL', 'SA_EMPLOYEES',
                source.store_id, source.FIRST_NAME, source.LAST_NAME, source.post_id, GETDATE(), GETDATE());
END;
