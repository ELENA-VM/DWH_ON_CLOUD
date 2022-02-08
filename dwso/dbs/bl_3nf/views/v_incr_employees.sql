CREATE OR ALTER VIEW v_incr_employees
AS
( SELECT sae.EMPLOYEE_ID,
         sae.FIRST_NAME,
         sae.LAST_NAME,
         COALESCE(cep.POST_ID, -1) POST_ID,
         COALESCE(ces.STORE_ID, -1) STORE_ID                
  FROM sa_employees sae
  LEFT JOIN ce_posts cep ON sae.POST_ID = cep.post_src_id
  LEFT JOIN ce_stores ces ON sae.STORE_ID = ces.store_src_id 
 
  WHERE sae.insert_dt > 
        ( SELECT previous_loaded_date
          FROM prm_mta_incremental_load 
          WHERE sa_table_name = 'SA_EMPLOYEES' )
     OR sae.update_dt > 
        ( SELECT previous_loaded_date 
          FROM prm_mta_incremental_load 
          WHERE sa_table_name = 'SA_EMPLOYEES' )
);         
               
                