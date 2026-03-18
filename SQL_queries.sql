CREATE DATABASE noseme ;
USE noseme ;

CREATE TABLE Sales_Data_Transactions (
    customer_id VARCHAR(255),
    trans_date VARCHAR(255),
    tran_amount INT
);

CREATE TABLE Sales_Data_Response (
    customer_id VARCHAR(255),
    response INT
);

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Retail_Data_Transactions.txt'
INTO TABLE Sales_Data_Transactions
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

SELECT * FROM  Sales_Data_Transactions LIMIT 10;

SELECT SUM(tran_amount) AS total_sales
FROM Sales_Data_Transactions;

SELECT COUNT(*) AS total_transactions
FROM Sales_Data_Transactions;

SELECT customer_id, SUM(tran_amount) AS total_spent
FROM Sales_Data_Transactions
GROUP BY customer_id;

SELECT AVG(tran_amount)
FROM Sales_Data_Transactions;
SELECT customer_id, SUM(tran_amount) AS total_spent
FROM Sales_Data_Transactions
GROUP BY customer_id
ORDER BY total_spent DESC
LIMIT 5;

SELECT MAX(tran_amount)
FROM Sales_Data_Transactions;

SELECT MIN(tran_amount)
FROM Sales_Data_Transactions;

SELECT customer_id, COUNT(*)
FROM Sales_Data_Transactions
GROUP BY customer_id;

SELECT MONTH(trans_date), SUM(tran_amount)
FROM Sales_Data_Transactions
GROUP BY MONTH(trans_date);

SELECT customer_id, SUM(tran_amount)
FROM Sales_Data_Transactions
GROUP BY customer_id
HAVING SUM(tran_amount) > 1000;