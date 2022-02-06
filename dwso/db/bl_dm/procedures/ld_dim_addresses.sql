CREATE OR ALTER PROCEDURE ld_dim_addresses AS 
BEGIN
    MERGE INTO dim_addresses target              
    USING (
            SELECT  ceadr.address_id,
                    ceadr.address,
                    ceadr.postal_code,
                    cect.city_id,
                    cect.city,
                    ceco.country_id,
                    ceco.country,
                    cer.region_id,
                    cer.region
            FROM ce_addresses ceadr 
            INNER JOIN ce_cities cect ON ceadr.city_surr_id = cect.city_id
            INNER JOIN ce_countries ceco ON cect.country_surr_id = ceco.country_id
            INNER JOIN ce_regions cer ON ceco.region_surr_id = cer.region_id 
          ) source       
        ON (target.address_id = source.address_id AND
			target.source_system = 'BL_3NF' AND
			target.source_entity = 'CE_ADDRESSES') 
        
    WHEN MATCHED 
	AND (IIF(target.address = source.address, 0, 1) +
         IIF(target.postal_code = source.postal_code, 0, 1) + 
         IIF(target.city_id = source.city_id, 0, 1) +   
         IIF(target.city = source.city, 0, 1) +
         IIF(target.country_id = source.country_id, 0, 1) +
         IIF(target.country = source.country, 0, 1) + 
         IIF(target.city_id = source.city_id, 0, 1) +
         IIF(target.region_id = source.region_id, 0, 1) + 
         IIF(target.region = source.region, 0, 1) ) > 1
	THEN
        UPDATE SET target.address = source.address, 
                   target.postal_code = source.postal_code, 
                   target.city_id = source.city_id, 
                   target.city = source.city,                        
                   target.country_id = source.country_id, 
                   target.country = source.country, 
                   target.region_id = source.region_id, 
                   target.region = source.region,                          
                   target.UPDATE_DT  = GETDATE()
        
    WHEN NOT MATCHED THEN 
        INSERT (address_surr_id, address_id, source_system, source_entity, address, postal_code, city_id, city, country_id,
                country, region_id, region, update_dt, insert_dt)

        VALUES (DEFAULT, source.address_id, 'BL_3NF', 'CE_ADDRESSES', source.address , source.postal_code, source.city_id, source.city , source.country_id,
                source.country, source.region_id, source.region, GETDATE(), GETDATE()); 
END;
