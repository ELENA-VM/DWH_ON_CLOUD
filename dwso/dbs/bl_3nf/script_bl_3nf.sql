/****** Object:  Database [BL_3NF]    Script Date: 2/9/2022 2:00:02 AM ******/
-- CREATE DATABASE [BL_3NF]  (EDITION = 'Basic', SERVICE_OBJECTIVE = 'Basic', MAXSIZE = 1 GB) WITH CATALOG_COLLATION = SQL_Latin1_General_CP1_CI_AS;
/****** Object:  DatabaseScopedCredential [AzureSqlSqrverCredentialETL]    Script Date: 2/9/2022 2:00:03 AM ******/
-- CREATE MASTER KEY;
GO
--CREATE DATABASE SCOPED CREDENTIAL [AzureSqlSqrverCredentialETL] WITH IDENTITY = N'EtlAdmin', SECRET = '';
GO
/****** Object:  PartitionFunction [pf_Date]    Script Date: 2/9/2022 2:00:03 AM ******/
CREATE PARTITION FUNCTION [pf_Date](date) AS RANGE RIGHT FOR VALUES (N'2020-02-01T00:00:00.000', N'2020-03-01T00:00:00.000', N'2020-04-01T00:00:00.000', N'2020-05-01T00:00:00.000', N'2020-06-01T00:00:00.000', N'2020-07-01T00:00:00.000', N'2020-08-01T00:00:00.000', N'2020-09-01T00:00:00.000', N'2020-10-01T00:00:00.000', N'2020-11-01T00:00:00.000', N'2020-12-01T00:00:00.000', N'2021-02-01T00:00:00.000', N'2021-03-01T00:00:00.000', N'2021-04-01T00:00:00.000', N'2021-05-01T00:00:00.000', N'2021-06-01T00:00:00.000', N'2021-07-01T00:00:00.000', N'2021-08-01T00:00:00.000', N'2021-09-01T00:00:00.000', N'2021-10-01T00:00:00.000', N'2021-11-01T00:00:00.000', N'2021-12-01T00:00:00.000', N'2022-02-01T00:00:00.000', N'2022-03-01T00:00:00.000', N'2022-04-01T00:00:00.000', N'2022-05-01T00:00:00.000', N'2022-06-01T00:00:00.000', N'2022-07-01T00:00:00.000', N'2022-08-01T00:00:00.000', N'2022-09-01T00:00:00.000', N'2022-10-01T00:00:00.000', N'2022-11-01T00:00:00.000', N'2022-12-01T00:00:00.000', N'2023-02-01T00:00:00.000')
GO
/****** Object:  PartitionScheme [ps_Date]    Script Date: 2/9/2022 2:00:03 AM ******/
CREATE PARTITION SCHEME [ps_Date] AS PARTITION [pf_Date] TO ([PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY])
GO
/****** Object:  Sequence [dbo].[ce_addresses_seq]    Script Date: 2/9/2022 2:00:03 AM ******/
CREATE SEQUENCE [dbo].[ce_addresses_seq] 
 AS [bigint]
 START WITH 1
 INCREMENT BY 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 CACHE 
GO
/****** Object:  Sequence [dbo].[ce_authors_seq]    Script Date: 2/9/2022 2:00:04 AM ******/
CREATE SEQUENCE [dbo].[ce_authors_seq] 
 AS [bigint]
 START WITH 1
 INCREMENT BY 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 CACHE 
GO
/****** Object:  Sequence [dbo].[ce_books_seq]    Script Date: 2/9/2022 2:00:04 AM ******/
CREATE SEQUENCE [dbo].[ce_books_seq] 
 AS [bigint]
 START WITH 1
 INCREMENT BY 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 CACHE 
GO
/****** Object:  Sequence [dbo].[ce_categories_seq]    Script Date: 2/9/2022 2:00:04 AM ******/
CREATE SEQUENCE [dbo].[ce_categories_seq] 
 AS [bigint]
 START WITH 1
 INCREMENT BY 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 CACHE 
GO
/****** Object:  Sequence [dbo].[ce_cities_seq]    Script Date: 2/9/2022 2:00:04 AM ******/
CREATE SEQUENCE [dbo].[ce_cities_seq] 
 AS [bigint]
 START WITH 1
 INCREMENT BY 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 CACHE 
GO
/****** Object:  Sequence [dbo].[ce_countries_seq]    Script Date: 2/9/2022 2:00:04 AM ******/
CREATE SEQUENCE [dbo].[ce_countries_seq] 
 AS [bigint]
 START WITH 1
 INCREMENT BY 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 CACHE 
GO
/****** Object:  Sequence [dbo].[ce_customers_seq]    Script Date: 2/9/2022 2:00:04 AM ******/
CREATE SEQUENCE [dbo].[ce_customers_seq] 
 AS [bigint]
 START WITH 1
 INCREMENT BY 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 CACHE 
GO
/****** Object:  Sequence [dbo].[ce_employees_seq]    Script Date: 2/9/2022 2:00:05 AM ******/
CREATE SEQUENCE [dbo].[ce_employees_seq] 
 AS [bigint]
 START WITH 1
 INCREMENT BY 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 CACHE 
GO
/****** Object:  Sequence [dbo].[ce_post_seq]    Script Date: 2/9/2022 2:00:05 AM ******/
CREATE SEQUENCE [dbo].[ce_post_seq] 
 AS [bigint]
 START WITH 1
 INCREMENT BY 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 CACHE 
GO
/****** Object:  Sequence [dbo].[ce_regions_seq]    Script Date: 2/9/2022 2:00:05 AM ******/
CREATE SEQUENCE [dbo].[ce_regions_seq] 
 AS [bigint]
 START WITH 1
 INCREMENT BY 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 CACHE 
GO
/****** Object:  Sequence [dbo].[ce_stores_seq]    Script Date: 2/9/2022 2:00:05 AM ******/
CREATE SEQUENCE [dbo].[ce_stores_seq] 
 AS [bigint]
 START WITH 1
 INCREMENT BY 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 CACHE 
GO
/****** Object:  Sequence [dbo].[ce_sub_categories_seq]    Script Date: 2/9/2022 2:00:05 AM ******/
CREATE SEQUENCE [dbo].[ce_sub_categories_seq] 
 AS [bigint]
 START WITH 1
 INCREMENT BY 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 CACHE 
GO
/****** Object:  Sequence [dbo].[ce_type_payments_seq]    Script Date: 2/9/2022 2:00:06 AM ******/
CREATE SEQUENCE [dbo].[ce_type_payments_seq] 
 AS [bigint]
 START WITH 1
 INCREMENT BY 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 CACHE 
GO
/****** Object:  Sequence [dbo].[ce_type_stores_seq]    Script Date: 2/9/2022 2:00:06 AM ******/
CREATE SEQUENCE [dbo].[ce_type_stores_seq] 
 AS [bigint]
 START WITH 1
 INCREMENT BY 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 CACHE 
GO

