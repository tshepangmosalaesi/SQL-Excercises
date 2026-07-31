-- Databricks notebook source
--01 Questions 1–5 — Extract Date Parts


--QUESTION 1
-- Create the orders table
CREATE TABLE orders (
    order_id INT,
    customer_id INT,
    order_date DATE
);

INSERT INTO orders VALUES
(1001, 101, '2026-05-01'),
(1002, 102, '2026-05-02'),
(1003, 103, '2026-05-03'),
(1004, 104, '2026-05-04'),
(1005, 105, '2026-05-05');
 
 
 --Analysis
 SELECT 
    order_id,
    customer_id,
    order_date,
    DAYNAME(order_date) AS day_name
FROM 
    orders;


--QUESTION 2
-- Create the customers table
CREATE TABLE customers (
    customer_id INT,
    customer_name STRING,
    signup_date DATE
);

INSERT INTO customers VALUES
(201, 'John', '2026-01-15'),
(202, 'Mary', '2026-02-20'),
(203, 'Peter', '2026-03-05'),
(204, 'Sarah', '2026-04-18'),
(205, 'Thabo', '2026-05-30');

SELECT 
    customer_id, 
    customer_name, 
    signup_date,
    MONTHNAME(signup_date) AS signup_month_name
FROM 
    customers;


--QUESTION 3
-- Create the sales table
CREATE TABLE sales (
    sale_id STRING,
    product_name STRING,
    sale_date DATE,
    amount INT
);

INSERT INTO sales VALUES
('S001', 'Laptop', '2026-01-10', 12000),
('S002', 'Mouse', '2026-02-15', 250),
('S003', 'Keyboard', '2026-03-20', 700),
('S004', 'Monitor', '2026-04-25', 3500),
('S005', 'Desk', '2026-05-30', 2000);

SELECT 
    sale_id, 
    product_name, 
    sale_date,
    MONTH(sale_date) AS sale_month
FROM 
    sales;


--QUESTION 4
-- Create the transactions table
CREATE TABLE transactions (
    transaction_id STRING,
    customer_id INT,
    transaction_date DATE,
    amount INT
);

INSERT INTO transactions VALUES
('T001', 101, '2024-12-15', 500),
('T002', 102, '2025-01-20', 1200),
('T003', 103, '2025-06-10', 800),
('T004', 104, '2026-02-05', 1500),
('T005', 105, '2026-05-25', 2000);

SELECT 
    transaction_id, 
    customer_id, 
    transaction_date,
    YEAR(transaction_date) AS transaction_year
FROM 
    transactions;


--QUESTION 5
-- Create the deliveries table
CREATE TABLE deliveries (
    delivery_id STRING,
    customer_id INT,
    delivery_date DATE
);

-- Insert the sample data
INSERT INTO deliveries VALUES
('D001', 101, '2026-05-01'),
('D002', 102, '2026-05-08'),
('D003', 103, '2026-05-15'),
('D004', 104, '2026-05-22'),
('D005', 105, '2026-05-29');

SELECT 
    delivery_id, 
    customer_id, 
    delivery_date,
    DAY(delivery_date) AS day_of_month
FROM 
    deliveries;

--Questions 6–10 — Current Date, Convert & Format

--QUESTION 6
-- Create the employees table
CREATE TABLE employees (
    employee_id INT,
    employee_name STRING,
    department STRING
);

INSERT INTO employees VALUES
(301, 'Nandi', 'Sales'),
(302, 'Brian', 'IT'),
(303, 'Lerato', 'Finance'),
(304, 'Sipho', 'HR'),
(305, 'Aisha', 'Marketing');

SELECT 
    employee_id, 
    employee_name, 
    department,
    CURRENT_DATE() AS today_date
FROM 
    employees;

--QUESTION 7

-- Create the online_orders table
CREATE TABLE online_orders (
    order_id INT,
    customer_id INT,
    order_date_text STRING
);

INSERT INTO online_orders VALUES
(4001, 101, '2026-01-15'),
(4002, 102, '2026-02-20'),
(4003, 103, '2026-03-25'),
(4004, 104, '2026-04-10'),
(4005, 105, '2026-05-05');

SELECT 
    order_id, 
    customer_id, 
    order_date_text,
    TO_DATE(order_date_text) AS order_date
FROM 
    online_orders;


--QUESTION 8

-- Create the payment_dates table
CREATE  TABLE payment_dates (
    payment_id STRING,
    customer_id INT,
    payment_date DATE
);

INSERT INTO payment_dates VALUES
('P001', 101, '2026-01-05'),
('P002', 102, '2026-02-10'),
('P003', 103, '2026-03-15'),
('P004', 104, '2026-04-20'),
('P005', 105, '2026-05-25');

