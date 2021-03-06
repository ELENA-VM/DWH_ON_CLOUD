/****** Object:  Database [BL_DM]    Script Date: 2/9/2022 2:02:24 AM ******/
-- CREATE DATABASE [BL_DM]  (EDITION = 'Basic', SERVICE_OBJECTIVE = 'Basic', MAXSIZE = 1 GB) WITH CATALOG_COLLATION = SQL_Latin1_General_CP1_CI_AS;
/****** Object:  DatabaseScopedCredential [AzureSqlSqrverCredentialETL]    Script Date: 2/9/2022 2:02:24 AM ******/
-- CREATE MASTER KEY;
GO
-- CREATE DATABASE SCOPED CREDENTIAL [AzureSqlSqrverCredentialETL] WITH IDENTITY = N'EtlAdmin', SECRET = '';
GO
/****** Object:  PartitionFunction [pf_Date]    Script Date: 2/9/2022 2:02:24 AM ******/
CREATE PARTITION FUNCTION [pf_Date](date) AS RANGE RIGHT FOR VALUES (N'2020-02-01T00:00:00.000', N'2020-03-01T00:00:00.000', N'2020-04-01T00:00:00.000', N'2020-05-01T00:00:00.000', N'2020-06-01T00:00:00.000', N'2020-07-01T00:00:00.000', N'2020-08-01T00:00:00.000', N'2020-09-01T00:00:00.000', N'2020-10-01T00:00:00.000', N'2020-11-01T00:00:00.000', N'2020-12-01T00:00:00.000', N'2021-02-01T00:00:00.000', N'2021-03-01T00:00:00.000', N'2021-04-01T00:00:00.000', N'2021-05-01T00:00:00.000', N'2021-06-01T00:00:00.000', N'2021-07-01T00:00:00.000', N'2021-08-01T00:00:00.000', N'2021-09-01T00:00:00.000', N'2021-10-01T00:00:00.000', N'2021-11-01T00:00:00.000', N'2021-12-01T00:00:00.000', N'2022-02-01T00:00:00.000', N'2022-03-01T00:00:00.000', N'2022-04-01T00:00:00.000', N'2022-05-01T00:00:00.000', N'2022-06-01T00:00:00.000', N'2022-07-01T00:00:00.000', N'2022-08-01T00:00:00.000', N'2022-09-01T00:00:00.000', N'2022-10-01T00:00:00.000', N'2022-11-01T00:00:00.000', N'2022-12-01T00:00:00.000', N'2023-02-01T00:00:00.000')
GO
/****** Object:  PartitionFunction [pf_DateFct]    Script Date: 2/9/2022 2:02:24 AM ******/
CREATE PARTITION FUNCTION [pf_DateFct](date) AS RANGE LEFT FOR VALUES (N'2020-01-01T00:00:00.000', N'2020-02-01T00:00:00.000', N'2020-03-01T00:00:00.000', N'2020-04-01T00:00:00.000', N'2020-05-01T00:00:00.000', N'2020-06-01T00:00:00.000', N'2020-07-01T00:00:00.000', N'2020-08-01T00:00:00.000', N'2020-09-01T00:00:00.000', N'2020-10-01T00:00:00.000', N'2020-11-01T00:00:00.000', N'2020-12-01T00:00:00.000', N'2021-01-01T00:00:00.000', N'2021-02-01T00:00:00.000', N'2021-03-01T00:00:00.000', N'2021-04-01T00:00:00.000', N'2021-05-01T00:00:00.000', N'2021-06-01T00:00:00.000', N'2021-07-01T00:00:00.000', N'2021-08-01T00:00:00.000', N'2021-09-01T00:00:00.000', N'2021-10-01T00:00:00.000', N'2021-11-01T00:00:00.000', N'2021-12-01T00:00:00.000', N'2022-01-01T00:00:00.000', N'2022-02-01T00:00:00.000', N'2022-03-01T00:00:00.000', N'2022-04-01T00:00:00.000', N'2022-05-01T00:00:00.000', N'2022-06-01T00:00:00.000', N'2022-07-01T00:00:00.000', N'2022-08-01T00:00:00.000', N'2022-09-01T00:00:00.000', N'2022-10-01T00:00:00.000', N'2022-11-01T00:00:00.000', N'2022-12-01T00:00:00.000', N'2023-01-01T00:00:00.000')
GO
/****** Object:  PartitionFunction [pf_wrkDateFct]    Script Date: 2/9/2022 2:02:24 AM ******/
CREATE PARTITION FUNCTION [pf_wrkDateFct](date) AS RANGE LEFT FOR VALUES (N'2020-01-01T00:00:00.000', N'2020-02-01T00:00:00.000', N'2020-03-01T00:00:00.000', N'2020-04-01T00:00:00.000', N'2020-05-01T00:00:00.000', N'2020-06-01T00:00:00.000', N'2020-07-01T00:00:00.000', N'2020-08-01T00:00:00.000', N'2020-09-01T00:00:00.000', N'2020-10-01T00:00:00.000', N'2020-11-01T00:00:00.000', N'2020-12-01T00:00:00.000', N'2021-01-01T00:00:00.000', N'2021-02-01T00:00:00.000', N'2021-03-01T00:00:00.000', N'2021-04-01T00:00:00.000', N'2021-05-01T00:00:00.000', N'2021-06-01T00:00:00.000', N'2021-07-01T00:00:00.000', N'2021-08-01T00:00:00.000', N'2021-09-01T00:00:00.000', N'2021-10-01T00:00:00.000', N'2021-11-01T00:00:00.000', N'2021-12-01T00:00:00.000', N'2022-01-01T00:00:00.000', N'2022-02-01T00:00:00.000', N'2022-03-01T00:00:00.000', N'2022-04-01T00:00:00.000', N'2022-05-01T00:00:00.000', N'2022-06-01T00:00:00.000', N'2022-07-01T00:00:00.000', N'2022-08-01T00:00:00.000', N'2022-09-01T00:00:00.000', N'2022-10-01T00:00:00.000', N'2022-11-01T00:00:00.000', N'2022-12-01T00:00:00.000', N'2023-01-01T00:00:00.000')
GO
/****** Object:  PartitionScheme [ps_Date]    Script Date: 2/9/2022 2:02:24 AM ******/
CREATE PARTITION SCHEME [ps_Date] AS PARTITION [pf_Date] TO ([PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY])
GO
/****** Object:  PartitionScheme [ps_DateFct]    Script Date: 2/9/2022 2:02:24 AM ******/
CREATE PARTITION SCHEME [ps_DateFct] AS PARTITION [pf_DateFct] TO ([PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY])
GO
/****** Object:  PartitionScheme [ps_wrkDateFct]    Script Date: 2/9/2022 2:02:24 AM ******/
CREATE PARTITION SCHEME [ps_wrkDateFct] AS PARTITION [pf_wrkDateFct] TO ([PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY], [PRIMARY])
GO
/****** Object:  Sequence [dbo].[dim_addresses_seq]    Script Date: 2/9/2022 2:02:25 AM ******/
CREATE SEQUENCE [dbo].[dim_addresses_seq] 
 AS [bigint]
 START WITH 1
 INCREMENT BY 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 CACHE 
