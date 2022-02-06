CREATE OR ALTER PROCEDURE ld_ce_addresses AS 
BEGIN    
	MERGE INTO ce_addresses target              
	USING (SELECT trim('"' from saa.ADDRESS_ID) ADDRESS_ID,
				  trim('"' from saa.ADDRESS) ADDRESS,
				  trim('"' from saa.postal_code) POSTAL_CODE,
				  COALESCE(bcc.CITY_ID, -1) CITY_ID
		   FROM sa_address saa 
		   LEFT JOIN ce_cities bcc ON saa.CITY_ID = bcc.CITY_SRC_ID
		   AND bcc.SOURCE_SYSTEM = 'RETAIL'
		   AND bcc.SOURCE_ENTITY = 'SA_CITIES') source           
		ON (target.ADDRESS_SRC_ID = source.ADDRESS_ID AND
			target.SOURCE_SYSTEM = 'RETAIL' AND
			target.SOURCE_ENTITY = 'SA_ADDRESSES') 
		
	WHEN MATCHED 
	AND (IIF(target.ADDRESS = source.ADDRESS, 0, 1) +                
		 IIF(target.POSTAL_CODE = source.POSTAL_CODE, 0, 1) +
		 IIF(target.CITY_SURR_ID = source.CITY_ID, 0, 1)) > 0 
	THEN
		UPDATE SET target.ADDRESS = source.ADDRESS,                      
				   target.POSTAL_CODE = source.POSTAL_CODE,
				   target.CITY_SURR_ID = source.CITY_ID,
				   target.UPDATE_DT = GETDATE()
					  
	WHEN NOT MATCHED THEN 
		INSERT (ADDRESS_ID, ADDRESS_SRC_ID, ADDRESS, postal_code, CITY_SURR_ID, SOURCE_SYSTEM, SOURCE_ENTITY, update_dt, insert_dt) 
		VALUES (default, CAST(trim('"' from source.ADDRESS_ID) AS BIGINT), trim('"' from source.ADDRESS), 
				COALESCE(trim('"' from source.postal_code), 'NA'),  source.CITY_ID, 'RETAIL', 'SA_ADDRESSES', GETDATE(), GETDATE()); 

END;