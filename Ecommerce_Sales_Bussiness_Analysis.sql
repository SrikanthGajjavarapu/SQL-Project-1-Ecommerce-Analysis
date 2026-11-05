
USE `e-commerce_analysis`;

-- ==========================================
-- SECTION 1: CUSTOMER ANALYSIS
-- ==========================================

-- Q1: Top 5 customers by revenue

SELECT
    c.customer_id,
    c.customer_name,
    SUM(o.total_amount) AS total_revenue
FROM Customers AS c
JOIN Orders AS o
    ON c.customer_id = o.customer_id
WHERE o.order_status = 'Delivered'
GROUP BY c.customer_id, c.customer_name
ORDER BY total_revenue DESC
LIMIT 5;


-- Q2: Customers who never placed orders

SELECT
    c.customer_id,
    c.customer_name
FROM Customers AS c
LEFT JOIN Orders AS o
    ON c.customer_id = o.customer_id
WHERE o.order_id IS NULL;


-- Q3: Customers with more than 2 orders

SELECT
    c.customer_id,
    c.customer_name,
    COUNT(o.order_id) AS total_orders
FROM Customers AS c
JOIN Orders AS o
    ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.customer_name
HAVING COUNT(o.order_id) > 2;


-- ==========================================
-- SECTION 2: SALES ANALYSIS
-- ==========================================

-- Q4: Total delivered revenue

SELECT
    SUM(total_amount) AS total_revenue
FROM Orders
WHERE order_status = 'Delivered';


-- Q5: Average delivered order value

SELECT
    AVG(total_amount) AS average_sale
FROM Orders
WHERE order_status = 'Delivered';


-- Q6: Monthly revenue analysis

SELECT
    YEAR(order_date) AS order_year,
    MONTH(order_date) AS order_month,
    SUM(total_amount) AS monthwise_revenue
FROM Orders
WHERE order_status = 'Delivered'
GROUP BY YEAR(order_date), MONTH(order_date)
ORDER BY order_year, order_month;


-- ==========================================
-- SECTION 3: ORDER ANALYSIS
-- ==========================================

-- Q7: Orders by status

SELECT
    order_status,
    COUNT(order_id) AS total_orders
FROM Orders
GROUP BY order_status;


-- ==========================================
-- SECTION 4: PRODUCT ANALYSIS
-- ==========================================

-- Q8: Top 5 products by quantity sold

SELECT
    p.product_id,
    p.product_name,
    SUM(od.quantity) AS total_quantity_sold
FROM OrderDetails AS od
JOIN Products AS p
    ON od.product_id = p.product_id
GROUP BY p.product_id, p.product_name
ORDER BY total_quantity_sold DESC
LIMIT 5;


-- Q9: Category-wise delivered revenue

SELECT
    p.category,
    SUM(od.quantity * od.price) AS total_revenue
FROM OrderDetails AS od
JOIN Products AS p
    ON od.product_id = p.product_id
JOIN Orders AS o
    ON od.order_id = o.order_id
WHERE o.order_status = 'Delivered'
GROUP BY p.category
ORDER BY total_revenue DESC;


-- ==========================================
-- SECTION 5: GEOGRAPHICAL ANALYSIS
-- ==========================================

-- Q10: Highest revenue city

SELECT
    c.city,
    SUM(o.total_amount) AS citywise_total_amount
FROM Customers AS c
JOIN Orders AS o
    ON c.customer_id = o.customer_id
WHERE o.order_status = 'Delivered'
GROUP BY c.city
ORDER BY citywise_total_amount DESC
LIMIT 1;


-- ==========================================
-- END OF SQL BUSINESS ANALYSIS PROJECT
-- ==========================================
