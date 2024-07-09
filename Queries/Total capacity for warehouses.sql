SELECT p.warehouseCode, SUM(p.quantityInStock) AS total_in_warehouse, w.warehousePctCap AS warehouse_Presentage_capacity, ROUND((SUM(p.quantityInStock) / w.warehousePctCap) * 100, 0) AS Total_Capacity, ROUND(((SUM(p.quantityInStock) / w.warehousePctCap) * 100) - SUM(p.quantityInStock), 0) AS empty_space
FROM mintclassics.products p
join mintclassics.warehouses w
ON p.warehouseCode = w.warehouseCode
GROUP BY warehouseCode