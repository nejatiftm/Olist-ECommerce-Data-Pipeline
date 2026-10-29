-- ==========================================================
-- Analytics Layer: Business Insights & Queries
-- Dataset: Olist E-Commerce
-- ==========================================================

-- 1. Total Revenue and Order Count by Month (مجموع درآمد و تعداد سفارش‌ها به تفکیک ماه)
SELECT 
    FORMAT(o.order_purchase_timestamp, 'yyyy-MM') AS order_month,
    COUNT(DISTINCT o.order_id) AS total_orders,
    ROUND(SUM(i.price + i.freight_value), 2) AS total_revenue
FROM core.fact_orders o
JOIN core.fact_order_items i ON o.order_id = i.order_id
WHERE o.order_status = 'delivered'
GROUP BY FORMAT(o.order_purchase_timestamp, 'yyyy-MM')
ORDER BY order_month;


-- 2. Top 10 Best-Selling Product Categories (پرفروش‌ترین دسته‌بندی‌های محصولات)
SELECT TOP 10
    p.product_category_name,
    COUNT(i.order_item_id) AS total_items_sold,
    ROUND(SUM(i.price), 2) AS total_sales
FROM core.fact_order_items i
JOIN core.dim_products p ON i.product_id = p.product_id
GROUP BY p.product_category_name
ORDER BY total_sales DESC;


-- 3. Revenue by State (درآمد به تفکیک استان مشتریان)
SELECT 
    c.customer_state,
    COUNT(DISTINCT o.order_id) AS total_orders,
    ROUND(SUM(i.price + i.freight_value), 2) AS total_revenue
FROM core.fact_orders o
JOIN core.dim_customers c ON o.customer_id = c.customer_id
JOIN core.fact_order_items i ON o.order_id = i.order_id
WHERE o.order_status = 'delivered'
GROUP BY c.customer_state
ORDER BY total_revenue DESC;


-- 4. Payment Types Distribution (بررسی روش‌های پرداخت مشتریان)
SELECT 
    payment_type,
    COUNT(DISTINCT order_id) AS total_orders,
    ROUND(SUM(payment_value), 2) AS total_payment_value
FROM core.fact_order_payments
GROUP BY payment_type
ORDER BY total_payment_value DESC;


-- 5. Average Review Score by Product Category (میانگین امتیاز نظرات به تفکیک دسته‌بندی محصولات)
SELECT TOP 10
    p.product_category_name,
    ROUND(AVG(CAST(r.review_score AS FLOAT)), 2) AS avg_review_score,
    COUNT(r.review_score) AS total_reviews
FROM core.fact_order_reviews r
JOIN core.fact_order_items i ON r.order_id = i.order_id
JOIN core.dim_products p ON i.product_id = p.product_id
GROUP BY p.product_category_name
HAVING COUNT(r.review_score) > 50
ORDER BY avg_review_score DESC;
