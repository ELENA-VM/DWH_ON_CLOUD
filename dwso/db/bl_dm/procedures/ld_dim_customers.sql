CREATE OR ALTER PROCEDURE ld_dim_customers AS 
BEGIN
    MERGE INTO dim_customers target              
    USING (
            SELECT  cecust.customer_id,
                    cecust.type_customer,
                    cecust.first_name,
                    cecust.last_name,
                    cecust.gender,
                    cecust.date_of_birth,
                    cecust.name_of_organization,
                    cecust.head_of_organization,
                    cecust.iban,
                    cecust.email,
                    ceadr.address_id,
                    ceadr.address,
                    ceadr.postal_code,
                    cect.city_id,
                    cect.city,
                    ceco.country_id,
                    ceco.country,
                    cer.region_id,
                    cer.region
            FROM ce_customers cecust
            INNER JOIN ce_addresses ceadr ON cecust.address_surr_id = ceadr.address_id
            INNER JOIN ce_cities cect ON ceadr.city_surr_id = cect.city_id
            INNER JOIN ce_countries ceco ON cect.country_surr_id = ceco.country_id
            INNER JOIN ce_regions cer ON ceco.region_surr_id = cer.region_id 
          ) source       
        ON (target.customer_id = source.customer_id AND 
			target.source_system = 'BL_3NF' AND
			target.source_entity = 'CE_CUSTOMERS' ) 
        
    WHEN MATCHED 
	AND (IIF(target.type_customer = source.type_customer, 0, 1) +
         IIF(target.first_name = source.first_name, 0, 1) + 
         IIF(target.last_name = source.last_name, 0, 1) +                   
         IIF(target.gender = source.gender, 0, 1) +
         IIF(target.date_of_birth = source.date_of_birth, 0, 1) + 
         IIF(target.name_of_organization = source.name_of_organization, 0, 1) +
         IIF(target.head_of_organization = source.head_of_organization, 0, 1) +
         IIF(target.iban = source.iban, 0, 1) + 
         IIF(target.email = source.email, 0, 1) +                   
         IIF(target.address_id = source.address_id, 0, 1) +
         IIF(target.address = source.address, 0, 1) +
         IIF(target.postal_code = source.postal_code, 0, 1) + 
         IIF(target.city_id = source.city_id, 0, 1) +   
         IIF(target.city = source.city, 0, 1) +
         IIF(target.country_id = source.country_id, 0, 1) +
         IIF(target.country = source.country, 0, 1) + 
         IIF(target.city_id = source.city_id, 0, 1) +
         IIF(target.region_id = source.region_id, 0, 1) + 
         IIF(target.region = source.region, 0, 1) ) > 1	

	THEN
        UPDATE SET target.type_customer = source.type_customer,
                   target.first_name = source.first_name, 
                   target.last_name = source.last_name, 
                   target.gender = source.gender, 
                   target.date_of_birth = source.date_of_birth,                        
                   target.name_of_organization = source.name_of_organization, 
                   target.head_of_organization = source.head_of_organization, 
                   target.iban = source.iban, 
                   target.email = source.email, 
                   target.address_id = source.address_id, 
                   target.address = source.address, 
                   target.postal_code = source.postal_code, 
                   target.city_id = source.city_id, 
                   target.city = source.city,                        
                   target.country_id = source.country_id, 
                   target.country = source.country, 
                   target.region_id = source.region_id, 
                   target.region = source.region,                          
                   target.UPDATE_DT  = GETDATE()
        
    WHEN NOT MATCHED THEN 
        INSERT (customer_surr_id, customer_id, source_system , source_entity, type_customer, first_name, last_name, gender, date_of_birth,
                name_of_organization, email, head_of_organization, iban, address, postal_code, city_id, city, country_id,
                country, region_id, region, address_id, update_dt, insert_dt)

        VALUES (default, source.customer_id, 'BL_3NF', 'CE_CUSTOMERS',
                source.type_customer, source.first_name, source.last_name, source.gender, source.date_of_birth,
                source.name_of_organization , source.email, source.head_of_organization, source.iban,
                source.address , source.postal_code, source.city_id, source.city , source.country_id,
                source.country, source.region_id, source.region, source.address_id, GETDATE(), GETDATE()); 
END;