CREATE OR ALTER PROCEDURE ld_dim_employees AS 
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION;
		MERGE INTO dim_employees target              
		USING ( SELECT cem.employee_id,
					   ces.store_id,
					   ces.store_name,
					   cets.type_store_id,
					   cets.type_store,
					   cem.first_name,
					   cem.last_name,
					   cep.post_id,
					   cep.post_name 
				FROM ce_employees cem 
				INNER JOIN ce_stores ces ON cem.store_surr_id = ces.store_id
				INNER JOIN ce_type_stores cets ON ces.store_type_surr_id = cets.type_store_id
				INNER JOIN ce_posts cep ON cem.post_surr_id = cep.post_id   
		) source       
			ON (target.employee_id = source.employee_id AND
				target.source_entity = 'CE_EMPLOYEES' AND
				target.source_system = 'BL_3NF') 
       
		WHEN MATCHED 
		AND (IIF(target.store_id = source.store_id, 0, 1) +
			 IIF(target.store_name = source.store_name, 0, 1) + 
			 IIF(target.store_type_id = source.type_store_id, 0, 1) + 
			 IIF(target.store_type = source.type_store, 0, 1) +
			 IIF(target.first_name = source.first_name, 0, 1) +
			 IIF(target.last_name = source.last_name, 0, 1) +
			 IIF(target.post_id = source.post_id, 0, 1) +
			 IIF(target.post = source.post_name, 0, 1)) > 1
		THEN
			UPDATE SET target.store_id = source.store_id,
					   target.store_name = source.store_name, 
					   target.store_type_id = source.type_store_id, 
					   target.store_type = source.type_store, 
					   target.first_name = source.first_name, 
					   target.last_name = source.last_name, 
					   target.post_id  = source.post_id,
					   target.post  = source.post_name,
					   target.UPDATE_DT  = GETDATE()
        
		WHEN NOT MATCHED THEN 
			INSERT (employee_surr_id, employee_id, source_entity, source_system, first_name, last_name, post_id, post, store_id, store_name,
					store_type_id, store_type, update_dt, insert_dt) 
                
			VALUES (DEFAULT, source.employee_id,  'CE_EMPLOYEES', 'BL_3NF', source.first_name, source.last_name, source.post_id, source.post_name, source.store_id,
					source.store_name, source.type_store_id, source.type_store, GETDATE(), GETDATE()); 
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