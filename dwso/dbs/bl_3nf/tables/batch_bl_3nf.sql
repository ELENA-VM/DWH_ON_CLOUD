DROP TABLE IF EXISTS ce_categories;

CREATE TABLE ce_categories (
    category_id      BIGINT NOT NULL,
    category_src_id  VARCHAR(50) NOT NULL,
    source_entity    VARCHAR(30) NOT NULL,
    source_system    VARCHAR(30) NOT NULL,
    category_name    VARCHAR(30) NOT NULL,
    update_dt        DATE NOT NULL,
    insert_dt        DATE NOT NULL
);

ALTER TABLE ce_categories ADD CONSTRAINT ce_category_pk PRIMARY KEY ( category_id );

GO

INSERT INTO ce_categories (CATEGORY_ID, CATEGORY_SRC_ID, category_name, SOURCE_SYSTEM, SOURCE_ENTITY, update_dt, insert_dt) 
SELECT -1, -1, 'NA', 'NA', 'NA', GETDATE(), GETDATE()
WHERE NOT EXISTS ( SELECT CATEGORY_ID
                   FROM ce_categories
                   WHERE CATEGORY_ID = -1 );
				   
GO

DROP TABLE IF EXISTS ce_type_stores;

CREATE TABLE ce_type_stores (
    type_store_id      BIGINT NOT NULL,
    type_store_src_id  VARCHAR(50) NOT NULL,
    source_entity      VARCHAR(30) NOT NULL,
    source_system      VARCHAR(30) NOT NULL,
    type_store         VARCHAR(30) NOT NULL,
    update_dt          DATE NOT NULL,
    insert_dt          DATE NOT NULL
);

ALTER TABLE ce_type_stores ADD CONSTRAINT ce_stores_type_pk PRIMARY KEY ( type_store_id );

GO

INSERT INTO ce_type_stores(TYPE_STORE_ID, TYPE_STORE_SRC_ID, TYPE_STORE, SOURCE_SYSTEM, SOURCE_ENTITY, update_dt, insert_dt) 
SELECT -1, -1, 'NA', 'NA', 'NA', GETDATE(), GETDATE()
WHERE NOT EXISTS ( SELECT TYPE_STORE_ID
                   FROM ce_type_stores
                   WHERE TYPE_STORE_ID = -1 );
				   
GO

DROP TABLE IF EXISTS ce_type_payments;

CREATE TABLE ce_type_payments (
    type_payment_id      BIGINT NOT NULL,
    type_payment_src_id  VARCHAR(50) NOT NULL,
    source_system        VARCHAR(30) NOT NULL,
    source_entity        VARCHAR(30) NOT NULL,
    type_payment         VARCHAR(30) NOT NULL,
    update_dt            DATE NOT NULL,
    insert_dt            DATE NOT NULL
);

ALTER TABLE ce_type_payments ADD CONSTRAINT ce_type_payment_pk PRIMARY KEY ( type_payment_id );

GO

INSERT INTO ce_type_payments(TYPE_PAYMENT_ID, TYPE_PAYMENT_SRC_ID, TYPE_PAYMENT, SOURCE_SYSTEM, SOURCE_ENTITY, update_dt, insert_dt) 
SELECT -1, -1, 'NA', 'NA', 'NA', GETDATE(), GETDATE()
WHERE NOT EXISTS ( SELECT TYPE_PAYMENT_ID
                   FROM ce_type_payments
                   WHERE TYPE_PAYMENT_ID = -1 );
				   
GO

DROP TABLE IF EXISTS ce_sub_categories;

CREATE TABLE ce_sub_categories (
    sub_category_id      BIGINT NOT NULL,
    sub_category_src_id  VARCHAR(50) NOT NULL,
    source_entity        VARCHAR(30) NOT NULL,
    source_system        VARCHAR(30) NOT NULL,
    sub_category         VARCHAR(100) NOT NULL,
    category_surr_id     BIGINT NOT NULL,
    update_dt            DATE NOT NULL,
    insert_dt            DATE NOT NULL
);

