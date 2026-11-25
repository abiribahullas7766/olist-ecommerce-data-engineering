-- ============================================
-- OLIST BRONZE-SILVER RECONCILIATION
-- ============================================

-- 1. Orders Reconciliation
SELECT
    (SELECT COUNT(*)
     FROM workspace.ecommerce_de_project.bronze_orders) AS bronze_orders,

    (SELECT COUNT(*)
     FROM workspace.ecommerce_de_project.silver_orders) AS silver_orders,

    (SELECT COUNT(*)
     FROM workspace.ecommerce_de_project.quarantine_orders) AS quarantined_orders;


-- 2. Order Items Reconciliation
SELECT
    (SELECT COUNT(*)
     FROM workspace.ecommerce_de_project.bronze_order_items) AS bronze_order_items,

    (SELECT COUNT(*)
     FROM workspace.ecommerce_de_project.silver_order_items) AS silver_order_items,

    (SELECT COUNT(*)
     FROM workspace.ecommerce_de_project.quarantine_order_items) AS quarantined_order_items;


-- 3. Silver Order Items Duplicate Check
SELECT
    order_id,
    COUNT(*) AS record_count
FROM workspace.ecommerce_de_project.silver_order_items
GROUP BY order_id
HAVING COUNT(*) > 1;


-- 4. Pipeline Run History
SELECT *
FROM workspace.ecommerce_de_project.pipeline_run_log
ORDER BY 1 DESC;
