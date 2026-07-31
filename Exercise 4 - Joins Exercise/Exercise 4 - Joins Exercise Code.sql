-- Databricks notebook source
------TABLE 1

CREATE TABLE table_users (
                    user_id INT,
                    user_name VARCHAR(50),
                    country VARCHAR(50)
                    );

INSERT INTO table_users  (user_id, user_name,country)
VALUES
        (1, 'Nomvula','Johannesburg'),
        (2, 'David', 'Cape Town'),
        (3, 'Anele', 'Durban'),
        (4, 'Kabelo', 'Pretoria'),
        (5, 'Lerato', 'Port Elizabeth');

SELECT*FROM table_users ;

-----TABLE 2

CREATE TABLE table_plans (
                    plan_id INT,
                    plan_name VARCHAR(50),
                    monthly_price INT
                    );

INSERT INTO table_plans (plan_id, plan_name, monthly_price)
VALUES
        (10, 'Basic', 79),
        (11, 'Standard', 129),
        (12, 'Premium', 199),
        (13, 'Family', 249),
        (14, 'Mobile', 59);

SELECT * FROM table_plans;

-----TABLE 3

CREATE TABLE table_subscriptions(
                                    subscription_id INT,
                                    user_id INT,
                                    plan_id INT,
                                    start_date VARCHAR(50)
                                );

INSERT INTO table_subscriptions (subscription_id, user_id, plan_id, start_date)
VALUES
        (501, 1, 10, '2026-01-15'),
        (502, 2, 11, '2026-02-01'),
        (503, 1, 12, '2026-03-10'),
        (504, 6, 11, '2026-03-20'),
        (505, 3, 13, '2026-04-05');

SELECT * FROM table_subscriptions;

-----TABLE 4

CREATE TABLE table_shows(
                                    show_id INT,
                                    show_title VARCHAR(50),
                                    genre VARCHAR(50)
                                );

INSERT INTO table_shows (show_id, show_title, genre)
VALUES
        (701, 'Comedy Hour' , ' Comedy'),
        (702, 'Crime Time' , 'Drama'),
        (703, 'Tech Tales', 'Documentary'),
        (704, 'Cooking Lab', 'Lifestyle'),
        (706, 'Wild Earth', 'Documentary');

SELECT * FROM table_shows;

----TABLE 5

CREATE TABLE table_viewing_sessions(
                                    session_id INT,
                                    user_id INT,
                                    show_id INT,
                                    watch_minutes INT
                                );

INSERT INTO table_viewing_sessions (session_id, user_id, show_id, watch_minutes)
VALUES
        (901, 1, 701, 45),
        (902, 2, 703, 30),
        (903, 1, 702, 60),
        (904, 7, 701, 20),
        (905, 3, 705, 90);

SELECT * FROM table_viewing_sessions;


-----Part A  —  INNER JOIN
-----QUESTION 1

SELECT 
     A_table_users.user_id, 
     A_table_users.user_name,
     B_table_subscriptions.subscription_id,
     B_table_subscriptions.start_date
FROM table_users AS A_table_users
INNER JOIN  table_subscriptions AS B_table_subscriptions 
ON A_table_users.user_id = B_table_subscriptions.user_id;

------QUESTION 2
SELECT 
        A_table_subscriptions.subscription_id,
        A_table_subscriptions.user_id,
        B_table_plans.plan_name,
        B_table_plans.monthly_price
FROM    table_subscriptions AS A_table_subscriptions
INNER JOIN table_plans AS B_table_plans
ON  A_table_subscriptions.plan_id= B_table_plans.plan_id;

-----QUESTION 3
SELECT
        A_table_viewing_sessions.session_id,
        A_table_viewing_sessions.user_id,
        B_table_shows.show_title,
        B_table_shows.genre,
        A_table_viewing_sessions.watch_minutes
FROM table_viewing_sessions AS A_table_viewing_sessions
INNER JOIN table_shows AS B_table_shows
ON A_table_viewing_sessions.show_id = B_table_shows.show_id;


----QUESTION 4
SELECT
        A_table_users.user_name,
        A_table_users.country,
        B_table_viewing_sessions.session_id,
        B_table_viewing_sessions.show_id,
        B_table_viewing_sessions.watch_minutes
FROM table_users AS A_table_users
INNER JOIN table_viewing_sessions AS B_table_viewing_sessions
ON A_table_users.user_id = B_table_viewing_sessions.user_id;

-----QUESTION 5
SELECT
        A_table_users.user_name,
        A_table_users.country,
        C_table_plans.plan_name,
        C_table_plans.monthly_price,
        B_table_subscriptions.start_date
