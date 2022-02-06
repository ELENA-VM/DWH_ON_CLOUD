CREATE MASTER KEY;

CREATE DATABASE SCOPED CREDENTIAL AzureSqlSqrverCredentialETL
WITH IDENTITY = 'EtlAdmin',
SECRET = '';

CREATE EXTERNAL DATA SOURCE sql_ds_bl_3nf
 WITH 
 ( TYPE = RDBMS,
   LOCATION = 'etlbooksalessqlserver.database.windows.net',
   DATABASE_NAME = 'BL_3NF',
   CREDENTIAL = AzureSqlSqrverCredentialETL 
 );
 
CREATE EXTERNAL TABLE ce_books
(
    book_id              BIGINT NOT NULL,
    book_src_id          VARCHAR(50) NOT NULL,
    source_system        VARCHAR(30) NOT NULL,
    source_entity        VARCHAR(30) NOT NULL,
    isbn                 VARCHAR(20) NOT NULL,
    publisher            VARCHAR(100) NOT NULL,
    book_title           VARCHAR(300) NOT NULL,
    year_of_publication  INTEGER NOT NULL,
    author_id            BIGINT NOT NULL,
    sub_category_surr_id BIGINT NOT NULL,
    start_dt             DATE NOT NULL,
    end_dt               DATE NOT NULL,
    is_active            VARCHAR(4) NOT NULL,
    update_dt            DATE NOT NULL,
    insert_dt            DATE NOT NULL
)
WITH 
(
  DATA_SOURCE = sql_ds_bl_3nf
);

CREATE EXTERNAL TABLE ce_authors
(
    author_id      BIGINT NOT NULL,
    author_src_id  VARCHAR(50) NOT NULL,
    source_entity  VARCHAR(30) NOT NULL,
    source_system  VARCHAR(30) NOT NULL,
    author_name    VARCHAR(150) NOT NULL,
    update_dt      DATE NOT NULL,
    insert_dt      DATE NOT NULL
)
WITH 
(
  DATA_SOURCE = sql_ds_bl_3nf
);

CREATE EXTERNAL TABLE ce_sub_categories
(
    sub_category_id      BIGINT NOT NULL,
    sub_category_src_id  VARCHAR(50) NOT NULL,
    source_entity        VARCHAR(30) NOT NULL,
    source_system        VARCHAR(30) NOT NULL,
    sub_category         VARCHAR(100) NOT NULL,
    category_surr_id     BIGINT NOT NULL,
    update_dt            DATE NOT NULL,
    insert_dt            DATE NOT NULL
)
WITH 
(
  DATA_SOURCE = sql_ds_bl_3nf
);

CREATE EXTERNAL TABLE ce_categories
(
    category_id      BIGINT NOT NULL,
    category_src_id  VARCHAR(50) NOT NULL,
    source_entity    VARCHAR(30) NOT NULL,
    source_system    VARCHAR(30) NOT NULL,
    category_name    VARCHAR(30) NOT NULL,
    update_dt        DATE NOT NULL,
    insert_dt        DATE NOT NULL
)
WITH 
(
  DATA_SOURCE = sql_ds_bl_3nf
);

CREATE EXTERNAL TABLE ce_customers
(
    customer_id           BIGINT NOT NULL,
    customer_src_id       VARCHAR(50) NOT NULL,
    source_system         VARCHAR(30) NOT NULL,
    source_entity         VARCHAR(30) NOT NULL,
    type_customer         INTEGER NOT NULL,
    first_name            VARCHAR(50) NOT NULL,
    last_name             VARCHAR(50) NOT NULL,
    gender                VARCHAR(20) NOT NULL,
    date_of_birth         DATE NOT NULL,
    name_of_organization  VARCHAR(100) NOT NULL,
    head_of_organization  VARCHAR(100) NOT NULL,
    iban                  VARCHAR(50) NOT NULL,
    email                 VARCHAR(50) NOT NULL,
    address_surr_id       BIGINT NOT NULL,
    update_dt             DATE NOT NULL,
    insert_dt             DATE NOT NULL
)
WITH 
(
  DATA_SOURCE = sql_ds_bl_3nf
);

CREATE EXTERNAL TABLE ce_addresses
(
    address_id      BIGINT NOT NULL,
    address_src_id  VARCHAR(50) NOT NULL,
    source_system   VARCHAR(30) NOT NULL,
    source_entity   VARCHAR(30) NOT NULL,
    address         VARCHAR(50) NOT NULL,
    postal_code     VARCHAR(20)  NOT NULL,
    city_surr_id    BIGINT	NOT NULL,
    update_dt       DATE NOT NULL,
	insert_dt       DATE NOT NULL
)
WITH 
(
  DATA_SOURCE = sql_ds_bl_3nf
);

