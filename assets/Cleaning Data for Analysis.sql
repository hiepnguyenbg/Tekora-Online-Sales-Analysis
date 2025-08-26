-- Cleaning and combining data for BI analysis with requested columns
-- Standardize product names to resolve inconsistencies
WITH cleaned_product AS (
  SELECT
    customer_id,
    id AS order_id,
    purchase_ts,
    product_id,
    CASE 
      WHEN LOWER(product_name) LIKE '%gaming monitor%' THEN '27 inch Gaming Monitor'
      WHEN LOWER(product_name) LIKE '%macbook%' THEN 'Apple Macbook Air Laptop'
      WHEN LOWER(product_name) LIKE '%thinkpad%' THEN 'Lenovo ThinkPad Laptop'
      WHEN LOWER(product_name) LIKE '%bose%' THEN 'Bose Soundsport Headphones'
      ELSE product_name 
    END AS product_name,
    UPPER(currency) AS currency,
    local_price,
    usd_price,
    purchase_platform
  FROM orders
),
-- Clean orders data and add brand_name and product_category
cleaned_orders AS (
  SELECT
    *,
    CASE 
      WHEN LOWER(product_name) LIKE '%apple%' THEN 'Apple'
      WHEN LOWER(product_name) LIKE '%samsung%' THEN 'Samsung'
      WHEN LOWER(product_name) LIKE '%lenovo%' THEN 'Lenovo'
      WHEN LOWER(product_name) LIKE '%bose%' THEN 'Bose'
      ELSE 'Unknown' 
    END AS brand_name,
    CASE 
      WHEN LOWER(product_name) LIKE '%headphones%' THEN 'Headphones'
      WHEN LOWER(product_name) LIKE '%laptop%' THEN 'Laptop'
      WHEN LOWER(product_name) LIKE '%iphone%' THEN 'Cell Phone'
      WHEN LOWER(product_name) LIKE '%monitor%' THEN 'Monitor'
      ELSE 'Accessories' 
    END AS product_category,
	ROW_NUMBER() OVER (PARTITION BY cleaned_product.customer_id ORDER BY cleaned_product.purchase_ts) AS customer_order_number
  FROM cleaned_product
),
-- Clean customer data
cleaned_customers AS (
  SELECT
    id AS customer_id,
    marketing_channel,
    account_creation_method,
    UPPER(country_code) AS country_code,
    CASE 
      WHEN loyalty_program = 1 THEN 'Member'
      WHEN loyalty_program = 0 THEN 'Non-Member'
      ELSE NULL
    END AS loyalty_program,
    created_on
  FROM customers
),
-- Clean geo lookup data for region inconsistencies
cleaned_geo_lookup AS (
  SELECT
    country,
    CASE 
      WHEN UPPER(country) = 'EU' THEN 'EMEA'
      WHEN UPPER(country) = 'A1' THEN ''
      ELSE TRIM(region) 
    END AS region
  FROM geo_lookup
),
-- Clean order status data and compute duration metrics
cleaned_order_status AS (
  SELECT
    order_status.order_id AS order_id,
    order_status.ship_ts AS ship_ts,
    order_status.delivery_ts AS delivery_ts,
    order_status.refund_ts AS refund_ts,
    CASE 
      WHEN DATEDIFF(order_status.ship_ts, orders.purchase_ts) < 0 THEN NULL 
      ELSE DATEDIFF(order_status.ship_ts, orders.purchase_ts) 
    END AS days_to_ship,
    CASE 
      WHEN DATEDIFF(orders.purchase_ts, customers.created_on) < 0 THEN NULL 
      ELSE DATEDIFF(orders.purchase_ts, customers.created_on) 
    END AS days_to_order
  FROM order_status
  LEFT JOIN orders
    ON order_status.order_id = orders.id
  LEFT JOIN customers
    ON orders.customer_id = customers.id
)
SELECT
  cleaned_orders.order_id,
  cleaned_orders.product_id,
  cleaned_orders.product_name,
  cleaned_orders.brand_name,
  cleaned_orders.product_category,
  cleaned_orders.currency,
  cleaned_orders.local_price,
  cleaned_orders.usd_price,
  cleaned_orders.purchase_platform,
  cleaned_orders.customer_id,
  cleaned_customers.country_code,
  cleaned_geo_lookup.region,
  cleaned_customers.loyalty_program,
  cleaned_orders.customer_order_number,
  cleaned_customers.marketing_channel,
  cleaned_customers.account_creation_method,
  cleaned_customers.created_on,
  cleaned_orders.purchase_ts,
  cleaned_order_status.ship_ts,
  cleaned_order_status.delivery_ts,
  cleaned_order_status.refund_ts,
  cleaned_order_status.days_to_ship AS time_to_ship_days,
  cleaned_order_status.days_to_order AS time_to_purchase_days
FROM cleaned_orders
LEFT JOIN cleaned_customers
  ON cleaned_orders.customer_id = cleaned_customers.customer_id
LEFT JOIN cleaned_geo_lookup
  ON cleaned_customers.country_code = cleaned_geo_lookup.country
LEFT JOIN cleaned_order_status
  ON cleaned_orders.order_id = cleaned_order_status.order_id;