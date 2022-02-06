CREATE OR ALTER PROCEDURE ld_ce_cities AS 
BEGIN
	DECLARE @CITY_ID BIGINT, @CITY VARCHAR(50), @COUNTRY_ID BIGINT, @INSERT_DT DATE, @UPDATE_DT DATE;

	DECLARE cities_cur CURSOR FOR 
		SELECT sac.CITY_ID, sac.CITY, COALESCE(bcc.COUNTRY_ID,-1) COUNTRY_ID, sac.INSERT_DT, sac.UPDATE_DT 
        FROM sa_cities sac 
        LEFT JOIN ce_countries bcc ON sac.COUNTRY_ID = bcc.COUNTRY_SRC_ID 
        AND bcc.SOURCE_SYSTEM = 'RETAIL'
        AND bcc.SOURCE_ENTITY = 'SA_COUNTRIES';
				
	OPEN cities_cur  
  
	FETCH NEXT FROM cities_cur INTO @CITY_ID, @CITY, @COUNTRY_ID, @INSERT_DT, @UPDATE_DT
	
	WHILE @@FETCH_STATUS = 0
	BEGIN

        INSERT INTO ce_cities(CITY_ID, CITY_SRC_ID, CITY, COUNTRY_SURR_ID, SOURCE_SYSTEM, SOURCE_ENTITY, update_dt, insert_dt) 
        SELECT NEXT VALUE FOR ce_cities_seq, @CITY_ID, @CITY, @COUNTRY_ID, 'RETAIL', 'SA_CITIES', GETDATE(), GETDATE()
        WHERE NOT EXISTS ( SELECT ncity.CITY_ID
                           FROM ce_cities ncity 
                           WHERE ncity.CITY_SRC_ID = @CITY_ID
                           AND ncity.SOURCE_SYSTEM = 'RETAIL' 
                           AND ncity.SOURCE_ENTITY = 'SA_CITIES' );
            
        UPDATE ce_cities
        SET CITY = @CITY,
            COUNTRY_SURR_ID = @COUNTRY_ID,
            UPDATE_DT = GETDATE()
            
        WHERE CITY_SRC_ID = @CITY_ID
          AND SOURCE_SYSTEM = 'RETAIL' 
          AND SOURCE_ENTITY = 'SA_CITIES'
          AND (IIF(CITY = @CITY, 0, 1) + 
               IIF(COUNTRY_SURR_ID = @COUNTRY_ID, 0, 1)) > 0;
			   
	FETCH NEXT FROM cities_cur INTO @CITY_ID, @CITY, @COUNTRY_ID, @INSERT_DT, @UPDATE_DT

	END

	CLOSE cities_cur
	DEALLOCATE cities_cur  
END;
