-- Databricks notebook source
----QUESTION 1
CREATE TABLE table_branch_sandton_accounts(
                                            account_id VARCHAR(50),
                                            account_holder VARCHAR(50),
                                            city VARCHAR(50)
                                            );

INSERT INTO table_branch_sandton_accounts (account_id, account_holder, city)
VALUES 
        ('A001', 'Nomvula Dlamini','Sandton'), 
        ('A002', 'David Mokoena','Sandton'),
        ('A003', 'Lerato Sithole','Sandton'),
        ('A004', 'Peter Nkosi','Sandton');

SELECT * FROM table_branch_sandton_accounts;

CREATE TABLE table_branch_rosebank_accounts(
                                            account_id VARCHAR(50),
                                            account_holder VARCHAR(50),
                                            city VARCHAR(50)
                                            );

INSERT INTO table_branch_rosebank_accounts  (account_id, account_holder, city)
VALUES 
        ('A003', 'Lerato Sithole','Rosebank'), 
        ('A004', 'Peter Nkosi','Rosebank'),
        ('A004', 'Peter Nkosi','Rosebank'),
        ('A005', 'Zanele Khumalo','Rosebank'),
        ('A006', 'Thabo Motha','Rosebank');

SELECT * FROM table_branch_rosebank_accounts;
-----CODE------
SELECT 
        account_id,
        account_holder,
        city
FROM table_branch_sandton_accounts
UNION
SELECT 
        account_id,
        account_holder,
        city
FROM table_branch_rosebank_accounts;

-----QUESTION 2
CREATE TABLE savings_products(
                               product_code VARCHAR(50),
                               product_name VARCHAR(50),                            
                               product_type VARCHAR(50) 

);

INSERT INTO savings_products (product_code, product_name, product_type)
VALUES
        ('SV01','Basic Savings','Savings'),
        ('SV02','Premium Savings','Savings'),
        ('SV03','Youth Savings','Savings'),
        ('SV04','Business Savings','Savings');

SELECT * FROM savings_products;

CREATE TABLE current_products(
                               product_code VARCHAR(50),
                               product_name VARCHAR(50),
                               product_type VARCHAR(50) 
);

INSERT INTO current_products(product_code, product_name,product_type )
VALUES
        ('CR01','Standard Current','Current'),
        ('CR02','Gold Current','Current'),
        ('SV03','Youth Savings','Savings'),
        ('CR03','Business Current','Current');

SELECT * FROM current_products;
-----CODE------
SELECT 
        product_code, 
        product_name,
        product_type
FROM savings_products
UNION
SELECT 
        product_code, 
        product_name,
        product_type
FROM current_products;

-----QUESTION 3
CREATE TABLE retail_banking_staff(
                                    staff_id VARCHAR(50),
                                    staff_name VARCHAR(50),
                                    email VARCHAR(50)
                                    );

INSERT INTO retail_banking_staff(staff_id, staff_name, email)
VALUES 
        ('S001', 'Mpho Radebe', 'MphoRadebe@gmail.com'),
        ('S002', 'Brian Tshabalala', 'BrianTshabalala@gmail.com'),
        ('S003', 'Aisha Patel', 'AishaPatel@gmail.com'),
        ('S004', 'Kabelo Moabelo', 'KabeloMoabelo@gmail.com');

SELECT * FROM retail_banking_staff;

CREATE TABLE corporate_banking_staff(
                                    staff_id VARCHAR(50),
                                    staff_name VARCHAR(50),
                                    email VARCHAR(50)
                                    );

INSERT INTO corporate_banking_staff(staff_id, staff_name, email)
VALUES 
        ('S003', 'Aisha Patel', 'AishaPatel@gmail.com'),
        ('S005', 'Nandi Dube', 'NandiDube@gmail.com'),
        ('S006', 'Sipho Khumalo', 'SiphoKhumalo@gmail.com'),
        ('S004', 'Kabelo Moabelo', 'KabeloMoabelo@gmail.com');

