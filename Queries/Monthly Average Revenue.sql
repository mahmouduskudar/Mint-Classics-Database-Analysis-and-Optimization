WITH TotalSales AS (
    SELECT p.productCode, p.productName, p.warehouseCode, p.quantityInStock, od.priceEach,
        COALESCE(SUM(od.quantityOrdered), 0) AS total_ordered_item,
        COALESCE(SUM(od.quantityOrdered * od.priceEach), 0) AS total_revenue
    FROM mintclassics.products p
    LEFT JOIN mintclassics.orderdetails od ON p.productCode = od.productCode
    LEFT JOIN mintclassics.orders o ON od.orderNumber = o.orderNumber AND o.status IN ('Shipped', 'Resolved')
    GROUP BY p.productCode, p.warehouseCode, p.quantityInStock
)
SELECT ts.productCode, ts.productName, ts.warehouseCode, ts.quantityInStock, ts.total_ordered_item, ts.total_revenue,
ROUND(ts.total_ordered_item / 18, 0) AS avg_monthly_sales, -- Assuming 18-month period for average sales calculation
ROUND(ts.priceEach * (ts.total_ordered_item / 18)) AS avg_monthly_revenue -- Assuming 18-month period for average revenue calculation
FROM TotalSales ts
ORDER BY avg_monthly_revenue DESC
LIMIT 20