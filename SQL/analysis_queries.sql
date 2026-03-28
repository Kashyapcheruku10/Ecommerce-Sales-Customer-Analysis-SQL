---Calculating the sum of Total Orders, Total Order Items, and Total Customers---
select count (*) as Total_Orders
from olist_orders_dataset;
select count (*) as Total_Order_Items
from olist_order_items_dataset;
select count (*) as Total_Customers
from olist_customers_dataset;

---Checking the order_Delivered_Data for any NULL Values---
SELECT *
FROM olist_orders_dataset
WHERE order_delivered_customer_date IS NULL;

---checking whether there are any empty values--- 
SELECT *
FROM olist_order_items_dataset
WHERE price <= 0;

---filling in the null values---
SELECT 
order_id,
ISNULL(order_delivered_customer_date, order_estimated_delivery_date) AS delivery_date
FROM olist_orders_dataset;

---joining different tables from Order_Dataset---
select top 10
o.order_id,
c.customer_city,
oi.price
from olist_orders_dataset o
join olist_customers_dataset c
on o.customer_id = c.customer_id
join olist_order_items_dataset oi
on o.order_id = oi.order_id;

---Calculate Total Revenue From Order Items---
select
SUM(price) as total_revenue
from olist_order_items_dataset;

---Calculate the Revenue of Each City from the Orders Dataset in Descending Order ---
select
c.customer_city,
sum(oi.price) as revenue
from olist_orders_dataset o
join olist_customers_dataset c
on o.customer_id = c.customer_id
join olist_order_items_dataset oi
on o.order_id = oi.order_id
group by c.customer_city
order by revenue desc;

---Finding out the top 10 countries which Spent the Most from the Orders Dataset---
SELECT TOP 10
    c.customer_id,
    SUM(oi.price) AS total_spent
FROM olist_orders_dataset o
INNER JOIN olist_customers_dataset c
    ON o.customer_id = c.customer_id
INNER JOIN olist_order_items_dataset oi
    ON o.order_id = oi.order_id
GROUP BY c.customer_id
ORDER BY total_spent DESC;

---Finding the Top-selling Product using Revenue---
select p.product_category_name,
sum(oi.price) as revenue
from olist_order_items_dataset oi
join olist_products_dataset p
on oi.product_id = p.product_id
group by p.product_category_name
order by revenue desc;

---Finding different trends in different months and years using MONTH, YEAR function---
select
YEAR(o.order_purchase_timestamp) as year,
MONTH(o.order_purchase_timestamp) as month,
SUM(oi.price) as revenue
from olist_orders_dataset o
join olist_order_items_dataset oi
on o.order_id = oi.order_id
group by
YEAR(o.order_purchase_timestamp),
MONTH(o.order_purchase_timestamp)
order by year, month;

---Top Customers using CTE---
with customers_spending as(
select 
c.customer_id,
SUM(oi.price) as total_spent
from olist_orders_dataset o
join olist_customers_dataset c
on o.customer_id = c.customer_id
join olist_order_items_dataset oi
on o.order_id = oi.order_id
group by c.customer_id
)
select top 10*
from customers_spending
order by total_spent desc;

---Window Function (RANK)---
WITH customer_spending AS (
SELECT 
c.customer_id,
SUM(oi.price) AS total_spent
FROM olist_orders_dataset o
JOIN olist_customers_dataset c
ON o.customer_id = c.customer_id
JOIN olist_order_items_dataset oi
ON o.order_id = oi.order_id
GROUP BY c.customer_id
)

SELECT 
customer_id,
total_spent,
RANK() OVER (ORDER BY total_spent DESC) AS rank
FROM customer_spending;

---Average Order Value---
SELECT 
AVG(order_total) AS avg_order_value
FROM (
SELECT 
o.order_id,
SUM(oi.price) AS order_total
FROM olist_orders_dataset o
JOIN olist_order_items_dataset oi
ON o.order_id = oi.order_id
GROUP BY o.order_id
) t;

---Customer Segmentation---
WITH customer_spending AS (
SELECT 
c.customer_id,
SUM(oi.price) AS total_spent
FROM olist_orders_dataset o
JOIN olist_customers_dataset c
ON o.customer_id = c.customer_id
JOIN olist_order_items_dataset oi
ON o.order_id = oi.order_id
GROUP BY c.customer_id
)
SELECT 
customer_id,
total_spent,
CASE 
WHEN total_spent > 10000 THEN 'High Value'
WHEN total_spent BETWEEN 5000 AND 10000 THEN 'Medium Value'
ELSE 'Low Value'
END AS customer_segment
FROM customer_spending
ORDER BY total_spent DESC;