SELECT 
    payment_id, 
    customer_id, 
    payment_date,
    TO_CHAR(payment_date, 'yyyy-MM-dd') AS formatted_payment_date
FROM 
    payment_dates;


--QUESTION 9
-- Create the customer_purchases table
CREATE TABLE customer_purchases (
    customer_id INT,
    customer_name STRING,
    last_purchase_date DATE
);

INSERT INTO customer_purchases VALUES
(501, 'John', '2026-05-01'),
(502, 'Mary', '2026-05-10'),
(503, 'Peter', '2026-05-15'),
(504, 'Sarah', '2026-05-20'),
(505, 'Thabo', '2026-05-25');

SELECT 
    customer_id, 
    customer_name, 
    last_purchase_date,
    DATEDIFF(CURRENT_DATE(), last_purchase_date) AS days_since_last_purchase
FROM 
    customer_purchases;

--QUESTION 10

-- Create the shipping_orders table
DROP TABLE shipping_orders;
CREATE TABLE shipping_orders (
    order_id INT,
    customer_id INT,
    order_date DATE
);

INSERT INTO shipping_orders VALUES
(6001, 101, '2026-05-01'),
(6002, 102, '2026-05-03'),
(6003, 103, '2026-05-05'),
(6004, 104, '2026-05-07'),
(6005, 105, '2026-05-09');


SELECT 
    order_id, 
    customer_id, 
    order_date,
    CAST(DATEADD(DAY, 7, order_date) AS DATE) AS expected_delivery_date
FROM 
    shipping_orders;

--Questions 11–15 — Multi-Extract & Date Filtering

--QUESTION 11
-- Create the bookings table
CREATE TABLE bookings (
    booking_id STRING,
    customer_id INT,
    booking_date DATE
);

INSERT INTO bookings VALUES
('B001', 101, '2026-01-12'),
('B002', 102, '2026-02-18'),
('B003', 103, '2026-03-22'),
('B004', 104, '2026-04-09'),
('B005', 105, '2026-05-27');

SELECT 
    booking_id, 
    customer_id, 
    booking_date,
    YEAR(booking_date) AS booking_year,
    MONTH(booking_date) AS booking_month,
    DAY(booking_date) AS booking_day
FROM 
    bookings;


--QUESTION 12

-- Create the yearly_orders table
CREATE OR REPLACE TABLE yearly_orders (
    order_id INT,
    customer_id INT,
    order_date DATE,
    amount INT
);

INSERT INTO yearly_orders VALUES
(7001, 101, '2024-12-15', 500),
(7002, 102, '2025-01-20', 1200),
(7003, 103, '2025-06-10', 800),
(7004, 104, '2026-02-05', 1500),
(7005, 105, '2026-05-25', 2000);

SELECT 
    order_id, 
    customer_id, 
    order_date,
    YEAR(order_date) AS order_year,
    amount
FROM 
    yearly_orders
WHERE 
    YEAR(order_date) = 2026;


--QUESTION 13
-- Create the monthly_orders table
CREATE TABLE monthly_orders (
    order_id INT,
    customer_id INT,
    order_date DATE,
    amount INT
);

INSERT INTO monthly_orders VALUES
(8001, 101, '2026-01-15', 500),
(8002, 102, '2026-02-20', 1200),
(8003, 103, '2026-03-10', 800),
(8004, 104, '2026-03-25', 1500),
(8005, 105, '2026-05-30', 2000);

SELECT 
    order_id, 
    customer_id, 
    order_date,
    MONTH(order_date) AS order_month,
    amount
FROM 
    monthly_orders
WHERE 
    MONTH(order_date) = 3;

--QUESTION 14

-- Create the subscriptions table
CREATE OR REPLACE TABLE subscriptions (
    subscription_id STRING,
    customer_id INT,
    start_date DATE
);

INSERT INTO subscriptions VALUES
('SUB001', 101, '2026-01-10'),
('SUB002', 102, '2026-02-15'),
('SUB003', 103, '2026-03-20'),
('SUB004', 104, '2026-04-25'),
('SUB005', 105, '2026-05-30');


SELECT 
    subscription_id, 
    customer_id, 
    start_date,
    LAST_DAY(start_date) AS month_end_date
FROM 
    subscriptions;


--QUESTION 15

-- Create the campaign_sends table
CREATE TABLE campaign_sends (
    send_id STRING,
    customer_id INT,
    send_date DATE
);

INSERT INTO campaign_sends VALUES
('C001', 101, '2026-01-12'),
('C002', 102, '2026-02-18'),
('C003', 103, '2026-03-22'),
('C004', 104, '2026-04-09'),
('C005', 105, '2026-05-27');

SELECT 
    send_id, 
    customer_id, 
    send_date,
    CAST(DATE_TRUNC('MONTH', send_date) AS DATE) AS month_start_date
