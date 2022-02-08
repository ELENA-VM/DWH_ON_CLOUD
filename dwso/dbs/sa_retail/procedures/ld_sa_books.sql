CREATE OR ALTER PROCEDURE ld_sa_books AS
BEGIN   
	BEGIN TRY
		BEGIN TRANSACTION;
		TRUNCATE TABLE ext_books;

		BULK INSERT ext_books
		FROM 'storagecontainermev/book.csv'
		WITH (DATA_SOURCE = 'AzureBlobStorageDataSourceETL',
			  FIRSTROW = 2,
			  FORMAT = 'CSV');
		  
		MERGE INTO sa_books target              
		USING (SELECT BOOK_ID,
					  ISBN,              
					  PUBLISHER,
					  BOOK_TITLE,
					  BOOK_AUTHOR,
					  YEAR_OF_PUBLICATION,
					  AUTHOR_ID,
					  CATEGORY_ID,
					  CATEGORY,
					  SUB_CATEGORY_ID,
					  SUB_CATEGORY
			   FROM ext_books
			   WHERE trim(';' from BOOK_ID) is not null ) source       
			ON (target.BOOK_ID = source.BOOK_ID)   
         
		WHEN MATCHED 
		AND (IIF(target.ISBN = source.ISBN, 0, 1) +
			  IIF(target.PUBLISHER = upper(source.PUBLISHER), 0, 1) +
			  IIF(target.BOOK_TITLE = upper(source.BOOK_TITLE), 0, 1) +
			  IIF(target.BOOK_AUTHOR = upper(source.BOOK_AUTHOR), 0, 1) +
			  IIF(target.YEAR_OF_PUBLICATION = source.YEAR_OF_PUBLICATION, 0, 1) +
			  IIF(target.AUTHOR_ID = source.AUTHOR_ID, 0, 1) +
			  IIF(target.CATEGORY_ID = source.CATEGORY_ID, 0, 1) +
			  IIF(target.CATEGORY = upper(source.CATEGORY), 0, 1) +
			  IIF(target.SUB_CATEGORY = upper(source.SUB_CATEGORY), 0, 1) +        
			  IIF(target.SUB_CATEGORY_ID = source.SUB_CATEGORY_ID, 0, 1)) > 0
		THEN
			 UPDATE SET target.ISBN = source.ISBN,
						target.PUBLISHER = upper(source.PUBLISHER),
						target.BOOK_TITLE = upper(source.BOOK_TITLE), 
						target.BOOK_AUTHOR = upper(source.BOOK_AUTHOR),
						target.YEAR_OF_PUBLICATION = source.YEAR_OF_PUBLICATION,
						target.AUTHOR_ID = source.AUTHOR_ID,
						target.CATEGORY_ID = source.CATEGORY_ID,
						target.CATEGORY = upper(source.CATEGORY),
						target.SUB_CATEGORY_ID = source.SUB_CATEGORY_ID,
						target.SUB_CATEGORY = upper(source.SUB_CATEGORY), 
						target.UPDATE_DT  = GETDATE()
     
		WHEN NOT MATCHED THEN 
			 INSERT (BOOK_ID, ISBN, PUBLISHER, BOOK_TITLE, BOOK_AUTHOR, YEAR_OF_PUBLICATION, AUTHOR_ID, CATEGORY_ID, CATEGORY, SUB_CATEGORY_ID, SUB_CATEGORY, INSERT_DT, UPDATE_DT) 
			 VALUES (source.BOOK_ID, source.ISBN, upper(source.PUBLISHER), upper(source.BOOK_TITLE), upper(source.BOOK_AUTHOR), source.YEAR_OF_PUBLICATION, source.AUTHOR_ID, source.CATEGORY_ID, upper(source.CATEGORY), source.SUB_CATEGORY_ID, upper(source.SUB_CATEGORY), GETDATE(), GETDATE());
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