ALTER TABLE ce_sub_categories ADD CONSTRAINT ce_sub_category_pk PRIMARY KEY ( sub_category_id );
        
ALTER TABLE ce_sub_categories
    ADD CONSTRAINT ce_sub_ce_category_category_fk FOREIGN KEY ( category_surr_id )
        REFERENCES ce_categories ( category_id );

GO

INSERT INTO ce_sub_categories(SUB_CATEGORY_ID, SUB_CATEGORY_SRC_ID, SUB_CATEGORY, category_surr_id, SOURCE_SYSTEM, SOURCE_ENTITY, update_dt, insert_dt) 
SELECT -1, -1, 'NA', -1, 'NA', 'NA', GETDATE(), GETDATE()
WHERE NOT EXISTS ( SELECT SUB_CATEGORY_ID
                   FROM ce_sub_categories
                   WHERE SUB_CATEGORY_ID = -1 );

GO

DROP TABLE IF EXISTS ce_stores;

CREATE TABLE ce_stores (
    store_id            BIGINT NOT NULL,
    store_src_id        VARCHAR(50) NOT NULL, 
    source_system       VARCHAR(30) NOT NULL,
    source_entity       VARCHAR(30) NOT NULL,
    store_name          VARCHAR(50) NOT NULL,
    store_type_surr_id  BIGINT	NOT NULL,
    update_dt           DATE NOT NULL,
    insert_dt           DATE NOT NULL
);

ALTER TABLE ce_stores ADD CONSTRAINT ce_store_scd_pk PRIMARY KEY ( store_id );

ALTER TABLE ce_stores
    ADD CONSTRAINT ce_store_ce_store_type_fk FOREIGN KEY ( store_type_surr_id )
        REFERENCES ce_type_stores ( type_store_id );

GO

INSERT INTO ce_stores(STORE_ID, STORE_SRC_ID, STORE_NAME, STORE_TYPE_SURR_ID, SOURCE_SYSTEM, SOURCE_ENTITY, update_dt, insert_dt)  
SELECT -1, -1, 'NA', -1, 'NA', 'NA', GETDATE(), GETDATE()
WHERE NOT EXISTS ( SELECT STORE_ID
                   FROM ce_stores
                   WHERE STORE_ID = -1 );
				   
GO

DROP TABLE IF EXISTS ce_posts;

CREATE TABLE ce_posts (
    post_id        BIGINT NOT NULL,
    post_src_id    VARCHAR(50) NOT NULL,
    source_entity  VARCHAR(30) NOT NULL,
    source_system  VARCHAR(30) NOT NULL,
    post_name      VARCHAR(50) NOT NULL,
    update_dt      DATE NOT NULL,
    insert_dt      DATE NOT NULL
);

ALTER TABLE ce_posts ADD CONSTRAINT ce_post_pk PRIMARY KEY ( post_id );

GO

INSERT INTO ce_posts(POST_ID, POST_SRC_ID, POST_NAME, SOURCE_SYSTEM, SOURCE_ENTITY, update_dt, insert_dt)
SELECT -1, -1, 'NA', 'NA', 'NA', GETDATE(), GETDATE()
WHERE NOT EXISTS ( SELECT POST_ID
                   FROM ce_posts
                   WHERE POST_ID = -1 );

GO

DROP TABLE IF EXISTS ce_regions;

CREATE TABLE ce_regions (
    region_id      BIGINT NOT NULL,
    region_src_id  VARCHAR(50) NOT NULL,
    source_entity  VARCHAR(30) NOT NULL,
    source_system  VARCHAR(30) NOT NULL,
    region         VARCHAR(50) NOT NULL,
    update_dt      DATE NOT NULL,
    insert_dt      DATE NOT NULL
);

ALTER TABLE ce_regions ADD CONSTRAINT ce_region_pk PRIMARY KEY ( region_id );

GO

