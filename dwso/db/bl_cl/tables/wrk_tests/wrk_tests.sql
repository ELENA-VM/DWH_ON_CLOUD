DROP TABLE IF EXISTS wrk_tests;

CREATE TABLE wrk_tests (
	test_id           	 BIGINT,
    source_system        VARCHAR(30),
    source_entity        VARCHAR(30),
	test_text			 VARCHAR(4000)
);

