DROP TABLE IF EXISTS dim_addresses

CREATE TABLE dim_addresses (
    address_surr_id  BIGINT NOT NULL,
    address_id       VARCHAR(50) NOT NULL,
    source_system    VARCHAR(30) NOT NULL,
    source_entity    VARCHAR(30) NOT NULL,
    address          VARCHAR(50) NOT NULL,
    postal_code      VARCHAR(20) NOT NULL,
    city_id          BIGINT NOT NULL,
    city             VARCHAR(50) NOT NULL,
    country_id       BIGINT NOT NULL,
    country          VARCHAR(50) NOT NULL,
    region_id        BIGINT NOT NULL,
    region           VARCHAR(50) NOT NULL,
    update_dt        DATE NOT NULL,
    insert_dt        DATE NOT NULL
);

ALTER TABLE dim_addresses ADD CONSTRAINT dim_address_pk PRIMARY KEY ( address_surr_id );

GO

INSERT INTO  dim_addresses(address_surr_id, address_id, source_system, source_entity, address,
                                 postal_code, city_id, city, country_id, country, region_id, 
                                 region, update_dt, insert_dt)           
SELECT -1, -1, 'NA', 'NA', 'NA', 'NA', -1, 'NA', -1, 'NA', -1, 'NA', GETDATE(), GETDATE()
WHERE NOT EXISTS ( SELECT address_surr_id
                   FROM dim_addresses
                   WHERE address_surr_id = -1 );

GO

DROP TABLE IF EXISTS dim_books_scd;

CREATE TABLE dim_books_scd (
    book_surr_id         BIGINT NOT NULL,
    book_id              BIGINT NOT NULL,
    source_system        VARCHAR(30) NOT NULL,
    source_entity        VARCHAR(30) NOT NULL,
    isbn                 VARCHAR(20) NOT NULL,
    publisher            VARCHAR(100) NOT NULL,
    book_title           VARCHAR(300) NOT NULL,
    year_of_publication  INTEGER  NOT NULL,
    author_id            BIGINT NOT NULL,
    author               VARCHAR(150) NOT NULL,
    category_id          BIGINT NOT NULL,
    category_name        VARCHAR(30) NOT NULL,
    sub_category_id      BIGINT NOT NULL,
    sub_category         VARCHAR(100) NOT NULL,
    start_dt             DATE NOT NULL,
    end_dt               DATE NOT NULL,
    is_active            VARCHAR(4) NOT NULL,
    update_dt            DATE NOT NULL,
    insert_dt            DATE NOT NULL
);

ALTER TABLE dim_books_scd ADD CONSTRAINT dim_book_scd_pk PRIMARY KEY ( book_surr_id, start_dt );

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

DROP TABLE IF EXISTS dim_customers;

CREATE TABLE dim_customers (
    customer_surr_id      BIGINT NOT NULL,
    customer_id           BIGINT NOT NULL,
    source_system         VARCHAR(30) NOT NULL,
    source_entity         VARCHAR(30) NOT NULL,
    type_customer         BIGINT NOT NULL,
    first_name            VARCHAR(50) NOT NULL,
    last_name             VARCHAR(50) NOT NULL,
    gender                VARCHAR(20) NOT NULL,
    date_of_birth         DATE NOT NULL,
    name_of_organization  VARCHAR(100) NOT NULL,
    email                 VARCHAR(50) NOT NULL,
    head_of_organization  VARCHAR(50) NOT NULL,
    iban                  VARCHAR(50) NOT NULL,
    address_id            NUMERIC NOT NULL,
    address               VARCHAR(50) NOT NULL,
    postal_code           VARCHAR(20)  NOT NULL,
    city_id               BIGINT NOT NULL,
    city                  VARCHAR(50)  NOT NULL,
    country_id            BIGINT NOT NULL,
    country               VARCHAR(50)  NOT NULL,
    region_id             BIGINT NOT NULL,
    region                VARCHAR(50)  NOT NULL,
    update_dt             DATE NOT NULL,
    insert_dt             DATE NOT NULL
);

ALTER TABLE dim_customers ADD CONSTRAINT dim_customer_pk PRIMARY KEY ( customer_surr_id );

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

