CREATE OR ALTER PROCEDURE ld_ce_book_author AS 
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION;
		MERGE INTO ce_book_author target              
		USING (SELECT COALESCE(ceb.book_id, -1) BOOK_ID,           
					  COALESCE(cea.author_id, -1) AUTHOR_ID
					  FROM sa_books sab
					  LEFT JOIN ce_authors cea on sab.author_id = cea.author_src_id
					  LEFT JOIN ce_books ceb on trim('"' from sab.book_id) = ceb.book_src_id ) source       
			ON (target.BOOK_SURR_ID = source.BOOK_ID and
				target.AUTHOR_SURR_ID = source.AUTHOR_ID)             
       
		WHEN NOT MATCHED THEN 
			INSERT (BOOK_SURR_ID, AUTHOR_SURR_ID) 
			VALUES (source.BOOK_ID, source.AUTHOR_ID); 
		COMMIT TRANSACTION;
	END TRY
	BEGIN CATCH
        SELECT  
            ERROR_NUMBER() AS ErrorNumber  
            ,ERROR_PROCEDURE() AS ErrorProcedure  
            ,ERROR_LINE() AS ErrorLine  
            ,ERROR_MESSAGE() AS ErrorMessage;  
		ROLLBACK TRANSACTION;
    END CATCH
END;
