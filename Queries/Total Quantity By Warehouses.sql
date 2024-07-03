SELECT warehouseCode, COUNT(productCode) AS totalProducts, SUM(quantityInStock) AS totalQuantity
FROM mintclassics.products
GROUP BY warehouseCode
ORDER BY totalQuantity Desc