SELECT warehouseCode, productCode, quantityInStock, productScale, productline
FROM mintclassics.products
Where warehouseCode = 'b'
ORDER BY warehouseCode, productline