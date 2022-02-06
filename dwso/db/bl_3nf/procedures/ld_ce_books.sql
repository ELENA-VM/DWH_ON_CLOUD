CREATE OR ALTER PROCEDURE ld_ce_books AS 
BEGIN
   TRUNCATE TABLE wrk_books;

   INSERT INTO wrk_books (book_id, book_src_id, source_system, source_entity, isbn,
               publisher, book_title, year_of_publication, author_id,
               sub_category_surr_id, start_dt, end_dt, is_active, update_dt, insert_dt) 
   
   SELECT ncb.BOOK_ID,
          trim('"' from sab.BOOK_ID),
          'RETAIL',
          'SA_BOOKS',
          trim('"' from sab.ISBN),              
          COALESCE(left(trim('"' from sab.PUBLISHER), 100), 'NA'),
          COALESCE(left(trim('"' from sab.BOOK_TITLE), 300), 'NA'),
          CAST(sab.YEAR_OF_PUBLICATION AS INTEGER),
          COALESCE(cea.author_id, -1),
          COALESCE(ces.sub_category_id, -1),
          GETDATE(),
          CAST('9999-01-01' AS DATE), 
          'yes', 
          GETDATE(), 
          GETDATE()
          
   FROM sa_books sab
   LEFT JOIN ce_authors cea ON sab.author_id = cea.author_src_id
   LEFT JOIN ce_sub_categories ces ON sab.sub_category_id = ces.sub_category_src_id 
   INNER JOIN ce_books ncb ON ncb.BOOK_SRC_ID = trim('"' from sab.BOOK_ID) 
   AND ncb.source_system = 'RETAIL' 
   AND ncb.source_entity = 'SA_BOOKS' 
   AND ncb.is_active = 'yes' 
   AND TRY_CAST(ncb.start_dt AS DATE) != TRY_CAST(GETDATE() AS DATE)
   WHERE ( IIF(ncb.ISBN = trim('"' from sab.ISBN), 0, 1) +
           IIF(ncb.PUBLISHER = COALESCE(trim('"' from sab.PUBLISHER), 'NA'), 0, 1) +
           IIF(ncb.BOOK_TITLE = COALESCE(trim('"' from sab.BOOK_TITLE), 'NA'), 0, 1) +
           IIF(ncb.AUTHOR_ID = COALESCE(cea.author_id, -1), 0, 1) +
           IIF(ncb.SUB_CATEGORY_SURR_ID = COALESCE(ces.sub_category_id, -1), 0, 1) +
           IIF(ncb.YEAR_OF_PUBLICATION = CAST(sab.YEAR_OF_PUBLICATION AS INTEGER), 0, 1)
        ) > 0;     

   MERGE INTO ce_books target              
   USING ( SELECT trim('"' from sab.BOOK_ID) BOOK_ID,
                  trim('"' from sab.ISBN) ISBN,              
                  COALESCE(left(trim('"' from sab.PUBLISHER),100), 'NA') PUBLISHER,
                  COALESCE(left(trim('"' from sab.BOOK_TITLE),300), 'NA') BOOK_TITLE,
                  COALESCE(cea.author_id, -1) AUTHOR_ID,
                  COALESCE(ces.sub_category_id, -1) SUB_CATEGORY_ID,
                  CAST(sab.YEAR_OF_PUBLICATION AS INTEGER) YEAR_OF_PUBLICATION
           FROM sa_books sab
           LEFT JOIN ce_authors cea on sab.author_id = cea.author_src_id
           LEFT JOIN ce_sub_categories ces on sab.sub_category_id = ces.sub_category_src_id
         ) source       
       ON (target.BOOK_SRC_ID = source.BOOK_ID AND
		   target.source_system = 'RETAIL' AND
		   target.source_entity = 'SA_BOOKS') 
        
   WHEN MATCHED 
   AND ( IIF(target.ISBN = source.ISBN, 0, 1) +
         IIF(target.PUBLISHER = source.PUBLISHER, 0, 1) +
         IIF(target.BOOK_TITLE = source.BOOK_TITLE, 0, 1) +
         IIF(target.AUTHOR_ID = source.AUTHOR_ID, 0, 1) +
         IIF(target.SUB_CATEGORY_SURR_ID = source.SUB_CATEGORY_ID, 0, 1) +
         IIF(target.YEAR_OF_PUBLICATION = source.YEAR_OF_PUBLICATION, 0, 1) ) > 0

   THEN 
       UPDATE SET target.is_active = 'no',
                  target.END_DT = GETDATE(),
                  target.UPDATE_DT = GETDATE()                       
       
   WHEN NOT MATCHED THEN 
       INSERT (book_id, book_src_id, source_system, source_entity, isbn, publisher, book_title, year_of_publication, author_id,
               sub_category_surr_id, start_dt, end_dt, is_active, update_dt, insert_dt) 
       VALUES (default, source.BOOK_ID, 'RETAIL', 'SA_BOOKS', source.isbn, source.publisher, source.book_title, source.year_of_publication, source.author_id,
               source.sub_category_id, CAST('1970-01-01' AS DATE),  CAST('9999-01-01' AS DATE), 'yes', GETDATE(), GETDATE());

   INSERT INTO ce_books(book_id, book_src_id, source_system, source_entity, isbn, publisher, book_title, year_of_publication, author_id,
                        sub_category_surr_id, start_dt, end_dt, is_active, update_dt, insert_dt) 
   
   SELECT wrk.book_id, wrk.book_src_id, wrk.source_system, wrk.source_entity, wrk.isbn,
          wrk.publisher, wrk.book_title, wrk.year_of_publication, wrk.author_id,
          wrk.sub_category_surr_id, wrk.start_dt, wrk.end_dt, wrk.is_active, wrk.update_dt, wrk.insert_dt              
   FROM wrk_books wrk;

END;