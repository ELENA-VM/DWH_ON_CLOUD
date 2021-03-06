/****** Object:  Database [SA_STOCK]    Script Date: 2/9/2022 1:54:13 AM ******/
--CREATE DATABASE [SA_STOCK]  (EDITION = 'Basic', SERVICE_OBJECTIVE = 'Basic', MAXSIZE = 1 GB) WITH CATALOG_COLLATION = SQL_Latin1_General_CP1_CI_AS;
/****** Object:  DatabaseScopedCredential [AzureBlobStorageCredentialETL]    Script Date: 2/9/2022 1:54:14 AM ******/
CREATE DATABASE SCOPED CREDENTIAL [AzureBlobStorageCredentialETL] WITH IDENTITY = N'SHARED ACCESS SIGNATURE'
GO
/****** Object:  ExternalDataSource [AzureBlobStorageDataSourceETL]    Script Date: 2/9/2022 1:54:14 AM ******/
CREATE EXTERNAL DATA SOURCE [AzureBlobStorageDataSourceETL] WITH (TYPE = BLOB_STORAGE, LOCATION = N'https://adlstoragebooksales.blob.core.windows.net', CREDENTIAL = [AzureBlobStorageCredentialETL])
GO
/****** Object:  Table [dbo].[ext_stock_customers]    Script Date: 2/9/2022 1:54:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ext_stock_customers](
	[CUSTOMER_ID] [varchar](4000) NULL,
	[NAME_OF_ORGANIZATION] [varchar](4000) NULL,
	[HEAD_OF_ORGANIZATION] [varchar](4000) NULL,
	[EMAIL] [varchar](4000) NULL,
	[IBAN] [varchar](4000) NULL,
	[ADDRESS_ID] [varchar](4000) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ext_transaction_stock]    Script Date: 2/9/2022 1:54:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ext_transaction_stock](
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
/****** Object:  Table [dbo].[sa_customers_stock]    Script Date: 2/9/2022 1:54:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sa_customers_stock](
	[CUSTOMER_ID] [varchar](4000) NULL,
	[NAME_OF_ORGANIZATION] [varchar](4000) NULL,
	[HEAD_OF_ORGANIZATION] [varchar](4000) NULL,
	[EMAIL] [varchar](4000) NULL,
	[IBAN] [varchar](4000) NULL,
	[ADDRESS_ID] [varchar](4000) NULL,
	[INSERT_DT] [date] NULL,
	[UPDATE_DT] [date] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sa_transaction_stock]    Script Date: 2/9/2022 1:54:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sa_transaction_stock](
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
ALTER TABLE [dbo].[sa_customers_stock] ADD  DEFAULT (getdate()) FOR [INSERT_DT]
GO
ALTER TABLE [dbo].[sa_customers_stock] ADD  DEFAULT (getdate()) FOR [UPDATE_DT]
GO
ALTER TABLE [dbo].[sa_transaction_stock] ADD  DEFAULT (getdate()) FOR [INSERT_DT]
GO
ALTER TABLE [dbo].[sa_transaction_stock] ADD  DEFAULT (getdate()) FOR [UPDATE_DT]
GO
/****** Object:  StoredProcedure [dbo].[ld_sa_customers_stock]    Script Date: 2/9/2022 1:54:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[ld_sa_customers_stock] AS
BEGIN
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
END; 
GO
/****** Object:  StoredProcedure [dbo].[ld_sa_transaction_stock]    Script Date: 2/9/2022 1:54:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[ld_sa_transaction_stock] AS
BEGIN
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
END;
GO
ALTER DATABASE [SA_STOCK] SET  READ_WRITE 
GO
