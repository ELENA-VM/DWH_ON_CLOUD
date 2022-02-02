INSERT INTO  dim_addresses(address_surr_id, address_id, source_system, source_entity, address,
                                 postal_code, city_id, city, country_id, country, region_id, 
                                 region, update_dt, insert_dt)           
SELECT -1, -1, 'NA', 'NA', 'NA', 'NA', -1, 'NA', -1, 'NA', -1, 'NA', GETDATE(), GETDATE()
WHERE NOT EXISTS ( SELECT address_surr_id
                   FROM dim_addresses
                   WHERE address_surr_id = -1 );
