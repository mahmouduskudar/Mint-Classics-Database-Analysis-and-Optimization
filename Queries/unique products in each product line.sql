Select productLine, count(*) AS 'Unique products'
From mintclassics.products
group by productLine