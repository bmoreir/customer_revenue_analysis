# Customer Behavior & Revenue Analysis (SQL)

> Analyzed customer purchasing behavior and revenue trends using SQL to identify high-value customers, revenue drivers, and growth opportunities.

---

## Overview

This project explores customer behavior and revenue performance for a simulated e-commerce business using SQL.

The objective is to understand how revenue is generated, identify high-value customers, and uncover opportunities to improve customer retention and overall business performance.

---

## Tools & Technologies

* SQL (MySQL)
* Data Analysis & Aggregation
* Relational Database Design (Primary & Foreign Keys)

---

## Dataset

The dataset was programmatically generated to simulate real-world e-commerce activity and includes:

* **customers** – customer demographics and signup date
* **orders** – transaction-level order data
* **order_items** – product-level order details (quantity, price)
* **products** – product categories

Key characteristics:

* 5,000+ orders across multiple customers
* Uneven customer spending distribution (realistic purchasing behavior)
* Multiple items per order
* Time-based data enabling trend and cohort analysis

---

## Database Schema

The database was designed using relational principles with primary and foreign key constraints to ensure data integrity:

* `customers.customer_id` → Primary Key
* `orders.order_id` → Primary Key
* `orders.customer_id` → Foreign Key
* `order_items (order_id, product_id)` → Composite Primary Key
* `order_items.order_id` → Foreign Key
* `order_items.product_id` → Foreign Key

---

## Key Analysis

### 1. Revenue Analysis

* Calculated daily and monthly revenue trends
* Identified overall revenue performance over time

### 2. Customer Analysis

* Identified top customers by total spending
* Measured customer purchase frequency
* Segmented customers into one-time vs repeat buyers

### 3. Product & Category Performance

* Analyzed revenue contribution by product
* Evaluated category-level performance

### 4. Advanced Analysis

* Ranked customers by total spending using SQL window functions
* Segmented customers into value tiers (High, Medium, Low)
* Calculated revenue contribution per customer to identify concentration of sales

---

## Key Insights

* A small group of customers contributes a disproportionately large share of total revenue
* Repeat customers generate significantly more revenue than one-time buyers
* Certain product categories consistently outperform others in revenue contribution
* Revenue distribution is highly skewed, indicating opportunities for targeted marketing and retention strategies

---

## Business Impact

* Identifies high-value customers for targeted retention and marketing campaigns
* Highlights revenue concentration risk and dependence on top customers
* Supports data-driven decision making for product and customer strategy
* Provides a scalable framework for ongoing customer and revenue analysis

---

## Project Structure

```
project-3-sql-analysis/
│
├── data/
│   ├── customers.csv
│   ├── orders.csv
│   ├── order_items.csv
│   ├── products.csv
│
├── sql/
│   ├── 01_revenue_analysis.sql
│   ├── 02_customer_analysis.sql
│   ├── 03_product_analysis.sql
│   ├── 04_advanced_analysis.sql
│
├── outputs/
│   ├── revenue_trend.csv
│   ├── top_customers.csv
│   ├── category_performance.csv
│   ├── customer_segments.csv
│
└── README.md
```

---

## How to Run

1. Create tables in MySQL using the provided schema
2. Import CSV files into the corresponding tables
3. Execute SQL queries in the `/sql` directory
4. Review outputs in the `/outputs` folder

---

## Project Objective

This project demonstrates the use of SQL for analyzing customer behavior and revenue performance in a relational database environment, with a focus on generating actionable business insights.

---

## Author

Byron Moreira
B.Sc. in Computer Applications, Mathematics & Statistics
