--Explanation:

--This view joins the Customer and SalesOrderHeader tables and groups the results by customer.
--It provides the total number of orders (TotalOrders) and the total value of those orders (TotalOrderValue).

CREATE VIEW CustomerOrderSummary AS
SELECT 
    c.CustomerID,
    c.FirstName,
    c.LastName,
    COUNT(soh.SalesOrderID) AS TotalOrders,
    SUM(soh.TotalDue) AS TotalOrderValue
FROM 
    SalesLT.Customer c
LEFT JOIN 
    SalesLT.SalesOrderHeader soh ON c.CustomerID = soh.CustomerID
GROUP BY 
    c.CustomerID, c.FirstName, c.LastName;
GO
