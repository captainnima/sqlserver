CREATE VIEW HighVolumeProducts AS
SELECT 
    p.ProductID,
    p.Name AS ProductName,
    SUM(sod.OrderQty) AS TotalQuantitySold,
    SUM(sod.LineTotal) AS TotalSalesAmount
FROM 
    SalesLT.Product p
JOIN 
    SalesLT.SalesOrderDetail sod ON p.ProductID = sod.ProductID
GROUP BY 
    p.ProductID, p.Name
HAVING 
    SUM(sod.OrderQty) > 100  -- Threshold for high-volume products
ORDER BY 
    SUM(sod.OrderQty) DESC;
GO
