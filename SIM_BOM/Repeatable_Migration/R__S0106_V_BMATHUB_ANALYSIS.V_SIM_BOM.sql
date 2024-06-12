CREATE OR REPLACE VIEW BMATHUB_ANALYSIS.V_SIM_BOM
AS
    SELECT
        ic.ITEM,
        ic.ITEM_CLASS_NM,
        ic.ANCHOR_ITEM_ID,
        ic.BOM_NUM,
        ic.LOC,
        CURRENT_DATE AS CREATE_DATE,
        'SYSTEM' AS CREATE_USER,
        id.item_dsc
        
    FROM
        BMATHUB_XFRM.V_COMPRESS_BOM_CORE ic
    JOIN
        BMATHUB_XFRM.V_ITEM_DETAIL_ROOT id
        ON ic.ITEM = id.ITEM_ID
    WHERE
        ic.ITEM_CLASS_NM = 'IC' ;       
    