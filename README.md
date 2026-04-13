E-commerce Sales & Customer Behavior Analysis using SQL


 Project Overview
This project analyzes an e-commerce dataset to understand customer purchasing behavior, sales performance, and revenue trends using SQL Server.

The goal is to extract meaningful insights that can help businesses improve decision-making, customer targeting, and overall sales strategy.


 Business Problem
E-commerce companies generate large volumes of data but often struggle to extract actionable insights.

This project focuses on:
- Understanding customer spending patterns
- Identifying top-performing regions and products
- Analyzing revenue trends over time
- Segmenting customers based on value


Tools & Technologies
- SQL Server (SSMS)
- SQL


 Dataset
- Source: Kaggle – Olist E-commerce Dataset  
- The dataset includes:
  - Orders
  - Customers
  - Order Items
  - Products
  - Payments
  - Sellers

Note: The dataset is not uploaded due to size limitations. It is publicly available on Kaggle.


 Data Cleaning & Validation
Before analysis, basic data validation was performed:
- Checked for missing values
- Handled NULL values using `ISNULL`
- Identified invalid data (e.g., price <= 0)
- Verified data consistency across tables


 Data Modeling
Multiple tables were connected using JOIN operations:

- Orders ↔ Customers
- Orders ↔ Order Items
- Order Items ↔ Products
- Orders ↔ Payments
- Order Items ↔ Sellers


 Key Analysis Performed

1. Data Exploration
- Total number of orders, customers, and order items

2. Revenue Analysis
- Total revenue calculation
- Revenue by city

3. Customer Analysis
- Top 10 customers by spending
- Customer segmentation (High / Medium / Low value)

4. Product Analysis
- Top-performing product categories

5. Time-Based Analysis
- Monthly revenue trends

6. Advanced SQL Analysis
- CTE (Common Table Expressions)
- Window functions (RANK)
- Subqueries (Average Order Value)
- CASE statements for segmentation


Key Insights
- A small group of customers contributes significantly to total revenue
- Certain cities consistently generate higher sales
- Orders often contain multiple items, increasing average order value
- Revenue trends fluctuate across months, indicating seasonal behavior


Business Recommendations
- Target high-value customers with loyalty programs
- Focus marketing efforts on top-performing cities
- Bundle products to increase order value
- Optimize inventory based on top-selling categories


SQL Concepts Used
- JOIN (INNER JOIN)
- GROUP BY
- ORDER BY
- Aggregations (SUM, COUNT, AVG)
- CTE (WITH)
- Window Functions (RANK)
- CASE Statements
- Subqueries
- Data Cleaning Functions (ISNULL)


Conclusion
This project demonstrates how SQL can be used to transform raw data into actionable business insights. It highlights the importance of data-driven decision-making in e-commerce.



 Power BI Dashboard

 Dashboard Overview

An interactive Power BI dashboard was created to visualize the insights derived from SQL analysis.

This dashboard is designed for **Sales Managers** to monitor performance and make data-driven decisions.

 Key Features

 KPI Metrics: Total Revenue, Orders, AOV, Customers
 Monthly Revenue Trend Analysis
 Customer Insights by State
 Top Customers by Revenue
 Sales Performance by City and Product Category
 Interactive slicers (Year, State, Category)

 Dashboard Screenshots

 Overview Dashboard

![Overview](images/overview.png)

 Customer Insights

![Customers](images/customers.png)

 Sales Insights

![Sales](images/sales.png)


 Author
Kashyap Cheruku
