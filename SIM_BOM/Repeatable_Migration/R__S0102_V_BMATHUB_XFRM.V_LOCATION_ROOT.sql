CREATE OR REPLACE VIEW BMATHUB_XFRM.V_LOCATION_ROOT
AS
SELECT
    ITEM_ID,
    ITEM_CLASS_NM,
    LOCATION
FROM
    BMATHUB_BASE.T_LOCATION_ROOT;