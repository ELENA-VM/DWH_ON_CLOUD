INSERT INTO ce_countries(COUNTRY_ID, COUNTRY_SRC_ID, COUNTRY, region_surr_id, SOURCE_SYSTEM, SOURCE_ENTITY, update_dt, insert_dt) 
SELECT -1, -1, 'NA', -1, 'NA', 'NA', GETDATE(), GETDATE()
WHERE NOT EXISTS ( SELECT COUNTRY_ID
                   FROM ce_countries
                   WHERE COUNTRY_ID = -1 );
