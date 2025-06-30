CREATE TABLE CUSTOMERS
(customer_id SERIAL	PRIMARY KEY,
name VARCHAR (100) 	NOT NULL,
country	VARCHAR (100) NOT NULL, 	
Industry VARCHAR(100) NOT NULL,	
signup_date	DATE ,	
churned2 varchar(2) NOT NULL	
);

CREATE TABLE SALES
( 
order_id INT NOT NULL,
customer_id INT NOT NULL,
product VARCHAR(50) ,
Price NUMERIC (5,2),
quantity INT ,
order_date DATE
);

CREATE TABLE USAGE
(customer_id INT NOT NULL,
name VARCHAR(100) ,
country VARCHAR(50) ,
Industry VARCHAR(50),
signup_date DATE,
churned VARCHAR(3)
);

CREATE TABLE feature_usage (
    customer_id INT,
    feature_name VARCHAR(100),
    usage_count INT,
    usage_date DATE,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

SELECT * FROM CUSTOMERS;
SELECT * FROM SALES;
SELECT * FROM feature_usage;


--1. Total Revenue (All Time)
SELECT SUM(PRICE*QUANTITY) AS TOTAL_REVENUE FROM SALES;


--2. Revenue by Product
SELECT PRODUCT , SUM(PRICE*QUANTITY) AS REVENUE FROM SALES
GROUP BY PRODUCT
ORDER BY REVENUE DESC ;


--3. Monthly Sales Trend
SELECT EXTRACT( MONTH FROM ORDER_DATE) AS MONTH ,EXTRACT (YEAR FROM ORDER_DATE) AS YEAR ,SUM(PRICE*QUANTITY) AS SALES
FROM SALES
GROUP BY MONTH,YEAR
ORDER BY SALES DESC;

--OR 
SELECT 
    TO_CHAR(order_date, 'Month') AS month,
    SUM(price * quantity) AS monthly_revenue
FROM sales
GROUP BY month
ORDER BY month;


--4. Revenue by Country
SELECT C.COUNTRY , SUM(S.PRICE*S.QUANTITY) AS REVENUE
FROM CUSTOMERS C
JOIN SALES S
ON
C.CUSTOMER_ID = S.CUSTOMER_ID
GROUP BY C.COUNTRY
ORDER BY REVENUE DESC;

--5. Churned vs Active Customers
SELECT 
    churned2,
    COUNT(*) AS customer_count
FROM customers
GROUP BY churned2;

--6. Top 5 Customers by Revenue
SELECT C.NAME,  SUM(S.PRICE*S.QUANTITY) AS REVENUE
FROM CUSTOMERS C
JOIN SALES S
ON
C.CUSTOMER_ID = S.CUSTOMER_ID
GROUP BY C.NAME
ORDER BY REVENUE DESC
LIMIT 5;


--7. Most Used Features (Usage Table)
SELECT 
    feature_name,
    SUM(usage_count) AS total_usage
FROM feature_usage
GROUP BY feature_name
ORDER BY total_usage DESC;



-- 8. Churn Rate by Industry
SELECT 
    industry,
    COUNT(*) FILTER (WHERE churned2 = 'Y') * 100.0 / COUNT(*) AS churn_rate_percent
FROM customers
GROUP BY industry
ORDER BY churn_rate_percent DESC;



-- Top 10 High-Spending Customers
SELECT 
    c.name,
    SUM(s.price * s.quantity) AS total_spent
FROM sales s
JOIN customers c ON s.customer_id = c.customer_id
GROUP BY c.name
ORDER BY total_spent DESC
LIMIT 10;

--Most Used Feature Per Customer
SELECT *
FROM (
    SELECT 
        customer_id,
        feature_name,
        usage_count,
        RANK() OVER (PARTITION BY customer_id ORDER BY usage_count DESC) AS rank
    FROM feature_usage
) ranked_features
WHERE rank = 1;

--Industry-wise Churn Rate
SELECT 
    industry,
    COUNT(*) FILTER (WHERE churned = 'Y') * 100.0 / COUNT(*) AS churn_rate
FROM customers
GROUP BY industry
ORDER BY churn_rate DESC;

-- Revenue by Country + Churn Comparison
SELECT 
    c.country,
    COUNT(DISTINCT c.customer_id) AS total_customers,
    COUNT(DISTINCT c.customer_id) FILTER (WHERE c.churned = 'Y') AS churned_customers,
    SUM(s.price * s.quantity) AS total_revenue
FROM customers c
JOIN sales s ON c.customer_id = s.customer_id
GROUP BY c.country
ORDER BY total_revenue DESC;


--Customers Who Used >3 Features in a Day
SELECT customer_id, usage_date, COUNT(DISTINCT feature_name) AS features_used
FROM feature_usage
GROUP BY customer_id, usage_date
HAVING COUNT(DISTINCT feature_name) > 3;

--Average Order Value by Product
SELECT 
    product,
    ROUND(AVG(price * quantity), 2) AS avg_order_value
FROM sales
GROUP BY product;