/****** Object:  ExternalDataSource [sql_ds_sa_retail]    Script Date: 2/9/2022 2:00:06 AM ******/
CREATE EXTERNAL DATA SOURCE [sql_ds_sa_retail] WITH (TYPE = RDBMS, LOCATION = N'etlbooksalessqlservertest.database.windows.net', CREDENTIAL = [AzureSqlSqrverCredentialETL], DATABASE_NAME = N'SA_RETAIL')
GO
/****** Object:  ExternalDataSource [sql_ds_sa_stock]    Script Date: 2/9/2022 2:00:06 AM ******/
CREATE EXTERNAL DATA SOURCE [sql_ds_sa_stock] WITH (TYPE = RDBMS, LOCATION = N'etlbooksalessqlservertest.database.windows.net', CREDENTIAL = [AzureSqlSqrverCredentialETL], DATABASE_NAME = N'SA_STOCK')
GO
/****** Object:  Table [dbo].[sa_stores]    Script Date: 2/9/2022 2:00:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE EXTERNAL TABLE [dbo].[sa_stores]
(
	[STORE_ID] [varchar](4000) NULL,
	[STORE_NAME] [varchar](4000) NULL,
	[STORE_TYPE_ID] [varchar](4000) NULL,
	[IS_CPROCESSED] [varchar](1) NULL,
	[INSERT_DT] [date] NULL,
	[UPDATE_DT] [date] NULL
)
WITH (DATA_SOURCE = [sql_ds_sa_retail])
GO
/****** Object:  Table [dbo].[ce_type_stores]    Script Date: 2/9/2022 2:00:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ce_type_stores](
	[type_store_id] [bigint] NOT NULL,
	[type_store_src_id] [varchar](50) NOT NULL,
	[source_entity] [varchar](30) NOT NULL,
	[source_system] [varchar](30) NOT NULL,
	[type_store] [varchar](30) NOT NULL,
	[update_dt] [date] NOT NULL,
	[insert_dt] [date] NOT NULL,
 CONSTRAINT [ce_stores_type_pk] PRIMARY KEY CLUSTERED 
(
	[type_store_id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[v_incr_stores]    Script Date: 2/9/2022 2:00:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   VIEW [dbo].[v_incr_stores]
AS
( SELECT sast.STORE_ID,
         sast.STORE_NAME,
         COALESCE(cets.type_store_id, -1) type_store_id
  FROM sa_stores sast
  LEFT JOIN ce_type_stores cets ON sast.STORE_TYPE_ID = cets.TYPE_STORE_SRC_ID
  AND cets.SOURCE_SYSTEM = 'RETAIL'
  AND cets.SOURCE_ENTITY = 'SA_TYPE_STORES'
  WHERE sast.IS_CPROCESSED = 'N'
);         
               
                
GO
/****** Object:  Table [dbo].[sa_employees]    Script Date: 2/9/2022 2:00:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE EXTERNAL TABLE [dbo].[sa_employees]
(
	[EMPLOYEE_ID] [varchar](4000) NULL,
	[FIRST_NAME] [varchar](4000) NULL,
	[LAST_NAME] [varchar](4000) NULL,
	[POST_ID] [varchar](4000) NULL,
	[STORE_ID] [varchar](4000) NULL,
	[INSERT_DT] [date] NULL,
	[UPDATE_DT] [date] NULL
)
WITH (DATA_SOURCE = [sql_ds_sa_retail])
GO
/****** Object:  Table [dbo].[prm_mta_incremental_load]    Script Date: 2/9/2022 2:00:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[prm_mta_incremental_load](
	[incremental_load_type] [varchar](50) NOT NULL,
	[sa_table_name] [varchar](50) NOT NULL,
	[target_table_name] [varchar](50) NOT NULL,
	[package] [varchar](50) NOT NULL,
	[procedure] [varchar](50) NOT NULL,
	[previous_loaded_date] [date] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ce_stores]    Script Date: 2/9/2022 2:00:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ce_stores](
	[store_id] [bigint] NOT NULL,
	[store_src_id] [varchar](50) NOT NULL,
	[source_system] [varchar](30) NOT NULL,
	[source_entity] [varchar](30) NOT NULL,
	[store_name] [varchar](50) NOT NULL,
	[store_type_surr_id] [bigint] NOT NULL,
	[update_dt] [date] NOT NULL,
	[insert_dt] [date] NOT NULL,
 CONSTRAINT [ce_store_scd_pk] PRIMARY KEY CLUSTERED 
(
	[store_id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ce_posts]    Script Date: 2/9/2022 2:00:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ce_posts](
	[post_id] [bigint] NOT NULL,
	[post_src_id] [varchar](50) NOT NULL,
	[source_entity] [varchar](30) NOT NULL,
	[source_system] [varchar](30) NOT NULL,
	[post_name] [varchar](50) NOT NULL,
	[update_dt] [date] NOT NULL,
	[insert_dt] [date] NOT NULL,
 CONSTRAINT [ce_post_pk] PRIMARY KEY CLUSTERED 
(
	[post_id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[v_incr_employees]    Script Date: 2/9/2022 2:00:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   VIEW [dbo].[v_incr_employees]
AS
( SELECT sae.EMPLOYEE_ID,
         sae.FIRST_NAME,
         sae.LAST_NAME,
         COALESCE(cep.POST_ID, -1) POST_ID,
         COALESCE(ces.STORE_ID, -1) STORE_ID                
  FROM sa_employees sae
  LEFT JOIN ce_posts cep ON sae.POST_ID = cep.post_src_id
  LEFT JOIN ce_stores ces ON sae.STORE_ID = ces.store_src_id 
 
  WHERE sae.insert_dt > 
        ( SELECT previous_loaded_date
          FROM prm_mta_incremental_load 
          WHERE sa_table_name = 'SA_EMPLOYEES' )
     OR sae.update_dt > 
        ( SELECT previous_loaded_date 
          FROM prm_mta_incremental_load 
          WHERE sa_table_name = 'SA_EMPLOYEES' )
);         
               
                
GO
/****** Object:  Table [dbo].[ce_customers]    Script Date: 2/9/2022 2:00:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ce_customers](
	[customer_id] [bigint] NOT NULL,
	[customer_src_id] [varchar](50) NOT NULL,
	[source_system] [varchar](30) NOT NULL,
	[source_entity] [varchar](30) NOT NULL,
	[type_customer] [int] NOT NULL,
	[first_name] [varchar](50) NOT NULL,
	[last_name] [varchar](50) NOT NULL,
	[gender] [varchar](20) NOT NULL,
	[date_of_birth] [date] NOT NULL,
	[name_of_organization] [varchar](100) NOT NULL,
	[head_of_organization] [varchar](100) NOT NULL,
	[iban] [varchar](50) NOT NULL,
	[email] [varchar](50) NOT NULL,
	[address_surr_id] [bigint] NOT NULL,
	[update_dt] [date] NOT NULL,
	[insert_dt] [date] NOT NULL,
 CONSTRAINT [ce_customer_pk] PRIMARY KEY CLUSTERED 
(
	[customer_id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sa_transaction_stock]    Script Date: 2/9/2022 2:00:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE EXTERNAL TABLE [dbo].[sa_transaction_stock]
(
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
)
WITH (DATA_SOURCE = [sql_ds_sa_stock])
GO
/****** Object:  Table [dbo].[sa_transaction_retail]    Script Date: 2/9/2022 2:00:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE EXTERNAL TABLE [dbo].[sa_transaction_retail]
(
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
)
WITH (DATA_SOURCE = [sql_ds_sa_retail])
GO
/****** Object:  Table [dbo].[ce_type_payments]    Script Date: 2/9/2022 2:00:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ce_type_payments](
	[type_payment_id] [bigint] NOT NULL,
	[type_payment_src_id] [varchar](50) NOT NULL,
	[source_system] [varchar](30) NOT NULL,
	[source_entity] [varchar](30) NOT NULL,
	[type_payment] [varchar](30) NOT NULL,
	[update_dt] [date] NOT NULL,
	[insert_dt] [date] NOT NULL,
 CONSTRAINT [ce_type_payment_pk] PRIMARY KEY CLUSTERED 
(
	[type_payment_id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ce_employees]    Script Date: 2/9/2022 2:00:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ce_employees](
	[employee_id] [bigint] NOT NULL,
	[employee_src_id] [varchar](50) NOT NULL,
	[source_entity] [varchar](30) NOT NULL,
	[source_system] [varchar](30) NOT NULL,
	[store_surr_id] [bigint] NOT NULL,
	[first_name] [varchar](50) NOT NULL,
	[last_name] [varchar](50) NOT NULL,
	[post_surr_id] [bigint] NOT NULL,
	[update_dt] [date] NOT NULL,
	[insert_dt] [date] NOT NULL,
 CONSTRAINT [ce_employee_pk] PRIMARY KEY CLUSTERED 
(
	[employee_id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ce_books]    Script Date: 2/9/2022 2:00:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ce_books](
	[book_id] [bigint] NOT NULL,
	[book_src_id] [varchar](50) NOT NULL,
	[source_system] [varchar](30) NOT NULL,
	[source_entity] [varchar](30) NOT NULL,
	[isbn] [varchar](20) NOT NULL,
	[publisher] [varchar](100) NOT NULL,
	[book_title] [varchar](300) NOT NULL,
	[year_of_publication] [int] NOT NULL,
	[author_id] [bigint] NOT NULL,
	[sub_category_surr_id] [bigint] NOT NULL,
	[start_dt] [date] NOT NULL,
	[end_dt] [date] NOT NULL,
	[is_active] [varchar](4) NOT NULL,
	[update_dt] [date] NOT NULL,
	[insert_dt] [date] NOT NULL,
 CONSTRAINT [ce_book_scd_pk] PRIMARY KEY CLUSTERED 
(
	[book_id] ASC,
	[start_dt] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ce_addresses]    Script Date: 2/9/2022 2:00:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ce_addresses](
	[address_id] [bigint] NOT NULL,
	[address_src_id] [varchar](50) NOT NULL,
	[source_system] [varchar](30) NOT NULL,
	[source_entity] [varchar](30) NOT NULL,
	[address] [varchar](50) NOT NULL,
	[postal_code] [varchar](20) NOT NULL,
	[city_surr_id] [bigint] NOT NULL,
	[update_dt] [date] NOT NULL,
	[insert_dt] [date] NOT NULL,
 CONSTRAINT [ce_address_pk] PRIMARY KEY CLUSTERED 
(
	[address_id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[v_incr_sales]    Script Date: 2/9/2022 2:00:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   VIEW [dbo].[v_incr_sales]
AS
( 
    SELECT
            trim('"' from satr.sale_id) sale_id,
            'RETAIL' SOURCE_SYSTEM,
            'SA_TRANSACTION_RETAIL' SOURCE_ENTITY,
            COALESCE(ceb.book_id, -1) book_id,
            COALESCE(TRY_CONVERT(DATE, substring(satr.invoice_date, 1, 10)), GETDATE()) invoice_date,
            COALESCE(cec.customer_id, -1) customer_id,
            COALESCE(cee.employee_id, -1) employee_id,
            COALESCE(ces.store_id, -1) store_id,
            COALESCE(ceadr.address_id, -1) address_id,
            COALESCE(ctp.type_payment_id, -1) type_payment_id,
            COALESCE(CAST(satr.quantity AS INTEGER), 0) quantity,
            CAST(satr.sale_amount AS NUMERIC(10, 2)) sale_amount,
            trim('"' from satr.invoice) invoice
    FROM sa_transaction_retail satr
    LEFT JOIN ce_stores ces ON trim('"' from satr.store_id) = ces.store_src_id
    LEFT JOIN ce_addresses ceadr ON satr.address_id = ceadr.address_src_id
    LEFT JOIN ce_employees cee ON trim('"' from satr.employee_id) = cee.employee_src_id
    LEFT JOIN ce_type_payments ctp ON satr.type_payment_id = ctp.type_payment_src_id
    LEFT JOIN ce_books ceb ON satr.book_id = ceb.book_src_id 
          AND ceb.start_dt <= COALESCE(TRY_CONVERT(DATE, substring(satr.invoice_date, 1, 10)), GETDATE())
          AND ceb.end_dt   >= COALESCE(TRY_CONVERT(DATE, substring(satr.invoice_date, 1, 10)), GETDATE())
    LEFT JOIN ce_customers cec ON satr.customer_id = cec.customer_src_id 
          AND cec.SOURCE_SYSTEM = 'RETAIL'         
    WHERE satr.insert_dt > 
        ( SELECT previous_loaded_date
          FROM prm_mta_incremental_load 
          WHERE sa_table_name = 'SA_TRANSACTION' )
       OR satr.update_dt > 
        ( SELECT previous_loaded_date 
          FROM prm_mta_incremental_load 
          WHERE sa_table_name = 'SA_TRANSACTION' )

    UNION ALL
    
    SELECT  trim('"' from sats.sale_id) sale_id,
            'STOCK' SOURCE_SYSTEM,
            'SA_TRANSACTION_STOCK' SOURCE_ENTITY,
            COALESCE(ceb.book_id, -1) book_id,
            COALESCE(TRY_CONVERT(DATE, substring(sats.invoice_date, 1, 10)), GETDATE()) invoice_date,
            COALESCE(cec.customer_id, -1) customer_id,
            COALESCE(cee.employee_id, -1) employee_id,
            COALESCE(ces.store_id, -1) store_id,
            COALESCE(ceadr.address_id, -1) address_id,
            COALESCE(ctp.type_payment_id, -1) type_payment_id,
            COALESCE(CAST(sats.quantity AS INTEGER), 0) quantity,  
            CAST(sats.sale_amount AS NUMERIC(10, 2)) sale_amount,  
            trim('"' from sats.invoice) invoice
    FROM sa_transaction_stock sats
    LEFT JOIN ce_stores ces ON trim('"' from sats.store_id) = ces.store_src_id
    LEFT JOIN ce_addresses ceadr ON sats.address_id = ceadr.address_src_id
    LEFT JOIN ce_employees cee ON trim('"' from sats.employee_id) = cee.employee_src_id
    LEFT JOIN ce_type_payments ctp ON sats.type_payment_id = ctp.type_payment_src_id
    LEFT JOIN ce_books ceb ON sats.book_id = ceb.book_src_id 
          AND ceb.start_dt <= COALESCE(TRY_CONVERT(DATE, substring(sats.invoice_date, 1, 10)), GETDATE())
          AND ceb.end_dt   >= COALESCE(TRY_CONVERT(DATE, substring(sats.invoice_date, 1, 10)), GETDATE()) 
    LEFT JOIN ce_customers cec ON sats.customer_id = cec.customer_src_id 
          AND cec.SOURCE_SYSTEM = 'STOCK'
          
    WHERE sats.insert_dt > 
        ( SELECT previous_loaded_date
          FROM prm_mta_incremental_load 
          WHERE sa_table_name = 'SA_TRANSACTION' )
       OR sats.update_dt > 
        ( SELECT previous_loaded_date 
          FROM prm_mta_incremental_load 
          WHERE sa_table_name = 'SA_TRANSACTION' )
);         
               
                
GO
/****** Object:  Table [dbo].[ce_authors]    Script Date: 2/9/2022 2:00:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ce_authors](
	[author_id] [bigint] NOT NULL,
	[author_src_id] [varchar](50) NOT NULL,
	[source_entity] [varchar](30) NOT NULL,
	[source_system] [varchar](30) NOT NULL,
	[author_name] [varchar](150) NOT NULL,
	[update_dt] [date] NOT NULL,
	[insert_dt] [date] NOT NULL,
 CONSTRAINT [ce_author_pk] PRIMARY KEY CLUSTERED 
(
	[author_id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ce_book_author]    Script Date: 2/9/2022 2:00:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ce_book_author](
	[book_surr_id] [bigint] NOT NULL,
	[author_surr_id] [bigint] NOT NULL,
 CONSTRAINT [ce_book_author_pk] PRIMARY KEY CLUSTERED 
(
	[book_surr_id] ASC,
	[author_surr_id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ce_categories]    Script Date: 2/9/2022 2:00:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ce_categories](
	[category_id] [bigint] NOT NULL,
	[category_src_id] [varchar](50) NOT NULL,
	[source_entity] [varchar](30) NOT NULL,
	[source_system] [varchar](30) NOT NULL,
	[category_name] [varchar](30) NOT NULL,
	[update_dt] [date] NOT NULL,
	[insert_dt] [date] NOT NULL,
 CONSTRAINT [ce_category_pk] PRIMARY KEY CLUSTERED 
(
	[category_id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ce_cities]    Script Date: 2/9/2022 2:00:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ce_cities](
	[city_id] [bigint] NOT NULL,
	[city_src_id] [varchar](30) NOT NULL,
	[source_entity] [varchar](30) NOT NULL,
	[source_system] [varchar](30) NOT NULL,
	[city] [varchar](50) NOT NULL,
	[country_surr_id] [bigint] NOT NULL,
	[update_dt] [date] NOT NULL,
	[insert_dt] [date] NOT NULL,
 CONSTRAINT [ce_city_pk] PRIMARY KEY CLUSTERED 
(
	[city_id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ce_countries]    Script Date: 2/9/2022 2:00:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ce_countries](
	[country_id] [bigint] NOT NULL,
	[country_src_id] [varchar](50) NOT NULL,
	[source_entity] [varchar](30) NOT NULL,
	[source_system] [varchar](30) NOT NULL,
	[country] [varchar](50) NOT NULL,
	[region_surr_id] [bigint] NOT NULL,
	[update_dt] [date] NOT NULL,
	[insert_dt] [date] NOT NULL,
 CONSTRAINT [ce_country_pk] PRIMARY KEY CLUSTERED 
(
	[country_id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ce_regions]    Script Date: 2/9/2022 2:00:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ce_regions](
	[region_id] [bigint] NOT NULL,
	[region_src_id] [varchar](50) NOT NULL,
	[source_entity] [varchar](30) NOT NULL,
	[source_system] [varchar](30) NOT NULL,
	[region] [varchar](50) NOT NULL,
	[update_dt] [date] NOT NULL,
	[insert_dt] [date] NOT NULL,
 CONSTRAINT [ce_region_pk] PRIMARY KEY CLUSTERED 
(
	[region_id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ce_sales]    Script Date: 2/9/2022 2:00:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ce_sales](
	[sales_src_id] [varchar](50) NOT NULL,
	[source_entity] [varchar](30) NOT NULL,
	[source_system] [varchar](30) NOT NULL,
	[book_surr_id] [bigint] NOT NULL,
	[date_sale] [date] NOT NULL,
	[customer_surr_id] [bigint] NOT NULL,
	[employee_surr_id] [bigint] NOT NULL,
	[store_surr_id] [bigint] NOT NULL,
	[address_surr_id] [bigint] NOT NULL,
	[type_payment_surr_id] [bigint] NOT NULL,
	[quantity] [bigint] NOT NULL,
	[sale_amount] [numeric](10, 2) NOT NULL,
	[num_invoice] [varchar](20) NOT NULL,
	[update_dt] [date] NOT NULL,
	[insert_dt] [date] NOT NULL
) ON [ps_Date]([date_sale])
GO
/****** Object:  Table [dbo].[ce_sub_categories]    Script Date: 2/9/2022 2:00:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ce_sub_categories](
	[sub_category_id] [bigint] NOT NULL,
	[sub_category_src_id] [varchar](50) NOT NULL,
	[source_entity] [varchar](30) NOT NULL,
	[source_system] [varchar](30) NOT NULL,
	[sub_category] [varchar](100) NOT NULL,
	[category_surr_id] [bigint] NOT NULL,
	[update_dt] [date] NOT NULL,
	[insert_dt] [date] NOT NULL,
 CONSTRAINT [ce_sub_category_pk] PRIMARY KEY CLUSTERED 
(
	[sub_category_id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sa_address]    Script Date: 2/9/2022 2:00:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE EXTERNAL TABLE [dbo].[sa_address]
(
	[ADDRESS_ID] [varchar](4000) NULL,
	[ADDRESS] [varchar](4000) NULL,
	[ADDRESS2] [varchar](4000) NULL,
	[DISTRICT] [varchar](4000) NULL,
	[CITY_ID] [varchar](4000) NULL,
	[POSTAL_CODE] [varchar](4000) NULL,
	[INSERT_DT] [date] NULL,
	[UPDATE_DT] [date] NULL
)
WITH (DATA_SOURCE = [sql_ds_sa_retail])
GO
/****** Object:  Table [dbo].[sa_authors]    Script Date: 2/9/2022 2:00:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE EXTERNAL TABLE [dbo].[sa_authors]
(
	[AUTHOR_ID] [varchar](4000) NULL,
	[AUTHOR_NAME] [varchar](4000) NULL,
	[INSERT_DT] [date] NULL,
	[UPDATE_DT] [date] NULL
)
WITH (DATA_SOURCE = [sql_ds_sa_retail])
GO
/****** Object:  Table [dbo].[sa_books]    Script Date: 2/9/2022 2:00:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE EXTERNAL TABLE [dbo].[sa_books]
(
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
)
WITH (DATA_SOURCE = [sql_ds_sa_retail])
GO
/****** Object:  Table [dbo].[sa_cities]    Script Date: 2/9/2022 2:00:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE EXTERNAL TABLE [dbo].[sa_cities]
(
	[CITY_ID] [varchar](4000) NULL,
	[CITY] [varchar](4000) NULL,
	[COUNTRY_ID] [varchar](4000) NULL,
	[INSERT_DT] [date] NULL,
	[UPDATE_DT] [date] NULL
)
WITH (DATA_SOURCE = [sql_ds_sa_retail])
GO
/****** Object:  Table [dbo].[sa_countries]    Script Date: 2/9/2022 2:00:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE EXTERNAL TABLE [dbo].[sa_countries]
(
	[COUNTRY_ID] [varchar](4000) NULL,
	[COUNTRY] [varchar](4000) NULL,
	[REGION_ID] [varchar](4000) NULL,
	[INSERT_DT] [date] NULL,
	[UPDATE_DT] [date] NULL
)
WITH (DATA_SOURCE = [sql_ds_sa_retail])
GO
/****** Object:  Table [dbo].[sa_customers_retail]    Script Date: 2/9/2022 2:00:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE EXTERNAL TABLE [dbo].[sa_customers_retail]
(
	[CUSTOMER_ID] [varchar](4000) NULL,
	[FIRST_NAME] [varchar](4000) NULL,
	[LAST_NAME] [varchar](4000) NULL,
	[GENDER] [varchar](4000) NULL,
	[DATE_OF_BIRTH] [varchar](4000) NULL,
	[ADDRESS_ID] [varchar](4000) NULL,
	[INSERT_DT] [date] NULL,
	[UPDATE_DT] [date] NULL
)
WITH (DATA_SOURCE = [sql_ds_sa_retail])
GO
/****** Object:  Table [dbo].[sa_customers_stock]    Script Date: 2/9/2022 2:00:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE EXTERNAL TABLE [dbo].[sa_customers_stock]
(
	[CUSTOMER_ID] [varchar](4000) NULL,
	[NAME_OF_ORGANIZATION] [varchar](4000) NULL,
	[HEAD_OF_ORGANIZATION] [varchar](4000) NULL,
	[EMAIL] [varchar](4000) NULL,
	[IBAN] [varchar](4000) NULL,
	[ADDRESS_ID] [varchar](4000) NULL,
	[INSERT_DT] [date] NULL,
	[UPDATE_DT] [date] NULL
)
WITH (DATA_SOURCE = [sql_ds_sa_stock])
GO
/****** Object:  Table [dbo].[SA_POSTS]    Script Date: 2/9/2022 2:00:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE EXTERNAL TABLE [dbo].[SA_POSTS]
(
	[POST_ID] [varchar](4000) NULL,
	[POST_NAME] [varchar](4000) NULL,
	[INSERT_DT] [date] NULL,
	[UPDATE_DT] [date] NULL
)
WITH (DATA_SOURCE = [sql_ds_sa_retail])
GO
/****** Object:  Table [dbo].[sa_regions]    Script Date: 2/9/2022 2:00:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE EXTERNAL TABLE [dbo].[sa_regions]
(
	[REGION_ID] [varchar](4000) NULL,
	[REGION_NAME] [varchar](4000) NULL,
	[INSERT_DT] [date] NULL,
	[UPDATE_DT] [date] NULL
)
WITH (DATA_SOURCE = [sql_ds_sa_retail])
GO
/****** Object:  Table [dbo].[SA_TYPE_PAYMENTS]    Script Date: 2/9/2022 2:00:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE EXTERNAL TABLE [dbo].[SA_TYPE_PAYMENTS]
(
	[TYPE_PAYMENT_ID] [varchar](4000) NULL,
	[TYPE_PAYMENT] [varchar](4000) NULL,
	[INSERT_DT] [date] NULL,
	[UPDATE_DT] [date] NULL
)
WITH (DATA_SOURCE = [sql_ds_sa_retail])
GO
/****** Object:  Table [dbo].[SA_TYPE_STORES]    Script Date: 2/9/2022 2:00:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE EXTERNAL TABLE [dbo].[SA_TYPE_STORES]
(
	[TYPE_STORE_ID] [varchar](4000) NULL,
	[TYPE_STORE] [varchar](4000) NULL,
	[INSERT_DT] [date] NULL,
	[UPDATE_DT] [date] NULL
)
WITH (DATA_SOURCE = [sql_ds_sa_retail])
GO
/****** Object:  Table [dbo].[wrk_books]    Script Date: 2/9/2022 2:00:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[wrk_books](
	[book_id] [bigint] NOT NULL,
	[book_src_id] [varchar](50) NOT NULL,
	[source_system] [varchar](30) NOT NULL,
	[source_entity] [varchar](30) NOT NULL,
	[isbn] [varchar](20) NOT NULL,
	[publisher] [varchar](100) NOT NULL,
	[book_title] [varchar](300) NOT NULL,
	[year_of_publication] [int] NOT NULL,
	[author_id] [bigint] NOT NULL,
	[sub_category_surr_id] [bigint] NOT NULL,
	[start_dt] [date] NOT NULL,
	[end_dt] [date] NOT NULL,
	[is_active] [varchar](4) NOT NULL,
	[update_dt] [date] NOT NULL,
	[insert_dt] [date] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ce_addresses] ADD  DEFAULT (NEXT VALUE FOR [ce_addresses_seq]) FOR [address_id]
GO
ALTER TABLE [dbo].[ce_authors] ADD  DEFAULT (NEXT VALUE FOR [ce_authors_seq]) FOR [author_id]
GO
ALTER TABLE [dbo].[ce_books] ADD  DEFAULT (NEXT VALUE FOR [ce_books_seq]) FOR [book_id]
GO
ALTER TABLE [dbo].[ce_categories] ADD  DEFAULT (NEXT VALUE FOR [ce_categories_seq]) FOR [category_id]
GO
ALTER TABLE [dbo].[ce_countries] ADD  DEFAULT (NEXT VALUE FOR [ce_countries_seq]) FOR [country_id]
GO
ALTER TABLE [dbo].[ce_customers] ADD  DEFAULT (NEXT VALUE FOR [ce_customers_seq]) FOR [customer_id]
GO
ALTER TABLE [dbo].[ce_employees] ADD  DEFAULT (NEXT VALUE FOR [ce_employees_seq]) FOR [employee_id]
GO
ALTER TABLE [dbo].[ce_posts] ADD  DEFAULT (NEXT VALUE FOR [ce_post_seq]) FOR [post_id]
GO
ALTER TABLE [dbo].[ce_regions] ADD  DEFAULT (NEXT VALUE FOR [ce_regions_seq]) FOR [region_id]
GO
ALTER TABLE [dbo].[ce_stores] ADD  DEFAULT (NEXT VALUE FOR [CE_STORES_SEQ]) FOR [store_id]
GO
ALTER TABLE [dbo].[ce_sub_categories] ADD  DEFAULT (NEXT VALUE FOR [ce_sub_categories_seq]) FOR [sub_category_id]
GO
/****** Object:  StoredProcedure [dbo].[ld_ce_addresses]    Script Date: 2/9/2022 2:00:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[ld_ce_addresses] AS 
BEGIN 
	BEGIN TRY
		BEGIN TRANSACTION;
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
/****** Object:  StoredProcedure [dbo].[ld_ce_authors]    Script Date: 2/9/2022 2:00:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[ld_ce_authors] AS 
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION;
		MERGE INTO ce_authors target              
		USING (SELECT AUTHOR_ID,
					  COALESCE(trim('"' from trim(';' from AUTHOR_NAME)), 'NA') AUTHOR_NAME  
			   FROM sa_authors ) source       
			ON (target.AUTHOR_SRC_ID = source.AUTHOR_ID AND
				target.SOURCE_SYSTEM = 'RETAIL' AND 
				target.SOURCE_ENTITY = 'SA_AUTHORS') 
        
		WHEN MATCHED 
		AND (target.AUTHOR_NAME <> source.AUTHOR_NAME)
		THEN
			UPDATE SET target.AUTHOR_NAME = source.AUTHOR_NAME,
					   target.UPDATE_DT = GETDATE()
        
		WHEN NOT MATCHED THEN 
			INSERT (AUTHOR_ID, AUTHOR_SRC_ID, AUTHOR_NAME, SOURCE_SYSTEM, SOURCE_ENTITY, update_dt, insert_dt) 
			VALUES (default, source.AUTHOR_ID, COALESCE(trim('"' from trim(';' from source.AUTHOR_NAME)), 'NA'), 'RETAIL', 'SA_AUTHORS', GETDATE(), GETDATE()); 
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
/****** Object:  StoredProcedure [dbo].[ld_ce_book_author]    Script Date: 2/9/2022 2:00:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[ld_ce_book_author] AS 
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
GO
/****** Object:  StoredProcedure [dbo].[ld_ce_books]    Script Date: 2/9/2022 2:00:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[ld_ce_books] AS 
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION;
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
/****** Object:  StoredProcedure [dbo].[ld_ce_categories]    Script Date: 2/9/2022 2:00:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[ld_ce_categories] AS 
BEGIN   
	BEGIN TRY
		BEGIN TRANSACTION;
		MERGE INTO ce_categories target              
		USING (SELECT DISTINCT CATEGORY_ID,
							   CATEGORY   
			   FROM sa_books
			   WHERE CATEGORY_ID in ('1', '2') ) source       
			ON (target.CATEGORY_SRC_ID = source.CATEGORY_ID AND
				target.SOURCE_SYSTEM = 'RETAIL' AND
				target.SOURCE_ENTITY = 'SA_BOOKS') 
        
		WHEN MATCHED 
		AND (target.category_name <> source.CATEGORY)
		THEN
			UPDATE SET target.category_name = source.CATEGORY,
					   target.UPDATE_DT = GETDATE()
        
		WHEN NOT MATCHED THEN 
			INSERT (CATEGORY_ID, CATEGORY_SRC_ID, category_name, SOURCE_SYSTEM, SOURCE_ENTITY, update_dt, insert_dt) 
			VALUES (default, source.CATEGORY_ID, source.CATEGORY, 'RETAIL', 'SA_BOOKS', GETDATE(), GETDATE()); 
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
/****** Object:  StoredProcedure [dbo].[ld_ce_cities]    Script Date: 2/9/2022 2:00:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[ld_ce_cities] AS 
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION;
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
/****** Object:  StoredProcedure [dbo].[ld_ce_countries]    Script Date: 2/9/2022 2:00:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[ld_ce_countries] AS 
BEGIN  
	BEGIN TRY
		BEGIN TRANSACTION;
		MERGE INTO ce_countries target              
		USING (SELECT trim('"' from sac.COUNTRY_ID) COUNTRY_ID,
					  trim('"' from sac.COUNTRY) COUNTRY,
					  COALESCE(bcr.REGION_ID, -1) REGION_ID
			   FROM sa_countries sac 
			   LEFT JOIN ce_regions bcr ON sac.REGION_ID = bcr.REGION_SRC_ID
			   AND bcr.SOURCE_SYSTEM = 'RETAIL'
			   AND bcr.SOURCE_ENTITY = 'SA_REGIONS'
			 ) source       
			ON (target.COUNTRY_SRC_ID = source.COUNTRY_ID AND
				target.SOURCE_SYSTEM = 'RETAIL' AND
				target.SOURCE_ENTITY = 'SA_COUNTRIES') 
        
		WHEN MATCHED 
		AND (IIF(target.COUNTRY = source.COUNTRY, 0, 1) +
			 IIF(target.REGION_SURR_ID = source.REGION_ID, 0, 1)) > 0
		THEN
			UPDATE SET target.COUNTRY = source.COUNTRY,
					   target.REGION_SURR_ID = source.REGION_ID,
					   target.UPDATE_DT = GETDATE()

		WHEN NOT MATCHED THEN 
			INSERT (COUNTRY_ID, COUNTRY_SRC_ID, COUNTRY, region_surr_id, SOURCE_SYSTEM, SOURCE_ENTITY, update_dt, insert_dt) 
			VALUES (default, trim('"' from source.COUNTRY_ID), trim('"' from source.COUNTRY), source.REGION_ID, 'RETAIL', 'SA_COUNTRIES', GETDATE(), GETDATE()); 
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
/****** Object:  StoredProcedure [dbo].[ld_ce_customers_from_retail]    Script Date: 2/9/2022 2:00:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[ld_ce_customers_from_retail] AS 
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION;
		MERGE INTO ce_customers target              
		USING ( SELECT sacr.CUSTOMER_ID,
					   sacr.FIRST_NAME,
					   sacr.LAST_NAME,
					   sacr.GENDER,
					   CAST(DATE_OF_BIRTH AS DATE) DATE_OF_BIRTH,
					   COALESCE(ceadd.ADDRESS_ID, -1) ADDRESS_ID
				FROM sa_customers_retail sacr
				LEFT JOIN ce_addresses ceadd on sacr.ADDRESS_ID = ceadd.ADDRESS_ID ) source       
			ON (target.CUSTOMER_SRC_ID = source.CUSTOMER_ID AND
				target.SOURCE_SYSTEM = 'RETAIL' AND
				target.SOURCE_ENTITY = 'SA_CUSTOMERS_RETAIL') 
        
		WHEN MATCHED 
		AND (IIF(target.FIRST_NAME = source.FIRST_NAME, 0, 1) +
			 IIF(target.LAST_NAME = source.LAST_NAME, 0, 1) +
			 IIF(target.GENDER = source.GENDER, 0, 1) +
			 IIF(target.DATE_OF_BIRTH = source.DATE_OF_BIRTH, 0, 1) + 
			 IIF(target.address_surr_id = source.ADDRESS_ID, 0, 1)) > 0
		THEN
			UPDATE SET target.FIRST_NAME = source.FIRST_NAME,
					   target.LAST_NAME = source.LAST_NAME,                       
					   target.GENDER = source.GENDER,
					   target.DATE_OF_BIRTH = source.DATE_OF_BIRTH,
					   target.address_surr_id = source.ADDRESS_ID,
					   target.UPDATE_DT = GETDATE()
        
		WHEN NOT MATCHED THEN 
			INSERT (customer_id, customer_src_id, SOURCE_SYSTEM, SOURCE_ENTITY,  type_customer,
					first_name, last_name, gender, date_of_birth, name_of_organization, head_of_organization, iban, email, address_surr_id,
					update_dt, insert_dt) 
        
			VALUES (default, source.customer_id, 'RETAIL', 'SA_CUSTOMERS_RETAIL', 0,
					source.first_name, source.last_name,  source.gender, source.date_of_birth,
					'NA', 'NA', 'NA', 'NA', source.ADDRESS_ID, GETDATE(), GETDATE());
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
/****** Object:  StoredProcedure [dbo].[ld_ce_customers_from_stock]    Script Date: 2/9/2022 2:00:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[ld_ce_customers_from_stock] AS 
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION;
		MERGE INTO ce_customers target              
		USING ( SELECT trim('"' from sacs.CUSTOMER_ID) CUSTOMER_ID,
					   trim('"' from sacs.NAME_OF_ORGANIZATION) NAME_OF_ORGANIZATION,
					   trim('"' from sacs.HEAD_OF_ORGANIZATION) HEAD_OF_ORGANIZATION,
					   sacs.EMAIL,
					   sacs.IBAN,
					   COALESCE(ceadd.ADDRESS_ID, -1) ADDRESS_ID
				FROM sa_customers_stock sacs
				LEFT JOIN ce_addresses ceadd on sacs.ADDRESS_ID = ceadd.ADDRESS_ID  --IIF(ltrim(sacs.ADDRESS_ID,'1234567890') IS NULL, sacs.ADDRESS_ID, -1) = ceadd.ADDRESS_ID 
			  ) source       
			ON (target.CUSTOMER_SRC_ID = source.CUSTOMER_ID	AND
				target.SOURCE_SYSTEM = 'STOCK' AND
				target.SOURCE_ENTITY = 'SA_CUSTOMERS_STOCK') 
        
		WHEN MATCHED 
		AND (IIF(target.NAME_OF_ORGANIZATION = source.NAME_OF_ORGANIZATION, 0, 1) +
			 IIF(target.HEAD_OF_ORGANIZATION = source.HEAD_OF_ORGANIZATION, 0, 1) +
			 IIF(target.EMAIL = source.EMAIL, 0, 1) +
			 IIF(target.IBAN = source.IBAN, 0, 1) + 
			 IIF(target.address_surr_id = source.ADDRESS_ID, 0, 1)) > 0	
	
		THEN
			UPDATE SET target.NAME_OF_ORGANIZATION = source.NAME_OF_ORGANIZATION,
					   target.HEAD_OF_ORGANIZATION = source.HEAD_OF_ORGANIZATION,                       
					   target.EMAIL = source.EMAIL,
					   target.IBAN = source.IBAN,
					   target.address_surr_id = source.ADDRESS_ID,
					   target.UPDATE_DT = GETDATE()
        
		WHEN NOT MATCHED THEN 
			INSERT (customer_id, customer_src_id, SOURCE_SYSTEM, SOURCE_ENTITY, type_customer, first_name, last_name, gender, date_of_birth, 
					name_of_organization, head_of_organization, iban, email, address_surr_id, update_dt, insert_dt) 
        
			VALUES (default, source.customer_id, 'STOCK', 'SA_CUSTOMERS_STOCK', 1, 'NA', 'NA', 'NA', CAST('1970-01-01' AS DATE),
					source.name_of_organization, source.head_of_organization, source.iban, source.email,
					 source.ADDRESS_ID, GETDATE(), GETDATE());
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
/****** Object:  StoredProcedure [dbo].[ld_ce_employees]    Script Date: 2/9/2022 2:00:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[ld_ce_employees] AS 
BEGIN

    MERGE INTO ce_employees target              
    USING ( SELECT sae.EMPLOYEE_ID,
                   sae.FIRST_NAME,
                   sae.LAST_NAME,
                   COALESCE(cep.POST_ID, -1) POST_ID,
                   COALESCE(ces.STORE_ID, -1) STORE_ID
            FROM sa_employees sae               
            LEFT JOIN ce_posts cep ON sae.POST_ID = cep.post_src_id
            LEFT JOIN ce_stores ces ON sae.STORE_ID = ces.store_src_id ) source       
        ON (target.EMPLOYEE_SRC_ID = source.EMPLOYEE_ID AND
            target.SOURCE_SYSTEM = 'RETAIL' AND
            target.SOURCE_ENTITY = 'SA_EMPLOYEES') 
        
    WHEN MATCHED 
	AND ( IIF(target.FIRST_NAME = source.FIRST_NAME, 0, 1) +
          IIF(target.LAST_NAME = source.LAST_NAME, 0, 1) +
          IIF(target.POST_SURR_ID = source.POST_ID, 0, 1) +
          IIF(target.STORE_SURR_ID = source.STORE_ID, 0, 1) ) > 1  
	THEN
        UPDATE SET target.FIRST_NAME = source.FIRST_NAME,
                   target.LAST_NAME = source.LAST_NAME,
                   target.POST_SURR_ID = source.POST_ID,
                   target.STORE_SURR_ID = source.STORE_ID,                       
                   target.UPDATE_DT = GETDATE()
        
    WHEN NOT MATCHED THEN 
        INSERT (EMPLOYEE_ID, EMPLOYEE_SRC_ID, SOURCE_SYSTEM, SOURCE_ENTITY, 
                STORE_SURR_ID, FIRST_NAME, LAST_NAME, POST_SURR_ID, update_dt, insert_dt) 
        VALUES (default, source.EMPLOYEE_ID, 'RETAIL', 'SA_EMPLOYEES',
                source.store_id, source.FIRST_NAME, source.LAST_NAME, source.post_id, GETDATE(), GETDATE());
END;
GO
/****** Object:  StoredProcedure [dbo].[ld_ce_posts]    Script Date: 2/9/2022 2:00:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[ld_ce_posts] AS 
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION;

		MERGE INTO ce_posts target              
		USING (SELECT POST_ID,
					  POST_NAME
			   FROM SA_POSTS ) source       
			ON (target.POST_SRC_ID = source.POST_ID AND
				target.SOURCE_SYSTEM = 'RETAIL' AND
				target.SOURCE_ENTITY = 'SA_POSTS') 
        
		WHEN MATCHED 
		AND (target.POST_NAME <> source.POST_NAME)	
		THEN
			UPDATE SET target.POST_NAME = source.POST_NAME,
					   target.UPDATE_DT  = GETDATE()
        
		WHEN NOT MATCHED THEN 
			INSERT (POST_ID, POST_SRC_ID, POST_NAME, SOURCE_SYSTEM, SOURCE_ENTITY, update_dt, insert_dt) 
			VALUES (default, source.POST_ID, source.POST_NAME, 'RETAIL', 'SA_POSTS', GETDATE(), GETDATE()); 
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
/****** Object:  StoredProcedure [dbo].[ld_ce_regions]    Script Date: 2/9/2022 2:00:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[ld_ce_regions] AS 
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION;
		MERGE INTO ce_regions target              
		USING (SELECT sar.REGION_ID,
					  sar.REGION_NAME
			   FROM sa_regions sar
			   ) source       
			ON (target.REGION_SRC_ID = source.REGION_ID AND
				target.SOURCE_SYSTEM = 'RETAIL' AND
				target.SOURCE_ENTITY = 'SA_REGIONS') 
        
		WHEN MATCHED 
		AND (target.REGION <> source.REGION_NAME)
		THEN
			UPDATE SET target.REGION = source.REGION_NAME,
					   target.UPDATE_DT  = GETDATE()
        
		WHEN NOT MATCHED THEN 
			INSERT (REGION_ID, REGION_SRC_ID, REGION, SOURCE_SYSTEM, SOURCE_ENTITY, update_dt, insert_dt) 
			VALUES (default, source.REGION_ID, source.REGION_NAME, 'RETAIL', 'SA_REGIONS', GETDATE(), GETDATE()); 
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
/****** Object:  StoredProcedure [dbo].[ld_ce_sales_from_retail]    Script Date: 2/9/2022 2:00:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[ld_ce_sales_from_retail] AS 
BEGIN   
    MERGE INTO ce_sales target              
    USING ( SELECT  trim('"' from satr.sale_id) sale_id,
                    trim('"' from satr.invoice) invoice,
                    COALESCE(ces.store_id, -1) store_id,
                    COALESCE(CAST(satr.quantity AS INTEGER), 0) quantity,
                    COALESCE(cec.customer_id, -1) customer_id,
                    CAST(substring(satr.invoice_date, 1, 10) AS DATE) invoice_date,
                    CAST(satr.sale_amount AS NUMERIC(10, 2)) sale_amount,
                    COALESCE(ceadr.address_id, -1) address_id,
                    COALESCE(cee.employee_id, -1) employee_id,
                    COALESCE(ctp.type_payment_id, -1) type_payment_id,
                    COALESCE(ceb.book_id, -1) book_id
                FROM sa_transaction_retail satr
                LEFT JOIN ce_stores ces ON trim('"' from satr.store_id) = ces.store_src_id
                LEFT JOIN ce_addresses ceadr ON satr.address_id = ceadr.address_src_id
                LEFT JOIN ce_employees cee ON trim('"' from satr.employee_id) = cee.employee_src_id
                LEFT JOIN ce_type_payments ctp ON satr.type_payment_id = ctp.type_payment_src_id
                LEFT JOIN ce_books ceb ON satr.book_id = ceb.book_src_id 
                      AND ceb.start_dt <= CAST(substring(satr.invoice_date, 1, 10) AS DATE)
                      AND ceb.end_dt   >  CAST(substring(satr.invoice_date, 1, 10) AS DATE)
                LEFT JOIN ce_customers cec ON satr.customer_id = cec.customer_src_id 
                     AND cec.SOURCE_SYSTEM = 'RETAIL' ) source       
        ON (target.sales_src_id = source.sale_id AND
			target.SOURCE_SYSTEM = 'RETAIL' AND
			target.SOURCE_ENTITY = 'SA_TRANSACTION_RETAIL')          
        
    WHEN MATCHED 
	AND (IIF(target.num_invoice = source.invoice, 0, 1) +
         IIF(target.store_surr_id = source.store_id, 0, 1) +
         IIF(target.quantity = source.quantity, 0, 1) +
         IIF(target.customer_surr_id = source.customer_id, 0, 1) + 
         IIF(target.date_sale = source.invoice_date, 0, 1) +
         IIF(target.sale_amount = source.sale_amount, 0, 1) +
         IIF(target.address_surr_id = source.address_id, 0, 1) +
         IIF(target.employee_surr_id = source.employee_id, 0, 1) +
         IIF(target.type_payment_surr_id = source.type_payment_id, 0, 1) +
         IIF(target.book_surr_id = source.book_id, 0, 1)) > 0
	THEN
        UPDATE SET target.num_invoice = source.invoice,
                   target.store_surr_id = source.store_id,                       
                   target.quantity = source.quantity,
                   target.customer_surr_id = source.customer_id,
                   target.date_sale = source.invoice_date,
                   target.sale_amount = source.sale_amount,
                   target.address_surr_id = source.address_id,
                   target.employee_surr_id = source.employee_id,
                   target.type_payment_surr_id = source.type_payment_id,
                   target.book_surr_id = source.book_id,
                   target.UPDATE_DT = GETDATE()
        
    WHEN NOT MATCHED THEN 
        INSERT (sales_src_id, SOURCE_SYSTEM, SOURCE_ENTITY, book_surr_id, date_sale, customer_surr_id, employee_surr_id, store_surr_id, 
                address_surr_id, type_payment_surr_id, quantity, sale_amount, num_invoice, update_dt, insert_dt) 
        
        VALUES (source.sale_id, 'RETAIL', 'SA_TRANSACTION_RETAIL', source.book_id,
                source.invoice_date, source.customer_id,  source.employee_id, source.store_id,
                source.address_id, source.type_payment_id, source.quantity, 
                source.sale_amount, source.invoice, GETDATE(), GETDATE());
END;
GO
/****** Object:  StoredProcedure [dbo].[ld_ce_sales_from_stock]    Script Date: 2/9/2022 2:00:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[ld_ce_sales_from_stock] AS 
BEGIN
    MERGE INTO ce_sales target              
    USING ( SELECT  trim('"' from sats.sale_id) sale_id,
                    trim('"' from sats.invoice) invoice,
                    COALESCE(ces.store_id, -1) store_id,
                    COALESCE(CAST(sats.quantity AS INTEGER), 0) quantity,
                    COALESCE(cec.customer_id, -1) customer_id,
                    CAST(substring(sats.invoice_date, 1, 10) AS DATE) invoice_date,
                    CAST(sats.sale_amount AS NUMERIC(10, 2)) sale_amount,
                    COALESCE(ceadr.address_id, -1) address_id,
                    COALESCE(cee.employee_id, -1) employee_id,
                    COALESCE(ctp.type_payment_id, -1) type_payment_id,
                    COALESCE(ceb.book_id, -1) book_id
                FROM sa_transaction_stock sats
                LEFT JOIN ce_stores ces ON trim('"' from sats.store_id) = ces.store_src_id
                LEFT JOIN ce_addresses ceadr ON sats.address_id = ceadr.address_src_id
                LEFT JOIN ce_employees cee ON trim('"' from sats.employee_id) = cee.employee_src_id
                LEFT JOIN ce_type_payments ctp ON sats.type_payment_id = ctp.type_payment_src_id
                LEFT JOIN ce_books ceb ON sats.book_id = ceb.book_src_id 
                      AND ceb.start_dt <= CAST(substring(sats.invoice_date, 1, 10) AS DATE )
                      AND ceb.end_dt   >= CAST(substring(sats.invoice_date, 1, 10) AS DATE)         
                LEFT JOIN ce_customers cec ON sats.customer_id = cec.customer_src_id 
                     AND cec.SOURCE_SYSTEM = 'STOCK' ) source       
        ON (target.sales_src_id = source.sale_id AND
			target.SOURCE_SYSTEM = 'STOCK' AND
			target.SOURCE_ENTITY = 'SA_TRANSACTION_STOCK')        
        
    WHEN MATCHED
	AND (IIF(target.num_invoice = source.invoice, 0, 1) +
         IIF(target.store_surr_id = source.store_id, 0, 1) +
         IIF(target.quantity = source.quantity, 0, 1) +
         IIF(target.customer_surr_id = source.customer_id, 0, 1) + 
         IIF(target.date_sale = source.invoice_date, 0, 1) +
         IIF(target.sale_amount = source.sale_amount, 0, 1) +
         IIF(target.address_surr_id = source.address_id, 0, 1) +
         IIF(target.employee_surr_id = source.employee_id, 0, 1) +
         IIF(target.type_payment_surr_id = source.type_payment_id, 0, 1) +
         IIF(target.book_surr_id = source.book_id, 0, 1)) > 0
	THEN
        UPDATE SET target.num_invoice = source.invoice,
                   target.store_surr_id = source.store_id,                       
                   target.quantity = source.quantity,
                   target.customer_surr_id = source.customer_id,
                   target.date_sale = source.invoice_date,
                   target.sale_amount = source.sale_amount,
                   target.address_surr_id = source.address_id,
                   target.employee_surr_id = source.employee_id,
                   target.type_payment_surr_id = source.type_payment_id,
                   target.book_surr_id = source.book_id,
                   target.UPDATE_DT = GETDATE()
        
    WHEN NOT MATCHED THEN 
        INSERT (sales_src_id, SOURCE_SYSTEM, SOURCE_ENTITY,  book_surr_id, date_sale, employee_surr_id, store_surr_id, customer_surr_id,
                address_surr_id, type_payment_surr_id, quantity, num_invoice, update_dt, insert_dt, sale_amount )
                
        VALUES (source.sale_id, 'STOCK', 'SA_TRANSACTION_STOCK', source.book_id, source.invoice_date, source.employee_id, source.store_id, source.customer_id,
                source.address_id, source.type_payment_id, source.quantity, source.invoice, GETDATE() , GETDATE(), source.sale_amount);
END;
GO
/****** Object:  StoredProcedure [dbo].[ld_ce_stores]    Script Date: 2/9/2022 2:00:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[ld_ce_stores] AS 
BEGIN      
	BEGIN TRY
		BEGIN TRANSACTION;
		MERGE INTO ce_stores target              
		USING (SELECT sast.STORE_ID,
					  sast.STORE_NAME,
					  COALESCE(cets.type_store_id, -1) type_store_id
			   FROM sa_stores sast 
			   LEFT JOIN ce_type_stores cets ON sast.STORE_TYPE_ID = cets.TYPE_STORE_SRC_ID
			   AND cets.SOURCE_SYSTEM = 'RETAIL'
			   AND cets.SOURCE_ENTITY = 'SA_TYPE_STORES'
			   ) source       
			ON (target.STORE_SRC_ID = source.STORE_ID AND
				target.SOURCE_SYSTEM = 'RETAIL' AND
				target.SOURCE_ENTITY = 'SA_STORES') 
        
		WHEN MATCHED 
		AND (IIF(target.STORE_NAME = source.STORE_NAME, 0, 1) + 
			 IIF(target.STORE_TYPE_SURR_ID = source.STORE_ID, 0, 1)) > 0
	
		THEN
			UPDATE SET target.STORE_NAME = source.STORE_NAME,
					   target.STORE_TYPE_SURR_ID = source.type_store_id,
					   target.UPDATE_DT = GETDATE()
        
		WHEN NOT MATCHED THEN 
			INSERT (STORE_ID, STORE_SRC_ID, STORE_NAME, STORE_TYPE_SURR_ID, SOURCE_SYSTEM, SOURCE_ENTITY, update_dt, insert_dt) 
			VALUES (default, source.STORE_ID, source.STORE_NAME, source.TYPE_STORE_ID, 'RETAIL', 'SA_STORES', GETDATE(), GETDATE()); 
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
/****** Object:  StoredProcedure [dbo].[ld_ce_sub_categories]    Script Date: 2/9/2022 2:00:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[ld_ce_sub_categories] AS 
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION;
		MERGE INTO ce_sub_categories target              
		USING ( SELECT DISTINCT SUB_CATEGORY_ID,
					   COALESCE(trim('"' from (trim(';' from SUB_CATEGORY))) , 'NA') SUB_CATEGORY,
					   COALESCE(cecat.category_id, -1) category_id
				FROM sa_books
				LEFT JOIN ce_categories cecat ON cecat.category_name = sa_books.CATEGORY               
				WHERE SUB_CATEGORY_ID is not null  			
				-- IIF(ltrim(SUB_CATEGORY_ID,'1234567890'), null, 0, 1) = 0 and
					  -- IIF(ltrim(SUB_CATEGORY,'1234567890'), null, 0, 1) = 1 and				  
					  ) source       
			ON (target.SUB_CATEGORY_SRC_ID = source.SUB_CATEGORY_ID AND
				target.SOURCE_SYSTEM = 'RETAIL' AND 
				target.SOURCE_ENTITY = 'SA_BOOKS') 
        
		WHEN MATCHED 
		AND (target.SUB_CATEGORY <> source.SUB_CATEGORY)
		THEN
			UPDATE SET target.SUB_CATEGORY = source.SUB_CATEGORY,
					   target.UPDATE_DT = GETDATE()
        
		WHEN NOT MATCHED THEN 
			INSERT (SUB_CATEGORY_ID, SUB_CATEGORY_SRC_ID, SUB_CATEGORY, category_surr_id, SOURCE_SYSTEM, SOURCE_ENTITY, update_dt, insert_dt) 
			VALUES (default, source.SUB_CATEGORY_ID, source.SUB_CATEGORY, source.category_id, 'RETAIL', 'SA_BOOKS', GETDATE(), GETDATE());
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
/****** Object:  StoredProcedure [dbo].[ld_ce_type_payments]    Script Date: 2/9/2022 2:00:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[ld_ce_type_payments] AS 
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION;
		DECLARE @TYPE_PAYMENT_ID BIGINT, @TYPE_PAYMENT VARCHAR(30);
	
		DECLARE type_payments_cur CURSOR FOR 
			SELECT TYPE_PAYMENT_ID, TYPE_PAYMENT
			FROM SA_TYPE_PAYMENTS;
  
		OPEN type_payments_cur  
  
		FETCH NEXT FROM type_payments_cur INTO @TYPE_PAYMENT_ID, @TYPE_PAYMENT 

		WHILE @@FETCH_STATUS = 0
		BEGIN

			INSERT INTO ce_type_payments(TYPE_PAYMENT_ID, TYPE_PAYMENT_SRC_ID, TYPE_PAYMENT, SOURCE_SYSTEM, SOURCE_ENTITY, update_dt, insert_dt) 
			SELECT NEXT VALUE FOR ce_type_payments_seq, @TYPE_PAYMENT_ID, @TYPE_PAYMENT, 'RETAIL', 'SA_TYPE_PAYMENTS', GETDATE(), GETDATE()
			WHERE NOT EXISTS ( SELECT nctype.TYPE_PAYMENT_ID
							   FROM ce_type_payments nctype 
							   WHERE nctype.TYPE_PAYMENT_SRC_ID = @TYPE_PAYMENT_ID
								 AND nctype.SOURCE_SYSTEM = 'RETAIL' 
								 AND nctype.SOURCE_ENTITY = 'SA_TYPE_PAYMENTS' );           
        
			UPDATE ce_type_payments
			SET TYPE_PAYMENT = @TYPE_PAYMENT,
				UPDATE_DT = GETDATE()
			WHERE TYPE_PAYMENT_SRC_ID = @TYPE_PAYMENT_ID
			  AND SOURCE_SYSTEM = 'RETAIL' 
			  AND SOURCE_ENTITY = 'SA_TYPE_PAYMENTS'
			  AND IIF(TYPE_PAYMENT = UPPER(@TYPE_PAYMENT), 0, 1) > 0;	

		FETCH NEXT FROM type_payments_cur INTO @TYPE_PAYMENT_ID, @TYPE_PAYMENT 

		END

		CLOSE type_payments_cur;
		DEALLOCATE type_payments_cur; 
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
/****** Object:  StoredProcedure [dbo].[ld_ce_type_stores]    Script Date: 2/9/2022 2:00:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[ld_ce_type_stores] AS 
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION;
		DECLARE @TYPE_STORE_ID BIGINT, @TYPE_STORE VARCHAR(30);
	
		DECLARE type_stores_cur CURSOR FOR 
			SELECT TYPE_STORE_ID,
				   TYPE_STORE
			FROM SA_TYPE_STORES;
  
		OPEN type_stores_cur  
  
		FETCH NEXT FROM type_stores_cur INTO @TYPE_STORE_ID, @TYPE_STORE 

		WHILE @@FETCH_STATUS = 0
		BEGIN

			INSERT INTO ce_type_stores(TYPE_STORE_ID, TYPE_STORE_SRC_ID, TYPE_STORE, SOURCE_SYSTEM, SOURCE_ENTITY, update_dt, insert_dt) 
			SELECT NEXT VALUE FOR ce_type_stores_seq, @TYPE_STORE_ID, upper(@TYPE_STORE), 'RETAIL', 'SA_TYPE_STORES', GETDATE(), GETDATE()
			WHERE NOT EXISTS ( SELECT ncts.TYPE_STORE_ID
							   FROM ce_type_stores ncts 
							   WHERE ncts.TYPE_STORE_SRC_ID = @TYPE_STORE_ID
								 AND ncts.SOURCE_SYSTEM = 'RETAIL' 
								 AND ncts.SOURCE_ENTITY = 'SA_TYPE_STORES' );
                             
			UPDATE ce_type_stores            
			SET TYPE_STORE = @TYPE_STORE,
				UPDATE_DT = GETDATE()                
			WHERE TYPE_STORE_SRC_ID = @TYPE_STORE_ID
			  AND SOURCE_SYSTEM = 'RETAIL' 
			  AND SOURCE_ENTITY = 'SA_TYPE_STORES'
			  AND IIF(TYPE_STORE = upper(@TYPE_STORE), 0, 1) > 0;       

		FETCH NEXT FROM type_stores_cur INTO @TYPE_STORE_ID, @TYPE_STORE 

		END

		CLOSE type_stores_cur;
		DEALLOCATE type_stores_cur; 
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
/****** Object:  StoredProcedure [dbo].[ld_dim_books]    Script Date: 2/9/2022 2:00:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[ld_dim_books] AS 
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
GO
/****** Object:  StoredProcedure [dbo].[ld_incr_ce_employees]    Script Date: 2/9/2022 2:00:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[ld_incr_ce_employees] AS 
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION;
		MERGE INTO ce_employees target              
		USING ( SELECT *
				FROM v_incr_employees ) source       
			ON (target.EMPLOYEE_SRC_ID = source.EMPLOYEE_ID AND
				target.SOURCE_SYSTEM = 'RETAIL' AND
				target.SOURCE_ENTITY = 'SA_EMPLOYEES') 
        
		WHEN MATCHED 
		AND  ( IIF(target.FIRST_NAME = source.FIRST_NAME, 0, 1) +
			   IIF(target.LAST_NAME = source.LAST_NAME, 0, 1) +
			   IIF(target.POST_SURR_ID = source.POST_ID, 0, 1) +
			   IIF(target.STORE_SURR_ID = source.STORE_ID, 0, 1) ) > 1 
		THEN
			UPDATE SET target.FIRST_NAME = source.FIRST_NAME,
					   target.LAST_NAME = source.LAST_NAME,
					   target.POST_SURR_ID = source.POST_ID,
					   target.STORE_SURR_ID = source.STORE_ID,                       
					   target.UPDATE_DT = GETDATE()
        
		WHEN NOT MATCHED THEN 
			INSERT (EMPLOYEE_ID, EMPLOYEE_SRC_ID, SOURCE_SYSTEM, SOURCE_ENTITY, 
					STORE_SURR_ID, FIRST_NAME, LAST_NAME, POST_SURR_ID, update_dt, insert_dt) 
			VALUES (default, source.EMPLOYEE_ID, 'RETAIL', 'SA_EMPLOYEES',
					source.store_id, source.FIRST_NAME, source.LAST_NAME, source.post_id, GETDATE(), GETDATE());

		if @@ROWCOUNT > 0
			UPDATE prm_mta_incremental_load
			SET previous_loaded_date = GETDATE()
			WHERE sa_table_name = 'SA_EMPLOYEES';
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
/****** Object:  StoredProcedure [dbo].[ld_incr_ce_stores]    Script Date: 2/9/2022 2:00:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[ld_incr_ce_stores] AS 
BEGIN      
    MERGE INTO ce_stores target              
    USING (SELECT *
           FROM v_incr_stores) source       
        ON (target.STORE_SRC_ID = source.STORE_ID AND
            target.SOURCE_SYSTEM = 'RETAIL' AND
            target.SOURCE_ENTITY = 'SA_STORES') 
        
    WHEN MATCHED 
	AND (IIF(target.STORE_NAME = source.STORE_NAME, 0, 1) + 
         IIF(target.STORE_TYPE_SURR_ID = source.STORE_ID, 0, 1)) > 0 
	THEN
        UPDATE SET target.STORE_NAME = source.STORE_NAME,
                   target.STORE_TYPE_SURR_ID = source.type_store_id,
                   target.UPDATE_DT = GETDATE()
        
    WHEN NOT MATCHED THEN 
        INSERT (STORE_ID, STORE_SRC_ID, STORE_NAME, STORE_TYPE_SURR_ID, SOURCE_SYSTEM, SOURCE_ENTITY, update_dt, insert_dt) 
        VALUES (default, source.STORE_ID, source.STORE_NAME, source.TYPE_STORE_ID, 'RETAIL', 'SA_STORES', GETDATE(), GETDATE()); 
    
 --   UPDATE sa_stores
 --   SET IS_CPROCESSED = 'Y';
END;  
GO
/****** Object:  StoredProcedure [dbo].[ld_incr_sale_from_sa_layers]    Script Date: 2/9/2022 2:00:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[ld_incr_sale_from_sa_layers] AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION;
		INSERT INTO ce_sales (sales_src_id, SOURCE_SYSTEM, SOURCE_ENTITY, book_surr_id,
							  date_sale, customer_surr_id, employee_surr_id, store_surr_id, 
							  address_surr_id, type_payment_surr_id, quantity,                     
							  sale_amount, num_invoice, update_dt, insert_dt) 
    
		SELECT vs.sale_id, vs.SOURCE_SYSTEM, vs.SOURCE_ENTITY, vs.book_id, 
			   vs.invoice_date, vs.customer_id, vs.employee_id, vs.store_id,
			   vs.address_id, vs.type_payment_id, vs.quantity, vs.sale_amount,
			   vs.invoice, GETDATE(), GETDATE()
		FROM v_incr_sales vs;
    
		IF @@ROWCOUNT > 0
			UPDATE prm_mta_incremental_load
			SET previous_loaded_date = GETDATE()
			WHERE sa_table_name = 'SA_TRANSACTION';    
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
/****** Object:  StoredProcedure [dbo].[load_sale_sa_layers]    Script Date: 2/9/2022 2:00:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[load_sale_sa_layers] @p_date_period  date
AS
BEGIN
     
     TRUNCATE TABLE wrk_ex_ce_sales;
     
     INSERT INTO wrk_ex_ce_sales (sales_src_id, SOURCE_SYSTEM, SOURCE_ENTITY, book_surr_id, date_sale, customer_surr_id, employee_surr_id, store_surr_id, 
                                  address_surr_id, type_payment_surr_id, quantity, sale_amount, num_invoice, update_dt, insert_dt) 
     SELECT
            trim('"' from satr.sale_id) sale_id,
            'RETAIL',
            'SA_TRANSACTION_RETAIL',
            COALESCE(ceb.book_id, -1) book_id,
            CAST(substring(satr.invoice_date, 1, 10) AS DATE) invoice_date,
            COALESCE(cec.customer_id, -1) customer_id,
            COALESCE(cee.employee_id, -1) employee_id,
            COALESCE(ces.store_id, -1) store_id,
            COALESCE(ceadr.address_id, -1) address_id,
            COALESCE(ctp.type_payment_id, -1) type_payment_id,
            COALESCE(CAST(satr.quantity AS INTEGER), 0) quantity,
            CAST(satr.sale_amount AS NUMERIC(10, 2)) sale_amount,
            trim('"' from satr.invoice) invoice,
            GETDATE(),
            GETDATE()
            FROM sa_transaction_retail satr
            LEFT JOIN ce_stores ces ON trim('"' from satr.store_id) = ces.store_src_id
            LEFT JOIN ce_addresses ceadr ON satr.address_id = ceadr.address_src_id
            LEFT JOIN ce_employees cee ON trim('"' from satr.employee_id) = cee.employee_src_id
            LEFT JOIN ce_type_payments ctp ON satr.type_payment_id = ctp.type_payment_src_id
            LEFT JOIN ce_books ceb ON satr.book_id = ceb.book_src_id 
                  AND ceb.start_dt <= CAST(substring(satr.invoice_date, 1, 10) AS DATE)
                  AND ceb.end_dt   >= CAST(substring(satr.invoice_date, 1, 10) AS DATE)
            LEFT JOIN ce_customers cec ON satr.customer_id = cec.customer_src_id 
                  AND cec.SOURCE_SYSTEM = 'RETAIL'         
            WHERE CAST(substring(satr.invoice_date, 1, 10) AS DATE) >= @p_date_period
              AND CAST(substring(satr.invoice_date, 1, 10) AS DATE) < DATEADD(month, 1, @p_date_period)
    UNION ALL
    
    SELECT  trim('"' from sats.sale_id) sale_id,
            'STOCK',
            'SA_TRANSACTION_STOCK',
            COALESCE(ceb.book_id, -1) book_id,
            CAST(substring(sats.invoice_date, 1, 10) AS DATE) invoice_date,
            COALESCE(cec.customer_id, -1) customer_id,
            COALESCE(cee.employee_id, -1) employee_id,
            COALESCE(ces.store_id, -1) store_id,
            COALESCE(ceadr.address_id, -1) address_id,
            COALESCE(ctp.type_payment_id, -1) type_payment_id,
            COALESCE(CAST(sats.quantity AS INTEGER), 0) quantity,  
            CAST(sats.sale_amount AS NUMERIC(10, 2)) sale_amount,  
            trim('"' from sats.invoice) invoice,                
            GETDATE(),
            GETDATE()
    FROM sa_transaction_stock sats
    LEFT JOIN ce_stores ces ON trim('"' from sats.store_id) = ces.store_src_id
    LEFT JOIN ce_addresses ceadr ON sats.address_id = ceadr.address_src_id
    LEFT JOIN ce_employees cee ON trim('"' from sats.employee_id) = cee.employee_src_id
    LEFT JOIN ce_type_payments ctp ON sats.type_payment_id = ctp.type_payment_src_id
    LEFT JOIN ce_books ceb ON sats.book_id = ceb.book_src_id 
          AND ceb.start_dt <= CAST(substring(sats.invoice_date, 1, 10) AS DATE)
          AND ceb.end_dt   >= CAST(substring(sats.invoice_date, 1, 10) AS DATE)      
		  
    LEFT JOIN ce_customers cec ON sats.customer_id = cec.customer_src_id 
          AND cec.SOURCE_SYSTEM = 'STOCK'
    WHERE CAST(substring(sats.invoice_date, 1, 10) AS DATE) >= @p_date_period
      AND CAST(substring(sats.invoice_date, 1, 10) AS DATE) < DATEADD(month, 1, @p_date_period);        

END;
GO
ALTER DATABASE [BL_3NF] SET  READ_WRITE 
GO
CREATE OR ALTER VIEW v_incr_stores
AS
( SELECT sast.STORE_ID,
         sast.STORE_NAME,
         COALESCE(cets.type_store_id, -1) type_store_id
  FROM sa_stores sast
  LEFT JOIN ce_type_stores cets ON sast.STORE_TYPE_ID = cets.TYPE_STORE_SRC_ID
  AND cets.SOURCE_SYSTEM = 'RETAIL'
  AND cets.SOURCE_ENTITY = 'SA_TYPE_STORES'
  WHERE sast.IS_CPROCESSED = 'N'
);    
GO
CREATE OR ALTER VIEW v_incr_sales
AS
( 
    SELECT
            trim('"' from satr.sale_id) sale_id,
            'RETAIL' SOURCE_SYSTEM,
            'SA_TRANSACTION_RETAIL' SOURCE_ENTITY,
            COALESCE(ceb.book_id, -1) book_id,
            CAST(substring(satr.invoice_date, 1, 10) AS DATE) invoice_date,
            COALESCE(cec.customer_id, -1) customer_id,
            COALESCE(cee.employee_id, -1) employee_id,
            COALESCE(ces.store_id, -1) store_id,
            COALESCE(ceadr.address_id, -1) address_id,
            COALESCE(ctp.type_payment_id, -1) type_payment_id,
            COALESCE(CAST(satr.quantity AS INTEGER), 0) quantity,
            CAST(satr.sale_amount AS NUMERIC(10, 2)) sale_amount,
            trim('"' from satr.invoice) invoice
    FROM sa_transaction_retail satr
    LEFT JOIN ce_stores ces ON trim('"' from satr.store_id) = ces.store_src_id
    LEFT JOIN ce_addresses ceadr ON satr.address_id = ceadr.address_src_id
    LEFT JOIN ce_employees cee ON trim('"' from satr.employee_id) = cee.employee_src_id
    LEFT JOIN ce_type_payments ctp ON satr.type_payment_id = ctp.type_payment_src_id
    LEFT JOIN ce_books ceb ON satr.book_id = ceb.book_src_id 
          AND ceb.start_dt <= CAST(substring(satr.invoice_date, 1, 10) AS DATE)
          AND ceb.end_dt   >= CAST(substring(satr.invoice_date, 1, 10) AS DATE)
    LEFT JOIN ce_customers cec ON satr.customer_id = cec.customer_src_id 
          AND cec.SOURCE_SYSTEM = 'RETAIL'         
    WHERE satr.insert_dt > 
        ( SELECT previous_loaded_date
          FROM prm_mta_incremental_load 
          WHERE sa_table_name = 'SA_TRANSACTION' )
       OR satr.update_dt > 
        ( SELECT previous_loaded_date 
          FROM prm_mta_incremental_load 
          WHERE sa_table_name = 'SA_TRANSACTION' )

    UNION ALL
    
    SELECT  trim('"' from sats.sale_id) sale_id,
            'STOCK' SOURCE_SYSTEM,
            'SA_TRANSACTION_STOCK' SOURCE_ENTITY,
            COALESCE(ceb.book_id, -1) book_id,
            CAST(substring(sats.invoice_date, 1, 10) AS DATE) invoice_date,
            COALESCE(cec.customer_id, -1) customer_id,
            COALESCE(cee.employee_id, -1) employee_id,
            COALESCE(ces.store_id, -1) store_id,
            COALESCE(ceadr.address_id, -1) address_id,
            COALESCE(ctp.type_payment_id, -1) type_payment_id,
            COALESCE(CAST(sats.quantity AS INTEGER), 0) quantity,  
            CAST(sats.sale_amount AS NUMERIC(10, 2)) sale_amount,  
            trim('"' from sats.invoice) invoice
    FROM sa_transaction_stock sats
    LEFT JOIN ce_stores ces ON trim('"' from sats.store_id) = ces.store_src_id
    LEFT JOIN ce_addresses ceadr ON sats.address_id = ceadr.address_src_id
    LEFT JOIN ce_employees cee ON trim('"' from sats.employee_id) = cee.employee_src_id
    LEFT JOIN ce_type_payments ctp ON sats.type_payment_id = ctp.type_payment_src_id
    LEFT JOIN ce_books ceb ON sats.book_id = ceb.book_src_id 
          AND ceb.start_dt <= CAST(substring(sats.invoice_date, 1, 10) AS DATE)
          AND ceb.end_dt   >= CAST(substring(sats.invoice_date, 1, 10) AS DATE)         
    LEFT JOIN ce_customers cec ON sats.customer_id = cec.customer_src_id 
          AND cec.SOURCE_SYSTEM = 'STOCK'
          
    WHERE sats.insert_dt > 
        ( SELECT previous_loaded_date
          FROM prm_mta_incremental_load 
          WHERE sa_table_name = 'SA_TRANSACTION' )
       OR sats.update_dt > 
        ( SELECT previous_loaded_date 
          FROM prm_mta_incremental_load 
          WHERE sa_table_name = 'SA_TRANSACTION' )
);         
               
GO
CREATE OR ALTER VIEW v_incr_employees
AS
( SELECT sae.EMPLOYEE_ID,
         sae.FIRST_NAME,
         sae.LAST_NAME,
         COALESCE(cep.POST_ID, -1) POST_ID,
         COALESCE(ces.STORE_ID, -1) STORE_ID                
  FROM sa_employees sae
  LEFT JOIN ce_posts cep ON sae.POST_ID = cep.post_src_id
  LEFT JOIN ce_stores ces ON sae.STORE_ID = ces.store_src_id 
 
  WHERE sae.insert_dt > 
        ( SELECT previous_loaded_date
          FROM prm_mta_incremental_load 
          WHERE sa_table_name = 'SA_EMPLOYEES' )
     OR sae.update_dt > 
        ( SELECT previous_loaded_date 
          FROM prm_mta_incremental_load 
          WHERE sa_table_name = 'SA_EMPLOYEES' )
);         
               
GO
INSERT INTO ce_addresses(ADDRESS_ID, ADDRESS_SRC_ID, ADDRESS, postal_code, CITY_SURR_ID, SOURCE_SYSTEM, SOURCE_ENTITY, update_dt, insert_dt)  
SELECT -1, -1, 'NA', 'NA', -1, 'NA', 'NA', GETDATE(), GETDATE()
WHERE NOT EXISTS ( SELECT ADDRESS_ID
                   FROM ce_addresses
                   WHERE ADDRESS_ID = -1 );
GO
INSERT INTO ce_authors(AUTHOR_ID, AUTHOR_SRC_ID, AUTHOR_NAME, SOURCE_SYSTEM, SOURCE_ENTITY, update_dt, insert_dt) 
SELECT -1, -1, 'NA', 'NA', 'NA', GETDATE(), GETDATE()
WHERE NOT EXISTS ( SELECT AUTHOR_ID
                   FROM ce_authors
                   WHERE AUTHOR_ID = -1 );

GO
INSERT INTO ce_books(BOOK_ID, BOOK_SRC_ID, SOURCE_SYSTEM, SOURCE_ENTITY, ISBN, PUBLISHER, BOOK_TITLE,
                            YEAR_OF_PUBLICATION, AUTHOR_ID, SUB_CATEGORY_SURR_ID, START_DT, END_DT, IS_ACTIVE, UPDATE_DT, INSERT_DT) 
SELECT -1, -1, 'NA', 'NA', 'NA', 'NA', 'NA', -1, -1, -1, CAST('01-01-1970' AS DATE), CAST('01-01-9999'AS DATE), 'yes', GETDATE(), GETDATE()
WHERE NOT EXISTS ( SELECT BOOK_ID
                   FROM ce_books
                   WHERE BOOK_ID = -1 );
GO
INSERT INTO ce_categories (CATEGORY_ID, CATEGORY_SRC_ID, category_name, SOURCE_SYSTEM, SOURCE_ENTITY, update_dt, insert_dt) 
SELECT -1, -1, 'NA', 'NA', 'NA', GETDATE(), GETDATE()
WHERE NOT EXISTS ( SELECT CATEGORY_ID
                   FROM ce_categories
                   WHERE CATEGORY_ID = -1 );
GO
INSERT INTO ce_cities(CITY_ID, CITY_SRC_ID, CITY, COUNTRY_SURR_ID, SOURCE_SYSTEM, SOURCE_ENTITY, update_dt, insert_dt) 
SELECT -1, -1, 'NA', -1, 'NA', 'NA', GETDATE(), GETDATE()
WHERE NOT EXISTS ( SELECT CITY_ID
                   FROM ce_cities
                   WHERE CITY_ID = -1 );

GO
INSERT INTO ce_countries(COUNTRY_ID, COUNTRY_SRC_ID, COUNTRY, region_surr_id, SOURCE_SYSTEM, SOURCE_ENTITY, update_dt, insert_dt) 
SELECT -1, -1, 'NA', -1, 'NA', 'NA', GETDATE(), GETDATE()
WHERE NOT EXISTS ( SELECT COUNTRY_ID
                   FROM ce_countries
                   WHERE COUNTRY_ID = -1 );
GO
INSERT INTO ce_customers(customer_id, customer_src_id, source_system, source_entity,
                         type_customer, first_name, last_name, gender, date_of_birth, 
                         name_of_organization, head_of_organization, 
                         iban, email, address_surr_id, update_dt, insert_dt) 
SELECT -1, -1, 'NA', 'NA', -1, 'NA', 'NA', 'NA', CAST('1970-01-01' AS DATE),  'NA', 'NA', 'NA', 'NA', -1, GETDATE(), GETDATE()
WHERE NOT EXISTS ( SELECT customer_id
                   FROM ce_customers
                   WHERE customer_id = -1 );
GO
INSERT INTO ce_employees(EMPLOYEE_ID, EMPLOYEE_SRC_ID, SOURCE_ENTITY, SOURCE_SYSTEM, store_surr_id, FIRST_NAME, 
                                LAST_NAME, POST_SURR_ID, update_dt, insert_dt) 
SELECT -1, -1, 'NA', 'NA', -1, 'NA', 'NA', -1, GETDATE(), GETDATE()
WHERE NOT EXISTS ( SELECT EMPLOYEE_ID
                   FROM ce_employees
                   WHERE EMPLOYEE_ID = -1 );

GO
INSERT INTO ce_posts(POST_ID, POST_SRC_ID, POST_NAME, SOURCE_SYSTEM, SOURCE_ENTITY, update_dt, insert_dt)
SELECT -1, -1, 'NA', 'NA', 'NA', GETDATE(), GETDATE()
WHERE NOT EXISTS ( SELECT POST_ID
                   FROM ce_posts
                   WHERE POST_ID = -1 );
GO
INSERT INTO ce_regions(REGION_ID, REGION_SRC_ID, REGION, SOURCE_SYSTEM, SOURCE_ENTITY, update_dt, insert_dt) 
SELECT -1, -1, 'NA', 'NA', 'NA', GETDATE(), GETDATE()
WHERE NOT EXISTS ( SELECT REGION_ID
                   FROM ce_regions
                   WHERE REGION_ID = -1 );
GO
INSERT INTO ce_stores(STORE_ID, STORE_SRC_ID, STORE_NAME, STORE_TYPE_SURR_ID, SOURCE_SYSTEM, SOURCE_ENTITY, update_dt, insert_dt)  
SELECT -1, -1, 'NA', -1, 'NA', 'NA', GETDATE(), GETDATE()
WHERE NOT EXISTS ( SELECT STORE_ID
                   FROM ce_stores
                   WHERE STORE_ID = -1 );

GO
INSERT INTO ce_sub_categories(SUB_CATEGORY_ID, SUB_CATEGORY_SRC_ID, SUB_CATEGORY, category_surr_id, SOURCE_SYSTEM, SOURCE_ENTITY, update_dt, insert_dt) 
SELECT -1, -1, 'NA', -1, 'NA', 'NA', GETDATE(), GETDATE()
WHERE NOT EXISTS ( SELECT SUB_CATEGORY_ID
                   FROM ce_sub_categories
                   WHERE SUB_CATEGORY_ID = -1 );

GO
INSERT INTO ce_type_payments(TYPE_PAYMENT_ID, TYPE_PAYMENT_SRC_ID, TYPE_PAYMENT, SOURCE_SYSTEM, SOURCE_ENTITY, update_dt, insert_dt) 
SELECT -1, -1, 'NA', 'NA', 'NA', GETDATE(), GETDATE()
WHERE NOT EXISTS ( SELECT TYPE_PAYMENT_ID
                   FROM ce_type_payments
                   WHERE TYPE_PAYMENT_ID = -1 );

GO
INSERT INTO ce_type_stores(TYPE_STORE_ID, TYPE_STORE_SRC_ID, TYPE_STORE, SOURCE_SYSTEM, SOURCE_ENTITY, update_dt, insert_dt) 
SELECT -1, -1, 'NA', 'NA', 'NA', GETDATE(), GETDATE()
WHERE NOT EXISTS ( SELECT TYPE_STORE_ID
                   FROM ce_type_stores
                   WHERE TYPE_STORE_ID = -1 );
GO
INSERT INTO prm_mta_incremental_load(incremental_load_type, sa_table_name, target_table_name, package, [procedure], previous_loaded_date) 
SELECT 'LAST_DATE', 'SA_EMPLOYEES', 'CE_EMPLOYEES', 'PKG_3NF_EMPLOYEES', 'LD_INCR_CE_EMPLOYEES', CAST('1970-01-01' AS DATE);

INSERT INTO prm_mta_incremental_load(incremental_load_type, sa_table_name, target_table_name, package, [procedure], previous_loaded_date) 
SELECT 'LAST_DATE', 'SA_TRANSACTION', 'CE_SALES', 'PKG_3NF_SALES', 'LD_INCR_CE_SALES', CAST('1970-01-01' AS DATE);

INSERT INTO prm_mta_incremental_load(incremental_load_type, sa_table_name, target_table_name, package, [procedure], previous_loaded_date) 
SELECT 'FLAG', 'SA_STORES', 'CE_STORES', 'PKG_3NF_STORES', 'LD_INCR_CE_STORES', CAST('1970-01-01' AS DATE);

GO





