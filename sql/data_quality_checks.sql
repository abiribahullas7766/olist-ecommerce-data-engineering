-- ==========================================
-- OLIST DATA QUALITY CHECKS
-- ==========================================

-- 1. Check NULL values in Silver Orders
SELECT
    COUNT(*) AS total_records,
    SUM(CASE WHEN customer_id IS NULL THEN 1 ELSE 0 END) AS null_customer_id,
    SUM(CASE WHEN order_id IS NULL THEN 1 ELSE 0 END) AS null_order_id
FROM workspace.ecommerce_de_project.silver_orders;


-- 2. Check duplicate Order IDs
SELECT
    order_id,
    COUNT(*) AS duplicate_count
FROM workspace.ecommerce_de_project.silver_orders
GROUP BY order_id
HAVING COUNT(*) > 1;


-- 3. Validate Order Items
SELECT
    COUNT(*) AS total_records,
    COUNT(DISTINCT order_id) AS unique_orders
FROM workspace.ecommerce_de_project.silver_order_items;


-- 4. Check Null Values in Order Items
SELECT
    SUM(CASE WHEN order_id IS NULL THEN 1 ELSE 0 END) AS null_order_ids,
    SUM(CASE WHEN product_id IS NULL THEN 1 ELSE 0 END) AS null_product_ids,
    SUM(CASE WHEN seller_id IS NULL THEN 1 ELSE 0 END) AS null_seller_ids
FROM workspace.ecommerce_de_project.silver_order_items;


-- 5. Pipeline Health Summary
SELECT *
FROM workspace.ecommerce_de_project.pipeline_health_summary;


-- 6. Data Quality Status
SELECT *
FROM workspace.ecommerce_de_project.data_quality_status;
