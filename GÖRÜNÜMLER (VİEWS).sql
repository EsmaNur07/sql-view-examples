USE AdventureWorks2019;
GO
CREATE VIEW vw_SalesPersonInfo AS
SELECT E.BusinessEntityID, P.FirstName, P.LastName, E.JobTitle
FROM HumanResources.Employee AS E
JOIN Person.Person AS P ON E.BusinessEntityID = P.BusinessEntityID;

SELECT * FROM vw_SalesPersonInfo;

USE AdventureWorks2019;
GO
CREATE VIEW vw_ProductPrices AS
SELECT ProductID, Name, ListPrice, StandardCost
FROM Production.Product;

SELECT * FROM vw_ProductPrices;

USE AdventureWorks2019;
GO
CREATE VIEW vw_CustomerOrders AS
SELECT C.CustomerID, SOH.SalesOrderID, SOH.OrderDate, SOH.TotalDue
FROM Sales.Customer AS C
JOIN Sales.SalesOrderHeader AS SOH ON C.CustomerID = SOH.CustomerID;

SELECT * FROM vw_CustomerOrders;

USE AdventureWorks2019;
GO
CREATE VIEW vw_ProductsInStock AS
SELECT ProductID, Name, SafetyStockLevel, ReorderPoint
FROM Production.Product
WHERE SafetyStockLevel > 0;

SELECT * FROM vw_ProductsInStock;

USE AdventureWorks2019;
GO
CREATE VIEW vw_EmployeeDepartment AS
SELECT P.FirstName, P.LastName, D.Name AS Department, S.Name AS Shift
FROM HumanResources.Employee AS E
JOIN Person.Person AS P ON E.BusinessEntityID = P.BusinessEntityID
JOIN HumanResources.EmployeeDepartmentHistory AS EDH ON E.BusinessEntityID = EDH.BusinessEntityID
JOIN HumanResources.Department AS D ON EDH.DepartmentID = D.DepartmentID
JOIN HumanResources.Shift AS S ON EDH.ShiftID = S.ShiftID
WHERE EDH.EndDate IS NULL;

SELECT * FROM vw_EmployeeDepartment;

USE AdventureWorks2019;
GO
CREATE VIEW vw_OrderDetails AS
SELECT SOD.SalesOrderID, P.Name AS ProductName, SOD.OrderQty, SOD.LineTotal
FROM Sales.SalesOrderDetail AS SOD
JOIN Production.Product AS P ON SOD.ProductID = P.ProductID;

SELECT * FROM vw_OrderDetails;

USE AdventureWorks2019;
GO
CREATE VIEW vw_ExpensiveProducts AS
SELECT ProductID, Name, ListPrice
FROM Production.Product
WHERE ListPrice > 1000;

SELECT * FROM vw_ExpensiveProducts;

USE AdventureWorks2019;
GO
CREATE VIEW vw_ShippedOrders AS
SELECT SOH.SalesOrderID, SOH.OrderDate, SH.Name AS ShippingMethod
FROM Sales.SalesOrderHeader AS SOH
JOIN Purchasing.ShipMethod AS SH ON SOH.ShipMethodID = SH.ShipMethodID;

SELECT * FROM vw_ShippedOrders;

USE AdventureWorks2019;
GO
CREATE VIEW vw_CustomersByCity AS
SELECT P.FirstName, P.LastName, A.City
FROM Person.Person AS P
JOIN Sales.Customer AS C ON P.BusinessEntityID = C.PersonID
JOIN Sales.SalesOrderHeader AS SOH ON C.CustomerID = SOH.CustomerID
JOIN Person.Address AS A ON SOH.BillToAddressID = A.AddressID;

SELECT * FROM vw_CustomersByCity;








USE AdventureWorks2019;
GO
CREATE VIEW vw_RecentOrders AS
SELECT SalesOrderID, OrderDate, TotalDue
FROM Sales.SalesOrderHeader
WHERE OrderDate >= DATEADD(DAY, -30, GETDATE());

SELECT * FROM vw_RecentOrders;