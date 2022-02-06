CREATE OR ALTER PROCEDURE ld_dim_type_payments AS 
BEGIN 
    MERGE INTO dim_type_payments target              
    USING (SELECT type_payment_id,
                  type_payment
           FROM ce_type_payments ) source       
        ON (target.type_payment_id = source.type_payment_id AND
			target.SOURCE_SYSTEM = 'BL_3NF' AND
			target.SOURCE_ENTITY = 'CE_TYPE_PATMENTS') 
        
    WHEN MATCHED 
	AND (IIF(target.TYPE_PAYMENT = source.TYPE_PAYMENT, 0, 1) > 0)
	THEN
        UPDATE SET target.TYPE_PAYMENT = source.TYPE_PAYMENT,
                   target.UPDATE_DT  = GETDATE()
        
    WHEN NOT MATCHED THEN 
        INSERT (type_payment_surr_id, type_payment_id, TYPE_PAYMENT, SOURCE_SYSTEM, SOURCE_ENTITY, update_dt, insert_dt) 
        VALUES (DEFAULT, source.TYPE_PAYMENT_ID, source.TYPE_PAYMENT, 'BL_3NF', 'CE_TYPE_PATMENTS', GETDATE(), GETDATE()); 
END;