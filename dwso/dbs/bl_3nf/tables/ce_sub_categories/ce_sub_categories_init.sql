INSERT INTO ce_sub_categories(SUB_CATEGORY_ID, SUB_CATEGORY_SRC_ID, SUB_CATEGORY, category_surr_id, SOURCE_SYSTEM, SOURCE_ENTITY, update_dt, insert_dt) 
SELECT -1, -1, 'NA', -1, 'NA', 'NA', GETDATE(), GETDATE()
WHERE NOT EXISTS ( SELECT SUB_CATEGORY_ID
                   FROM ce_sub_categories
                   WHERE SUB_CATEGORY_ID = -1 );
