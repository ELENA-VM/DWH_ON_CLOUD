CREATE OR ALTER PROCEDURE ld_sa_type_payments AS
BEGIN
	TRUNCATE TABLE ext_type_payments;

	BULK INSERT ext_type_payments
	FROM 'storagecontainermev/type_payment.csv'
	WITH (DATA_SOURCE = 'AzureBlobStorageDataSourceETL',
	      FIRSTROW = 2,
		  FORMAT = 'CSV');		  

     MERGE INTO sa_type_payments target              
     USING (SELECT TYPE_PAYMENT_ID,
                   TYPE_PAYMENT
            FROM ext_type_payments ) source       
         ON (target.TYPE_PAYMENT_ID = source.TYPE_PAYMENT_ID) 
         
     WHEN MATCHED 
	 AND IIF(target.TYPE_PAYMENT = upper(source.TYPE_PAYMENT), 0, 1) > 0 THEN
         UPDATE SET target.TYPE_PAYMENT = upper(source.TYPE_PAYMENT),
                    target.UPDATE_DT  = GETDATE()        
         
     WHEN NOT MATCHED THEN 
         INSERT (TYPE_PAYMENT_ID, TYPE_PAYMENT, INSERT_DT, UPDATE_DT) 
         VALUES (source.TYPE_PAYMENT_ID, upper(source.TYPE_PAYMENT), GETDATE(), GETDATE()); 
END; 
