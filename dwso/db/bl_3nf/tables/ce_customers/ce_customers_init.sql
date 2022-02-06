INSERT INTO ce_customers(customer_id, customer_src_id, source_system, source_entity,
                         type_customer, first_name, last_name, gender, date_of_birth, 
                         name_of_organization, head_of_organization, 
                         iban, email, address_surr_id, update_dt, insert_dt) 
SELECT -1, -1, 'NA', 'NA', -1, 'NA', 'NA', 'NA', CAST('1970-01-01' AS DATE),  'NA', 'NA', 'NA', 'NA', -1, GETDATE(), GETDATE()
WHERE NOT EXISTS ( SELECT customer_id
                   FROM ce_customers
                   WHERE customer_id = -1 );
