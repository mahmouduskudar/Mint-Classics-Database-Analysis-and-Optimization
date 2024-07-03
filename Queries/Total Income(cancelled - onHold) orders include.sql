SELECT productCode, 
       totalSold, 
       priceEach, 
       totalSold * priceEach AS total
FROM (
    SELECT productCode, 
           SUM(quantityOrdered) AS totalSold, 
           MAX(priceEach) AS priceEach
    FROM mintclassics.orderdetails
    GROUP BY productCode
) AS sub
ORDER BY totalSold DESC;