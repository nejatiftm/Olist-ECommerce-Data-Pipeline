-- ==========================================================
-- ETL Script: Populate Core Layer (Star Schema) from Staging
-- ==========================================================

-- 1. Populate dim_customers
TRUNCATE TABLE core.dim_customers;
INSERT INTO core.dim_customers (customer_id, customer_unique_id, customer_city, customer_state, customer_zip_code_prefix)
SELECT DISTINCT 
    customer_id,
    customer_unique_id,
    customer_city,
    customer_state,
    customer_zip_code_prefix
FROM stg_customers; 


-- 2. Populate dim_sellers
TRUNCATE TABLE core.dim_sellers;
INSERT INTO core.dim_sellers (seller_id, seller_city, seller_state, seller_zip_code_prefix)
SELECT DISTINCT 
    seller_id,
    seller_city,
    seller_state,
    seller_zip_code_prefix
FROM stg_sellers;


-- 3. Populate dim_products
TRUNCATE TABLE core.dim_products;
INSERT INTO core.dim_products (product_id, product_category_name, product_weight_g, product_length_cm, product_height_cm, product_width_cm)
SELECT DISTINCT 
    product_id,
    product_category_name,
    product_weight_g,
    product_length_cm,
    product_height_cm,
    product_width_cm
FROM stg_products;


-- 4. Populate fact_orders
TRUNCATE TABLE core.fact_orders;
INSERT INTO core.fact_orders (order_id, customer_id, order_status, order_purchase_timestamp, order_approved_at, order_delivered_customer_date, order_estimated_delivery_date)
SELECT 
    order_id,
    customer_id,
    order_status,
    order_purchase_timestamp,
    order_approved_at,
    order_delivered_customer_date,
    order_estimated_delivery_date
FROM stg_orders;


-- 5. Populate fact_order_items
TRUNCATE TABLE core.fact_order_items;
INSERT INTO core.fact_order_items (order_id, order_item_id, product_id, seller_id, shipping_limit_date, price, freight_value)
SELECT 
    order_id,
    order_item_id,
    product_id,
    seller_id,
    shipping_limit_date,
    price,
    freight_value
FROM stg_order_items;


-- 6. Populate fact_order_payments
TRUNCATE TABLE core.fact_order_payments;
INSERT INTO core.fact_order_payments (order_id, payment_sequential, payment_type, payment_installments, payment_value)
SELECT 
    order_id,
    payment_sequential,
    payment_type,
    payment_installments,
    payment_value
FROM stg_order_payments;


-- 7. Populate fact_order_reviews
TRUNCATE TABLE core.fact_order_reviews;
INSERT INTO core.fact_order_reviews (review_id, order_id, review_score, review_comment_title, review_comment_message, review_creation_date, review_answer_timestamp)
SELECT 
    review_id,
    order_id,
    review_score,
    review_comment_title,
    review_comment_message,
    review_creation_date,
    review_answer_timestamp
FROM stg_order_reviews;
