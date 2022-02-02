DROP TABLE IF EXISTS wrk_test_results;

CREATE TABLE wrk_test_results (
	test_id           	 BIGINT,
    source_system        VARCHAR(30),
    source_entity        VARCHAR(30),
	test_result			 BIGINT,
    test_date            DATE
);

