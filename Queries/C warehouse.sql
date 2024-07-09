SELECT warehouseCode, productCode, quantityInStock, productScale, productline
FROM mintclassics.products
Where warehouseCode = 'c'
ORDER BY warehouseCode, productline