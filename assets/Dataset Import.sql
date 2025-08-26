
-- Create database and use it
CREATE DATABASE IF NOT EXISTS tekora;
USE tekora;

-- Enable local_infile if needed
SET GLOBAL local_infile = 1;



-- ====================================
-- 1. Geo Lookup Table
-- ====================================
DROP TABLE IF EXISTS geo_lookup;

CREATE TABLE geo_lookup (
    country CHAR(2) PRIMARY KEY,  -- ISO country code
    region VARCHAR(64)
);

LOAD DATA LOCAL INFILE '/Users/hiepnguyenbg91/Downloads/Tekora/geo_lookup.csv'
INTO TABLE geo_lookup
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(@country, @region)
SET
    country = NULLIF(@country, ''),
    region       = NULLIF(TRIM(REPLACE(@region, '\r', '')), '');


-- ====================================
-- 2. Customers Table
-- ====================================
DROP TABLE IF EXISTS customers;

CREATE TABLE customers (
    id VARCHAR(32) PRIMARY KEY,
    marketing_channel VARCHAR(32),
    account_creation_method VARCHAR(32),
    country_code CHAR(2),
    loyalty_program TINYINT,
    created_on DATE,
    CONSTRAINT fk_customers_country FOREIGN KEY (country_code)
        REFERENCES geo_lookup(country)
);

LOAD DATA LOCAL INFILE '/Users/hiepnguyenbg91/Downloads/Tekora/customers.csv'
INTO TABLE customers
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(@id, @marketing_channel, @account_creation_method, @country_code, @loyalty_program, @created_on)
SET
    id                      = NULLIF(@id, ''),
    marketing_channel       = NULLIF(@marketing_channel, ''),
    account_creation_method = NULLIF(@account_creation_method, ''),
    country_code            = NULLIF(@country_code, ''),
    loyalty_program         = NULLIF(@loyalty_program, ''),
    created_on = STR_TO_DATE(NULLIF(TRIM(REPLACE(@created_on, '\r', '')), ''), '%m/%d/%y');



-- ====================================
-- 3. Orders Table
-- ====================================
DROP TABLE IF EXISTS orders;

CREATE TABLE orders (
    id VARCHAR(32) PRIMARY KEY,  -- order ID
    customer_id VARCHAR(32),
    purchase_ts DATE,
    product_id VARCHAR(16),
    product_name VARCHAR(255),
    currency CHAR(3),
    local_price DECIMAL(10,2),
    usd_price DECIMAL(10,2),
    purchase_platform VARCHAR(32),
    CONSTRAINT fk_orders_customer FOREIGN KEY (customer_id)
        REFERENCES customers(id)
);

LOAD DATA LOCAL INFILE '/Users/hiepnguyenbg91/Downloads/Tekora/orders.csv'
INTO TABLE orders
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(@customer_id, @id, @purchase_ts, @product_id, @product_name, @currency, @local_price, @usd_price, @purchase_platform)
SET
    customer_id       = NULLIF(@customer_id, ''),
    id                = NULLIF(@id, ''),
    purchase_ts       = STR_TO_DATE(NULLIF(@purchase_ts, ''), '%m/%d/%y'),
    product_id        = NULLIF(@product_id, ''),
    product_name      = NULLIF(@product_name, ''),
    currency          = NULLIF(@currency, ''),
    local_price       = NULLIF(TRIM(@local_price), ''),
    usd_price         = NULLIF(TRIM(@usd_price), ''),
    purchase_platform = NULLIF(TRIM(REPLACE(@purchase_platform, '\r', '')), '');


-- ====================================
-- 4. Order Status Table
-- ====================================
DROP TABLE IF EXISTS order_status;

CREATE TABLE order_status (
    order_id VARCHAR(32) PRIMARY KEY,  -- corrected column name
    purchase_ts DATE,
    ship_ts DATE,
    delivery_ts DATE,
    refund_ts DATE,
    CONSTRAINT fk_orderstatus_order FOREIGN KEY (order_id)
        REFERENCES orders(id)
);

LOAD DATA LOCAL INFILE '/Users/hiepnguyenbg91/Downloads/Tekora/order_status.csv'
INTO TABLE order_status
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(@order_id, @purchase_ts, @ship_ts, @delivery_ts, @refund_ts)
SET
    order_id    = NULLIF(@order_id, ''),
    purchase_ts = STR_TO_DATE(NULLIF(@purchase_ts, ''), '%m/%d/%y'),
    ship_ts     = STR_TO_DATE(NULLIF(@ship_ts, ''), '%m/%d/%y'),
    delivery_ts = STR_TO_DATE(NULLIF(@delivery_ts, ''), '%m/%d/%y'),
    refund_ts = STR_TO_DATE(NULLIF(TRIM(REPLACE(@refund_ts, '\r', '')), ''), '%m/%d/%y');