INSERT INTO ce_regions(REGION_ID, REGION_SRC_ID, REGION, SOURCE_SYSTEM, SOURCE_ENTITY, update_dt, insert_dt) 
SELECT -1, -1, 'NA', 'NA', 'NA', GETDATE(), GETDATE()
WHERE NOT EXISTS ( SELECT REGION_ID
                   FROM ce_regions
                   WHERE REGION_ID = -1 );
				   
GO

DROP TABLE IF EXISTS ce_employees;

CREATE TABLE ce_employees (
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
);

ALTER TABLE ce_employees ADD CONSTRAINT ce_employee_pk PRIMARY KEY ( employee_id );

ALTER TABLE ce_employees
    ADD CONSTRAINT ce_employee_ce_post_fk FOREIGN KEY ( post_surr_id )
        REFERENCES ce_posts ( post_id );

ALTER TABLE ce_employees
    ADD CONSTRAINT ce_employees_ce_stores_fk FOREIGN KEY ( store_surr_id )
        REFERENCES ce_stores ( store_id );

GO

INSERT INTO ce_employees(EMPLOYEE_ID, EMPLOYEE_SRC_ID, SOURCE_ENTITY, SOURCE_SYSTEM, store_surr_id, FIRST_NAME, 
                                LAST_NAME, POST_SURR_ID, update_dt, insert_dt) 
SELECT -1, -1, 'NA', 'NA', -1, 'NA', 'NA', -1, GETDATE(), GETDATE()
WHERE NOT EXISTS ( SELECT EMPLOYEE_ID
                   FROM ce_employees
                   WHERE EMPLOYEE_ID = -1 );

GO

DROP TABLE IF EXISTS ce_countries;

CREATE TABLE ce_countries (
    country_id      BIGINT NOT NULL,
    country_src_id  VARCHAR(50) NOT NULL,
    source_entity   VARCHAR(30) NOT NULL,
    source_system   VARCHAR(30) NOT NULL,
    country         VARCHAR(50) NOT NULL, 
    region_surr_id  BIGINT	NOT NULL,
    update_dt       DATE NOT NULL,
    insert_dt       DATE NOT NULL
);

ALTER TABLE ce_countries ADD CONSTRAINT ce_country_pk PRIMARY KEY ( country_id );

ALTER TABLE ce_countries
    ADD CONSTRAINT ce_country_ce_region_fk FOREIGN KEY ( region_surr_id )
        REFERENCES ce_regions ( region_id );

GO

INSERT INTO ce_countries(COUNTRY_ID, COUNTRY_SRC_ID, COUNTRY, region_surr_id, SOURCE_SYSTEM, SOURCE_ENTITY, update_dt, insert_dt) 
SELECT -1, -1, 'NA', -1, 'NA', 'NA', GETDATE(), GETDATE()
WHERE NOT EXISTS ( SELECT COUNTRY_ID
                   FROM ce_countries
                   WHERE COUNTRY_ID = -1 );
				   
GO

DROP TABLE IF EXISTS ce_cities;

CREATE TABLE ce_cities (
    city_id          BIGINT NOT NULL,
    city_src_id      VARCHAR(30) NOT NULL, 
    source_entity    VARCHAR(30) NOT NULL,
    source_system    VARCHAR(30) NOT NULL,
    city             VARCHAR(50) NOT NULL,
    country_surr_id  BIGINT	NOT NULL,
    update_dt        DATE NOT NULL,
    insert_dt        DATE NOT NULL
);

ALTER TABLE ce_cities ADD CONSTRAINT ce_city_pk PRIMARY KEY ( city_id );

ALTER TABLE ce_cities
    ADD CONSTRAINT ce_city_country_fk FOREIGN KEY ( country_surr_id )
        REFERENCES ce_countries ( country_id );

GO

INSERT INTO ce_cities(CITY_ID, CITY_SRC_ID, CITY, COUNTRY_SURR_ID, SOURCE_SYSTEM, SOURCE_ENTITY, update_dt, insert_dt) 
SELECT -1, -1, 'NA', -1, 'NA', 'NA', GETDATE(), GETDATE()
WHERE NOT EXISTS ( SELECT CITY_ID
                   FROM ce_cities
                   WHERE CITY_ID = -1 );

