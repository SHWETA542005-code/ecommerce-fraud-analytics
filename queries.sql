/*SELECT Payment_Method,
       COUNT(*) AS total_transactions,
       SUM(Is_Fraudulent) AS fraud_count,
       ROUND(SUM(Is_Fraudulent)*100.0/COUNT(*), 2) AS fraud_rate_pct
FROM transactions
GROUP BY Payment_Method
ORDER BY fraud_rate_pct DESC;*/



/*SELECT Product_Category,
       COUNT(*) AS total_transactions,
       SUM(Is_Fraudulent) AS fraud_count,
       ROUND(SUM(Is_Fraudulent)*100.0/COUNT(*), 2) AS fraud_rate_pct
FROM transactions
GROUP BY Product_Category
ORDER BY fraud_rate_pct DESC;*/



/*SELECT 
    CASE 
        WHEN Account_Age_Days <= 30 THEN '0-30 days (New)'
        WHEN Account_Age_Days <= 90 THEN '31-90 days'
        WHEN Account_Age_Days <= 180 THEN '91-180 days'
        WHEN Account_Age_Days <= 365 THEN '181-365 days'
        ELSE '365+ days (Old)'
    END AS account_age_bucket,
    COUNT(*) AS total_transactions,
    SUM(Is_Fraudulent) AS fraud_count,
    ROUND(SUM(Is_Fraudulent)*100.0/COUNT(*), 2) AS fraud_rate_pct
FROM transactions
GROUP BY account_age_bucket
ORDER BY MIN(Account_Age_Days);*/


/*
SELECT 
    CASE 
        WHEN Transaction_Amount <= 50 THEN '0-50'
        WHEN Transaction_Amount <= 150 THEN '51-150'
        WHEN Transaction_Amount <= 300 THEN '151-300'
        WHEN Transaction_Amount <= 500 THEN '301-500'
        ELSE '500+'
    END AS amount_bucket,
    COUNT(*) AS total_transactions,
    SUM(Is_Fraudulent) AS fraud_count,
    ROUND(SUM(Is_Fraudulent)*100.0/COUNT(*), 2) AS fraud_rate_pct,
    ROUND(AVG(Transaction_Amount), 2) AS avg_amount
FROM transactions
GROUP BY amount_bucket
ORDER BY MIN(Transaction_Amount);*/


-- Query 5: Combined Risk Segment (New Account + High Order Value)
/*SELECT 
    CASE 
        WHEN Account_Age_Days <= 30 AND Transaction_Amount > 500 THEN 'New Account + High Value (High Risk)'
        ELSE 'All Other Transactions'
    END AS risk_segment,
    COUNT(*) AS total_transactions,
    SUM(Is_Fraudulent) AS fraud_count,
    ROUND(SUM(Is_Fraudulent)*100.0/COUNT(*), 2) AS fraud_rate_pct
FROM transactions
GROUP BY risk_segment;*/



/*SELECT 
    HOUR(Transaction_Date_Clean) AS transaction_hour,
    COUNT(*) AS total_transactions,
    SUM(Is_Fraudulent) AS fraud_count,
    ROUND(SUM(Is_Fraudulent)*100.0/COUNT(*), 2) AS fraud_rate_pct
FROM transactions
GROUP BY HOUR(Transaction_Date_Clean)
ORDER BY transaction_hour;*/



SELECT Device_Used,
       COUNT(*) AS total_transactions,
       SUM(Is_Fraudulent) AS fraud_count,
       ROUND(SUM(Is_Fraudulent)*100.0/COUNT(*), 2) AS fraud_rate_pct
FROM transactions
GROUP BY Device_Used
ORDER BY fraud_rate_pct DESC;