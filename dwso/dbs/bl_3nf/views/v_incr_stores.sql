CREATE OR ALTER VIEW v_incr_stores
AS
( SELECT sast.STORE_ID,
         sast.STORE_NAME,
         COALESCE(cets.type_store_id, -1) type_store_id
  FROM sa_stores sast
  LEFT JOIN ce_type_stores cets ON sast.STORE_TYPE_ID = cets.TYPE_STORE_SRC_ID
  AND cets.SOURCE_SYSTEM = 'RETAIL'
  AND cets.SOURCE_ENTITY = 'SA_TYPE_STORES'
  WHERE sast.IS_CPROCESSED = 'N'
);         
               
                