SELECT * FROM corporate_banking_staff;
-----CODE------
SELECT 
        staff_id,
        staff_name,
        email
FROM retail_banking_staff
UNION 
SELECT  
        staff_id,
        staff_name,
        email
FROM corporate_banking_staff;

-----QUESTION 4
CREATE TABLE mobile_branch_cities(
                                   city_code VARCHAR(50),
                                   city_name VARCHAR(50),
                                   region VARCHAR(50) 
                                    );

INSERT INTO mobile_branch_cities(city_code, city_name, region)
VALUES 
        ('C01','Johannesburg','Gauteng'),
        ('C02','Pretoria','Gauteng'),
        ('C03','Cape Town','Western Cape'),
        ('C04','Durban','KwaZulu-Natal');

SELECT * FROM mobile_branch_cities;

CREATE TABLE digital_branch_cities(
                                   city_code VARCHAR(50),
                                   city_name VARCHAR(50),
                                   region VARCHAR(50) 
                                    );

INSERT INTO digital_branch_cities(city_code, city_name, region)
VALUES 
        ('C03','Cape Town','Western Cape'),
        ('C05','Polokwane','Limpopo'),
        ('C06','Port Elizabeth','Eastern Cape'),
        ('C01','Johannesburg','Gauteng');

SELECT * FROM digital_branch_cities;
-----CODE------
SELECT 
        city_code,
        city_name,
        region
FROM mobile_branch_cities
UNION 
SELECT 
        city_code,
        city_name,
        region  
FROM digital_branch_cities;  

-----QUESTION 5

CREATE OR REPLACE TABLE push_notification_targets (
                                                    customer_id    VARCHAR(50),
                                                    customer_name  VARCHAR(50),
                                                    segment        VARCHAR(50)
                                                    );

INSERT INTO push_notification_targets 
VALUES
        ('C1001', 'Nomsa Zwane',      'Push Notification'),
        ('C1002', 'Andile Buthelezi', 'Push Notification'),
        ('C1003', 'Fatima Mahomed',   'Push Notification'),
        ('C1004', 'Ryno van Zyl',     'Push Notification');

SELECT * FROM push_notification_targets;

CREATE OR REPLACE TABLE inapp_banner_targets (
                                                customer_id    STRING,
                                                customer_name  STRING,
                                                segment        STRING
                                                );

INSERT INTO inapp_banner_targets 
VALUES
        ('C1003', 'Fatima Mahomed',   'In-App Banner'),
        ('C1005', 'Thandeka Cele',    'In-App Banner'),
        ('C1006', 'Samuel Nkosi',     'In-App Banner'),
        ('C1002', 'Andile Buthelezi', 'In-App Banner');

SELECT * FROM inapp_banner_targets;

SELECT 
        customer_id, 
        customer_name, 
        --segment
        CASE 
        WHEN customer_id IN (SELECT customer_id FROM push_notification_targets)
         AND customer_id IN (SELECT customer_id FROM inapp_banner_targets)
        THEN 'Both'
        WHEN customer_id IN (SELECT customer_id FROM push_notification_targets)
        THEN 'Push Notification'
        ELSE 'In-App Banner'
    END AS segment
FROM push_notification_targets
UNION
SELECT 
        customer_id, 
        customer_name, 
        --segment
        CASE 
        WHEN customer_id IN (SELECT customer_id FROM push_notification_targets)
         AND customer_id IN (SELECT customer_id FROM inapp_banner_targets)
        THEN 'Both'
        WHEN customer_id IN (SELECT customer_id FROM push_notification_targets)
        THEN 'Push Notification'
        ELSE 'In-App Banner'
    END AS segment
FROM inapp_banner_targets;


---QUESTION 6
DROP TABLE  atm01_transactions;
CREATE TABLE atm01_transactions (
                                    txn_id VARCHAR(50),
                                    account_id VARCHAR(50),
                                    amount DECIMAL(10,2)
                                );

INSERT INTO  atm01_transactions(txn_id, account_id, amount)
VALUES 
        ('T1001', 'A001',500.00), 
        ('T1002', 'A002',1200.00),
        ('T1003', 'A001',300.00),
        ('T1004', 'A003',750.00);  

