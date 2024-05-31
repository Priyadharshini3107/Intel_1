USE DATABASE PD_INTEL;
CREATE or REPLACE TABLE ORDER_BASE.T_SALES_ORDER_DETAIL 
(	
    ORDER_ID	VARCHAR(10),
    ORDER_DATE	DATE,
    CUSTOMER_ID	VARCHAR(10),
    ITEM_ID	VARCHAR(10),
    QTY	INT,
    TOTAL_AMOUNT NUMBER(12,2),
    CREATE_DATE	DATE,
    CREATE_USER	VARCHAR(10),
    PRICE number(12,2)
);

