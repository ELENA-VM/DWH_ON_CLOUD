INSERT INTO ce_employees(EMPLOYEE_ID, EMPLOYEE_SRC_ID, SOURCE_ENTITY, SOURCE_SYSTEM, store_surr_id, FIRST_NAME, 
                                LAST_NAME, POST_SURR_ID, update_dt, insert_dt) 
SELECT -1, -1, 'NA', 'NA', -1, 'NA', 'NA', -1, GETDATE(), GETDATE()
WHERE NOT EXISTS ( SELECT EMPLOYEE_ID
                   FROM ce_employees
                   WHERE EMPLOYEE_ID = -1 );
