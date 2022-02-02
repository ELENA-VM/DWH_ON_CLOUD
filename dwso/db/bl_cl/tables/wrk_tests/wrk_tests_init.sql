TRUNCATE TABLE wrk_tests;

INSERT INTO wrk_tests(test_id, source_system, source_entity, test_text)  
SELECT NEXT VALUE FOR wrk_tests_seq, 'SA_RETAIL', 'SA_TYPE_STORES', 'select count(*) from sar_type_stores';

GO;

INSERT INTO wrk_tests(test_id, source_system, source_entity, test_text)  
SELECT NEXT VALUE FOR wrk_tests_seq, 'SA_RETAIL', 'SA_TYPE_PAYMENTS', 'select count(*) from sar_type_payments';

GO;

INSERT INTO wrk_tests(test_id, source_system, source_entity, test_text)  
SELECT NEXT VALUE FOR wrk_tests_seq, 'SA_RETAIL', 'SA_STORES', 'select count(*) from sar_stores';

GO;

INSERT INTO wrk_tests(test_id, source_system, source_entity, test_text)  
SELECT NEXT VALUE FOR wrk_tests_seq, 'SA_RETAIL', 'SA_POSTS', 'select count(*) from sar_posts';

GO;

INSERT INTO wrk_tests(test_id, source_system, source_entity, test_text)  
SELECT NEXT VALUE FOR wrk_tests_seq, 'SA_RETAIL', 'SA_REGIONS', 'select count(*) from sar_regions';

GO;

INSERT INTO wrk_tests(test_id, source_system, source_entity, test_text)  
SELECT NEXT VALUE FOR wrk_tests_seq, 'SA_RETAIL', 'SA_COUNTRIES', 'select count(*) from sar_countries';

GO;

INSERT INTO wrk_tests(test_id, source_system, source_entity, test_text)  
SELECT NEXT VALUE FOR wrk_tests_seq, 'SA_RETAIL', 'SA_CITIES', 'select count(*) from sar_cities';

GO;

INSERT INTO wrk_tests(test_id, source_system, source_entity, test_text)  
SELECT NEXT VALUE FOR wrk_tests_seq, 'SA_RETAIL', 'SA_ADDRESS', 'select count(*) from sar_address';

GO;

INSERT INTO wrk_tests(test_id, source_system, source_entity, test_text)  
SELECT NEXT VALUE FOR wrk_tests_seq, 'SA_RETAIL', 'SA_EMPLOYEES', 'select count(*) from sar_employees';

GO;

INSERT INTO wrk_tests(test_id, source_system, source_entity, test_text)  
SELECT NEXT VALUE FOR wrk_tests_seq, 'SA_RETAIL', 'SA_AUTHORS', 'select count(*) from sar_authors';

GO;

INSERT INTO wrk_tests(test_id, source_system, source_entity, test_text)  
SELECT NEXT VALUE FOR wrk_tests_seq, 'SA_RETAIL', 'SA_BOOKS', 'select count(*) from sar_books';

GO;

INSERT INTO wrk_tests(test_id, source_system, source_entity, test_text)  
SELECT NEXT VALUE FOR wrk_tests_seq, 'SA_RETAIL', 'SA_CUSTOMER_RETAIL', 'select count(*) from sar_customers_retail';

GO;

INSERT INTO wrk_tests(test_id, source_system, source_entity, test_text)  
SELECT NEXT VALUE FOR wrk_tests_seq, 'SA_RETAIL', 'SA_TRANSACTION_RETAIL', 'select count(*) from sar_transaction_retail';

GO;

INSERT INTO wrk_tests(test_id, source_system, source_entity, test_text)  
SELECT NEXT VALUE FOR wrk_tests_seq, 'SA_STOCK', 'SA_CUSTOMER_STOCK', 'select count(*) from sas_customers_stock';

GO;

INSERT INTO wrk_tests(test_id, source_system, source_entity, test_text)  
SELECT NEXT VALUE FOR wrk_tests_seq, 'SA_STOCK', 'SA_TRANSACTION_STOCK', 'select count(*) from sas_transaction_stock';

GO;
--------------------------------------------------------------------------------
INSERT INTO wrk_tests(test_id, source_system, source_entity, test_text)  
SELECT NEXT VALUE FOR wrk_tests_seq, 'BL_3NF', UPPER('ce_type_stores'), 'select count(*) from nf_ce_type_stores';

GO;

INSERT INTO wrk_tests(test_id, source_system, source_entity, test_text)  
SELECT NEXT VALUE FOR wrk_tests_seq, 'BL_3NF', UPPER('ce_type_payments'), 'select count(*) from nf_ce_type_payments';

GO;

INSERT INTO wrk_tests(test_id, source_system, source_entity, test_text)  
SELECT NEXT VALUE FOR wrk_tests_seq, 'BL_3NF', UPPER('ce_sub_categories'), 'select count(*) from nf_ce_sub_categories';

GO;

