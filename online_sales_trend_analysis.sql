CREATE DATABASE IF NOT EXISTS online_store;
USE online_store;

CREATE TABLE IF NOT EXISTS online_sales(
order_id INT,
order_date DATE,
ship_date DATE,
ship_mode VARCHAR(50),
customer_id VARCHAR(50),
customer_name VARCHAR(50),
amount FLOAT,
quantity INT,
product VARCHAR(50)
);

INSERT INTO online_sales 
(order_id, order_date, ship_date, ship_mode, customer_id, customer_name, amount, quantity, product)
VALUES
(1001, '2024-01-05', '2024-01-10', 'Standard Class', 'C001', 'Alice Johnson', 250.00, 2, 'Laptop'),
(1002, '2024-01-15', '2024-01-20', 'Second Class', 'C002', 'Bob Smith', 120.50, 1, 'Mouse'),
(1003, '2024-02-01', '2024-02-05', 'Standard Class', 'C003', 'Charlie Brown', 800.00, 5, 'Office Chair'),
(1004, '2024-02-10', '2024-02-15', 'First Class', 'C004', 'Diana Ross', 1500.75, 3, 'Smartphone'),
(1005, '2024-03-03', '2024-03-07', 'Standard Class', 'C005', 'Ethan Hunt', 450.25, 2, 'Printer'),
(1006, '2024-03-12', '2024-03-17', 'Standard Class', 'C006', 'Fiona Carter', 99.99, 1, 'Keyboard'),
(1007, '2024-04-08', '2024-04-13', 'Second Class', 'C007', 'George Miller', 2000.00, 10, 'Tablet'),
(1008, '2024-04-25', '2024-04-30', 'First Class', 'C008', 'Hannah Lee', 320.45, 1, 'Headphones'),
(1009, '2024-05-14', '2024-05-20', 'Standard Class', 'C009', 'Ian Wright', 600.00, 4, 'Monitor'),
(1010, '2024-05-28', '2024-06-02', 'Standard Class', 'C010', 'Julia Adams', 150.00, 2, 'Mouse Pad');


--  Extract month from order_date &  Group by year/month
SELECT 
    YEAR(order_date) AS order_year,
    EXTRACT(MONTH FROM order_date) AS month_number,  -- for sorting
    MONTHNAME(order_date) AS month_name, 
    --  Total revenue
    SUM(amount) AS total_revenue,
    --  Total unique orders
    COUNT(DISTINCT order_id) AS total_orders
FROM 
    online_sales
GROUP BY 
    order_year, order_month
--  Sorting by year and month
ORDER BY 
    order_year ASC, order_month ASC;



