WITH TotalSales AS (
    SELECT 
        p.productCode,
        p.productName,
        p.warehouseCode,
        p.quantityInStock,
        COALESCE(SUM(od.quantityOrdered), 0) AS total_ordered_item,
        COALESCE(SUM(od.quantityOrdered * od.priceEach), 0) AS total_revenue,
        p.productScale
    FROM mintclassics.products p
    LEFT JOIN mintclassics.orderdetails od ON p.productCode = od.productCode
    LEFT JOIN mintclassics.orders o ON od.orderNumber = o.orderNumber AND o.status IN ('Shipped', 'Resolved')
    GROUP BY p.productCode, p.warehouseCode, p.quantityInStock, p.productScale
),

InventoryAnalysis AS (
    SELECT 
        ts.productCode,
        ts.productName,
        ts.warehouseCode,
        ts.quantityInStock,
        ts.total_ordered_item,
        ts.total_revenue,
        ROUND(ts.total_ordered_item / 18, 0) AS avg_monthly_sales,
        ROUND((ts.total_ordered_item / 18) * 12, 0) AS good_stock_level_sales,
        ROUND(ts.total_revenue / 18, 0) AS avg_monthly_revenue,
        ts.productScale,
        CASE
            WHEN ts.total_ordered_item < 1 THEN 'Never ordered'
            WHEN ts.quantityInStock > (ts.total_ordered_item / 18) * 12 THEN 'Overstocked'
            WHEN ts.quantityInStock < (ts.total_ordered_item / 18) * 12 THEN 'Understocked'
            ELSE 'Well-Stocked'
        END AS inventory_status
    FROM TotalSales ts
)

SELECT 
    ia.productCode,
    ia.warehouseCode,
    ia.quantityInStock,
    ia.total_ordered_item,
    ia.total_revenue,
    ia.avg_monthly_sales,
    ia.good_stock_level_sales,
    ia.avg_monthly_revenue,
    ia.inventory_status,
    CASE
		WHEN ia.inventory_status = 'Never ordered' OR ia.inventory_status = 'Overstocked' AND (ia.productScale LIKE '%1:700%' OR ia.productScale LIKE '%1:72%' OR ia.productScale LIKE '%1:50%' OR ia.productScale LIKE '%1:32%' OR ia.productScale LIKE '%1:24%') THEN 'Reduce'  -- reduce if high stocked and scale is high
        WHEN ia.inventory_status = 'Understocked' THEN 'Increase'  -- increase if stocked is low scale is low
        ELSE 'Maintain'
    END AS action
FROM InventoryAnalysis ia
where ia.inventory_status = 'Never ordered' OR ia.inventory_status = 'Overstocked' AND (ia.productScale LIKE '%1:700%' OR ia.productScale LIKE '%1:72%' OR ia.productScale LIKE '%1:50%' OR ia.productScale LIKE '%1:32%' OR ia.productScale LIKE '%1:24%')
HAVING ia.warehouseCode = "a"
ORDER BY ia.warehouseCode