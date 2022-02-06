CREATE OR ALTER PROCEDURE ld_sa_employees AS
BEGIN
	TRUNCATE TABLE ext_employees;

	BULK INSERT ext_employees
	FROM 'storagecontainermev/employee.csv'
	WITH (DATA_SOURCE = 'AzureBlobStorageDataSourceETL',
	      FIRSTROW = 2,
		  FORMAT = 'CSV');

     MERGE INTO sa_employees target              
     USING (SELECT EMPLOYEE_ID,
                   FIRST_NAME,
                   LAST_NAME,
                   POST_ID,
                   STORE_ID
            FROM ext_employees) source       
         ON (target.EMPLOYEE_ID = source.EMPLOYEE_ID) 
         
     WHEN MATCHED 
	 AND (IIF(target.FIRST_NAME = upper(source.FIRST_NAME), 0, 1) +
          IIF(target.LAST_NAME = upper(source.LAST_NAME), 0, 1) +
          IIF(target.STORE_ID = source.STORE_ID, 0, 1) +
          IIF(target.POST_ID = source.POST_ID, 0, 1)) > 0
	 THEN
         UPDATE SET target.FIRST_NAME = upper(source.FIRST_NAME),
                    target.LAST_NAME = upper(source.LAST_NAME),    
                    target.POST_ID = source.POST_ID, 
                    target.STORE_ID = source.STORE_ID, 
                    target.UPDATE_DT  = GETDATE()
                   
     WHEN NOT MATCHED THEN 
         INSERT (EMPLOYEE_ID, FIRST_NAME, LAST_NAME, POST_ID, STORE_ID, INSERT_DT, UPDATE_DT) 
         VALUES (source.EMPLOYEE_ID, upper(source.FIRST_NAME), upper(source.LAST_NAME), source.POST_ID, source.STORE_ID, GETDATE(), GETDATE());
END;  