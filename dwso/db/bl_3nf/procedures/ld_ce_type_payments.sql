CREATE OR ALTER PROCEDURE ld_ce_type_payments AS 
BEGIN
	DECLARE @TYPE_PAYMENT_ID BIGINT, @TYPE_PAYMENT VARCHAR(30);
	
	DECLARE type_payments_cur CURSOR FOR 
		SELECT TYPE_PAYMENT_ID, TYPE_PAYMENT
		FROM SA_TYPE_PAYMENTS;
  
	OPEN type_payments_cur  
  
	FETCH NEXT FROM type_payments_cur INTO @TYPE_PAYMENT_ID, @TYPE_PAYMENT 

	WHILE @@FETCH_STATUS = 0
	BEGIN

        INSERT INTO ce_type_payments(TYPE_PAYMENT_ID, TYPE_PAYMENT_SRC_ID, TYPE_PAYMENT, SOURCE_SYSTEM, SOURCE_ENTITY, update_dt, insert_dt) 
        SELECT NEXT VALUE FOR ce_type_payments_seq, @TYPE_PAYMENT_ID, @TYPE_PAYMENT, 'RETAIL', 'SA_TYPE_PAYMENTS', GETDATE(), GETDATE()
        WHERE NOT EXISTS ( SELECT nctype.TYPE_PAYMENT_ID
                           FROM ce_type_payments nctype 
                           WHERE nctype.TYPE_PAYMENT_SRC_ID = @TYPE_PAYMENT_ID
                             AND nctype.SOURCE_SYSTEM = 'RETAIL' 
                             AND nctype.SOURCE_ENTITY = 'SA_TYPE_PAYMENTS' );           
        
        UPDATE ce_type_payments
        SET TYPE_PAYMENT = @TYPE_PAYMENT,
            UPDATE_DT = GETDATE()
        WHERE TYPE_PAYMENT_SRC_ID = @TYPE_PAYMENT_ID
          AND SOURCE_SYSTEM = 'RETAIL' 
          AND SOURCE_ENTITY = 'SA_TYPE_PAYMENTS'
          AND IIF(TYPE_PAYMENT = UPPER(@TYPE_PAYMENT), 0, 1) > 0;	

	FETCH NEXT FROM type_payments_cur INTO @TYPE_PAYMENT_ID, @TYPE_PAYMENT 

	END

	CLOSE type_payments_cur
	DEALLOCATE type_payments_cur   
END;