GO
/****** Object:  Sequence [dbo].[dim_books_scd_seq]    Script Date: 2/9/2022 2:02:25 AM ******/
CREATE SEQUENCE [dbo].[dim_books_scd_seq] 
 AS [bigint]
 START WITH 1
 INCREMENT BY 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 CACHE 
GO
/****** Object:  Sequence [dbo].[dim_customers_seq]    Script Date: 2/9/2022 2:02:26 AM ******/
CREATE SEQUENCE [dbo].[dim_customers_seq] 
 AS [bigint]
 START WITH 1
 INCREMENT BY 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 CACHE 
GO
/****** Object:  Sequence [dbo].[dim_employees_seq]    Script Date: 2/9/2022 2:02:27 AM ******/
CREATE SEQUENCE [dbo].[dim_employees_seq] 
 AS [bigint]
 START WITH 1
 INCREMENT BY 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 CACHE 
GO
/****** Object:  Sequence [dbo].[dim_stores_seq]    Script Date: 2/9/2022 2:02:27 AM ******/
CREATE SEQUENCE [dbo].[dim_stores_seq] 
 AS [bigint]
 START WITH 1
 INCREMENT BY 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 CACHE 
GO
/****** Object:  Sequence [dbo].[dim_type_payments_seq]    Script Date: 2/9/2022 2:02:27 AM ******/
CREATE SEQUENCE [dbo].[dim_type_payments_seq] 
 AS [bigint]
 START WITH 1
 INCREMENT BY 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 CACHE 
