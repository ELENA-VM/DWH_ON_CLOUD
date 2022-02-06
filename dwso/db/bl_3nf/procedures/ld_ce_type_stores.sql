CREATE OR ALTER PROCEDURE ld_ce_type_stores AS 
BEGIN
	DECLARE @TYPE_STORE_ID BIGINT, @TYPE_STORE VARCHAR(30);
	
	DECLARE type_stores_cur CURSOR FOR 
		SELECT TYPE_STORE_ID,
               TYPE_STORE
        FROM SA_TYPE_STORES;
  
	OPEN type_stores_cur  
  
	FETCH NEXT FROM type_stores_cur INTO @TYPE_STORE_ID, @TYPE_STORE 

	WHILE @@FETCH_STATUS = 0
	BEGIN

        INSERT INTO ce_type_stores(TYPE_STORE_ID, TYPE_STORE_SRC_ID, TYPE_STORE, SOURCE_SYSTEM, SOURCE_ENTITY, update_dt, insert_dt) 
        SELECT NEXT VALUE FOR ce_type_stores_seq, @TYPE_STORE_ID, upper(@TYPE_STORE), 'RETAIL', 'SA_TYPE_STORES', GETDATE(), GETDATE()
        WHERE NOT EXISTS ( SELECT ncts.TYPE_STORE_ID
                           FROM ce_type_stores ncts 
                           WHERE ncts.TYPE_STORE_SRC_ID = @TYPE_STORE_ID
                             AND ncts.SOURCE_SYSTEM = 'RETAIL' 
                             AND ncts.SOURCE_ENTITY = 'SA_TYPE_STORES' );
                             
        UPDATE ce_type_stores            
        SET TYPE_STORE = @TYPE_STORE,
			UPDATE_DT = GETDATE()                
		WHERE TYPE_STORE_SRC_ID = @TYPE_STORE_ID
          AND SOURCE_SYSTEM = 'RETAIL' 
          AND SOURCE_ENTITY = 'SA_TYPE_STORES'
          AND IIF(TYPE_STORE = upper(@TYPE_STORE), 0, 1) > 0;       

	FETCH NEXT FROM type_stores_cur INTO @TYPE_STORE_ID, @TYPE_STORE 

	END

	CLOSE type_stores_cur
	DEALLOCATE type_stores_cur 
END;

