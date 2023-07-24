-- Creation of Database --

CREATE DATABASE SQL_basics;
USE SQL_basics;
-- Tables Generation --
CREATE TABLE product(
product_code INT PRIMARY KEY,
product_name VARCHAR(100),
price float,
stock float,
category VARCHAR(25)
);

CREATE TABLE customer_details(
customer_id INT PRIMARY KEY,
customer_name VARCHAR(50),
customer_location VARCHAR(50),
customer_phone INT
);



CREATE TABLE sales_dataset(
order_date DATE,
order_no VARCHAR(100),
c_id INT,
c_name VARCHAR(100),
s_code INT,
p_name VARCHAR(100),
qty INT,
price float
);


-- Select * --

SELECT * FROM product;

SELECT * FROM sales_dataset;

SELECT * FROM customer_details;

-- Actions --
INSERT INTO product (product_code, product_name, price, stock, category)
VALUES ();

-- add two new columns such as S_no and categories to the sales table.--
ALTER TABLE sales 
ADD S_no INT,
ADD categories VARCHAR(150);

-- change the column type of stock in the product table to varchar. --

ALTER TABLE product
MODIFY COLUMN stock VARCHAR(250);

-- change the table name from customer-to-customer details. --
ALTER TABLE customer
RENAME TO customer_details;

-- drop the columns S_no and categories from the sales table.-- 
ALTER TABLE sales
DROP COLUMN S_no, 
DROP COLUMN categories;

-- display order id, customer id, order date, price, and quantity from the sales table.-- 

SELECT order_no, c_id, order_date, price, qty
FROM sales_dataset;

-- display all the details in the product table if the category is stationary. --

SELECT * FROM product
WHERE category = "stationary";

-- display a unique category from the product table --

SELECT DISTINCT category
FROM product;

/* display the sales details if quantity is greater than 2 
and price is lesser than 500 from the sales table.*/

SELECT * FROM sales_dataset
WHERE qty>2 AND price<500;

-- display the customer’s name if the name ends with a.--

SELECT customer_name FROM customer_details
WHERE customer_name LIKE '%a';

-- display the product details in descending order of the price.--

SELECT * FROM product
ORDER BY price DESC;

/*isplay the product code and category from similar categories
 that are greater than or equal to 2.*/
 
SELECT product_code, category
FROM product
WHERE category IN (
    SELECT category
    FROM product
    GROUP BY category
    HAVING COUNT(*) >= 2
);

/* display the order number and the customer name to combine 
the results of the order and the customer tables including duplicate rows.*/

SELECT S.order_no, C.customer_name
FROM sales_dataset S
JOIN customer_details C ON c_id = customer_id;