FROM table_users AS A_table_users
INNER JOIN table_subscriptions AS B_table_subscriptions
ON A_table_users.user_id = B_table_subscriptions.user_id
INNER JOIN table_plans AS C_table_plans
ON B_table_subscriptions.plan_id = C_table_plans.plan_id;

---Part B - LEFT JOIN
-----QUESTION 6
SELECT
        A_table_users.user_id,
        A_table_users.user_name,
        B_table_subscriptions.subscription_id,
        B_table_subscriptions.start_date
FROM    table_users AS A_table_users
LEFT JOIN table_subscriptions AS  B_table_subscriptions
ON A_table_users.user_id = B_table_subscriptions.user_id;

-----QUESTION 7
SELECT 
        A_table_plans.plan_id,
        A_table_plans.plan_name,
        B_table_subscriptions.subscription_id,
        B_table_subscriptions.user_id
FROM table_plans AS A_table_plans
LEFT JOIN table_subscriptions AS B_table_subscriptions
ON A_table_plans.plan_id = B_table_subscriptions.plan_id;

-----QUESTION 8
SELECT
        A_table_shows.show_id,
        A_table_shows.show_title,
        B_table_viewing_sessions.session_id,
        B_table_viewing_sessions.watch_minutes
FROM table_shows AS A_table_shows
LEFT JOIN table_viewing_sessions AS B_table_viewing_sessions
ON A_table_shows.show_id = B_table_viewing_sessions.show_id;

-----QUESTION 9
SELECT
        A_table_viewing_sessions.session_id,
        A_table_viewing_sessions.show_id,
        A_table_viewing_sessions.watch_minutes,
        A_table_viewing_sessions.user_id,
        B_table_users.user_name
FROM table_viewing_sessions AS A_table_viewing_sessions
LEFT JOIN table_users AS B_table_users
ON A_table_viewing_sessions.user_id = B_table_users.user_id;

-----QUESTION 10
SELECT 
        A_table_users.user_name,
        A_table_users.country,
        C_table_plans.plan_name,
        C_table_plans.monthly_price
FROM table_users AS A_table_users
LEFT JOIN table_subscriptions AS B_table_subscriptions
ON A_table_users.user_id = B_table_subscriptions.user_id
LEFT JOIN table_plans AS C_table_plans
ON B_table_subscriptions.plan_id = C_table_plans.plan_id ;

---Part C - FULL OUTER JOIN

-----QUESTION 11
SELECT
        A_table_users.user_id,
        A_table_users.user_name,
        B_table_subscriptions.subscription_id,
        B_table_subscriptions.start_date
FROM table_users AS A_table_users
FULL OUTER JOIN table_subscriptions AS B_table_subscriptions
ON A_table_users.user_id = B_table_subscriptions.user_id;

-----QUESTION 12
SELECT
         A_table_plans.plan_id,
         A_table_plans.plan_name, 
         B_table_subscriptions.subscription_id, 
         B_table_subscriptions.user_id
FROM table_plans AS A_table_plans
FULL OUTER JOIN table_subscriptions AS B_table_subscriptions
ON A_table_plans.plan_id = B_table_subscriptions.plan_id;

-----QUESTION 13
SELECT 
        A_table_shows.show_id, 
        A_table_shows.show_title, 
        B_table_viewing_sessions.session_id, 
        B_table_viewing_sessions.watch_minutes
FROM table_shows AS A_table_shows
FULL OUTER JOIN table_viewing_sessions AS B_table_viewing_sessions
ON A_table_shows.show_id = B_table_viewing_sessions.show_id;

-----QUESTION 14
SELECT 
        A_table_users.user_id, 
        A_table_users.user_name,
        B_table_viewing_sessions.session_id, 
        B_table_viewing_sessions.show_id, 
        B_table_viewing_sessions.watch_minutes
FROM table_users AS A_table_users
FULL OUTER JOIN table_viewing_sessions AS B_table_viewing_sessions
ON A_table_users.user_id = B_table_viewing_sessions.user_id;

-----QUESTION 15
SELECT 
        A_table_users.user_id, 
        A_table_users.user_name, 
        B_table_subscriptions.subscription_id, 
        B_table_subscriptions.plan_id, 
        C_table_plans.plan_name
FROM table_users AS A_table_users
FULL OUTER JOIN table_subscriptions AS B_table_subscriptions
ON A_table_users.user_id = B_table_subscriptions.user_id
FULL OUTER JOIN table_plans AS C_table_plans
ON B_table_subscriptions.plan_id = C_table_plans.plan_id;

