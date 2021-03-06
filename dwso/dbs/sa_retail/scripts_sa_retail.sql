/****** Object:  Database [SA_RETAIL]    Script Date: 2/9/2022 1:57:19 AM ******/
-- CREATE DATABASE [SA_RETAIL]  (EDITION = 'Basic', SERVICE_OBJECTIVE = 'Basic', MAXSIZE = 1 GB) WITH CATALOG_COLLATION = SQL_Latin1_General_CP1_CI_AS;
/****** Object:  DatabaseScopedCredential [AzureBlobStorageCredentialETL]    Script Date: 2/9/2022 1:57:19 AM ******/
CREATE DATABASE SCOPED CREDENTIAL [AzureBlobStorageCredentialETL] WITH IDENTITY = N'SHARED ACCESS SIGNATURE'
GO
/****** Object:  ExternalDataSource [AzureBlobStorageDataSourceETL]    Script Date: 2/9/2022 1:57:20 AM ******/
CREATE EXTERNAL DATA SOURCE [AzureBlobStorageDataSourceETL] WITH (TYPE = BLOB_STORAGE, LOCATION = N'https://adlstoragebooksales.blob.core.windows.net', CREDENTIAL = [AzureBlobStorageCredentialETL])
GO
/****** Object:  Table [dbo].[ext_address]    Script Date: 2/9/2022 1:57:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ext_address](
	[ADDRESS_ID] [varchar](4000) NULL,
	[ADDRESS] [varchar](4000) NULL,
	[ADDRESS2] [varchar](4000) NULL,
	[DISTRICT] [varchar](4000) NULL,
	[CITY_ID] [varchar](4000) NULL,
	[POSTAL_CODE] [varchar](4000) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ext_authors]    Script Date: 2/9/2022 1:57:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ext_authors](
	[AUTHOR_ID] [varchar](4000) NULL,
	[AUTHOR_NAME] [varchar](4000) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ext_books]    Script Date: 2/9/2022 1:57:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ext_books](
	[BOOK_ID] [varchar](4000) NULL,
	[ISBN] [varchar](4000) NULL,
	[PUBLISHER] [varchar](4000) NULL,
	[BOOK_TITLE] [varchar](4000) NULL,
	[BOOK_AUTHOR] [varchar](4000) NULL,
	[YEAR_OF_PUBLICATION] [varchar](4000) NULL,
	[AUTHOR_ID] [varchar](4000) NULL,
	[CATEGORY_ID] [varchar](4000) NULL,
	[CATEGORY] [varchar](4000) NULL,
	[SUB_CATEGORY_ID] [varchar](4000) NULL,
	[SUB_CATEGORY] [varchar](4000) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ext_cities]    Script Date: 2/9/2022 1:57:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ext_cities](
	[CITY_ID] [varchar](4000) NULL,
	[CITY] [varchar](4000) NULL,
	[COUNTRY_ID] [varchar](4000) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ext_country]    Script Date: 2/9/2022 1:57:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ext_country](
	[COUNTRY_ID] [varchar](4000) NULL,
	[COUNTRY] [varchar](4000) NULL,
	[REGION_ID] [varchar](4000) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ext_customers]    Script Date: 2/9/2022 1:57:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ext_customers](
	[CUSTOMER_ID] [varchar](4000) NULL,
	[FIRST_NAME] [varchar](4000) NULL,
	[LAST_NAME] [varchar](4000) NULL,
	[GENDER] [varchar](4000) NULL,
	[DATE_OF_BIRTH] [varchar](4000) NULL,
	[ADDRESS_ID] [varchar](4000) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ext_employees]    Script Date: 2/9/2022 1:57:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ext_employees](
	[EMPLOYEE_ID] [varchar](4000) NULL,
	[FIRST_NAME] [varchar](4000) NULL,
	[LAST_NAME] [varchar](4000) NULL,
	[POST_ID] [varchar](4000) NULL,
	[STORE_ID] [varchar](4000) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ext_posts]    Script Date: 2/9/2022 1:57:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ext_posts](
	[POST_ID] [varchar](4000) NULL,
	[POST_NAME] [varchar](4000) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ext_regions]    Script Date: 2/9/2022 1:57:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ext_regions](
	[REGION_ID] [varchar](4000) NULL,
	[REGION_NAME] [varchar](4000) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ext_stores]    Script Date: 2/9/2022 1:57:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ext_stores](
	[STORE_ID] [varchar](4000) NULL,
	[STORE_NAME] [varchar](4000) NULL,
	[STORE_TYPE_ID] [varchar](4000) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ext_transaction_retail]    Script Date: 2/9/2022 1:57:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ext_transaction_retail](
	[SALE_ID] [varchar](4000) NULL,
	[INVOICE] [varchar](4000) NULL,
	[STORE_ID] [varchar](4000) NULL,
	[QUANTITY] [varchar](4000) NULL,
	[PRICE] [varchar](4000) NULL,
	[CUSTOMER_ID] [varchar](4000) NULL,
	[INVOICE_DATE] [varchar](4000) NULL,
	[SALE_AMOUNT] [varchar](4000) NULL,
	[ADDRESS_ID] [varchar](4000) NULL,
	[EMPLOYEE_ID] [varchar](4000) NULL,
	[type_payment_id] [varchar](4000) NULL,
	[BOOK_ID] [varchar](4000) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ext_type_payments]    Script Date: 2/9/2022 1:57:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ext_type_payments](
	[TYPE_PAYMENT_ID] [varchar](4000) NULL,
	[TYPE_PAYMENT] [varchar](4000) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ext_type_stores]    Script Date: 2/9/2022 1:57:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ext_type_stores](
	[TYPE_STORE_ID] [varchar](4000) NULL,
	[TYPE_STORE] [varchar](4000) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sa_address]    Script Date: 2/9/2022 1:57:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sa_address](
	[ADDRESS_ID] [varchar](4000) NULL,
	[ADDRESS] [varchar](4000) NULL,
	[ADDRESS2] [varchar](4000) NULL,
	[DISTRICT] [varchar](4000) NULL,
	[CITY_ID] [varchar](4000) NULL,
	[POSTAL_CODE] [varchar](4000) NULL,
	[INSERT_DT] [date] NULL,
	[UPDATE_DT] [date] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sa_authors]    Script Date: 2/9/2022 1:57:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sa_authors](
	[AUTHOR_ID] [varchar](4000) NULL,
	[AUTHOR_NAME] [varchar](4000) NULL,
	[INSERT_DT] [date] NULL,
	[UPDATE_DT] [date] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sa_books]    Script Date: 2/9/2022 1:57:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sa_books](
	[BOOK_ID] [varchar](4000) NULL,
	[ISBN] [varchar](4000) NULL,
	[PUBLISHER] [varchar](4000) NULL,
	[BOOK_TITLE] [varchar](4000) NULL,
	[BOOK_AUTHOR] [varchar](4000) NULL,
	[YEAR_OF_PUBLICATION] [varchar](4000) NULL,
	[AUTHOR_ID] [varchar](4000) NULL,
	[CATEGORY_ID] [varchar](4000) NULL,
	[CATEGORY] [varchar](4000) NULL,
	[SUB_CATEGORY_ID] [varchar](4000) NULL,
	[SUB_CATEGORY] [varchar](4000) NULL,
	[INSERT_DT] [date] NULL,
	[UPDATE_DT] [date] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sa_cities]    Script Date: 2/9/2022 1:57:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sa_cities](
	[CITY_ID] [varchar](4000) NULL,
	[CITY] [varchar](4000) NULL,
	[COUNTRY_ID] [varchar](4000) NULL,
	[INSERT_DT] [date] NULL,
	[UPDATE_DT] [date] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sa_countries]    Script Date: 2/9/2022 1:57:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sa_countries](
	[COUNTRY_ID] [varchar](4000) NULL,
	[COUNTRY] [varchar](4000) NULL,
	[REGION_ID] [varchar](4000) NULL,
	[INSERT_DT] [date] NULL,
	[UPDATE_DT] [date] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sa_customers_retail]    Script Date: 2/9/2022 1:57:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sa_customers_retail](
	[CUSTOMER_ID] [varchar](4000) NULL,
	[FIRST_NAME] [varchar](4000) NULL,
	[LAST_NAME] [varchar](4000) NULL,
	[GENDER] [varchar](4000) NULL,
	[DATE_OF_BIRTH] [varchar](4000) NULL,
	[ADDRESS_ID] [varchar](4000) NULL,
	[INSERT_DT] [date] NULL,
	[UPDATE_DT] [date] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sa_employees]    Script Date: 2/9/2022 1:57:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sa_employees](
	[EMPLOYEE_ID] [varchar](4000) NULL,
	[FIRST_NAME] [varchar](4000) NULL,
	[LAST_NAME] [varchar](4000) NULL,
	[POST_ID] [varchar](4000) NULL,
	[STORE_ID] [varchar](4000) NULL,
	[INSERT_DT] [date] NULL,
	[UPDATE_DT] [date] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sa_posts]    Script Date: 2/9/2022 1:57:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sa_posts](
	[POST_ID] [varchar](4000) NULL,
	[POST_NAME] [varchar](4000) NULL,
	[INSERT_DT] [date] NULL,
	[UPDATE_DT] [date] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sa_regions]    Script Date: 2/9/2022 1:57:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sa_regions](
	[REGION_ID] [varchar](4000) NULL,
	[REGION_NAME] [varchar](4000) NULL,
	[INSERT_DT] [date] NULL,
	[UPDATE_DT] [date] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sa_stores]    Script Date: 2/9/2022 1:57:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sa_stores](
	[STORE_ID] [varchar](4000) NULL,
	[STORE_NAME] [varchar](4000) NULL,
	[STORE_TYPE_ID] [varchar](4000) NULL,
	[IS_CPROCESSED] [varchar](1) NULL,
	[INSERT_DT] [date] NULL,
	[UPDATE_DT] [date] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sa_transaction_retail]    Script Date: 2/9/2022 1:57:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sa_transaction_retail](
	[SALE_ID] [varchar](4000) NULL,
	[INVOICE] [varchar](4000) NULL,
	[STORE_ID] [varchar](4000) NULL,
	[QUANTITY] [varchar](4000) NULL,
	[PRICE] [varchar](4000) NULL,
	[CUSTOMER_ID] [varchar](4000) NULL,
	[INVOICE_DATE] [varchar](4000) NULL,
	[SALE_AMOUNT] [varchar](4000) NULL,
	[ADDRESS_ID] [varchar](4000) NULL,
	[EMPLOYEE_ID] [varchar](4000) NULL,
	[TYPE_PAYMENT_ID] [varchar](4000) NULL,
	[BOOK_ID] [varchar](4000) NULL,
	[INSERT_DT] [date] NULL,
	[UPDATE_DT] [date] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sa_type_payments]    Script Date: 2/9/2022 1:57:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sa_type_payments](
	[TYPE_PAYMENT_ID] [varchar](4000) NULL,
	[TYPE_PAYMENT] [varchar](4000) NULL,
	[INSERT_DT] [date] NULL,
	[UPDATE_DT] [date] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sa_type_stores]    Script Date: 2/9/2022 1:57:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sa_type_stores](
	[TYPE_STORE_ID] [varchar](4000) NULL,
	[TYPE_STORE] [varchar](4000) NULL,
	[INSERT_DT] [date] NULL,
	[UPDATE_DT] [date] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[sa_address] ADD  DEFAULT (getdate()) FOR [INSERT_DT]
GO
ALTER TABLE [dbo].[sa_address] ADD  DEFAULT (getdate()) FOR [UPDATE_DT]
GO
ALTER TABLE [dbo].[sa_authors] ADD  DEFAULT (getdate()) FOR [INSERT_DT]
GO
ALTER TABLE [dbo].[sa_authors] ADD  DEFAULT (getdate()) FOR [UPDATE_DT]
GO
ALTER TABLE [dbo].[sa_books] ADD  DEFAULT (getdate()) FOR [INSERT_DT]
GO
ALTER TABLE [dbo].[sa_books] ADD  DEFAULT (getdate()) FOR [UPDATE_DT]
GO
ALTER TABLE [dbo].[sa_cities] ADD  DEFAULT (getdate()) FOR [INSERT_DT]
GO
ALTER TABLE [dbo].[sa_cities] ADD  DEFAULT (getdate()) FOR [UPDATE_DT]
GO
ALTER TABLE [dbo].[sa_countries] ADD  DEFAULT (getdate()) FOR [INSERT_DT]
GO
ALTER TABLE [dbo].[sa_countries] ADD  DEFAULT (getdate()) FOR [UPDATE_DT]
GO
ALTER TABLE [dbo].[sa_customers_retail] ADD  DEFAULT (getdate()) FOR [INSERT_DT]
GO
ALTER TABLE [dbo].[sa_customers_retail] ADD  DEFAULT (getdate()) FOR [UPDATE_DT]
GO
ALTER TABLE [dbo].[sa_employees] ADD  DEFAULT (getdate()) FOR [INSERT_DT]
GO
ALTER TABLE [dbo].[sa_employees] ADD  DEFAULT (getdate()) FOR [UPDATE_DT]
GO
ALTER TABLE [dbo].[sa_posts] ADD  DEFAULT (getdate()) FOR [INSERT_DT]
GO
ALTER TABLE [dbo].[sa_posts] ADD  DEFAULT (getdate()) FOR [UPDATE_DT]
GO
ALTER TABLE [dbo].[sa_regions] ADD  DEFAULT (getdate()) FOR [INSERT_DT]
GO
ALTER TABLE [dbo].[sa_regions] ADD  DEFAULT (getdate()) FOR [UPDATE_DT]
GO
ALTER TABLE [dbo].[sa_stores] ADD  DEFAULT (getdate()) FOR [INSERT_DT]
GO
ALTER TABLE [dbo].[sa_stores] ADD  DEFAULT (getdate()) FOR [UPDATE_DT]
GO
ALTER TABLE [dbo].[sa_transaction_retail] ADD  DEFAULT (getdate()) FOR [INSERT_DT]
GO
ALTER TABLE [dbo].[sa_transaction_retail] ADD  DEFAULT (getdate()) FOR [UPDATE_DT]
GO
ALTER TABLE [dbo].[sa_type_payments] ADD  DEFAULT (getdate()) FOR [INSERT_DT]
GO
ALTER TABLE [dbo].[sa_type_payments] ADD  DEFAULT (getdate()) FOR [UPDATE_DT]
GO
ALTER TABLE [dbo].[sa_type_stores] ADD  DEFAULT (getdate()) FOR [INSERT_DT]
GO
ALTER TABLE [dbo].[sa_type_stores] ADD  DEFAULT (getdate()) FOR [UPDATE_DT]
GO
/****** Object:  StoredProcedure [dbo].[ld_sa_address]    Script Date: 2/9/2022 1:57:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[ld_sa_address] AS
BEGIN  
	BEGIN TRY
		BEGIN TRANSACTION;
		TRUNCATE TABLE ext_address;

		BULK INSERT ext_address
		FROM 'input/address.csv'
		WITH (DATA_SOURCE = 'AzureBlobStorageDataSourceETL',
			  FIRSTROW = 2,
			  FIELDTERMINATOR =',')

		MERGE INTO sa_address target              
		USING (SELECT ADDRESS_ID,
					  ADDRESS,
					  ADDRESS2,
					  DISTRICT,
					  CITY_ID,
					  POSTAL_CODE
			   FROM ext_address) source       
			ON (target.ADDRESS_ID = source.ADDRESS_ID) 
        
		WHEN MATCHED 
		AND (IIF(target.ADDRESS = upper(source.ADDRESS), 0, 1) + 
			 IIF(target.ADDRESS2 = upper(source.ADDRESS2), 0, 1) +
			 IIF(target.DISTRICT = upper(source.DISTRICT), 0, 1) + 
			 IIF(target.POSTAL_CODE = upper(source.POSTAL_CODE), 0, 1) +
			 IIF(target.CITY_ID = source.CITY_ID, 0, 1) ) > 0 
	 
		THEN
			UPDATE SET target.ADDRESS = upper(source.ADDRESS),
					   target.ADDRESS2 = upper(source.ADDRESS2), 
					   target.DISTRICT = upper(source.DISTRICT),
					   target.CITY_ID = source.CITY_ID,
					   target.POSTAL_CODE = source.POSTAL_CODE,
					   target.UPDATE_DT  = GETDATE()
         
		WHEN NOT MATCHED THEN 
			INSERT (ADDRESS_ID, ADDRESS, ADDRESS2, DISTRICT, CITY_ID, POSTAL_CODE, INSERT_DT, UPDATE_DT) 
			VALUES (source.ADDRESS_ID, upper(source.ADDRESS), upper(source.ADDRESS2), upper(source.DISTRICT), source.CITY_ID, source.POSTAL_CODE, GETDATE(), GETDATE());
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
GO
/****** Object:  StoredProcedure [dbo].[ld_sa_authors]    Script Date: 2/9/2022 1:57:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[ld_sa_authors] AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION;
		TRUNCATE TABLE ext_authors;

		BULK INSERT ext_authors
		FROM 'input/author.csv'
		WITH (DATA_SOURCE = 'AzureBlobStorageDataSourceETL',
			  FIRSTROW = 2,
			  FIELDTERMINATOR =',');

		MERGE INTO sa_authors target              
		USING (SELECT AUTHOR_ID,
					  AUTHOR_NAME
			   FROM ext_authors) source       
			ON (target.AUTHOR_ID = source.AUTHOR_ID) 
         
		WHEN MATCHED 
		AND IIF(target.AUTHOR_NAME = upper(source.AUTHOR_NAME), 0, 1) > 0
		THEN
			UPDATE SET target.AUTHOR_NAME = upper(source.AUTHOR_NAME),
					   target.UPDATE_DT  = GETDATE()

		WHEN NOT MATCHED THEN 
			INSERT (AUTHOR_ID, AUTHOR_NAME, INSERT_DT, UPDATE_DT) 
			VALUES (source.AUTHOR_ID, upper(source.AUTHOR_NAME), GETDATE(), GETDATE()); 
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
GO
/****** Object:  StoredProcedure [dbo].[ld_sa_books]    Script Date: 2/9/2022 1:57:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[ld_sa_books] AS
BEGIN   
	BEGIN TRY
		BEGIN TRANSACTION;
		TRUNCATE TABLE ext_books;

		BULK INSERT ext_books
		FROM 'input/book.csv'
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
GO
/****** Object:  StoredProcedure [dbo].[ld_sa_cities]    Script Date: 2/9/2022 1:57:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[ld_sa_cities] AS
BEGIN   
	BEGIN TRY
		BEGIN TRANSACTION;
		TRUNCATE TABLE ext_cities;

		BULK INSERT ext_cities
		FROM 'input/city.csv'
		WITH (DATA_SOURCE = 'AzureBlobStorageDataSourceETL',
			  FIRSTROW = 2,
			  FORMAT = 'CSV');

		 MERGE INTO sa_cities target              
		 USING (SELECT CITY_ID,
					   CITY,
					   COUNTRY_ID
				FROM ext_cities) source       
			 ON (target.CITY_ID = source.CITY_ID) 
         
		 WHEN MATCHED 
		 AND ( IIF(target.CITY = upper(source.CITY), 0, 1) +
			   IIF(target.COUNTRY_ID = source.COUNTRY_ID, 0, 1) ) > 0 
		 THEN
			 UPDATE SET target.CITY = upper(source.CITY),
						target.COUNTRY_ID = source.COUNTRY_ID, 
						target.UPDATE_DT  = GETDATE()
 
         
		 WHEN NOT MATCHED THEN 
			 INSERT (CITY_ID, CITY, COUNTRY_ID, INSERT_DT, UPDATE_DT) 
			 VALUES (source.CITY_ID, upper(source.CITY), source.COUNTRY_ID, GETDATE(), GETDATE());
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
GO
/****** Object:  StoredProcedure [dbo].[ld_sa_countries]    Script Date: 2/9/2022 1:57:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[ld_sa_countries] AS
BEGIN   
	BEGIN TRY
		BEGIN TRANSACTION;
		TRUNCATE TABLE ext_country;

		BULK INSERT ext_country
		FROM 'input/country.csv'
		WITH (DATA_SOURCE = 'AzureBlobStorageDataSourceETL',
			  FIRSTROW = 2,
			  FORMAT = 'CSV');

		 MERGE INTO sa_countries target              
		 USING (SELECT COUNTRY_ID,
					   COUNTRY,
					   REGION_ID
				FROM ext_country) source       
			 ON (target.COUNTRY_ID = source.COUNTRY_ID) 
         
		 WHEN MATCHED 
		 AND ( IIF(target.COUNTRY = upper(source.COUNTRY), 0, 1) +
			   IIF(target.REGION_ID = source.REGION_ID, 0, 1) ) > 0
		 THEN
			 UPDATE SET target.COUNTRY = upper(source.COUNTRY),
						target.REGION_ID = source.REGION_ID, 
						target.UPDATE_DT  = GETDATE()
         
		 WHEN NOT MATCHED 
		 AND source.COUNTRY IS NOT NULL 
		 THEN 
			 INSERT (COUNTRY_ID, COUNTRY, REGION_ID, INSERT_DT, UPDATE_DT) 
			 VALUES (source.COUNTRY_ID, upper(source.COUNTRY), source.REGION_ID, GETDATE(), GETDATE());
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
GO
/****** Object:  StoredProcedure [dbo].[ld_sa_customers_retail]    Script Date: 2/9/2022 1:57:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[ld_sa_customers_retail] AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION;
		TRUNCATE TABLE ext_customers;

		BULK INSERT ext_customers
		FROM 'input/customer.csv'
		WITH (DATA_SOURCE = 'AzureBlobStorageDataSourceETL',
			  FIRSTROW = 2,
			  FORMAT = 'CSV'); 

		MERGE INTO sa_customers_retail target              
		USING (SELECT CUSTOMER_ID,              
					  FIRST_NAME,
					  LAST_NAME,
					  GENDER,
					  DATE_OF_BIRTH,
					  ADDRESS_ID                      
			   FROM ext_customers) source       
			ON (target.CUSTOMER_ID = source.CUSTOMER_ID)   
         
		WHEN MATCHED 
		AND ( IIF(target.FIRST_NAME = upper(source.FIRST_NAME), 0, 1) +
			  IIF(target.LAST_NAME = upper(source.LAST_NAME), 0, 1) +
			  IIF(target.GENDER = upper(source.GENDER), 0, 1) +
			  IIF(target.DATE_OF_BIRTH = source.DATE_OF_BIRTH, 0, 1) +
			  IIF(target.ADDRESS_ID = source.ADDRESS_ID, 0, 1) ) > 0
		THEN
			UPDATE SET target.FIRST_NAME = upper(source.FIRST_NAME),
					   target.LAST_NAME = upper(source.LAST_NAME),
					   target.GENDER = upper(source.GENDER),
					   target.DATE_OF_BIRTH = source.DATE_OF_BIRTH,               
					   target.ADDRESS_ID = source.ADDRESS_ID, 
					   target.UPDATE_DT  = GETDATE()
         
		WHEN NOT MATCHED THEN 
			INSERT (CUSTOMER_ID, FIRST_NAME, LAST_NAME, GENDER, DATE_OF_BIRTH, ADDRESS_ID, INSERT_DT, UPDATE_DT) 
			VALUES (source.CUSTOMER_ID, upper(source.FIRST_NAME), upper(source.LAST_NAME), upper(source.GENDER), source.DATE_OF_BIRTH, source.ADDRESS_ID, GETDATE(), GETDATE());
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
GO
/****** Object:  StoredProcedure [dbo].[ld_sa_customers_stock]    Script Date: 2/9/2022 1:57:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[ld_sa_customers_stock] AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION;
		TRUNCATE TABLE ext_stock_customers;

		BULK INSERT ext_stock_customers
		FROM 'input/customer_stock.csv'
		WITH (DATA_SOURCE = 'AzureBlobStorageDataSourceETL',
			  FIRSTROW = 2,
			  FORMAT = 'CSV');
		  
		MERGE INTO sa_customers_stock target              
		USING (SELECT CUSTOMER_ID,              
					  NAME_OF_ORGANIZATION,
					  HEAD_OF_ORGANIZATION,
					  EMAIL,
					  IBAN,
					  ADDRESS_ID              
			   FROM ext_stock_customers) source       
			ON (target.CUSTOMER_ID = source.CUSTOMER_ID)   
        
		WHEN MATCHED 
		AND (IIF(target.NAME_OF_ORGANIZATION = upper(source.NAME_OF_ORGANIZATION), 0, 1) + 
			 IIF(target.HEAD_OF_ORGANIZATION = upper(source.HEAD_OF_ORGANIZATION), 0, 1) + 
			 IIF(target.EMAIL = upper(source.EMAIL), 0, 1) + 
			 IIF(target.IBAN = source.IBAN, 0, 1) + 
			 IIF(target.ADDRESS_ID = source.ADDRESS_ID, 0, 1) ) >0 
		THEN
			UPDATE SET target.NAME_OF_ORGANIZATION = upper(source.NAME_OF_ORGANIZATION),
					   target.HEAD_OF_ORGANIZATION = upper(source.HEAD_OF_ORGANIZATION),
					   target.EMAIL = upper(source.EMAIL),
					   target.IBAN = source.IBAN,               
					   target.ADDRESS_ID = source.ADDRESS_ID, 
					   target.UPDATE_DT  = GETDATE()
        
		WHEN NOT MATCHED
		AND source.NAME_OF_ORGANIZATION IS NOT NULL
		THEN 
			INSERT (CUSTOMER_ID, NAME_OF_ORGANIZATION, HEAD_OF_ORGANIZATION, EMAIL, IBAN, ADDRESS_ID, INSERT_DT, UPDATE_DT) 
			VALUES (source.CUSTOMER_ID, upper(source.NAME_OF_ORGANIZATION), upper(source.HEAD_OF_ORGANIZATION), upper(source.EMAIL), source.IBAN, source.ADDRESS_ID, GETDATE(), GETDATE());
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
GO
/****** Object:  StoredProcedure [dbo].[ld_sa_employees]    Script Date: 2/9/2022 1:57:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[ld_sa_employees] AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION;
		TRUNCATE TABLE ext_employees;

		BULK INSERT ext_employees
		FROM 'input/employee.csv'
		WITH (DATA_SOURCE = 'AzureBlobStorageDataSourceETL',
			  FIRSTROW = 2,
			  FORMAT = 'CSV');

		 MERGE INTO sa_employees target              
		 USING (SELECT EMPLOYEE_ID,
					   FIRST_NAME,
					   LAST_NAME,
					   POST_ID,
					   STORE_ID
				FROM ext_employees) source       
			 ON (target.EMPLOYEE_ID = source.EMPLOYEE_ID) 
         
		 WHEN MATCHED 
		 AND (IIF(target.FIRST_NAME = upper(source.FIRST_NAME), 0, 1) +
			  IIF(target.LAST_NAME = upper(source.LAST_NAME), 0, 1) +
			  IIF(target.STORE_ID = source.STORE_ID, 0, 1) +
			  IIF(target.POST_ID = source.POST_ID, 0, 1)) > 0
		 THEN
			 UPDATE SET target.FIRST_NAME = upper(source.FIRST_NAME),
						target.LAST_NAME = upper(source.LAST_NAME),    
						target.POST_ID = source.POST_ID, 
						target.STORE_ID = source.STORE_ID, 
						target.UPDATE_DT  = GETDATE()
                   
		 WHEN NOT MATCHED THEN 
			 INSERT (EMPLOYEE_ID, FIRST_NAME, LAST_NAME, POST_ID, STORE_ID, INSERT_DT, UPDATE_DT) 
			 VALUES (source.EMPLOYEE_ID, upper(source.FIRST_NAME), upper(source.LAST_NAME), source.POST_ID, source.STORE_ID, GETDATE(), GETDATE());
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
GO
/****** Object:  StoredProcedure [dbo].[ld_sa_posts]    Script Date: 2/9/2022 1:57:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[ld_sa_posts] AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION;
		TRUNCATE TABLE ext_posts;

		BULK INSERT ext_posts
		FROM 'input/post.csv'
		WITH (DATA_SOURCE = 'AzureBlobStorageDataSourceETL',
			  FIRSTROW = 2,
			  FORMAT = 'CSV');

		 MERGE INTO sa_posts target              
		 USING (SELECT POST_ID,
					   POST_NAME
				FROM ext_posts) source       
			 ON (target.POST_ID = source.POST_ID) 
         
		 WHEN MATCHED 
		 AND IIF(target.POST_NAME = upper(source.POST_NAME), 0, 1) > 0
		 THEN
			 UPDATE SET target.POST_NAME = upper(source.POST_NAME),
						target.UPDATE_DT  = GETDATE()
         
		 WHEN NOT MATCHED 
		 AND source.POST_ID IS NOT NULL
		 THEN 
			 INSERT (POST_ID, POST_NAME, INSERT_DT, UPDATE_DT) 
			 VALUES (source.POST_ID, upper(source.POST_NAME), GETDATE(), GETDATE()); 
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
   
GO
/****** Object:  StoredProcedure [dbo].[ld_sa_regions]    Script Date: 2/9/2022 1:57:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[ld_sa_regions] AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION;
		TRUNCATE TABLE ext_regions;

		BULK INSERT ext_regions
		FROM 'input/region.csv'
		WITH (DATA_SOURCE = 'AzureBlobStorageDataSourceETL',
			  FIRSTROW = 2,
			  FORMAT = 'CSV');

		 MERGE INTO sa_regions target              
		 USING (SELECT REGION_ID,
					   REGION_NAME
				FROM ext_regions) source       
			 ON (target.REGION_ID = source.REGION_ID) 
         
		 WHEN MATCHED 
		 AND IIF(target.REGION_NAME = upper(source.REGION_NAME), 0, 1) > 0 
		 THEN
			 UPDATE SET target.REGION_NAME = upper(source.REGION_NAME),
						target.UPDATE_DT  = GETDATE()
         
		 WHEN NOT MATCHED THEN 
			 INSERT (REGION_ID, REGION_NAME, INSERT_DT, UPDATE_DT) 
			 VALUES (source.REGION_ID, upper(source.REGION_NAME), GETDATE(), GETDATE());
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
GO
/****** Object:  StoredProcedure [dbo].[ld_sa_stores]    Script Date: 2/9/2022 1:57:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[ld_sa_stores] AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION;
		TRUNCATE TABLE ext_stores;

		BULK INSERT ext_stores
		FROM 'input/stores.csv'
		WITH (DATA_SOURCE = 'AzureBlobStorageDataSourceETL',
			  FIRSTROW = 2,
			  FORMAT = 'CSV');

		MERGE INTO sa_stores target              
		USING (SELECT STORE_ID,              
					  STORE_NAME,
					  STORE_TYPE_ID         
			   FROM ext_stores) source       
			ON (target.STORE_ID = source.STORE_ID)   
         
		WHEN MATCHED 
		AND ( IIF(target.STORE_NAME = upper(source.STORE_NAME), 0, 1) +
			  IIF(target.STORE_TYPE_ID = source.STORE_TYPE_ID, 0, 1) ) > 0 
		THEN
			UPDATE SET target.STORE_NAME = upper(source.STORE_NAME),
					   target.STORE_TYPE_ID = source.STORE_TYPE_ID, 
					   target.IS_CPROCESSED = 'N',
					   target.UPDATE_DT  = GETDATE()
         
		WHEN NOT MATCHED THEN 
			INSERT (STORE_ID, STORE_NAME, STORE_TYPE_ID, IS_CPROCESSED, INSERT_DT, UPDATE_DT) 
			VALUES (source.STORE_ID, upper(source.STORE_NAME), source.STORE_TYPE_ID, 'N', GETDATE(), GETDATE());
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
GO
/****** Object:  StoredProcedure [dbo].[ld_sa_transaction_retail]    Script Date: 2/9/2022 1:57:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[ld_sa_transaction_retail] AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION;
		TRUNCATE TABLE ext_transaction_retail;

		BULK INSERT ext_transaction_retail
		FROM 'input/b_transaction_600000.csv'
		WITH (DATA_SOURCE = 'AzureBlobStorageDataSourceETL',
			  FIRSTROW = 2,
			  FORMAT = 'CSV');

		 MERGE INTO sa_transaction_retail target              
		 USING (SELECT SALE_ID,
					   INVOICE,
					   STORE_ID,
					   QUANTITY,
					   PRICE,
					   CUSTOMER_ID,
					   INVOICE_DATE,
					   SALE_AMOUNT,
					   ADDRESS_ID,
					   EMPLOYEE_ID,
					   type_payment_id,
					   BOOK_ID
				FROM ext_transaction_retail) source       
			 ON (target.SALE_ID = source.SALE_ID) 
         
		 WHEN MATCHED 
		 AND (IIF(target.INVOICE = upper(source.INVOICE), 0, 1) +
			  IIF(target.STORE_ID = source.STORE_ID, 0, 1) + 
			  IIF(target.QUANTITY = source.QUANTITY, 0, 1) +
			  IIF(target.PRICE = source.PRICE, 0, 1) +
			  IIF(target.CUSTOMER_ID = source.CUSTOMER_ID, 0, 1) +
			  IIF(target.INVOICE_DATE = source.INVOICE_DATE, 0, 1) +
			  IIF(target.SALE_AMOUNT = source.SALE_AMOUNT, 0, 1) + 
			  IIF(target.ADDRESS_ID = source.ADDRESS_ID, 0, 1) + 
			  IIF(target.EMPLOYEE_ID = source.EMPLOYEE_ID, 0, 1) + 
			  IIF(target.type_payment_id = source.type_payment_id, 0, 1) + 
			  IIF(target.book_id = source.book_id, 0, 1) ) > 0 
		 THEN
			 UPDATE SET target.INVOICE = upper(source.INVOICE),
						target.STORE_ID = source.STORE_ID, 
						target.QUANTITY = source.QUANTITY,
						target.PRICE = source.PRICE,
						target.CUSTOMER_ID = source.CUSTOMER_ID,
						target.INVOICE_DATE = source.INVOICE_DATE,
						target.SALE_AMOUNT = source.SALE_AMOUNT,
						target.ADDRESS_ID = source.ADDRESS_ID,
						target.EMPLOYEE_ID = source.EMPLOYEE_ID,
						target.type_payment_id = source.type_payment_id,
						target.book_id = source.book_id,
						target.UPDATE_DT  = GETDATE()
         
		 WHEN NOT MATCHED THEN 
			 INSERT (SALE_ID, INVOICE, STORE_ID, QUANTITY, 
					 PRICE, CUSTOMER_ID, INVOICE_DATE, SALE_AMOUNT, 
					 ADDRESS_ID, EMPLOYEE_ID, type_payment_id, 
					 book_id, INSERT_DT, UPDATE_DT) 
			 VALUES (source.SALE_ID, upper(source.INVOICE),source.STORE_ID, source.QUANTITY, 
					 source.PRICE, source.CUSTOMER_ID, source.INVOICE_DATE, source.SALE_AMOUNT, 
					 source.ADDRESS_ID, source.EMPLOYEE_ID, source.type_payment_id, 
					 source.book_id, GETDATE(), GETDATE()); 
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
GO
/****** Object:  StoredProcedure [dbo].[ld_sa_transaction_stock]    Script Date: 2/9/2022 1:57:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[ld_sa_transaction_stock] AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION;
		TRUNCATE TABLE ext_transaction_stock;

		BULK INSERT ext_transaction_stock
		FROM 'input/b_transaction_400000.csv'
		WITH (DATA_SOURCE = 'AzureBlobStorageDataSourceETL',
			  FIRSTROW = 2,
			  FORMAT = 'CSV');
		  
		 MERGE INTO sa_transaction_stock target              
		 USING (SELECT SALE_ID,
					   INVOICE,
					   STORE_ID,
					   QUANTITY,
					   PRICE,
					   CUSTOMER_ID,
					   INVOICE_DATE,
					   SALE_AMOUNT,
					   ADDRESS_ID,
					   EMPLOYEE_ID,
					   type_payment_id,
					   BOOK_ID
				FROM ext_transaction_stock) source       
			 ON (target.SALE_ID = source.SALE_ID) 
         
		 WHEN MATCHED 
		 AND (IIF(target.INVOICE = upper(source.INVOICE), 0, 1) +
			  IIF(target.STORE_ID = source.STORE_ID, 0, 1) + 
			  IIF(target.QUANTITY = source.QUANTITY, 0, 1) + 
			  IIF(target.PRICE = source.PRICE, 0, 1) + 
			  IIF(target.CUSTOMER_ID = source.CUSTOMER_ID, 0, 1) + 
			  IIF(target.INVOICE_DATE = source.INVOICE_DATE, 0, 1) + 
			  IIF(target.SALE_AMOUNT = source.SALE_AMOUNT, 0, 1) + 
			  IIF(target.ADDRESS_ID = source.ADDRESS_ID, 0, 1) + 
			  IIF(target.EMPLOYEE_ID = source.EMPLOYEE_ID, 0, 1) + 
			  IIF(target.type_payment_id = source.type_payment_id, 0, 1) + 
			  IIF(target.BOOK_ID = source.BOOK_ID, 0, 1) ) > 0  
		 THEN
			 UPDATE SET target.INVOICE = upper(source.INVOICE),
						target.STORE_ID = source.STORE_ID, 
						target.QUANTITY = source.QUANTITY,
						target.PRICE = source.PRICE,
						target.CUSTOMER_ID = source.CUSTOMER_ID,
						target.INVOICE_DATE = source.INVOICE_DATE,
						target.SALE_AMOUNT = source.SALE_AMOUNT,
						target.ADDRESS_ID = source.ADDRESS_ID,
						target.EMPLOYEE_ID = source.EMPLOYEE_ID,
						target.type_payment_id = source.type_payment_id,
						target.BOOK_ID = source.BOOK_ID,              
						target.UPDATE_DT  = GETDATE()
         
		 WHEN NOT MATCHED THEN 
			 INSERT (SALE_ID, INVOICE, STORE_ID, QUANTITY, 
					 PRICE, CUSTOMER_ID, INVOICE_DATE, SALE_AMOUNT, 
					 ADDRESS_ID, EMPLOYEE_ID, type_payment_id, 
					 BOOK_ID, INSERT_DT, UPDATE_DT) 
			 VALUES (source.SALE_ID, upper(source.INVOICE),source.STORE_ID, source.QUANTITY, 
					 source.PRICE, source.CUSTOMER_ID, source.INVOICE_DATE, source.SALE_AMOUNT,
					 source.ADDRESS_ID, source.EMPLOYEE_ID, source.type_payment_id, 
					 source.BOOK_ID, GETDATE(), GETDATE()); 
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
GO
/****** Object:  StoredProcedure [dbo].[ld_sa_type_payments]    Script Date: 2/9/2022 1:57:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[ld_sa_type_payments] AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION;

		TRUNCATE TABLE ext_type_payments;

		BULK INSERT ext_type_payments
		FROM 'input/type_payment.csv'
		WITH (DATA_SOURCE = 'AzureBlobStorageDataSourceETL',
			  FIRSTROW = 2,
			  FORMAT = 'CSV');		  

		 MERGE INTO sa_type_payments target              
		 USING (SELECT TYPE_PAYMENT_ID,
					   TYPE_PAYMENT
				FROM ext_type_payments ) source       
			 ON (target.TYPE_PAYMENT_ID = source.TYPE_PAYMENT_ID) 
         
		 WHEN MATCHED 
		 AND IIF(target.TYPE_PAYMENT = upper(source.TYPE_PAYMENT), 0, 1) > 0 THEN
			 UPDATE SET target.TYPE_PAYMENT = upper(source.TYPE_PAYMENT),
						target.UPDATE_DT  = GETDATE()        
         
		 WHEN NOT MATCHED THEN 
			 INSERT (TYPE_PAYMENT_ID, TYPE_PAYMENT, INSERT_DT, UPDATE_DT) 
			 VALUES (source.TYPE_PAYMENT_ID, upper(source.TYPE_PAYMENT), GETDATE(), GETDATE()); 
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
GO
/****** Object:  StoredProcedure [dbo].[ld_sa_type_stores]    Script Date: 2/9/2022 1:57:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[ld_sa_type_stores]
AS
BEGIN
BEGIN TRY
	BEGIN TRANSACTION;

	TRUNCATE TABLE ext_type_stores;

	BULK INSERT ext_type_stores
	FROM 'input/type_stores.csv'
	WITH (DATA_SOURCE = 'AzureBlobStorageDataSourceETL',
	      FIRSTROW = 2,
		  FORMAT = 'CSV');

	MERGE INTO sa_type_stores target              
	  USING (SELECT TYPE_STORE_ID,
					    TYPE_STORE
				 FROM ext_type_stores) source       
		  ON (target.TYPE_STORE_ID = source.TYPE_STORE_ID) 
        
		  WHEN MATCHED 
		  AND IIF(target.TYPE_STORE = upper(source.TYPE_STORE), 0, 1) > 0 THEN
				UPDATE SET target.TYPE_STORE = upper(source.TYPE_STORE),
						   target.UPDATE_DT  = GETDATE()
        
		  WHEN NOT MATCHED BY TARGET THEN 
				INSERT (TYPE_STORE_ID, TYPE_STORE, INSERT_DT, UPDATE_DT) 
				VALUES (source.TYPE_STORE_ID, upper(source.TYPE_STORE), GETDATE(), GETDATE()); 
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
END

GO
ALTER DATABASE [SA_RETAIL] SET  READ_WRITE 
GO
