INSERT INTO ce_addresses(ADDRESS_ID, ADDRESS_SRC_ID, ADDRESS, postal_code, CITY_SURR_ID, SOURCE_SYSTEM, SOURCE_ENTITY, update_dt, insert_dt)  
SELECT -1, -1, 'NA', 'NA', -1, 'NA', 'NA', GETDATE(), GETDATE()
WHERE NOT EXISTS ( SELECT ADDRESS_ID
                   FROM ce_addresses
                   WHERE ADDRESS_ID = -1 );