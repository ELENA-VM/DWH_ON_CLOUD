INSERT INTO dim_type_payments(type_payment_surr_id, type_payment_id, source_system, source_entity, type_payment, update_dt, insert_dt) 
SELECT -1, -1, 'NA', 'NA', 'NA', GETDATE(), GETDATE()
WHERE NOT EXISTS ( SELECT type_payment_surr_id
                   FROM dim_type_payments
                   WHERE type_payment_surr_id = -1 );
