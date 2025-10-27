----Exploratory Data Analysis EDA

-------Categorical data
--1. Checking number of coffee store

SELECT DISTINCT store_location
FROM BRIGHT_LEARN_COFFEE_SHOP.CSHOP.BRIGHTLEARNCOFFEESHOP;

--2. Check number of product_category
SELECT DISTINCT PRODUCT_CATEGORY
FROM BRIGHT_LEARN_COFFEE_SHOP.CSHOP.BRIGHTLEARNCOFFEESHOP;

--3. Checking number of product type
SELECT DISTINCT product_type
FROM BRIGHT_LEARN_COFFEE_SHOP.CSHOP.BRIGHTLEARNCOFFEESHOP;

----- Date_and_Time Functions

--Check the earliest transaction_date
SELECT MIN(Transaction_date) AS First_Operating_date
FROM BRIGHT_LEARN_COFFEE_SHOP.CSHOP.BRIGHTLEARNCOFFEESHOP;

--Check latest transaction date
SELECT MAX(Transaction_date) AS Last_Operating_date
FROM BRIGHT_LEARN_COFFEE_SHOP.CSHOP.BRIGHTLEARNCOFFEESHOP

--Check day name

SELECT Transaction_date,
       DAYNAME(Transaction_date) AS Day_name,
 -----Clasifying date into buckets for clear analysis on the graphs using CASE statements     
       CASE
           WHEN DAYNAME(Transaction_date) IN ('Sat','Sun') THEN 'Weekend'
           ELSE  'Weekday'
       END AS Day_Classification,
------Check month_name from the date  
       MONTHNAME(Transaction_date) AS Month_name,
-----Clasifying time into buckets for clear analysis on the graphs using CASE statements     
       
       Transaction_time,
       CASE 
          WHEN transaction_time BETWEEN '06:00:00' AND '11:59:00' THEN 'Morning'
          WHEN transaction_time BETWEEN '12:00:00' AND '16:59:00' THEN 'Afternoon'
          WHEN transaction_time >= '17:00:00' THEN 'Evening'
       END AS Time_category,
-------Check hour from the date
       HOUR(Transaction_time) AS Hour_of_day,
       store_location,
       product_category,
       product_detail,
       product_type,
-------Check number of sales
       COUNT (DISTINCT TRANSACTION_ID) AS Number_of_Sales,
-----Calculate Revenue
      SUM(transaction_qty * unit_price) AS Revenue
FROM BRIGHT_LEARN_COFFEE_SHOP.CSHOP.BRIGHTLEARNCOFFEESHOP
GROUP BY ALL;

