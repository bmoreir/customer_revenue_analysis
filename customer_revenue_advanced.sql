-- Project: Customer & Revenue Analysis
-- Description: SQL queries to analyze customer behavior and revenue trends

--Top Customer
SELECT customer_id, SUM(b.quantity * b.price) AS total_spent, RANK() OVER (ORDER BY SUM(b.quantity * b.price) DESC) AS customer_rank
FROM orders a
JOIN order_items b 
ON a.order_id = b.order_id
GROUP BY customer_id;

--Customer Segmentation
SELECT customer_id, total_spent,
    CASE 
        WHEN total_spent > 1000 THEN 'High Value'
        WHEN total_spent > 500 THEN 'Medium Value'
        ELSE 'Low Value'
    END AS customer_segment
FROM (
    SELECT a.customer_id, SUM(b.quantity * b.price) AS total_spent
    FROM orders a
    JOIN order_items b 
    ON a.order_id = b.order_id
    GROUP BY a.customer_id
) t;

--Revenue Share
SELECT customer_id, total_spent, ROUND(total_spent / SUM(total_spent) OVER () * 100, 2) AS revenue_percent
FROM (
    SELECT a.customer_id, SUM(b.quantity * b.price) AS total_spent
    FROM orders a
    JOIN order_items b 
    ON a.order_id = b.order_id
    GROUP BY a.customer_id
) t
ORDER BY total_spent DESC;