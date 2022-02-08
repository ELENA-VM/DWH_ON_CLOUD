INSERT INTO ce_type_stores(TYPE_STORE_ID, TYPE_STORE_SRC_ID, TYPE_STORE, SOURCE_SYSTEM, SOURCE_ENTITY, update_dt, insert_dt) 
SELECT -1, -1, 'NA', 'NA', 'NA', GETDATE(), GETDATE()
WHERE NOT EXISTS ( SELECT TYPE_STORE_ID
                   FROM ce_type_stores
                   WHERE TYPE_STORE_ID = -1 );