-- ==========================================================
-- Core Layer: Creating Dimension Tables (Star Schema)
-- ==========================================================

-- 1. Customers Dimension
CREATE TABLE core.dim_customers (
    customer_key INT IDENTITY(1,1) PRIMARY KEY,
    customer_id VARCHAR(100) NOT NULL,
    customer_unique_id VARCHAR(100),
    customer_city VARCHAR(100),
    customer_state VARCHAR(10),
    customer_zip_code_prefix VARCHAR(20)
);

-- 2. Sellers Dimension
CREATE TABLE core.dim_sellers (
    seller_key INT IDENTITY(1,1) PRIMARY KEY,
    seller_id VARCHAR(100) NOT NULL,
    seller_city VARCHAR(100),
    seller_state VARCHAR(10),
    seller_zip_code_prefix VARCHAR(20)
);

-- 3. Products Dimension
CREATE TABLE core.dim_products (
    product_key INT IDENTITY(1,1) PRIMARY KEY,
    product_id VARCHAR(100) NOT NULL,
    product_category_name VARCHAR(100),
    product_weight_g FLOAT,
    product_length_cm FLOAT,
    product_height_cm FLOAT,
    product_width_cm FLOAT
);
