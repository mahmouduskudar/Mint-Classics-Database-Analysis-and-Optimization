SELECT warehouseCode, productCode, quantityInStock, productScale, productline
FROM mintclassics.products
Where warehouseCode = 'd'
ORDER BY warehouseCode, productline