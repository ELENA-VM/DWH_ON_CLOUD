TRUNCATE TABLE wrk_test_results;

DROP TABLE wrk_test_results;

CREATE TABLE wrk_test_results (
    source_system     VARCHAR(30),
    table_name        VARCHAR(30),
	cont_rows  		  INTEGER,
    test_date         DATE
);

