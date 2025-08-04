-- 1. Top 10 Customers by Total Sales Amount
SELECT TOP (10)
    c.AccountNumber,
    p.FirstName + ' ' + p.LastName AS CustomerName,
    SUM(soh.TotalDue) AS TotalSales
FROM Sales.SalesOrderHeader AS soh
JOIN Sales.Customer AS c ON soh.CustomerID = c.CustomerID
JOIN Person.Person AS p ON c.PersonID = p.BusinessEntityID
WHERE soh.Status IN (5)  -- 5 = SalesOrderStatus "Shipped" (adjust if needed)
GROUP BY c.AccountNumber, p.FirstName, p.LastName
ORDER BY TotalSales DESC;

-- 2. Sales Amount by Year
SELECT
    YEAR(OrderDate) AS SalesYear,
    SUM(TotalDue) AS TotalSales
FROM Sales.SalesOrderHeader
WHERE OrderDate IS NOT NULL
GROUP BY YEAR(OrderDate)
ORDER BY SalesYear;

-- 3. Product Inventory Levels (current on-hand quantity)
SELECT 
    p.ProductID,
    p.Name,
    SUM(wod.Quantity) AS TotalOnHand
FROM Production.Product AS p
JOIN Production.ProductInventory AS wod ON p.ProductID = wod.ProductID
GROUP BY p.ProductID, p.Name
HAVING SUM(wod.Quantity) > 0
ORDER BY TotalOnHand DESC;

-- 4. Sales by Salesperson (including their territory)
SELECT 
    sp.BusinessEntityID,
    e.LoginID,
    t.Name AS Territory,
    SUM(soh.TotalDue) AS SalesAmount
FROM Sales.SalesOrderHeader AS soh
JOIN Sales.SalesPerson AS sp ON soh.SalesPersonID = sp.BusinessEntityID
JOIN Sales.SalesTerritory AS t ON sp.TerritoryID = t.TerritoryID
JOIN HumanResources.Employee AS e ON sp.BusinessEntityID = e.BusinessEntityID
WHERE soh.OrderDate >= '2013-01-01'  -- adjust date range as desired
GROUP BY sp.BusinessEntityID, e.LoginID, t.Name
ORDER BY SalesAmount DESC;

-- 5. Average Sales Order Amount by Customer
SELECT
    c.CustomerID,
    COUNT(soh.SalesOrderID) AS OrderCount,
    AVG(soh.TotalDue) AS AvgOrderAmount
FROM Sales.SalesOrderHeader AS soh
JOIN Sales.Customer AS c ON soh.CustomerID = c.CustomerID
GROUP BY c.CustomerID
HAVING COUNT(soh.SalesOrderID) > 1
ORDER BY AvgOrderAmount DESC;

-- 6. Products with the Highest List Price in Each Category
WITH RankedProducts AS (
    SELECT 
        p.ProductID,
        p.Name,
        p.ListPrice,
        pc.Name AS CategoryName,
        ROW_NUMBER() OVER (PARTITION BY pc.ProductCategoryID ORDER BY p.ListPrice DESC) AS rn
    FROM Production.Product AS p
    JOIN Production.ProductSubcategory AS psc ON p.ProductSubcategoryID = psc.ProductSubcategoryID
    JOIN Production.ProductCategory AS pc ON psc.ProductCategoryID = pc.ProductCategoryID
)
SELECT ProductID, Name, CategoryName, ListPrice
FROM RankedProducts
WHERE rn = 1;
