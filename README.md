# 🛒 Sales Trend Analysis Using MySQL

## 📌 Project Overview
This project analyzes monthly revenue and order volume from an **online sales dataset** using MySQL.  
The objective is to identify sales trends over time by aggregating revenue and orders by month and year.

---

## 📂 Dataset Structure
**Database:** `online_store`  
**Table:** `online_sales`

| Column Name   | Data Type     | Description |
|---------------|--------------|-------------|
| order_id      | INT          | Unique order identifier |
| order_date    | DATE         | Date when the order was placed |
| ship_date     | DATE         | Date when the order was shipped |
| ship_mode     | VARCHAR(50)  | Mode of shipment |
| customer_id   | VARCHAR(50)  | Unique customer ID |
| customer_name | VARCHAR(50)  | Name of the customer |
| amount        | FLOAT        | Order amount in currency |
| quantity      | INT          | Quantity of products purchased |
| product       | VARCHAR(50)  | Product name |

---

## 🛠 Steps Performed
1. **Database & Table Creation**  
   - Created `online_store` database.  
   - Created `online_sales` table.  

2. **Data Insertion**  
   - Inserted sample sales records for multiple months in 2024.  

3. **Sales Trend Analysis Query**  
   - Extracted **year** and **month** from `order_date`.  
   - Aggregated **total revenue** using `SUM(amount)`.  
   - Counted **total unique orders** using `COUNT(DISTINCT order_id)`.  
   - Grouped results by year and month.  
   - Sorted output chronologically.  

---

## 📊 MySQL Query
```sql
SELECT 
    YEAR(order_date) AS order_year,
    EXTRACT(MONTH FROM order_date) AS month_number,
    MONTHNAME(order_date) AS month_name,
    SUM(amount) AS total_revenue,
    COUNT(DISTINCT order_id) AS total_orders
FROM 
    online_sales
GROUP BY 
    order_year, month_number, month_name
ORDER BY 
    order_year ASC, month_number ASC;
