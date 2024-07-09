SELECT p.productCode, p.warehouseCode, p.quantityInStock, COALESCE(SUM(CASE WHEN o.status IN ('Shipped', 'Resolved') THEN od.quantityOrdered ELSE 0 END), 0) AS total_ordered_item
FROM mintclassics.products p
LEFT JOIN mintclassics.orderdetails od ON p.productCode = od.productCode
LEFT JOIN mintclassics.orders o ON od.orderNumber = o.orderNumber
GROUP BY p.productCode, p.warehouseCode, p.quantityInStock
HAVING total_ordered_item < 1
ORDER BY p.warehouseCode;
