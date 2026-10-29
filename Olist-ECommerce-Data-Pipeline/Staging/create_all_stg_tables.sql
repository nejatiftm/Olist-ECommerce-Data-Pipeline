-- ==========================================================
-- Staging Layer: Creating Raw Tables for Olist Dataset
-- Note: All columns are set as VARCHAR to ensure smooth import
-- ==========================================================

-- 1. Customers Table
CREATE TABLE stg_customers (
    customer_id VARCHAR(100),
    customer_unique_id VARCHAR(100),
    customer_zip_code_prefix VARCHAR(20),
    customer_city VARCHAR(100),
    customer_state VARCHAR(10)
);

-- 2. Sellers Table
CREATE TABLE stg_sellers (
    seller_id VARCHAR(100),
    seller_zip_code_prefix VARCHAR(20),
    seller_city VARCHAR(100),
    seller_state VARCHAR(10)
);

-- 3. Products Table
CREATE TABLE stg_products (
    product_id VARCHAR(100),
    product_category_name VARCHAR(100),
    product_name_lenght VARCHAR(20),
    product_description_lenght VARCHAR(20),
    product_photos_qty VARCHAR(20),
    product_weight_g VARCHAR(20),
    product_length_cm VARCHAR(20),
    product_height_cm VARCHAR(20),
    product_width_cm VARCHAR(20)
);

-- 4. Orders Table
CREATE TABLE stg_orders (
    order_id VARCHAR(100),
    customer_id VARCHAR(100),
    order_status VARCHAR(50),
    order_purchase_timestamp VARCHAR(50),
    order_approved_at VARCHAR(50),
    order_delivered_carrier_date VARCHAR(50),
    order_delivered_customer_date VARCHAR(50),
    order_estimated_delivery_date VARCHAR(50)
);

-- 5. Order Items Table
CREATE TABLE stg_order_items (
    order_id VARCHAR(100),
    order_item_id VARCHAR(20),
    product_id VARCHAR(100),
    seller_id VARCHAR(100),
    shipping_limit_date VARCHAR(50),
    price VARCHAR(50),
    freight_value VARCHAR(50)
);

-- 6. Order Payments Table
CREATE TABLE stg_order_payments (
    order_id VARCHAR(100),
    payment_sequential VARCHAR(20),
    payment_type VARCHAR(50),
    payment_installments VARCHAR(20),
    payment_value VARCHAR(50)
);

-- 7. Order Reviews Table
CREATE TABLE stg_order_reviews (
    review_id VARCHAR(100),
    order_id VARCHAR(100),
    review_score VARCHAR(10),
    review_comment_title VARCHAR(MAX),
    review_comment_message VARCHAR(MAX),
    review_creation_date VARCHAR(50),
    review_answer_timestamp VARCHAR(50)
);
