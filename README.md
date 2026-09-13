# Mint Classics Database Analysis and Optimization

MySQL portfolio project for **Mint Classics**, a classic-car model retailer. The business is considering closing one warehouse to cut cost while still serving customers on time. This repo imports the company database, runs inventory SQL analyses, and documents recommendations in a PDF report.

## Business question

Which warehouse inventory can be reduced or relocated, and can Mint Classics close a storage facility without hurting service levels?

## What’s in the repo

| Path | Description |
|------|-------------|
| `mintclassicsDB.sql` | Full MySQL dump to recreate the `mintclassics` schema |
| `Queries/` | SQL scripts for capacity, stock status, over/understock, and recommended actions |
| `Spreadsheets/Original/` | Source CSV exports of core tables |
| `Spreadsheets/From Queries/` | Query result exports used in the write-up |
| `Report.pdf` | Final analysis report and recommendations |
| `Task-by-Task-Guide-Mint-Classics-Portfolio-Project.pdf` | Step-by-step project guide |

## Analysis themes (SQL)

Scripts under `Queries/` explore:

- Warehouse capacity and quantity on hand (warehouses A–D)  
- Product lines stored in each warehouse  
- Items never ordered  
- Overstocked / understocked / well-stocked products (using historical sales)  
- Suggested actions: **Reduce**, **Increase**, or **Maintain** inventory  

Example files: `Total capacity for warehouses.sql`, `Never ordered Items.sql`, `Overstocked A.sql` … `Overstocked D.sql`, `Understocked.sql`, `Reduce.sql`, `Increase.sql`, `Maintain.sql`, `Action.sql`, plus per-warehouse scripts such as `A warehouse.sql` / `A reduce.sql`.

## How to run

1. Install **MySQL** (8.x) and **MySQL Workbench**.  
2. Create/import the schema:

```bash
mysql -u root -p < mintclassicsDB.sql
```

3. Open Workbench, select the `mintclassics` database, and run scripts from `Queries/` (start with capacity / stock overview, then overstock and action queries).  
4. Compare your results with CSVs in `Spreadsheets/From Queries/`.  
5. Read `Report.pdf` for the narrative recommendation.

## Tech stack

MySQL 8, MySQL Workbench, SQL (including CTEs), spreadsheet exports for presentation

## Project report

- [Report.pdf](./Report.pdf)