DROP TABLE IF EXISTS dim_dates;
CREATE TABLE dim_dates (
    date_id                  DATE NOT NULL,
    day_name                 VARCHAR(20) NOT NULL,
    day_number_in_week       INTEGER NOT NULL,
    day_number_in_month      INTEGER NOT NULL,
    calendar_week_number     INTEGER NOT NULL,
    calendar_month_number    INTEGER NOT NULL,
    calendar_quarter_number  INTEGER NOT NULL,
    days_in_cal_year         INTEGER NOT NULL,
    year_num                 INTEGER NOT NULL
);

ALTER TABLE dim_dates ADD CONSTRAINT dim_time_pk PRIMARY KEY ( date_id );

GO

DROP TABLE IF EXISTS dim_employees;

CREATE TABLE dim_employees (
    employee_surr_id  BIGINT NOT NULL,
    employee_id       VARCHAR(50) NOT NULL,
    source_entity     VARCHAR(30) NOT NULL,
    source_system     VARCHAR(30) NOT NULL,
    first_name        VARCHAR(50) NOT NULL,
    last_name         VARCHAR(50) NOT NULL,
    post_id           BIGINT NOT NULL,
    post              VARCHAR(50) NOT NULL,
    store_id          BIGINT NOT NULL,
    store_name        VARCHAR(50) NOT NULL,
    store_type_id     BIGINT NOT NULL,
    store_type        VARCHAR(30) NOT NULL,
    update_dt         DATE NOT NULL,
    insert_dt         DATE NOT NULL
);

ALTER TABLE dim_employees ADD CONSTRAINT dim_employee_pk PRIMARY KEY ( employee_surr_id );

GO

INSERT INTO dim_employees(employee_surr_id, employee_id, source_entity, source_system, first_name, last_name, 
                                post_id, post, store_id, store_name, store_type_id, store_type, update_dt, insert_dt) 
SELECT -1, '-1', 'NA', 'NA', 'NA', 'NA', -1, 'NA', -1, 'NA', -1, 'NA', GETDATE(), GETDATE()
WHERE NOT EXISTS ( SELECT employee_surr_id
                   FROM dim_employees
                   WHERE employee_surr_id = -1 );

GO

DROP TABLE IF EXISTS dim_stores;

CREATE TABLE dim_stores (
    store_surr_id  BIGINT NOT NULL,
    store_id       BIGINT NOT NULL,
    source_system  VARCHAR(30) NOT NULL,
    source_entity  VARCHAR(30) NOT NULL,
    store_name     VARCHAR(50) NOT NULL,
    store_type_id  BIGINT  NOT NULL,
    store_type     VARCHAR(30) NOT NULL,
    update_dt      DATE NOT NULL,
    insert_dt      DATE NOT NULL
);

ALTER TABLE dim_stores ADD CONSTRAINT dim_store_pk PRIMARY KEY ( store_surr_id );

GO

INSERT INTO  dim_stores(store_surr_id, store_id, source_system, source_entity, store_name, store_type_id, store_type, update_dt, insert_dt) 
SELECT -1, -1, 'NA', 'NA', 'NA', -1, 'NA', GETDATE(), GETDATE()
WHERE NOT EXISTS ( SELECT store_surr_id
                   FROM dim_stores
                   WHERE store_surr_id = -1 );
				   
GO

DROP TABLE IF EXISTS dim_type_payments;

CREATE TABLE dim_type_payments (
    type_payment_surr_id  BIGINT NOT NULL,
    type_payment_id       BIGINT NOT NULL,
    source_system         VARCHAR(30) NOT NULL,
    source_entity         VARCHAR(30) NOT NULL,
    type_payment          VARCHAR(30) NOT NULL,
    update_dt             DATE  NOT NULL,
    insert_dt             DATE  NOT NULL
);

ALTER TABLE dim_type_payments ADD CONSTRAINT dim_type_payment_pk PRIMARY KEY ( type_payment_surr_id );

GO

INSERT INTO dim_type_payments(type_payment_surr_id, type_payment_id, source_system, source_entity, type_payment, update_dt, insert_dt) 
SELECT -1, -1, 'NA', 'NA', 'NA', GETDATE(), GETDATE()
WHERE NOT EXISTS ( SELECT type_payment_surr_id
                   FROM dim_type_payments
                   WHERE type_payment_surr_id = -1 );
				   
GO


