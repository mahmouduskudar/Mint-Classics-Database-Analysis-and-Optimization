WITH TotalSales AS (
    SELECT 
        p.productCode,
        p.warehouseCode,
        p.quantityInStock,
        COALESCE(SUM(od.quantityOrdered), 0) AS total_ordered_item
    FROM mintclassics.products p
    LEFT JOIN mintclassics.orderdetails od ON p.productCode = od.productCode
    LEFT JOIN mintclassics.orders o ON od.orderNumber = o.orderNumber AND o.status IN ('Shipped', 'Resolved')
    GROUP BY p.productCode, p.warehouseCode, p.quantityInStock
)

SELECT 
    ts.productCode,
    ts.warehouseCode,
    ts.quantityInStock,
    ts.total_ordered_item,
    ROUND(ts.total_ordered_item / 18, 0) AS avg_monthly_sales, -- 18-month period for average sales calculation
    ROUND((ts.total_ordered_item / 18) * 12, 0) AS good_stock_level, -- Assuming 12 months buffer for good stock level
    CASE
        WHEN ts.total_ordered_item < 1 OR ts.quantityInStock > (ts.total_ordered_item / 18) * 12 THEN 'Overstocked'
    END AS inventory_status
FROM TotalSales ts
WHERE ts.quantityInStock > (ts.total_ordered_item / 18) * 12 AND  ts.warehouseCode = 'a'
ORDER BY ts.warehouseCode, good_stock_level