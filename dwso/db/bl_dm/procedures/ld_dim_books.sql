CREATE OR ALTER PROCEDURE ld_dim_books AS 
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION;
		MERGE INTO dim_books_scd target              
		USING (
				SELECT  ceb.book_id,
						ceb.isbn,
						ceb.publisher,
						ceb.book_title,
						ceb.year_of_publication,
						cea.author_id,
						cea.author_name,
						ces.sub_category_id,
						ces.sub_category,
						cec.category_id,
						cec.category_name,
						ceb.start_dt,
						ceb.end_dt,
						ceb.is_active
					FROM ce_books ceb
					INNER JOIN ce_authors cea ON ceb.author_id = cea.author_id 
					INNER JOIN ce_sub_categories ces ON ceb.sub_category_surr_id = ces.sub_category_id              
					INNER JOIN ce_categories cec ON ces.category_surr_id = cec.category_id

			  ) source       
			ON (target.book_id = source.book_id AND
				target.start_dt = source.start_dt AND
				target.source_system = 'BL_3NF' AND
				target.source_entity = 'CE_BOOKS_SCD' ) 
        
		WHEN MATCHED 
		AND (IIF(target.isbn = source.isbn, 0, 1) +
			 IIF(target.publisher = source.publisher, 0, 1) + 
			 IIF(target.book_title = source.book_title, 0, 1) +   
			 IIF(target.year_of_publication = source.year_of_publication, 0, 1) +
			 IIF(target.author_id = source.author_id, 0, 1) +
			 IIF(target.author = source.author_name, 0, 1) + 
			 IIF(target.sub_category_id = source.sub_category_id, 0, 1) +
			 IIF(target.sub_category = source.sub_category, 0, 1) + 
			 IIF(target.category_id = source.category_id, 0, 1) +
			 IIF(target.category_name = source.category_name, 0, 1) +
			 IIF(target.end_dt = source.end_dt, 0, 1) +
			 IIF(target.is_active = source.is_active, 0, 1) ) > 1
		THEN
			UPDATE SET target.isbn = source.isbn, 
					   target.publisher = source.publisher, 
					   target.book_title = source.book_title, 
					   target.year_of_publication = source.year_of_publication,                        
					   target.author_id = source.author_id, 
					   target.author = source.author_name, 
					   target.sub_category_id = source.sub_category_id, 
					   target.sub_category = source.sub_category,                          
					   target.category_id = source.category_id, 
					   target.category_name = source.category_name,
					   target.update_dt = GETDATE(),
					   target.end_dt = source.end_dt,
					   target.is_active = source.is_active                                            

		WHEN NOT MATCHED THEN 
			INSERT (book_surr_id, book_id, source_system, source_entity, isbn, publisher, book_title, year_of_publication, author_id,
					author, category_id, category_name, sub_category_id, sub_category, start_dt, end_dt, is_active,                  
					update_dt, insert_dt)

			VALUES (default, source.book_id, 'BL_3NF', 'CE_BOOKS_SCD',
					source.isbn , source.publisher, source.book_title, source.year_of_publication , source.author_id,
					source.author_name, source.category_id, source.category_name, source.sub_category_id, 
					source.sub_category, source.start_dt, source.end_dt, source.is_active, GETDATE(), GETDATE()); 
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