# Mint-Classics-Database-Analysis-and-Optimization
This project aims to analyze and optimize the inventory management of Mint Classics Company by investigating the potential closure of one of its storage facilities. The project involves importing, understanding, and analyzing the Mint Classics relational database using MySQL Workbench. The analysis will lead to data-driven recommendations to improve business processes.

# Project Overview
Mint Classics Company is considering closing one of its storage facilities to streamline operations and reduce costs while maintaining timely customer service. This project involves a detailed examination of the company's database to provide insights and recommendations on inventory reorganization.

# Project Report
Under work.........




<details>
<summary>Warehouses Table</summary>

### Warehouses Table

```sql
   SELECT * FROM mintclassics.warehouses;
```

| warehouseCode  | warehouseName | warehousePctCap |
| -------------- | ------------- | --------------- |
|        a       |     North     |        72       |
|        b       |      East     |        67       |
|        c       |      West     |        50       |
|        d       |     South     |        75       |
</details>


<details>
<summary>Products Table</summary>
   
### Products Table

```sql
   SELECT productCode, productName, productLine, productScale, productVendor, quantityInStock, warehouseCode, buyPrice, MSRP
   FROM mintclassics.products
   order by productName
   LIMIT 10
```

| productCode | productName                         | productLine   | productScale | productVendor            | quantityInStock | warehouseCode | buyPrice | MSRP   |
|-------------|-------------------------------------|---------------|--------------|--------------------------|-----------------|---------------|----------|--------|
| S24_2011    | 18th century schooner               | Ships         | 1:24         | Carousel DieCast Legends | 1898            | d             | 82.34    | 122.89 |
| S18_3136    | 18th Century Vintage Horse Carriage | Vintage Cars  | 1:18         | Red Start Diecast        | 5992            | c             | 60.74    | 104.72 |
| S24_2841    | 1900s Vintage Bi-Plane              | Planes        | 1:24         | Autoart Studio Design    | 5942            | a             | 34.25    | 68.51  |
| S24_4278    | 1900s Vintage Tri-Plane             | Planes        | 1:24         | Unimax Art Galleries     | 2756            | a             | 36.23    | 72.45  |
| S18_3140    | 1903 Ford Model A                   | Vintage Cars  | 1:18         | Unimax Art Galleries     | 3913            | c             | 68.30    | 136.59 |
| S18_4522    | 1904 Buick Runabout                 | Vintage Cars  | 1:18         | Exoto Designs            | 8290            | c             | 52.66    | 87.77  |
| S18_2248    | 1911 Ford Town Car                  | Vintage Cars  | 1:18         | Motor City Art Classics  | 540             | c             | 33.30    | 60.54  |
| S24_3151    | 1912 Ford Model T Delivery Wagon    | Vintage Cars  | 1:24         | Min Lin Diecast          | 9173            | c             | 46.91    | 88.51  |
| S18_2949    | 1913 Ford Model T Speedster         | Vintage Cars  | 1:18         | Carousel DieCast Legends | 4189            | c             | 60.78    | 101.31 |
| S18_1749    | 1917 Grand Touring Sedan            | Vintage Cars  | 1:18         | Welly Diecast Productions| 2724            | c             | 86.70    | 170.00 |

</details>


<details>
<summary>Product Lines Table</summary>
   
### Product Lines Table

```sql
   SELECT productLine FROM mintclassics.productlines
   LIMIT 10
```

| productLine       |
|-------------------|
| Classic Cars      |
| Motorcycles       |
| Planes            |
| Ships             |
| Trains            |
| Trucks and Buses  |
| Vintage Cars      |

</details>

<details>
<summary>Orders Table</summary>

### Orders Table

```sql
   SELECT orderNumber, orderDate, requiredDate, shippedDate, status, customerNumber
   FROM mintclassics.orders
   order by customerNumber DESC
   LIMIT 10
```

| orderNumber | orderDate   | requiredDate | shippedDate | status    | customerNumber |
|-------------|-------------|--------------|-------------|-----------|----------------|
| 10399       | 2005-04-01  | 2005-04-12   | 2005-04-03  | Shipped   | 496            |
| 10138       | 2003-07-07  | 2003-07-16   | 2003-07-13  | Shipped   | 496            |
| 10179       | 2003-11-11  | 2003-11-17   | 2003-11-13  | Cancelled | 496            |
| 10360       | 2004-12-16  | 2004-12-22   | 2004-12-18  | Shipped   | 496            |
| 10207       | 2003-12-09  | 2003-12-17   | 2003-12-11  | Shipped   | 495            |
| 10243       | 2004-04-26  | 2004-05-03   | 2004-04-28  | Shipped   | 495            |
| 10213       | 2004-01-22  | 2004-01-28   | 2004-01-27  | Shipped   | 489            |
| 10186       | 2003-11-14  | 2003-11-20   | 2003-11-18  | Shipped   | 489            |
| 10219       | 2004-02-10  | 2004-02-17   | 2004-02-12  | Shipped   | 487            |
| 10149       | 2003-09-12  | 2003-09-18   | 2003-09-17  | Shipped   | 487            |

</details>


<details>
<summary>Order Details Table</summary>
   
### Order Details Table

```sql
   SELECT * FROM mintclassics.orderdetails
   LIMIT 10
```

| orderNumber | productCode | quantityOrdered | priceEach | orderLineNumber |
|-------------|-------------|-----------------|-----------|------------------|
| 10100       | S18_1749    | 30              | 136.00    | 3                |
| 10100       | S18_2248    | 50              | 55.09     | 2                |
| 10100       | S18_4409    | 22              | 75.46     | 4                |
| 10100       | S24_3969    | 49              | 35.29     | 1                |
| 10101       | S18_2325    | 25              | 108.06    | 4                |
| 10101       | S18_2795    | 26              | 167.06    | 1                |
| 10101       | S24_1937    | 45              | 32.53     | 3                |
| 10101       | S24_2022    | 46              | 44.35     | 2                |
| 10102       | S18_1342    | 39              | 95.55     | 2                |
| 10102       | S18_1367    | 41              | 43.13     | 1                |

</details>
