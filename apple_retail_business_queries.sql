-- SQL Project: Apple Retail Sales
-- Purpose: Key business insights using SQL analytics

ALTER TABLE products
ADD COLUMN currency VARCHAR(10) DEFAULT 'USD';


-- 1. Total Sales Revenue by Product Category
SELECT c.category_name, sum(s.quantity * p.price) as total_revenue
FROM sales s
JOIN products p on s.product_id = p.product_id
JOIN category c on p.category_id = c.category_id
GROUP BY c.category_name
ORDER BY total_revenue DESC;

-- 2. Top 5 Best-Selling Products
SELECT 
    p.product_name,
    SUM(s.quantity) AS total_units_sold
FROM sales s
JOIN products p ON s.product_id = p.product_id
GROUP BY p.product_name
ORDER BY total_units_sold DESC
LIMIT 5;

-- 3. Monthly Revenue Trend
SELECT 
    DATE_TRUNC('month', s.sale_date) AS month,
    TO_CHAR(DATE_TRUNC('month', s.sale_date), 'Mon YYYY') AS month_name,
    SUM(s.quantity * p.price) AS monthly_revenue
FROM sales s
JOIN products p ON s.product_id = p.product_id
GROUP BY month
ORDER BY month;

-- 4. Total Revenue by Store
SELECT 
    st.store_name,
    SUM(s.quantity * p.price) AS store_revenue
FROM sales s
JOIN stores st ON s.store_id = st.store_id
JOIN products p ON s.product_id = p.product_id
GROUP BY st.store_name
ORDER BY store_revenue DESC;

-- 5.Average Product Price by Category
SELECT 
    c.category_name,
    ROUND(AVG(p.price), 2) AS avg_price
FROM products p
JOIN category c ON p.category_id = c.category_id
GROUP BY c.category_name;

-- 6. Products Never Sold
SELECT 
    p.product_name
FROM products p
LEFT JOIN sales s ON p.product_id = s.product_id
WHERE s.sale_id IS NULL;

-- 7.Stores with the Highest Warranty Claims
SELECT 
    st.store_name,
    COUNT(w.claim_id) AS total_claims
FROM warranty w
JOIN sales s ON w.sale_id = s.sale_id
JOIN stores st ON s.store_id = st.store_id
GROUP BY st.store_name
ORDER BY total_claims DESC
LIMIT 3;

-- 8. Product with the Most Warranty Claims
SELECT 
    p.product_name,
    COUNT(w.claim_id) AS claim_count
FROM warranty w
JOIN sales s ON w.sale_id = s.sale_id
JOIN products p ON s.product_id = p.product_id
GROUP BY p.product_name
ORDER BY claim_count DESC
LIMIT 1;

-- 9. Top Performing Product by Each Store (Window Function)
SELECT store_name, product_name, total_sales
FROM (
    SELECT 
        st.store_name,
        p.product_name,
        SUM(s.quantity * p.price) AS total_sales,
        RANK() OVER (PARTITION BY st.store_id ORDER BY SUM(s.quantity * p.price) DESC) AS rnk
    FROM sales s
    JOIN stores st ON s.store_id = st.store_id
    JOIN products p ON s.product_id = p.product_id
    GROUP BY st.store_name, p.product_name, st.store_id
) ranked
WHERE rnk = 1;

-- 10. Category Contribution to Total Revenue
WITH total AS (
    SELECT SUM(s.quantity * p.price) AS overall_sales
    FROM sales s
    JOIN products p ON s.product_id = p.product_id
)
SELECT 
    c.category_name,
    ROUND(SUM(s.quantity * p.price) * 100 / (SELECT overall_sales FROM total), 2) AS revenue_percent
FROM sales s
JOIN products p ON s.product_id = p.product_id
JOIN category c ON p.category_id = c.category_id
GROUP BY c.category_name;

---11. Top 5 products by revenue
SELECT 
    p.product_name,
    SUM(s.quantity * p.price) AS total_revenue
FROM sales s
JOIN products p ON s.product_id = p.product_id
GROUP BY p.product_name
ORDER BY total_revenue DESC
LIMIT 5;





