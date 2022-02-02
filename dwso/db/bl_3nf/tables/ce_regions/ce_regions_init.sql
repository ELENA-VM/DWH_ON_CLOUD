INSERT INTO ce_regions(REGION_ID, REGION_SRC_ID, REGION, SOURCE_SYSTEM, SOURCE_ENTITY, update_dt, insert_dt) 
SELECT -1, -1, 'NA', 'NA', 'NA', GETDATE(), GETDATE()
WHERE NOT EXISTS ( SELECT REGION_ID
                   FROM ce_regions
                   WHERE REGION_ID = -1 );