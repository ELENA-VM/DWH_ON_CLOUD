INSERT INTO  dim_books_scd(book_surr_id, book_id, source_system, source_entity, isbn,
                                 publisher, book_title, year_of_publication, author_id, author, category_id, 
                                 category_name, sub_category_id, sub_category, start_dt, 
                                 end_dt, is_active, update_dt, insert_dt)    
                                 
SELECT -1, -1, 'NA', 'NA', 'NA', 'NA', 'NA', -1, -1, 'NA', -1,  
        'NA', -1 , 'NA', CAST('01-01-1970' AS DATE), CAST('01-01-9999' AS DATE), 'true', GETDATE(), GETDATE()
WHERE NOT EXISTS ( SELECT book_surr_id
                   FROM dim_books_scd
                   WHERE book_surr_id = -1 );
