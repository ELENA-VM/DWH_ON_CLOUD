INSERT INTO ce_type_payments(TYPE_PAYMENT_ID, TYPE_PAYMENT_SRC_ID, TYPE_PAYMENT, SOURCE_SYSTEM, SOURCE_ENTITY, update_dt, insert_dt) 
SELECT -1, -1, 'NA', 'NA', 'NA', GETDATE(), GETDATE()
WHERE NOT EXISTS ( SELECT TYPE_PAYMENT_ID
                   FROM ce_type_payments
                   WHERE TYPE_PAYMENT_ID = -1 );
