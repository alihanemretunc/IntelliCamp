-- DM SQL STATEMENTS for Dimensions

-- BRANCH
SELECT 
    BR_ID AS BRANCH_ID,
    BR_CD AS BRANCH_CODE,
    BR_NM AS BRANCH_NAME,
    SYSDATE AS ETL_DATE
FROM
    INT.DW_BRANCH;
    
-- CUSTOMER
SELECT 
    l.PARTY_ID AS CUSTOMER_ID,
    l.CUST_NO AS CUSTOMER_NUMBER,
    l.CUST_NM AS CUSTOMER_NAME,
    l.CUST_SEG_ID AS CUSTOMER_SEGMENT_ID,
    seg.CAT_NAME AS CUSTOMER_SEGMENT_DESC,
    l.CUST_TYP_ID AS CUSTOMER_TYPE_ID,
    typ.CAT_NAME AS CUSTOMER_TYPE_DESC,
    l.MOBIL_BNKG_USAGE_FLG AS MOBIL_BANKING_USAGE_FLAG,
    l.INTERNET_BNKG_FLG AS INTERNET_BNKG_FLAG,
    l.CALL_CENTER_FLAG,
    status.CAT_ID AS CUSTOMER_STATUS_CODE,
    status.CAT_NAME AS CUSTOMER_STATUS,
    l.CUST_BIRTH_DT AS BIRTH_DATE,
    SYSDATE AS ETL_DATE
FROM INT.DW_CUST l
LEFT JOIN INT.DW_CAT seg ON l.CUST_SEG_ID = seg.CAT_ID AND seg.CAT_SCM_NAME = 'Customer Segment'
LEFT JOIN INT.DW_CAT typ ON l.CUST_TYP_ID = typ.CAT_ID AND typ.CAT_SCM_NAME = 'Customer Type'
LEFT JOIN INT.DW_CAT status ON l.CUST_SEG_ID = status.CAT_ID AND status.CAT_SCM_NAME = 'Customer Status';

-- LOAN CONTRACT STATUS
SELECT
    CAT_ID AS LOAN_CONTRACT_STATUS_ID,
    CAT_CODE AS LOAN_CONTRACT_STATUS_CODE, 
    CAT_NAME AS LOAN_CONTRACT_STATUS_NAME,
    SYSDATE AS ETL_DATE
FROM
    INT.DW_CAT
WHERE
    CAT_SCM_NAME = 'Bank Loan Status';
    
-- CHANNEL
SELECT
    CNL_ID AS CHANNEL_ID,
    CNL_CD AS CHANNEL_CODE, 
    CNL_NM AS CHANNEL_NAME,
    SYSDATE AS ETL_DATE
FROM
    INT.DW_CNL;
    
-- LOAN CONTRACT TYPE
SELECT
    CAT_ID AS LOAN_CONTRACT_TYPE_ID,
    CAT_CODE AS LOAN_CONTRACT_TYPE_CODE, 
    CAT_NAME AS LOAN_CONTRACT_TYPE_NAME,
    SYSDATE AS ETL_DATE
FROM
    INT.DW_CAT
WHERE
    CAT_SCM_NAME = 'Loan Contract Type';
    
-- CURRENCY
SELECT
    CCY_ID AS CURRENCY_ID,
    CCY_CD AS CURRENCY_CODE, 
    CCY_NM AS CURRENCY_NAME,
    SYSDATE AS ETL_DATE
FROM
    INT.DW_CCY;
    
-- APPLICATION STATUS
SELECT
    CAT_ID AS IDV_APPLICATION_STATUS_ID,
    CAT_CODE AS IDV_APPLICATION_STATUS_CODE, 
    CAT_NAME AS IDV_APPLICATION_STATUS_NAME,
    SYSDATE AS ETL_DATE
FROM
    INT.DW_CAT
WHERE
    CAT_SCM_NAME = 'Credit Loan Application Status';
    
-- APPLICATION RESULT STATUS
SELECT
    CAT_ID AS IDV_APPLICATION_RESULT_STATUS_ID,
    CAT_CODE AS IDV_APPLICATION_RESULT_STATUS_CODE, 
    CAT_NAME AS IDV_APPLICATION_RESULT_STATUS_NAME,
    SYSDATE AS ETL_DATE
FROM
    INT.DW_CAT
WHERE
    CAT_SCM_NAME = 'Credit Loan Application Result';
    
-- LOAN PURPOSE
SELECT
    CAT_ID AS IDV_LOAN_PURPOSE_ID,
    CAT_CODE AS IDV_LOAN_PURPOSE_CODE, 
    CAT_NAME AS IDV_LOAN_PURPOSE_NAME,
    SYSDATE AS ETL_DATE
FROM
    INT.DW_CAT
WHERE
    CAT_SCM_NAME = 'Bank Loan Purpose';
    
-- EXCHANGE RATE
SELECT
    EXG_RATE_ID,
    EXG_RATE_DT AS EXG_RATE_DATE,
    CCY_ID AS CURRENCY_ID,
    EXG_BUY_PRTY AS BANK_EXG_BUY_RATE, -- EXG_BUY_RATE field not found, EXG_BUY_PRTY used
    SYSDATE AS ETL_DATE
FROM
    INT.DW_EXG_RATE;