CREATE OR ALTER PROCEDURE ld_sa_transaction_stock AS
BEGIN
	TRUNCATE TABLE ext_transaction_stock;

	BULK INSERT ext_transaction_stock
	FROM 'storagecontainermev/b_transaction_400000.csv'
	WITH (DATA_SOURCE = 'AzureBlobStorageDataSourceETL',
	      FIRSTROW = 2,
		  FORMAT = 'CSV');
		  
     MERGE INTO sa_transaction_stock target              
     USING (SELECT SALE_ID,
                   INVOICE,
                   STORE_ID,
                   QUANTITY,
                   PRICE,
                   CUSTOMER_ID,
                   INVOICE_DATE,
                   SALE_AMOUNT,
                   ADDRESS_ID,
                   EMPLOYEE_ID,
                   type_payment_id,
                   BOOK_ID
            FROM ext_transaction_stock) source       
         ON (target.SALE_ID = source.SALE_ID) 
         
     WHEN MATCHED 
	 AND (IIF(target.INVOICE = upper(source.INVOICE), 0, 1) +
          IIF(target.STORE_ID = source.STORE_ID, 0, 1) + 
          IIF(target.QUANTITY = source.QUANTITY, 0, 1) + 
          IIF(target.PRICE = source.PRICE, 0, 1) + 
          IIF(target.CUSTOMER_ID = source.CUSTOMER_ID, 0, 1) + 
          IIF(target.INVOICE_DATE = source.INVOICE_DATE, 0, 1) + 
          IIF(target.SALE_AMOUNT = source.SALE_AMOUNT, 0, 1) + 
          IIF(target.ADDRESS_ID = source.ADDRESS_ID, 0, 1) + 
          IIF(target.EMPLOYEE_ID = source.EMPLOYEE_ID, 0, 1) + 
          IIF(target.type_payment_id = source.type_payment_id, 0, 1) + 
          IIF(target.BOOK_ID = source.BOOK_ID, 0, 1) ) > 0  
	 THEN
         UPDATE SET target.INVOICE = upper(source.INVOICE),
                    target.STORE_ID = source.STORE_ID, 
                    target.QUANTITY = source.QUANTITY,
                    target.PRICE = source.PRICE,
                    target.CUSTOMER_ID = source.CUSTOMER_ID,
                    target.INVOICE_DATE = source.INVOICE_DATE,
                    target.SALE_AMOUNT = source.SALE_AMOUNT,
                    target.ADDRESS_ID = source.ADDRESS_ID,
                    target.EMPLOYEE_ID = source.EMPLOYEE_ID,
                    target.type_payment_id = source.type_payment_id,
                    target.BOOK_ID = source.BOOK_ID,              
                    target.UPDATE_DT  = GETDATE()
         
     WHEN NOT MATCHED THEN 
         INSERT (SALE_ID, INVOICE, STORE_ID, QUANTITY, 
                 PRICE, CUSTOMER_ID, INVOICE_DATE, SALE_AMOUNT, 
                 ADDRESS_ID, EMPLOYEE_ID, type_payment_id, 
                 BOOK_ID, INSERT_DT, UPDATE_DT) 
         VALUES (source.SALE_ID, upper(source.INVOICE),source.STORE_ID, source.QUANTITY, 
                 source.PRICE, source.CUSTOMER_ID, source.INVOICE_DATE, source.SALE_AMOUNT,
                 source.ADDRESS_ID, source.EMPLOYEE_ID, source.type_payment_id, 
                 source.BOOK_ID, GETDATE(), GETDATE()); 
END;
