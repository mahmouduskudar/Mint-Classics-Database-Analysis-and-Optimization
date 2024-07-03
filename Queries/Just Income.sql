SELECT sub.productCode, 
       p.productName, 
       p.buyPrice AS priceEach, 
       sub.totalSold, 
       (p.buyPrice * sub.totalSold) AS total
FROM (SELECT productCode, SUM(quantityOrdered) AS totalSold
      FROM mintclassics.orderdetails
      GROUP BY productCode) AS sub
JOIN mintclassics.products p ON sub.productCode = p.productCode
ORDER BY sub.totalSold DESC;