INSERT INTO wrk_tests(test_id, source_system, source_entity, test_text)  
SELECT NEXT VALUE FOR wrk_tests_seq, 'BL_3NF', UPPER('ce_stores'), 'select count(*) from nf_ce_stores';

GO;

INSERT INTO wrk_tests(test_id, source_system, source_entity, test_text)  
SELECT NEXT VALUE FOR wrk_tests_seq, 'BL_3NF', UPPER('ce_sales'), 'select count(*) from nf_ce_sales';

GO;

INSERT INTO wrk_tests(test_id, source_system, source_entity, test_text)  
SELECT NEXT VALUE FOR wrk_tests_seq, 'BL_3NF', UPPER('ce_regions'), 'select count(*) from nf_ce_regions';

GO;

INSERT INTO wrk_tests(test_id, source_system, source_entity, test_text)  
SELECT NEXT VALUE FOR wrk_tests_seq, 'BL_3NF', UPPER('ce_posts'), 'select count(*) from nf_ce_posts';

GO;

INSERT INTO wrk_tests(test_id, source_system, source_entity, test_text)  
SELECT NEXT VALUE FOR wrk_tests_seq, 'BL_3NF', UPPER('ce_employees'), 'select count(*) from nf_ce_employees';

GO;

INSERT INTO wrk_tests(test_id, source_system, source_entity, test_text)  
SELECT NEXT VALUE FOR wrk_tests_seq, 'BL_3NF', UPPER('ce_customers'), 'select count(*) from nf_ce_customers';

GO;

INSERT INTO wrk_tests(test_id, source_system, source_entity, test_text)  
SELECT NEXT VALUE FOR wrk_tests_seq, 'BL_3NF', UPPER('ce_countries'), 'select count(*) from nf_ce_countries';

GO;

INSERT INTO wrk_tests(test_id, source_system, source_entity, test_text)  
SELECT NEXT VALUE FOR wrk_tests_seq, 'BL_3NF', UPPER('ce_cities'), 'select count(*) from nf_ce_cities';

GO;

INSERT INTO wrk_tests(test_id, source_system, source_entity, test_text)  
SELECT NEXT VALUE FOR wrk_tests_seq, 'BL_3NF', UPPER('ce_categories'), 'select count(*) from nf_ce_categories';

GO;

INSERT INTO wrk_tests(test_id, source_system, source_entity, test_text)  
SELECT NEXT VALUE FOR wrk_tests_seq, 'BL_3NF', UPPER('ce_books'), 'select count(*) from nf_ce_books';

GO;

INSERT INTO wrk_tests(test_id, source_system, source_entity, test_text)  
SELECT NEXT VALUE FOR wrk_tests_seq, 'BL_3NF', UPPER('ce_book_author'), 'select count(*) from nf_ce_book_author';

GO;

INSERT INTO wrk_tests(test_id, source_system, source_entity, test_text)  
SELECT NEXT VALUE FOR wrk_tests_seq, 'BL_3NF', UPPER('ce_authors'), 'select count(*) from nf_ce_authors';

GO;

INSERT INTO wrk_tests(test_id, source_system, source_entity, test_text)  
SELECT NEXT VALUE FOR wrk_tests_seq, 'BL_3NF', UPPER('ce_addresses'), 'select count(*) from nf_ce_addresses';

GO;
--------------------------------------------------------------------------------
INSERT INTO wrk_tests(test_id, source_system, source_entity, test_text)  
SELECT NEXT VALUE FOR wrk_tests_seq, 'BL_DM', UPPER('dim_type_payments'), 'select count(*) from dm_dim_type_payments';

GO;

INSERT INTO wrk_tests(test_id, source_system, source_entity, test_text)  
SELECT NEXT VALUE FOR wrk_tests_seq, 'BL_DM', UPPER('dim_stores'), 'select count(*) from dm_dim_stores';

GO;

INSERT INTO wrk_tests(test_id, source_system, source_entity, test_text)  
SELECT NEXT VALUE FOR wrk_tests_seq, 'BL_DM', UPPER('dim_employees'), 'select count(*) from dm_dim_employees';

GO;

INSERT INTO wrk_tests(test_id, source_system, source_entity, test_text)  
SELECT NEXT VALUE FOR wrk_tests_seq, 'BL_DM', UPPER('dim_addresses'), 'select count(*) from dm_dim_addresses';

GO;

INSERT INTO wrk_tests(test_id, source_system, source_entity, test_text)  
SELECT NEXT VALUE FOR wrk_tests_seq, 'BL_DM', UPPER('dim_books'), 'select count(*) from dm_dim_books_scd';

GO;

INSERT INTO wrk_tests(test_id, source_system, source_entity, test_text)  
SELECT NEXT VALUE FOR wrk_tests_seq, 'BL_DM', UPPER('dim_customers'), 'select count(*) from dm_dim_customers';

GO;

INSERT INTO wrk_tests(test_id, source_system, source_entity, test_text)  
SELECT NEXT VALUE FOR wrk_tests_seq, 'BL_DM', UPPER('fct_sales'), 'select count(*) from dm_fct_sales';

GO;