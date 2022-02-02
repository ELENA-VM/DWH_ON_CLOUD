INSERT INTO ce_authors(AUTHOR_ID, AUTHOR_SRC_ID, AUTHOR_NAME, SOURCE_SYSTEM, SOURCE_ENTITY, update_dt, insert_dt) 
SELECT -1, -1, 'NA', 'NA', 'NA', GETDATE(), GETDATE()
WHERE NOT EXISTS ( SELECT AUTHOR_ID
                   FROM ce_authors
                   WHERE AUTHOR_ID = -1 );
