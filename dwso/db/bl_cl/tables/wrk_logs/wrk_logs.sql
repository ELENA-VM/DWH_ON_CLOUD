DROP TABLE IF EXISTS wrk_logs;

CREATE TABLE wrk_logs (
	user_id           	 VARCHAR(30),
    source_system        VARCHAR(30),
    source_entity        VARCHAR(30) ,
	obj_name			 VARCHAR(100),
	msg_type			 BIGINT,	
	msg_text			 VARCHAR(100),
	msg_code			 VARCHAR(30),
	msg_descr			 VARCHAR(300),
	insert_dt		 	 DATE	
);

