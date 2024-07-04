# Mint-Classics-Database-Analysis-and-Optimization
This project aims to analyze and optimize the inventory management of Mint Classics Company by investigating the potential closure of one of its storage facilities. The project involves importing, understanding, and analyzing the Mint Classics relational database using MySQL Workbench. The analysis will lead to data-driven recommendations to improve business processes.

# Project Overview
Mint Classics Company is considering closing one of its storage facilities to streamline operations and reduce costs while maintaining timely customer service. This project involves a detailed examination of the company's database to provide insights and recommendations on inventory reorganization.

# Project Report
Under work.........




<details>
<summary> All Tables</summary>

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