CREATE EXTERNAL TABLE ce_cities
(
    city_id          BIGINT NOT NULL,
    city_src_id      VARCHAR(30) NOT NULL, 
    source_entity    VARCHAR(30) NOT NULL,
    source_system    VARCHAR(30) NOT NULL,
    city             VARCHAR(50) NOT NULL,
    country_surr_id  BIGINT	NOT NULL,
    update_dt        DATE NOT NULL,
    insert_dt        DATE NOT NULL
)
WITH 
(
  DATA_SOURCE = sql_ds_bl_3nf
);

CREATE EXTERNAL TABLE ce_countries
(
   country_id      BIGINT NOT NULL,
    country_src_id  VARCHAR(50) NOT NULL,
    source_entity   VARCHAR(30) NOT NULL,
    source_system   VARCHAR(30) NOT NULL,
    country         VARCHAR(50) NOT NULL, 
    region_surr_id  BIGINT	NOT NULL,
    update_dt       DATE NOT NULL,
    insert_dt       DATE NOT NULL
)
WITH 
(
  DATA_SOURCE = sql_ds_bl_3nf
);

CREATE EXTERNAL TABLE ce_regions
(
    region_id      BIGINT NOT NULL,
    region_src_id  VARCHAR(50) NOT NULL,
    source_entity  VARCHAR(30) NOT NULL,
    source_system  VARCHAR(30) NOT NULL,
    region         VARCHAR(50) NOT NULL,
    update_dt      DATE NOT NULL,
    insert_dt      DATE NOT NULL
)
WITH 
(
  DATA_SOURCE = sql_ds_bl_3nf
);

CREATE EXTERNAL TABLE ce_employees
(
    employee_id      BIGINT NOT NULL,
    employee_src_id  VARCHAR(50) NOT NULL,
    source_entity    VARCHAR(30) NOT NULL,
    source_system    VARCHAR(30) NOT NULL,
    store_surr_id    BIGINT NOT NULL,
    first_name       VARCHAR(50) NOT NULL,
    last_name        VARCHAR(50)NOT NULL,
    post_surr_id     BIGINT NOT NULL,
    update_dt        DATE NOT NULL,
    insert_dt        DATE NOT NULL
)
WITH 
(
  DATA_SOURCE = sql_ds_bl_3nf
);

CREATE EXTERNAL TABLE ce_stores
(
    store_id            BIGINT NOT NULL,
    store_src_id        VARCHAR(50) NOT NULL, 
    source_system       VARCHAR(30) NOT NULL,
    source_entity       VARCHAR(30) NOT NULL,
    store_name          VARCHAR(50) NOT NULL,
    store_type_surr_id  BIGINT	NOT NULL,
    update_dt           DATE NOT NULL,
    insert_dt           DATE NOT NULL
)
WITH 
(
  DATA_SOURCE = sql_ds_bl_3nf
);

CREATE EXTERNAL TABLE ce_type_stores
(
    type_store_id      BIGINT NOT NULL,
    type_store_src_id  VARCHAR(50) NOT NULL,
    source_entity      VARCHAR(30) NOT NULL,
    source_system      VARCHAR(30) NOT NULL,
    type_store         VARCHAR(30) NOT NULL,
    update_dt          DATE NOT NULL,
    insert_dt          DATE NOT NULL
)
WITH 
(
  DATA_SOURCE = sql_ds_bl_3nf
);

CREATE EXTERNAL TABLE ce_posts
(
    post_id        BIGINT NOT NULL,
    post_src_id    VARCHAR(50) NOT NULL,
    source_entity  VARCHAR(30) NOT NULL,
    source_system  VARCHAR(30) NOT NULL,
    post_name      VARCHAR(50) NOT NULL,
    update_dt      DATE NOT NULL,
    insert_dt      DATE NOT NULL
)
WITH 
(
  DATA_SOURCE = sql_ds_bl_3nf
);

CREATE EXTERNAL TABLE ce_type_payments
(
    type_payment_id      BIGINT NOT NULL,
    type_payment_src_id  VARCHAR(50) NOT NULL,
    source_system        VARCHAR(30) NOT NULL,
    source_entity        VARCHAR(30) NOT NULL,
    type_payment         VARCHAR(30) NOT NULL,
    update_dt            DATE NOT NULL,
    insert_dt            DATE NOT NULL
)
WITH 
(
  DATA_SOURCE = sql_ds_bl_3nf
);