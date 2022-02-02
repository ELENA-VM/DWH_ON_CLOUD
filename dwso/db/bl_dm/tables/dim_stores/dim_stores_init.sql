INSERT INTO  dim_stores(store_surr_id, store_id, source_system, source_entity, store_name, store_type_id, store_type, update_dt, insert_dt) 
SELECT -1, -1, 'NA', 'NA', 'NA', -1, 'NA', GETDATE(), GETDATE()
WHERE NOT EXISTS ( SELECT store_surr_id
                   FROM dim_stores
                   WHERE store_surr_id = -1 );
