SELECT sub.productCode, 
       p.productName, 
       sub.avgSellPrice AS sellPrice, 
       p.buyPrice, 
       sub.totalSold, 
       (sub.avgSellPrice - p.buyPrice) * sub.totalSold AS revenue
FROM (
    SELECT od.productCode, 
           AVG(od.priceEach) AS avgSellPrice, 
           SUM(od.quantityOrdered) AS totalSold
    FROM mintclassics.orderdetails od
    JOIN mintclassics.orders o ON od.orderNumber = o.orderNumber
    WHERE o.status IN ('Shipped', 'Resolved')
    GROUP BY od.productCode
) AS sub
JOIN mintclassics.products p ON sub.productCode = p.productCode
ORDER BY revenue DESC;