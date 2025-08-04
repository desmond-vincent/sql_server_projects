# SQL Practice & Projects

This repository is a place where I cultivate my SQL skills.  
I use **SQL Server Management Studio (SSMS)**, **SQL Server Reporting Services (SSRS)**, **SQL Server**, and other **data analysis frameworks** to explore, analyze, and visualize data.

## Purpose
The goal of this repository is to:
- Practice writing efficient and optimized SQL queries
- Explore database design and management techniques
- Build and test data reports using SSRS
- Work with real-world datasets like **AdventureWorks** and custom datasets
- Develop solutions that simulate real business intelligence scenarios

## Tools & Technologies
- Microsoft SQL Server – Database engine
- SSMS (SQL Server Management Studio) – Query development & database administration
- SSRS (SQL Server Reporting Services) – Report design & visualization
- T-SQL (Transact-SQL) – SQL query language for Microsoft SQL Server
- Other frameworks & tools for data analysis

## Repository Structure
```

/queries         # T-SQL scripts and practice queries
/reports         # SSRS report definitions and exports
/datasets        # Sample data or scripts to create them
/documentation   # Notes, tutorials, and SQL tips

````

## How to Use
1. Clone this repository:
   ```bash
   git clone https://github.com/your-username/sql-projects.git

2. Open `.sql` files in SSMS and execute against your SQL Server instance.
3. Explore `/reports` for example SSRS report definitions.
4. Modify queries or datasets for your own experiments.

## Getting AdventureWorks

To work with the **AdventureWorks** sample database:

1. Visit the official Microsoft SQL Server sample database page:
   [https://github.com/microsoft/sql-server-samples/releases/tag/adventureworks](https://github.com/microsoft/sql-server-samples/releases/tag/adventureworks)
2. Download the desired `.bak` file (for example, `AdventureWorks2019.bak`).
3. Open **SQL Server Management Studio (SSMS)** and connect to your server.
4. Restore the database:

   * Right-click **Databases** > **Restore Database...**
   * Select **Device**, browse to the downloaded `.bak` file, and restore it.
5. Once restored, you can run queries against `AdventureWorks`.

## Sample Datasets

* AdventureWorks (Microsoft sample database)
* Custom datasets for reporting & analysis

## Goals

* Build complex queries with multiple joins and subqueries
* Implement stored procedures, functions, and triggers
* Create parameterized and interactive SSRS reports
* Practice indexing and performance optimization
