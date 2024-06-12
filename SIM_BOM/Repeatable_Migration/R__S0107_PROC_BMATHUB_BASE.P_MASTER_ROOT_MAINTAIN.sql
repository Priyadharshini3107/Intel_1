CREATE OR REPLACE PROCEDURE BMATHUB_BASE.P_MASTER_ROOT_MAINTAIN()
RETURNS STRING
LANGUAGE SQL
AS
$$

BEGIN
   
    BEGIN
        MERGE INTO BMATHUB_BASE.T_ITEM_DETAIL_ROOT AS tgt
        USING MASTER_DATA.ITEM AS src
        ON tgt.ITEM_ID = src.ITEM_ID  
        WHEN MATCHED THEN
            UPDATE SET
                tgt.ITEM_CLASS_NM = src.ITEM_CLASS_NM,
                tgt.ITEM_DSC = src.ITEM_DSC,
                tgt.DELETE_IND = src.DELETE_IND
        WHEN NOT MATCHED THEN
            INSERT (ITEM_ID, ITEM_CLASS_NM, ITEM_DSC, DELETE_IND)
            VALUES (src.ITEM_ID, src.ITEM_CLASS_NM, src.ITEM_DSC, src.DELETE_IND);
     
    END;
    
   
    BEGIN
        MERGE INTO BMATHUB_BASE.T_LOCATION_ROOT AS tgt
        USING MASTER_DATA.LOCATION AS src
        ON tgt.ITEM_ID = src.ITEM_ID AND tgt.ITEM_CLASS_NM = src.ITEM_CLASS_NM
        WHEN MATCHED THEN
            UPDATE SET
                tgt.LOCATION = src.LOCATION
            
        WHEN NOT MATCHED THEN
            INSERT (ITEM_ID, ITEM_CLASS_NM, LOCATION)
            VALUES (src.ITEM_ID, src.ITEM_CLASS_NM, src.LOCATION);
       
    END;

  
    BEGIN
        MERGE INTO BMATHUB_BASE.T_ORIG_BOM AS tgt
        USING MASTER_DATA.ORIG_BOM AS src
        ON tgt.INPUT_ITEM_ID = src.INPUT_ITEM_ID AND tgt.ITEM_CLASS_NM = src.ITEM_CLASS_NM
        WHEN MATCHED THEN
            UPDATE SET
                tgt.INPUT_ITEM_ID = src.INPUT_ITEM_ID,
                tgt.ITEM_CLASS_NM = src.ITEM_CLASS_NM,
                tgt.LOCATION = src.LOCATION
        WHEN NOT MATCHED THEN
            INSERT (INPUT_ITEM_ID, ITEM_CLASS_NM, OUTPUT_ITEM_ID, LOCATION)
            VALUES (src.INPUT_ITEM_ID, src.ITEM_CLASS_NM, src.OUTPUT_ITEM_ID,src.LOCATION);
        
    END;
END; 
$$;