FROM 
    campaign_sends;


--Questions 16–20 — Advanced Date Work

--QUESTION 16
-- Create the invoice_dates table
CREATE TABLE invoice_dates (
    invoice_id STRING,
    customer_id INT,
    invoice_date DATE
);

INSERT INTO invoice_dates VALUES
('INV001', 101, '2026-01-05'),
('INV002', 102, '2026-02-10'),
('INV003', 103, '2026-03-15'),
('INV004', 104, '2026-04-20'),
('INV005', 105, '2026-05-25');

SELECT 
    invoice_id, 
    customer_id, 
    invoice_date,
    TO_CHAR(invoice_date, 'MMMM yyyy') AS invoice_month_year
FROM 
    invoice_dates;


--QUESTION 17

-- Create the customer_birthdays table
CREATE TABLE customer_birthdays (
    customer_id INT,
    customer_name STRING,
    date_of_birth DATE
);

INSERT INTO customer_birthdays VALUES
(901, 'John', '1998-05-10'),
(902, 'Mary', '1990-08-20'),
(903, 'Peter', '2002-03-15'),
(904, 'Sarah', '1985-12-01'),
(905, 'Thabo', '2000-07-30');

SELECT 
    customer_id, 
    customer_name, 
    date_of_birth,
    FLOOR(DATEDIFF(CURRENT_DATE(), date_of_birth) / 365.25) AS customer_age
FROM 
    customer_birthdays;


--QUESTION 18

-- Create the weekend_orders table
CREATE TABLE weekend_orders (
    order_id INT,
    customer_id INT,
    order_date DATE
);

INSERT INTO weekend_orders VALUES
(9001, 101, '2026-05-01'),
(9002, 102, '2026-05-02'),
(9003, 103, '2026-05-03'),
(9004, 104, '2026-05-04'),
(9005, 105, '2026-05-05');

SELECT 
    order_id, 
    customer_id, 
    order_date,
    DAYNAME(order_date) AS day_name,
    CASE 
        WHEN DAYNAME(order_date) IN ('Saturday', 'Sunday') THEN 'Weekend'
        ELSE 'Weekday'
    END AS day_type
FROM 
    weekend_orders;
    

--QUESTION 19

-- Create the quarterly_transactions table
CREATE TABLE quarterly_transactions (
    transaction_id STRING,
    customer_id INT,
    transaction_date DATE,
    amount INT
);

INSERT INTO quarterly_transactions VALUES
('Q001', 101, '2026-01-15', 500),
('Q002', 102, '2026-03-20', 1200),
('Q003', 103, '2026-04-10', 800),
('Q004', 104, '2026-07-05', 1500),
('Q005', 105, '2026-10-25', 2000);


SELECT 
    transaction_id, 
    customer_id, 
    transaction_date,
    QUARTER(transaction_date) AS transaction_quarter,
    amount
FROM 
    quarterly_transactions;


--QUESTION 20
-- Create the recent_orders table
CREATE TABLE recent_orders (
    order_id STRING,
    customer_id INT,
    order_date DATE,
    amount INT
);

INSERT INTO recent_orders VALUES
('R001', 101, '2026-04-01', 500),
('R002', 102, '2026-04-15', 1200),
('R003', 103, '2026-05-01', 800),
('R004', 104, '2026-05-10', 1500),
('R005', 105, '2026-05-25', 2000);

SELECT 
    order_id, 
    customer_id, 
    order_date,
    DATEDIFF(CURRENT_DATE(), order_date) AS days_since_order,
    amount
FROM 
    recent_orders
WHERE 
    DATEDIFF(CURRENT_DATE(), order_date) > 30;



--BONUS CHALLENGE

-- Create the customer_recency table
CREATE OR REPLACE TABLE customer_recency (
    customer_id INT,
    customer_name STRING,
    last_purchase_date DATE,
    total_spend INT
);

INSERT INTO customer_recency VALUES
(1001, 'John', '2026-05-25', 5000),
(1002, 'Mary', '2026-05-10', 2500),
(1003, 'Peter', '2026-04-01', 700),
(1004, 'Sarah', '2026-02-15', 15000),
(1005, 'Thabo', '2025-12-20', 300);

SELECT 
    customer_id, 
    customer_name, 
    last_purchase_date,
    DATEDIFF(CURRENT_DATE(), last_purchase_date) AS days_since_last_purchase,
    CASE 
        WHEN DATEDIFF(CURRENT_DATE(), last_purchase_date) <= 30 THEN 'Active Customer'
        WHEN DATEDIFF(CURRENT_DATE(), last_purchase_date) BETWEEN 31 AND 90 THEN 'At Risk Customer'
        ELSE 'Inactive Customer'
    END AS customer_status
FROM 
    customer_recency;