SELECT * FROM  atm01_transactions; 

SELECT 
    txn_id AS transaction_id,
    account_id,
    amount
FROM atm01_transactions
UNION ALL
SELECT 
    txn_id AS transaction_id,
    account_id,
    amount
FROM atm01_transactions;


---QUESTION 7
CREATE TABLE gauteng_loan_applications (
    app_id STRING,
    customer_id STRING,
    loan_type STRING
);

INSERT INTO gauteng_loan_applications VALUES
('LA001', 'C1001', 'Home Loan'),
('LA002', 'C1002', 'Vehicle Loan'),
('LA003', 'C1003', 'Personal'),
('LA004', 'C1004', 'Home Loan');

CREATE TABLE western_cape_loan_applications (
    app_id STRING,
    customer_id STRING,
    loan_type STRING
    );

INSERT INTO western_cape_loan_applications VALUES
('LA003', 'C1003', 'Personal' ),
('LA005', 'C1005', 'Vehicle Loan'),
('LA006', 'C1006', 'Business'),
('LA007', 'C1007', 'Home Loan');

SELECT 
    app_id AS application_id,
    customer_id,
    loan_type
FROM gauteng_loan_applications
UNION ALL
SELECT 
    app_id AS application_id,
    customer_id,
    loan_type
FROM western_cape_loan_applications;


--QUESTION 8
CREATE TABLE email_complaints (
    complaint_id STRING,
    customer_id STRING
);

INSERT INTO email_complaints VALUES
('EC001', 'C2001'),
('EC002', 'C2002'),
('EC003', 'C2003'),
('EC004', 'C2004');

CREATE TABLE app_complaints (
    complaint_id STRING,
    customer_id STRING
);

INSERT INTO app_complaints VALUES
('AC001', 'C2005'),
('AC002', 'C2001'),
('AC003', 'C2006'),
('AC004', 'C2007');



SELECT 
    complaint_id,
    customer_id
FROM email_complaints
UNION ALL
SELECT 
    complaint_id,
    customer_id
FROM app_complaints;


--QUESTION 9
CREATE OR REPLACE TABLE april_payments (
    payment_id STRING,
    account_id STRING,
    amount DECIMAL(10,2)
);

INSERT INTO april_payments VALUES
('PAY001', 'A001', 12500.00),
('PAY002', 'A002', 4800.00),
('PAY003', 'A003', 9200.00),
('PAY004', 'A004', 3300.00);

-- May Payments Table
CREATE OR REPLACE TABLE may_payments (
    payment_id STRING,
    account_id STRING,
    amount DECIMAL(10,2)
);

INSERT INTO may_payments VALUES
('PAY005', 'A001', 12500.00),
('PAY006', 'A005', 7600.00),
('PAY007', 'A002', 5100.00),
('PAY008', 'A006', 2800.00);


SELECT 
    payment_id,
    account_id,
    amount
FROM april_payments
UNION ALL
SELECT 
    payment_id,
    account_id,
    amount
FROM may_payments;


---QUESTION 10

CREATE OR REPLACE TABLE debit_entries (
    entry_id STRING,
    account_id STRING,
    entry_type STRING
);

INSERT INTO debit_entries VALUES
('DR001', 'A001', 'Debit'),
('DR002', 'A002', 'Debit'),
('DR003', 'A003', 'Debit'),
('DR004', 'A004', 'Debit');

CREATE OR REPLACE TABLE credit_entries (
    entry_id STRING,
    account_id STRING,
    entry_type STRING
);

INSERT INTO credit_entries VALUES
('CR001', 'A001', 'Credit'),
('CR002', 'A005', 'Credit'),
('CR003', 'A002', 'Credit'),
('CR004', 'A006', 'Credit');

SELECT 
    entry_id,
    account_id,
    entry_type
FROM debit_entries
UNION ALL
SELECT 
    entry_id,
    account_id,
    entry_type
FROM credit_entries;