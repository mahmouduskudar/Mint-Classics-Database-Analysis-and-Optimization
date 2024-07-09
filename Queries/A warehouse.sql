SELECT warehouseCode, productCode, quantityInStock, productScale, productline
FROM mintclassics.products
Where warehouseCode = 'a'
ORDER BY warehouseCode, productline