GO

DROP TABLE IF EXISTS ce_books;

CREATE TABLE ce_books (
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
);

ALTER TABLE ce_books ADD CONSTRAINT ce_book_scd_pk PRIMARY KEY ( book_id, start_dt );

ALTER TABLE ce_books
    ADD CONSTRAINT ce_book_sub_ce_category_fk FOREIGN KEY ( sub_category_surr_id )
        REFERENCES ce_sub_categories ( sub_category_id );

GO

INSERT INTO ce_books(BOOK_ID, BOOK_SRC_ID, SOURCE_SYSTEM, SOURCE_ENTITY, ISBN, PUBLISHER, BOOK_TITLE,
                            YEAR_OF_PUBLICATION, AUTHOR_ID, SUB_CATEGORY_SURR_ID, START_DT, END_DT, IS_ACTIVE, UPDATE_DT, INSERT_DT) 
SELECT -1, -1, 'NA', 'NA', 'NA', 'NA', 'NA', -1, -1, -1, CAST('01-01-1970' AS DATE), CAST('01-01-9999'AS DATE), 'yes', GETDATE(), GETDATE()
WHERE NOT EXISTS ( SELECT BOOK_ID
                   FROM ce_books
                   WHERE BOOK_ID = -1 );

GO

CREATE TABLE ce_book_author (
    book_surr_id    BIGINT NOT NULL,
    author_surr_id  BIGINT NOT NULL
);

ALTER TABLE ce_book_author ADD CONSTRAINT ce_book_author_pk PRIMARY KEY ( book_surr_id,
                                                                          author_surr_id );
																		  
ALTER TABLE ce_book_author
    ADD CONSTRAINT ce_book_author_ce_author_fk FOREIGN KEY ( author_surr_id )
        REFERENCES ce_authors ( author_id );

ALTER TABLE ce_book_author
    ADD CONSTRAINT ce_book_author_ce_book_fk FOREIGN KEY ( book_surr_id )
        REFERENCES ce_books ( book_id );
        
GO

INSERT INTO ce_authors(AUTHOR_ID, AUTHOR_SRC_ID, AUTHOR_NAME, SOURCE_SYSTEM, SOURCE_ENTITY, update_dt, insert_dt) 
SELECT -1, -1, 'NA', 'NA', 'NA', GETDATE(), GETDATE()
WHERE NOT EXISTS ( SELECT AUTHOR_ID
                   FROM ce_authors
                   WHERE AUTHOR_ID = -1 );

GO

DROP TABLE IF EXISTS ce_addresses;

CREATE TABLE ce_addresses (
    address_id      BIGINT NOT NULL,
    address_src_id  VARCHAR(50) NOT NULL,
    source_system   VARCHAR(30) NOT NULL,
    source_entity   VARCHAR(30) NOT NULL,
    address         VARCHAR(50) NOT NULL,
    postal_code     VARCHAR(20)  NOT NULL,
    city_surr_id    BIGINT	NOT NULL,
    update_dt       DATE NOT NULL,
	insert_dt       DATE NOT NULL
);

ALTER TABLE ce_addresses ADD CONSTRAINT ce_address_pk PRIMARY KEY ( address_id );

ALTER TABLE ce_addresses
    ADD CONSTRAINT ce_address_city_fk FOREIGN KEY ( city_surr_id )
        REFERENCES ce_cities ( city_id );

GO

INSERT INTO ce_addresses(ADDRESS_ID, ADDRESS_SRC_ID, ADDRESS, postal_code, CITY_SURR_ID, SOURCE_SYSTEM, SOURCE_ENTITY, update_dt, insert_dt)  
SELECT -1, -1, 'NA', 'NA', -1, 'NA', 'NA', GETDATE(), GETDATE()
WHERE NOT EXISTS ( SELECT ADDRESS_ID
                   FROM ce_addresses
                   WHERE ADDRESS_ID = -1 );
				   
											


				   







