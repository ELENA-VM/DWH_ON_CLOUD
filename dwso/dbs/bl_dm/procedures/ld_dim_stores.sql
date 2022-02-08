CREATE OR ALTER PROCEDURE ld_dim_stores AS 
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION;
		MERGE INTO dim_stores target              
		USING (
				SELECT
					ces.store_id,
					ces.store_name,
					cets.type_store_id,
					cets.type_store
				FROM ce_stores ces
				INNER JOIN ce_type_stores cets ON ces.store_type_surr_id = cets.type_store_id
			  ) source       
			ON (target.store_id = source.store_id AND
				target.source_system = 'BL_3NF' AND
				target.source_entity = 'CE_STORES') 
        
		WHEN MATCHED
		AND (IIF(target.store_name = source.store_name, 0, 1) +
			 IIF(target.store_type_id = source.type_store_id, 0, 1) + 
			 IIF(target.store_type = source.type_store, 0, 1)) > 1
		THEN
			UPDATE SET target.store_name = source.store_name,
					   target.store_type_id = source.type_store_id, 
					   target.store_type = source.type_store, 
					   target.UPDATE_DT  = GETDATE()
        
		WHEN NOT MATCHED THEN 
			INSERT (store_surr_id, store_id, source_system, source_entity, store_name, store_type_id, store_type, update_dt, insert_dt) 
			VALUES (DEFAULT, source.store_id, 'BL_3NF', 'CE_STORES', source.store_name, source.type_store_id, source.type_store, GETDATE(), GETDATE()); 
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