GO
/****** Object:  ExternalDataSource [sql_ds_bl_3nf]    Script Date: 2/9/2022 2:02:27 AM ******/
CREATE EXTERNAL DATA SOURCE [sql_ds_bl_3nf] WITH (TYPE = RDBMS, LOCATION = N'etlbooksalessqlservertest.database.windows.net', CREDENTIAL = [AzureSqlSqrverCredentialETL], DATABASE_NAME = N'BL_3NF')
GO
/****** Object:  ExternalDataSource [sql_ds_sa_retail]    Script Date: 2/9/2022 2:02:27 AM ******/
CREATE EXTERNAL DATA SOURCE [sql_ds_sa_retail] WITH (TYPE = RDBMS, LOCATION = N'etlbooksalessqlservertest.database.windows.net', CREDENTIAL = [AzureSqlSqrverCredentialETL], DATABASE_NAME = N'BL_3NF')
GO
/****** Object:  Table [dbo].[ce_addresses]    Script Date: 2/9/2022 2:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE EXTERNAL TABLE [dbo].[ce_addresses]
(
	[address_id] [bigint] NOT NULL,
	[address_src_id] [varchar](50) NOT NULL,
	[source_system] [varchar](30) NOT NULL,
	[source_entity] [varchar](30) NOT NULL,
	[address] [varchar](50) NOT NULL,
	[postal_code] [varchar](20) NOT NULL,
	[city_surr_id] [bigint] NOT NULL,
	[update_dt] [date] NOT NULL,
	[insert_dt] [date] NOT NULL
)
WITH (DATA_SOURCE = [sql_ds_bl_3nf])
GO
/****** Object:  Table [dbo].[ce_authors]    Script Date: 2/9/2022 2:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE EXTERNAL TABLE [dbo].[ce_authors]
(
	[author_id] [bigint] NOT NULL,
	[author_src_id] [varchar](50) NOT NULL,
	[source_entity] [varchar](30) NOT NULL,
	[source_system] [varchar](30) NOT NULL,
	[author_name] [varchar](150) NOT NULL,
	[update_dt] [date] NOT NULL,
	[insert_dt] [date] NOT NULL
)
WITH (DATA_SOURCE = [sql_ds_bl_3nf])
GO
/****** Object:  Table [dbo].[ce_books]    Script Date: 2/9/2022 2:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE EXTERNAL TABLE [dbo].[ce_books]
(
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
)
WITH (DATA_SOURCE = [sql_ds_bl_3nf])
GO
/****** Object:  Table [dbo].[ce_categories]    Script Date: 2/9/2022 2:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE EXTERNAL TABLE [dbo].[ce_categories]
(
	[category_id] [bigint] NOT NULL,
	[category_src_id] [varchar](50) NOT NULL,
	[source_entity] [varchar](30) NOT NULL,
	[source_system] [varchar](30) NOT NULL,
	[category_name] [varchar](30) NOT NULL,
	[update_dt] [date] NOT NULL,
	[insert_dt] [date] NOT NULL
)
WITH (DATA_SOURCE = [sql_ds_bl_3nf])
GO
/****** Object:  Table [dbo].[ce_cities]    Script Date: 2/9/2022 2:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE EXTERNAL TABLE [dbo].[ce_cities]
(
	[city_id] [bigint] NOT NULL,
	[city_src_id] [varchar](30) NOT NULL,
	[source_entity] [varchar](30) NOT NULL,
	[source_system] [varchar](30) NOT NULL,
	[city] [varchar](50) NOT NULL,
	[country_surr_id] [bigint] NOT NULL,
	[update_dt] [date] NOT NULL,
	[insert_dt] [date] NOT NULL
)
WITH (DATA_SOURCE = [sql_ds_bl_3nf])
GO
/****** Object:  Table [dbo].[ce_countries]    Script Date: 2/9/2022 2:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE EXTERNAL TABLE [dbo].[ce_countries]
(
	[country_id] [bigint] NOT NULL,
	[country_src_id] [varchar](50) NOT NULL,
	[source_entity] [varchar](30) NOT NULL,
	[source_system] [varchar](30) NOT NULL,
	[country] [varchar](50) NOT NULL,
	[region_surr_id] [bigint] NOT NULL,
	[update_dt] [date] NOT NULL,
	[insert_dt] [date] NOT NULL
)
WITH (DATA_SOURCE = [sql_ds_bl_3nf])
GO
/****** Object:  Table [dbo].[ce_customers]    Script Date: 2/9/2022 2:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE EXTERNAL TABLE [dbo].[ce_customers]
(
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
	[insert_dt] [date] NOT NULL
)
WITH (DATA_SOURCE = [sql_ds_bl_3nf])
GO
/****** Object:  Table [dbo].[ce_employees]    Script Date: 2/9/2022 2:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE EXTERNAL TABLE [dbo].[ce_employees]
(
	[employee_id] [bigint] NOT NULL,
	[employee_src_id] [varchar](50) NOT NULL,
	[source_entity] [varchar](30) NOT NULL,
	[source_system] [varchar](30) NOT NULL,
	[store_surr_id] [bigint] NOT NULL,
	[first_name] [varchar](50) NOT NULL,
	[last_name] [varchar](50) NOT NULL,
	[post_surr_id] [bigint] NOT NULL,
	[update_dt] [date] NOT NULL,
	[insert_dt] [date] NOT NULL
)
WITH (DATA_SOURCE = [sql_ds_bl_3nf])
GO
/****** Object:  Table [dbo].[ce_posts]    Script Date: 2/9/2022 2:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE EXTERNAL TABLE [dbo].[ce_posts]
(
	[post_id] [bigint] NOT NULL,
	[post_src_id] [varchar](50) NOT NULL,
	[source_entity] [varchar](30) NOT NULL,
	[source_system] [varchar](30) NOT NULL,
	[post_name] [varchar](50) NOT NULL,
	[update_dt] [date] NOT NULL,
	[insert_dt] [date] NOT NULL
)
WITH (DATA_SOURCE = [sql_ds_bl_3nf])
GO
/****** Object:  Table [dbo].[ce_regions]    Script Date: 2/9/2022 2:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE EXTERNAL TABLE [dbo].[ce_regions]
(
	[region_id] [bigint] NOT NULL,
	[region_src_id] [varchar](50) NOT NULL,
	[source_entity] [varchar](30) NOT NULL,
	[source_system] [varchar](30) NOT NULL,
	[region] [varchar](50) NOT NULL,
	[update_dt] [date] NOT NULL,
	[insert_dt] [date] NOT NULL
)
WITH (DATA_SOURCE = [sql_ds_bl_3nf])
GO
/****** Object:  Table [dbo].[ce_sales]    Script Date: 2/9/2022 2:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE EXTERNAL TABLE [dbo].[ce_sales]
(
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
)
WITH (DATA_SOURCE = [sql_ds_bl_3nf])
GO
/****** Object:  Table [dbo].[ce_stores]    Script Date: 2/9/2022 2:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE EXTERNAL TABLE [dbo].[ce_stores]
(
	[store_id] [bigint] NOT NULL,
	[store_src_id] [varchar](50) NOT NULL,
	[source_system] [varchar](30) NOT NULL,
	[source_entity] [varchar](30) NOT NULL,
	[store_name] [varchar](50) NOT NULL,
	[store_type_surr_id] [bigint] NOT NULL,
	[update_dt] [date] NOT NULL,
	[insert_dt] [date] NOT NULL
)
WITH (DATA_SOURCE = [sql_ds_bl_3nf])
GO
/****** Object:  Table [dbo].[ce_sub_categories]    Script Date: 2/9/2022 2:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE EXTERNAL TABLE [dbo].[ce_sub_categories]
(
	[sub_category_id] [bigint] NOT NULL,
	[sub_category_src_id] [varchar](50) NOT NULL,
	[source_entity] [varchar](30) NOT NULL,
	[source_system] [varchar](30) NOT NULL,
	[sub_category] [varchar](100) NOT NULL,
	[category_surr_id] [bigint] NOT NULL,
	[update_dt] [date] NOT NULL,
	[insert_dt] [date] NOT NULL
)
WITH (DATA_SOURCE = [sql_ds_bl_3nf])
GO
/****** Object:  Table [dbo].[ce_type_payments]    Script Date: 2/9/2022 2:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE EXTERNAL TABLE [dbo].[ce_type_payments]
(
	[type_payment_id] [bigint] NOT NULL,
	[type_payment_src_id] [varchar](50) NOT NULL,
	[source_system] [varchar](30) NOT NULL,
	[source_entity] [varchar](30) NOT NULL,
	[type_payment] [varchar](30) NOT NULL,
	[update_dt] [date] NOT NULL,
	[insert_dt] [date] NOT NULL
)
WITH (DATA_SOURCE = [sql_ds_bl_3nf])
GO
/****** Object:  Table [dbo].[ce_type_stores]    Script Date: 2/9/2022 2:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE EXTERNAL TABLE [dbo].[ce_type_stores]
(
	[type_store_id] [bigint] NOT NULL,
	[type_store_src_id] [varchar](50) NOT NULL,
	[source_entity] [varchar](30) NOT NULL,
	[source_system] [varchar](30) NOT NULL,
	[type_store] [varchar](30) NOT NULL,
	[update_dt] [date] NOT NULL,
	[insert_dt] [date] NOT NULL
)
WITH (DATA_SOURCE = [sql_ds_bl_3nf])
GO
/****** Object:  Table [dbo].[dim_addresses]    Script Date: 2/9/2022 2:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dim_addresses](
	[address_surr_id] [bigint] NOT NULL,
	[address_id] [varchar](50) NOT NULL,
	[source_system] [varchar](30) NOT NULL,
	[source_entity] [varchar](30) NOT NULL,
	[address] [varchar](50) NOT NULL,
	[postal_code] [varchar](20) NOT NULL,
	[city_id] [bigint] NOT NULL,
	[city] [varchar](50) NOT NULL,
	[country_id] [bigint] NOT NULL,
	[country] [varchar](50) NOT NULL,
	[region_id] [bigint] NOT NULL,
	[region] [varchar](50) NOT NULL,
	[update_dt] [date] NOT NULL,
	[insert_dt] [date] NOT NULL,
 CONSTRAINT [dim_address_pk] PRIMARY KEY CLUSTERED 
(
	[address_surr_id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dim_books_scd]    Script Date: 2/9/2022 2:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dim_books_scd](
	[book_surr_id] [bigint] NOT NULL,
	[book_id] [bigint] NOT NULL,
	[source_system] [varchar](30) NOT NULL,
	[source_entity] [varchar](30) NOT NULL,
	[isbn] [varchar](20) NOT NULL,
	[publisher] [varchar](100) NOT NULL,
	[book_title] [varchar](300) NOT NULL,
	[year_of_publication] [int] NOT NULL,
	[author_id] [bigint] NOT NULL,
	[author] [varchar](150) NOT NULL,
	[category_id] [bigint] NOT NULL,
	[category_name] [varchar](30) NOT NULL,
	[sub_category_id] [bigint] NOT NULL,
	[sub_category] [varchar](100) NOT NULL,
	[start_dt] [date] NOT NULL,
	[end_dt] [date] NOT NULL,
	[is_active] [varchar](4) NOT NULL,
	[update_dt] [date] NOT NULL,
	[insert_dt] [date] NOT NULL,
 CONSTRAINT [dim_book_scd_pk] PRIMARY KEY CLUSTERED 
(
	[book_surr_id] ASC,
	[start_dt] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dim_customers]    Script Date: 2/9/2022 2:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dim_customers](
	[customer_surr_id] [bigint] NOT NULL,
	[customer_id] [bigint] NOT NULL,
	[source_system] [varchar](30) NOT NULL,
	[source_entity] [varchar](30) NOT NULL,
	[type_customer] [bigint] NOT NULL,
	[first_name] [varchar](50) NOT NULL,
	[last_name] [varchar](50) NOT NULL,
	[gender] [varchar](20) NOT NULL,
	[date_of_birth] [date] NOT NULL,
	[name_of_organization] [varchar](100) NOT NULL,
	[email] [varchar](50) NOT NULL,
	[head_of_organization] [varchar](50) NOT NULL,
	[iban] [varchar](50) NOT NULL,
	[address_id] [numeric](18, 0) NOT NULL,
	[address] [varchar](50) NOT NULL,
	[postal_code] [varchar](20) NOT NULL,
	[city_id] [bigint] NOT NULL,
	[city] [varchar](50) NOT NULL,
	[country_id] [bigint] NOT NULL,
	[country] [varchar](50) NOT NULL,
	[region_id] [bigint] NOT NULL,
	[region] [varchar](50) NOT NULL,
	[update_dt] [date] NOT NULL,
	[insert_dt] [date] NOT NULL,
 CONSTRAINT [dim_customer_pk] PRIMARY KEY CLUSTERED 
(
	[customer_surr_id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dim_dates]    Script Date: 2/9/2022 2:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dim_dates](
	[date_id] [date] NOT NULL,
	[day_name] [varchar](20) NOT NULL,
	[day_number_in_week] [int] NOT NULL,
	[day_number_in_month] [int] NOT NULL,
	[calendar_week_number] [int] NOT NULL,
	[calendar_month_number] [int] NOT NULL,
	[calendar_quarter_number] [int] NOT NULL,
	[days_in_cal_year] [int] NOT NULL,
	[year_num] [int] NOT NULL,
 CONSTRAINT [dim_time_pk] PRIMARY KEY CLUSTERED 
(
	[date_id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dim_employees]    Script Date: 2/9/2022 2:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dim_employees](
	[employee_surr_id] [bigint] NOT NULL,
	[employee_id] [varchar](50) NOT NULL,
	[source_entity] [varchar](30) NOT NULL,
	[source_system] [varchar](30) NOT NULL,
	[first_name] [varchar](50) NOT NULL,
	[last_name] [varchar](50) NOT NULL,
	[post_id] [bigint] NOT NULL,
	[post] [varchar](50) NOT NULL,
	[store_id] [bigint] NOT NULL,
	[store_name] [varchar](50) NOT NULL,
	[store_type_id] [bigint] NOT NULL,
	[store_type] [varchar](30) NOT NULL,
	[update_dt] [date] NOT NULL,
	[insert_dt] [date] NOT NULL,
 CONSTRAINT [dim_employee_pk] PRIMARY KEY CLUSTERED 
(
	[employee_surr_id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dim_stores]    Script Date: 2/9/2022 2:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dim_stores](
	[store_surr_id] [bigint] NOT NULL,
	[store_id] [bigint] NOT NULL,
	[source_system] [varchar](30) NOT NULL,
	[source_entity] [varchar](30) NOT NULL,
	[store_name] [varchar](50) NOT NULL,
	[store_type_id] [bigint] NOT NULL,
	[store_type] [varchar](30) NOT NULL,
	[update_dt] [date] NOT NULL,
	[insert_dt] [date] NOT NULL,
 CONSTRAINT [dim_store_pk] PRIMARY KEY CLUSTERED 
(
	[store_surr_id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dim_type_payments]    Script Date: 2/9/2022 2:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dim_type_payments](
	[type_payment_surr_id] [bigint] NOT NULL,
	[type_payment_id] [bigint] NOT NULL,
	[source_system] [varchar](30) NOT NULL,
	[source_entity] [varchar](30) NOT NULL,
	[type_payment] [varchar](30) NOT NULL,
	[update_dt] [date] NOT NULL,
	[insert_dt] [date] NOT NULL,
 CONSTRAINT [dim_type_payment_pk] PRIMARY KEY CLUSTERED 
(
	[type_payment_surr_id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[fct_sales]    Script Date: 2/9/2022 2:02:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[fct_sales](
	[sales_id] [varchar](50) NOT NULL,
	[source_entity] [varchar](30) NOT NULL,
	[source_system] [varchar](30) NOT NULL,
	[book_surr_id] [bigint] NOT NULL,
	[date_id] [date] NOT NULL,
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
) ON [ps_DateFct]([date_id])
GO
/****** Object:  Table [dbo].[wrk_ex_dm_fct_sales]    Script Date: 2/9/2022 2:02:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[wrk_ex_dm_fct_sales](
	[sales_id] [varchar](50) NOT NULL,
	[source_entity] [varchar](30) NOT NULL,
	[source_system] [varchar](30) NOT NULL,
	[book_surr_id] [bigint] NOT NULL,
	[date_id] [date] NOT NULL,
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
) ON [ps_wrkDateFct]([date_id])
GO
ALTER TABLE [dbo].[dim_addresses] ADD  DEFAULT (NEXT VALUE FOR [dim_addresses_seq]) FOR [address_surr_id]
GO
ALTER TABLE [dbo].[dim_books_scd] ADD  DEFAULT (NEXT VALUE FOR [dim_books_scd_seq]) FOR [book_surr_id]
GO
ALTER TABLE [dbo].[dim_customers] ADD  DEFAULT (NEXT VALUE FOR [dim_customers_seq]) FOR [customer_surr_id]
GO
ALTER TABLE [dbo].[dim_employees] ADD  DEFAULT (NEXT VALUE FOR [dim_employees_seq]) FOR [employee_surr_id]
GO
ALTER TABLE [dbo].[dim_stores] ADD  DEFAULT (NEXT VALUE FOR [dim_stores_seq]) FOR [store_surr_id]
GO
ALTER TABLE [dbo].[dim_type_payments] ADD  DEFAULT (NEXT VALUE FOR [dim_type_payments_seq]) FOR [type_payment_surr_id]
GO
/****** Object:  StoredProcedure [dbo].[fill_dim_date]    Script Date: 2/9/2022 2:02:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create   PROCEDURE [dbo].[fill_dim_date] 
AS 
BEGIN
   DECLARE @start_date date = DATEFROMPARTS( '2019', '1', '1' ) , 
		   @end_date date = DATEFROMPARTS ( '2024', '1', '1' );

    DECLARE @tmp_date date = @start_date;

    WHILE (@tmp_date <= @end_date)
    BEGIN
        INSERT INTO DIM_DATES(DATE_ID, DAY_NAME, DAY_NUMBER_IN_WEEK, DAY_NUMBER_IN_MONTH, 
                              CALENDAR_WEEK_NUMBER, CALENDAR_MONTH_NUMBER, CALENDAR_QUARTER_NUMBER,
                              DAYS_IN_CAL_YEAR, YEAR_NUM)                             
        SELECT @tmp_date,
               DATENAME(weekday, @tmp_date),
               DATEPART(weekday, @tmp_date),
               day(@tmp_date),
               DATEPART(week, @tmp_date),
               month(@tmp_date),
               DATEPART(QUARTER, @tmp_date),
               DATEPART(dayofyear, @tmp_date),
               year(@tmp_date);                   

        SET @tmp_date = DATEADD(day, 1, @tmp_date);
    END;   
END;
GO
/****** Object:  StoredProcedure [dbo].[ld_ce_sales_by_part]    Script Date: 2/9/2022 2:02:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[ld_ce_sales_by_part] 
AS   
BEGIN
	DECLARE @p_start_date date = DATEADD(MONTH, -2, GETDATE()),
			@p_end_date date =  DATEADD(MONTH, 10, GETDATE()),
			@tmp_date date = GETDATE();  
	 
    set @tmp_date = datefromparts(year(@p_start_date), month(@p_start_date), 1);

    WHILE (@tmp_date <= @p_end_date)
	BEGIN
        EXEC load_sale_bl_3nf_layer @tmp_date;  

        set @tmp_date = DATEADD(MONTH, 1, @tmp_date);
    END;        
END;
GO
/****** Object:  StoredProcedure [dbo].[ld_dim_addresses]    Script Date: 2/9/2022 2:02:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[ld_dim_addresses] AS 
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION;
		MERGE INTO dim_addresses target              
		USING (
				SELECT  ceadr.address_id,
						ceadr.address,
						ceadr.postal_code,
						cect.city_id,
						cect.city,
						ceco.country_id,
						ceco.country,
						cer.region_id,
						cer.region
				FROM ce_addresses ceadr 
				INNER JOIN ce_cities cect ON ceadr.city_surr_id = cect.city_id
				INNER JOIN ce_countries ceco ON cect.country_surr_id = ceco.country_id
				INNER JOIN ce_regions cer ON ceco.region_surr_id = cer.region_id 
			  ) source       
			ON (target.address_id = source.address_id AND
				target.source_system = 'BL_3NF' AND
				target.source_entity = 'CE_ADDRESSES') 
        
		WHEN MATCHED 
		AND (IIF(target.address = source.address, 0, 1) +
			 IIF(target.postal_code = source.postal_code, 0, 1) + 
			 IIF(target.city_id = source.city_id, 0, 1) +   
			 IIF(target.city = source.city, 0, 1) +
			 IIF(target.country_id = source.country_id, 0, 1) +
			 IIF(target.country = source.country, 0, 1) + 
			 IIF(target.city_id = source.city_id, 0, 1) +
			 IIF(target.region_id = source.region_id, 0, 1) + 
			 IIF(target.region = source.region, 0, 1) ) > 1
		THEN
			UPDATE SET target.address = source.address, 
					   target.postal_code = source.postal_code, 
					   target.city_id = source.city_id, 
					   target.city = source.city,                        
					   target.country_id = source.country_id, 
					   target.country = source.country, 
					   target.region_id = source.region_id, 
					   target.region = source.region,                          
					   target.UPDATE_DT  = GETDATE()
        
		WHEN NOT MATCHED THEN 
			INSERT (address_surr_id, address_id, source_system, source_entity, address, postal_code, city_id, city, country_id,
					country, region_id, region, update_dt, insert_dt)

			VALUES (DEFAULT, source.address_id, 'BL_3NF', 'CE_ADDRESSES', source.address, source.postal_code, source.city_id, source.city , source.country_id,
					source.country, source.region_id, source.region, GETDATE(), GETDATE()); 
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
/****** Object:  StoredProcedure [dbo].[ld_dim_books]    Script Date: 2/9/2022 2:02:28 AM ******/
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
/****** Object:  StoredProcedure [dbo].[ld_dim_customers]    Script Date: 2/9/2022 2:02:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[ld_dim_customers] AS 
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION;
		MERGE INTO dim_customers target              
		USING (
				SELECT  cecust.customer_id,
						cecust.type_customer,
						cecust.first_name,
						cecust.last_name,
						cecust.gender,
						cecust.date_of_birth,
						cecust.name_of_organization,
						cecust.head_of_organization,
						cecust.iban,
						cecust.email,
						ceadr.address_id,
						ceadr.address,
						ceadr.postal_code,
						cect.city_id,
						cect.city,
						ceco.country_id,
						ceco.country,
						cer.region_id,
						cer.region
				FROM ce_customers cecust
				INNER JOIN ce_addresses ceadr ON cecust.address_surr_id = ceadr.address_id
				INNER JOIN ce_cities cect ON ceadr.city_surr_id = cect.city_id
				INNER JOIN ce_countries ceco ON cect.country_surr_id = ceco.country_id
				INNER JOIN ce_regions cer ON ceco.region_surr_id = cer.region_id 
			  ) source       
			ON (target.customer_id = source.customer_id AND 
				target.source_system = 'BL_3NF' AND
				target.source_entity = 'CE_CUSTOMERS' ) 
        
		WHEN MATCHED 
		AND (IIF(target.type_customer = source.type_customer, 0, 1) +
			 IIF(target.first_name = source.first_name, 0, 1) + 
			 IIF(target.last_name = source.last_name, 0, 1) +                   
			 IIF(target.gender = source.gender, 0, 1) +
			 IIF(target.date_of_birth = source.date_of_birth, 0, 1) + 
			 IIF(target.name_of_organization = source.name_of_organization, 0, 1) +
			 IIF(target.head_of_organization = source.head_of_organization, 0, 1) +
			 IIF(target.iban = source.iban, 0, 1) + 
			 IIF(target.email = source.email, 0, 1) +                   
			 IIF(target.address_id = source.address_id, 0, 1) +
			 IIF(target.address = source.address, 0, 1) +
			 IIF(target.postal_code = source.postal_code, 0, 1) + 
			 IIF(target.city_id = source.city_id, 0, 1) +   
			 IIF(target.city = source.city, 0, 1) +
			 IIF(target.country_id = source.country_id, 0, 1) +
			 IIF(target.country = source.country, 0, 1) + 
			 IIF(target.city_id = source.city_id, 0, 1) +
			 IIF(target.region_id = source.region_id, 0, 1) + 
			 IIF(target.region = source.region, 0, 1) ) > 1	

		THEN
			UPDATE SET target.type_customer = source.type_customer,
					   target.first_name = source.first_name, 
					   target.last_name = source.last_name, 
					   target.gender = source.gender, 
					   target.date_of_birth = source.date_of_birth,                        
					   target.name_of_organization = source.name_of_organization, 
					   target.head_of_organization = source.head_of_organization, 
					   target.iban = source.iban, 
					   target.email = source.email, 
					   target.address_id = source.address_id, 
					   target.address = source.address, 
					   target.postal_code = source.postal_code, 
					   target.city_id = source.city_id, 
					   target.city = source.city,                        
					   target.country_id = source.country_id, 
					   target.country = source.country, 
					   target.region_id = source.region_id, 
					   target.region = source.region,                          
					   target.UPDATE_DT  = GETDATE()
        
		WHEN NOT MATCHED THEN 
			INSERT (customer_surr_id, customer_id, source_system , source_entity, type_customer, first_name, last_name, gender, date_of_birth,
					name_of_organization, email, head_of_organization, iban, address, postal_code, city_id, city, country_id,
					country, region_id, region, address_id, update_dt, insert_dt)

			VALUES (default, source.customer_id, 'BL_3NF', 'CE_CUSTOMERS',
					source.type_customer, source.first_name, source.last_name, source.gender, source.date_of_birth,
					source.name_of_organization , source.email, source.head_of_organization, source.iban,
					source.address , source.postal_code, source.city_id, source.city , source.country_id,
					source.country, source.region_id, source.region, source.address_id, GETDATE(), GETDATE()); 
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
/****** Object:  StoredProcedure [dbo].[ld_dim_employees]    Script Date: 2/9/2022 2:02:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[ld_dim_employees] AS 
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION;
		MERGE INTO dim_employees target              
		USING ( SELECT cem.employee_id,
					   ces.store_id,
					   ces.store_name,
					   cets.type_store_id,
					   cets.type_store,
					   cem.first_name,
					   cem.last_name,
					   cep.post_id,
					   cep.post_name 
				FROM ce_employees cem 
				INNER JOIN ce_stores ces ON cem.store_surr_id = ces.store_id
				INNER JOIN ce_type_stores cets ON ces.store_type_surr_id = cets.type_store_id
				INNER JOIN ce_posts cep ON cem.post_surr_id = cep.post_id   
		) source       
			ON (target.employee_id = source.employee_id AND
				target.source_entity = 'CE_EMPLOYEES' AND
				target.source_system = 'BL_3NF') 
       
		WHEN MATCHED 
		AND (IIF(target.store_id = source.store_id, 0, 1) +
			 IIF(target.store_name = source.store_name, 0, 1) + 
			 IIF(target.store_type_id = source.type_store_id, 0, 1) + 
			 IIF(target.store_type = source.type_store, 0, 1) +
			 IIF(target.first_name = source.first_name, 0, 1) +
			 IIF(target.last_name = source.last_name, 0, 1) +
			 IIF(target.post_id = source.post_id, 0, 1) +
			 IIF(target.post = source.post_name, 0, 1)) > 1
		THEN
			UPDATE SET target.store_id = source.store_id,
					   target.store_name = source.store_name, 
					   target.store_type_id = source.type_store_id, 
					   target.store_type = source.type_store, 
					   target.first_name = source.first_name, 
					   target.last_name = source.last_name, 
					   target.post_id  = source.post_id,
					   target.post  = source.post_name,
					   target.UPDATE_DT  = GETDATE()
        
		WHEN NOT MATCHED THEN 
			INSERT (employee_surr_id, employee_id, source_entity, source_system, first_name, last_name, post_id, post, store_id, store_name,
					store_type_id, store_type, update_dt, insert_dt) 
                
			VALUES (DEFAULT, source.employee_id,  'CE_EMPLOYEES', 'BL_3NF', source.first_name, source.last_name, source.post_id, source.post_name, source.store_id,
					source.store_name, source.type_store_id, source.type_store, GETDATE(), GETDATE()); 
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
/****** Object:  StoredProcedure [dbo].[ld_dim_stores]    Script Date: 2/9/2022 2:02:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[ld_dim_stores] AS 
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION;
		MERGE INTO dim_stores target              
		USING (
				SELECT
					ces.store_id,
					ces.store_name,
					cets.type_store_id,
					cets.type_store
				FROM ce_stores ces
				INNER JOIN ce_type_stores cets ON ces.store_type_surr_id = cets.type_store_id
			  ) source       
			ON (target.store_id = source.store_id AND
				target.source_system = 'BL_3NF' AND
				target.source_entity = 'CE_STORES') 
        
		WHEN MATCHED
		AND (IIF(target.store_name = source.store_name, 0, 1) +
			 IIF(target.store_type_id = source.type_store_id, 0, 1) + 
			 IIF(target.store_type = source.type_store, 0, 1)) > 1
		THEN
			UPDATE SET target.store_name = source.store_name,
					   target.store_type_id = source.type_store_id, 
					   target.store_type = source.type_store, 
					   target.UPDATE_DT  = GETDATE()
        
		WHEN NOT MATCHED THEN 
			INSERT (store_surr_id, store_id, source_system, source_entity, store_name, store_type_id, store_type, update_dt, insert_dt) 
			VALUES (DEFAULT, source.store_id, 'BL_3NF', 'CE_STORES', source.store_name, source.type_store_id, source.type_store, GETDATE(), GETDATE()); 
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
/****** Object:  StoredProcedure [dbo].[ld_dim_type_payments]    Script Date: 2/9/2022 2:02:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[ld_dim_type_payments] AS 
BEGIN 
	BEGIN TRY
		BEGIN TRANSACTION;
		MERGE INTO dim_type_payments target              
		USING (SELECT type_payment_id,
					  type_payment
			   FROM ce_type_payments ) source       
			ON (target.type_payment_id = source.type_payment_id AND
				target.SOURCE_SYSTEM = 'BL_3NF' AND
				target.SOURCE_ENTITY = 'CE_TYPE_PATMENTS') 
        
		WHEN MATCHED 
		AND (IIF(target.TYPE_PAYMENT = source.TYPE_PAYMENT, 0, 1) > 0)
		THEN
			UPDATE SET target.TYPE_PAYMENT = source.TYPE_PAYMENT,
					   target.UPDATE_DT  = GETDATE()
        
		WHEN NOT MATCHED THEN 
			INSERT (type_payment_surr_id, type_payment_id, TYPE_PAYMENT, SOURCE_SYSTEM, SOURCE_ENTITY, update_dt, insert_dt) 
			VALUES (DEFAULT, source.TYPE_PAYMENT_ID, source.TYPE_PAYMENT, 'BL_3NF', 'CE_TYPE_PATMENTS', GETDATE(), GETDATE()); 
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
/****** Object:  StoredProcedure [dbo].[ld_fct_sales]    Script Date: 2/9/2022 2:02:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[ld_fct_sales] AS 
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION;
		MERGE INTO fct_sales target              
		USING (
				SELECT ces.sales_src_id,
					   dm_book.book_surr_id,
					   dm_dt.DATE_ID,
					   dm_cust.customer_surr_id,
					   dm_em.employee_surr_id,    
					   dm_st.store_surr_id,    
					   dm_ad.address_surr_id,    
					   dm_tp.type_payment_surr_id,
					   ces.quantity,
					   ces.sale_amount,
					   ces.num_invoice
				FROM ce_sales ces
				JOIN dim_books_scd dm_book ON ces.book_surr_id = dm_book.book_id
				JOIN dim_dates dm_dt ON ces.date_sale = dm_dt.DATE_ID
				JOIN dim_customers dm_cust ON ces.customer_surr_id = dm_cust.customer_id
				JOIN dim_employees dm_em ON ces.employee_surr_id = dm_em.employee_id
				JOIN dim_stores dm_st ON ces.store_surr_id = dm_st.store_id
				JOIN dim_addresses dm_ad ON ces.address_surr_id = dm_ad.address_id
				JOIN dim_type_payments dm_tp ON ces.type_payment_surr_id = dm_tp.type_payment_id
			) source       
			ON (target.sales_id = source.sales_src_id AND
				target.source_system = 'BL_3NF' AND
				target.source_entity = 'CE_SALES') 
        
		WHEN MATCHED 
		AND (IIF(target.book_surr_id = source.book_surr_id, 0, 1) +
			 IIF(target.date_id = source.date_id, 0, 1) + 
			 IIF(target.customer_surr_id = source.customer_surr_id, 0, 1) +   
			 IIF(target.employee_surr_id = source.employee_surr_id, 0, 1) +
			 IIF(target.store_surr_id = source.store_surr_id, 0, 1) +
			 IIF(target.address_surr_id = source.address_surr_id, 0, 1) + 
			 IIF(target.type_payment_surr_id = source.type_payment_surr_id, 0, 1) +
			 IIF(target.quantity = source.quantity, 0, 1) + 
			 IIF(target.sale_amount = source.sale_amount, 0, 1) +
			 IIF(target.num_invoice = source.num_invoice, 0, 1) ) > 1
	
		THEN
			UPDATE SET target.book_surr_id = source.book_surr_id, 
					   target.date_id = source.date_id, 
					   target.customer_surr_id = source.customer_surr_id, 
					   target.employee_surr_id = source.employee_surr_id,                        
					   target.store_surr_id = source.store_surr_id, 
					   target.address_surr_id = source.address_surr_id, 
					   target.type_payment_surr_id = source.type_payment_surr_id, 
					   target.quantity = source.quantity,                          
					   target.sale_amount = source.sale_amount, 
					   target.num_invoice = source.num_invoice,
					   target.UPDATE_DT  = GETDATE()

		WHEN NOT MATCHED THEN 
			INSERT (sales_id, source_system, source_entity, book_surr_id, date_id, customer_surr_id, employee_surr_id, 
					store_surr_id, address_surr_id, type_payment_surr_id, quantity, sale_amount, num_invoice, update_dt, insert_dt)

			VALUES (source.sales_src_id, 'BL_3NF', 'CE_SALES',
					source.book_surr_id , source.date_id, source.customer_surr_id, source.employee_surr_id,
					source.store_surr_id, source.address_surr_id, source.type_payment_surr_id,
					source.quantity, source.sale_amount, source.num_invoice, GETDATE(), GETDATE()); 
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
/****** Object:  StoredProcedure [dbo].[load_sale_bl_3nf_layer]    Script Date: 2/9/2022 2:02:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[load_sale_bl_3nf_layer] @p_date_period date
AS
BEGIN    
	TRUNCATE TABLE wrk_ex_dm_fct_sales;
    
    INSERT INTO wrk_ex_dm_fct_sales (sales_id, source_system, source_entity,                    
               book_surr_id, date_id, customer_surr_id, employee_surr_id, 
               store_surr_id, address_surr_id, type_payment_surr_id, 
               quantity, sale_amount, num_invoice, update_dt, insert_dt  ) 
    SELECT ces.sales_src_id,
           'BL_3NF',
           'CE_SALES',
           dm_book.book_surr_id,
           dm_dt.DATE_ID,
           dm_cust.customer_surr_id,
           dm_em.employee_surr_id,    
           dm_st.store_surr_id,    
           dm_ad.address_surr_id,    
           dm_tp.type_payment_surr_id,
           ces.quantity,
           ces.sale_amount,
           ces.num_invoice,
           GETDATE(),
           GETDATE()
    FROM ce_sales ces
           JOIN dim_books_scd dm_book ON ces.book_surr_id = dm_book.book_id
           JOIN dim_dates dm_dt ON ces.date_sale = dm_dt.DATE_ID
           JOIN dim_customers dm_cust ON ces.customer_surr_id = dm_cust.customer_id
           JOIN dim_employees dm_em ON ces.employee_surr_id = dm_em.employee_id
           JOIN dim_stores dm_st ON ces.store_surr_id = dm_st.store_id
           JOIN dim_addresses dm_ad ON ces.address_surr_id = dm_ad.address_id
           JOIN dim_type_payments dm_tp ON ces.type_payment_surr_id = dm_tp.type_payment_id
    WHERE ces.date_sale >= @p_date_period
      AND ces.date_sale < DATEADD(month, 1, @p_date_period);	
	
	declare @NumPart integer = 0;

	SELECT @NumPart = p.partition_number
	FROM sys.tables AS t  
	JOIN sys.indexes AS i ON t.object_id = i.object_id  
	JOIN sys.partitions AS p  ON i.object_id = p.object_id AND i.index_id = p.index_id   
	JOIN  sys.partition_schemes AS s ON i.data_space_id = s.data_space_id  
	JOIN sys.partition_functions AS f ON s.function_id = f.function_id  
	LEFT JOIN sys.partition_range_values AS r ON f.function_id = r.function_id and r.boundary_id = p.partition_number  
	WHERE i.type <= 1 AND t.name = 'wrk_ex_dm_fct_sales' 
 	AND convert(varchar, r.value, 112) = convert(varchar, @p_date_period, 112);

	TRUNCATE TABLE fct_sales WITH (PARTITIONS (@NumPart TO @NumPart));

	ALTER TABLE wrk_ex_dm_fct_sales SWITCH PARTITION @NumPart TO fct_sales PARTITION @NumPart;					
END;

GO
ALTER DATABASE [BL_DM] SET  READ_WRITE 
GO
INSERT INTO  dim_addresses(address_surr_id, address_id, source_system, source_entity, address,
                                 postal_code, city_id, city, country_id, country, region_id, 
                                 region, update_dt, insert_dt)           
SELECT -1, -1, 'NA', 'NA', 'NA', 'NA', -1, 'NA', -1, 'NA', -1, 'NA', GETDATE(), GETDATE()
WHERE NOT EXISTS ( SELECT address_surr_id
                   FROM dim_addresses
                   WHERE address_surr_id = -1 );

GO
INSERT INTO  dim_books_scd(book_surr_id, book_id, source_system, source_entity, isbn,
                                 publisher, book_title, year_of_publication, author_id, author, category_id, 
                                 category_name, sub_category_id, sub_category, start_dt, 
                                 end_dt, is_active, update_dt, insert_dt)    
                                 
SELECT -1, -1, 'NA', 'NA', 'NA', 'NA', 'NA', -1, -1, 'NA', -1,  
        'NA', -1 , 'NA', CAST('01-01-1970' AS DATE), CAST('01-01-9999' AS DATE), 'true', GETDATE(), GETDATE()
WHERE NOT EXISTS ( SELECT book_surr_id
                   FROM dim_books_scd
                   WHERE book_surr_id = -1 );

GO
INSERT INTO  dim_customers(customer_surr_id, customer_id, source_system, source_entity, type_customer, address_id,
                                 first_name, last_name, gender, date_of_birth, name_of_organization,
                                 email, head_of_organization, iban, address, postal_code, city_id,
                                 city, country_id, country, region_id, region, update_dt, insert_dt)           
SELECT -1, -1, 'NA', 'NA', -1, -1,
       'NA', 'NA', 'NA', CAST('01-01-1970' AS DATE), 'NA',
       'NA', 'NA', 'NA', 'NA', -1, -1, 'NA', -1, 'NA',-1, 'NA', GETDATE(), GETDATE()
WHERE NOT EXISTS ( SELECT customer_surr_id
                   FROM dim_customers
                   WHERE customer_surr_id = -1 );

GO
INSERT INTO dim_employees(employee_surr_id, employee_id, source_entity, source_system, first_name, last_name, 
                                post_id, post, store_id, store_name, store_type_id, store_type, update_dt, insert_dt) 
SELECT -1, '-1', 'NA', 'NA', 'NA', 'NA', -1, 'NA', -1, 'NA', -1, 'NA', GETDATE(), GETDATE()
WHERE NOT EXISTS ( SELECT employee_surr_id
                   FROM dim_employees
                   WHERE employee_surr_id = -1 );

GO
INSERT INTO  dim_stores(store_surr_id, store_id, source_system, source_entity, store_name, store_type_id, store_type, update_dt, insert_dt) 
SELECT -1, -1, 'NA', 'NA', 'NA', -1, 'NA', GETDATE(), GETDATE()
WHERE NOT EXISTS ( SELECT store_surr_id
                   FROM dim_stores
                   WHERE store_surr_id = -1 );

GO
INSERT INTO dim_type_payments(type_payment_surr_id, type_payment_id, source_system, source_entity, type_payment, update_dt, insert_dt) 
SELECT -1, -1, 'NA', 'NA', 'NA', GETDATE(), GETDATE()
WHERE NOT EXISTS ( SELECT type_payment_surr_id
                   FROM dim_type_payments
                   WHERE type_payment_surr_id = -1 );

GO
EXEC fill_dim_date;
