-- Project: Customer & Revenue Analysis
-- Description: SQL queries to analyze customer behavior and revenue trends

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    signup_date DATE,
    country VARCHAR(10)
);

CREATE TABLE products (
    product_id INT PRIMARY KEY,
    category VARCHAR(15)
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    FOREIGN KEY (customer_id) 
    REFERENCES customers(customer_id)
);

CREATE TABLE order_items (
    order_id INT,
    product_id INT,
    quantity INT,
    price DECIMAL(10, 2)
    PRIMARY KEY (order_id, product_id),
    FOREIGN KEY (order_id) 
    REFERENCES orders(order_id),
    FOREIGN KEY (product_id) 
    REFERENCES products(product_id)
);

-- Revenue Analysis
--Daily Revenue
SELECT DATE(a.order_date) AS order_date, SUM(b.quantity * b.price) AS revenue
FROM orders a
JOIN order_items b
ON a.order_id = b.order_id
GROUP BY order_date
ORDER BY order_date;

--Monthly Revenue
SELECT DATE_FORMAT(a.order_date, '%Y-%m') AS month, SUM(b.quantity * b.price) AS revenue
FROM orders a
JOIN order_items b 
ON a.order_id = b.order_id
GROUP BY month
ORDER BY month;

--Total Revenue
SELECT SUM(quantity * price) AS total_revenue
FROM order_items;

-- Customer Analysis
--Top Customers
SELECT a.customer_id, SUM(b.quantity * b.price) AS total_spent
FROM orders a
JOIN order_items b 
ON a.order_id = b.order_id
GROUP BY a.customer_id
ORDER BY total_spent DESC
LIMIT 10;

--Orders Per Customer
SELECT customer_id, COUNT(order_id) AS total_orders
FROM orders
GROUP BY customer_id
ORDER BY total_orders DESC;

--Repeat Customers
SELECT 
    CASE 
        WHEN order_count = 1 THEN 'One-Time'
        ELSE 'Repeat'
    END AS customer_type,
    COUNT(*) AS num_customers
FROM (
    SELECT customer_id, COUNT(order_id) AS order_count
    FROM orders
    GROUP BY customer_id
) t
GROUP BY customer_type;

--Cohort Analysis
SELECT DATE_FORMAT(c.signup_date, '%Y-%m') AS cohort, COUNT(DISTINCT o.customer_id) AS active_customers
FROM customers c
LEFT JOIN orders o 
ON c.customer_id = o.customer_id
GROUP BY cohort
ORDER BY cohort;

-- Product Analysis
--Revenue by Product
SELECT product_id, SUM(quantity * price) AS revenue
FROM order_items
GROUP BY product_id
ORDER BY revenue DESC
LIMIT 10;

--Revenue by Category
SELECT p.category, SUM(o.quantity * o.price) AS revenue
FROM order_items o
JOIN products p 
ON o.product_id = p.product_id
GROUP BY p.category
ORDER BY revenue DESC;

--Average Order Value
SELECT AVG(order_total) AS avg_order_value
FROM (
    SELECT a.order_id, SUM(b.quantity * b.price) AS order_total
    FROM orders a
    JOIN order_items b 
    ON a.order_id = b.order_id
    GROUP BY a.order_id
) t;