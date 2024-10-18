--Explanation:

--This view joins the SalesOrderHeader, SalesOrderDetail, and Customer tables.
--It provides a detailed view of each order, including the customer's name and the specific products ordered with their quantities and prices.

CREATE VIEW OrderDetailsWithCustomer AS
SELECT 
    soh.SalesOrderID,
    soh.OrderDate,
    soh.TotalDue,
    c.FirstName,
    c.LastName,
    sod.ProductID,
    sod.OrderQty,
    sod.UnitPrice,
    sod.LineTotal
FROM 
    SalesLT.SalesOrderHeader soh
JOIN 
    SalesLT.SalesOrderDetail sod ON soh.SalesOrderID = sod.SalesOrderID
JOIN 
    SalesLT.Customer c ON soh.CustomerID = c.CustomerID;
GO
