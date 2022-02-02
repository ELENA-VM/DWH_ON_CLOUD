DROP TABLE IF EXISTS prm_mta_incremental_load;


CREATE TABLE prm_mta_incremental_load (
    incremental_load_type VARCHAR(50) NOT NULL,
    sa_table_name         VARCHAR(50) NOT NULL,
    target_table_name     VARCHAR(50) NOT NULL,
    [package]	          VARCHAR(50) NOT NULL,
    [procedure]           VARCHAR(50) NOT NULL,
    previous_loaded_date  DATE
);
