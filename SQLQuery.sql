USE WideWorldImporters
GO
CREATE PROC Primero(@Year INT)
AS
SELECT ws.StockItemID,ws.StockItemName,SUM(ol.Quantity) AS cantidad FROM Warehouse.StockItems ws
INNER JOIN  Sales.OrderLines  ol
ON ol.StockItemID=ws.StockItemID
INNER JOIN Sales.Orders  o
ON o.OrderID=ol.OrderID
WHERE YEAR(o.OrderDate)=@Year
GROUP BY ws.StockItemID, ws.StockItemName
ORDER BY ws.StockItemID DESC

EXEC  Primero 2013


CREATE PROC Segundo(@Year INT,@Mes INT)
as
SELECT TOP 3 ws.StockItemID,ws.StockItemName,SUM(ol.Quantity) AS cantidad FROM Warehouse.StockItems ws
INNER JOIN  Sales.OrderLines  ol
ON ol.StockItemID=ws.StockItemID
INNER JOIN Sales.Orders  o
ON o.OrderID=ol.OrderID
WHERE YEAR(o.OrderDate)=@Year AND MONTH(O.OrderDate)=@Mes
GROUP BY ws.StockItemID, ws.StockItemName
ORDER BY cantidad DESC

EXEC Segundo 2013,04

SELECT * FROM Sales.Orders AS o


SELECT * FROM Sales.OrderLines AS ol 
SELECT * FROM Warehouse.PackageTypes AS pt

SELECT TOP 3 pt.PackageTypeID,pt.PackageTypeName,SUM(ol.Quantity) AS Cantidad FROM Warehouse.PackageTypes AS pt
INNER JOIN Sales.OrderLines AS ol
ON ol.PackageTypeID=pt.PackageTypeID
GROUP BY pt.PackageTypeID, pt.PackageTypeName
ORDER BY cantidad DESC


CREATE PROC ProductsList
as
SELECT si.StockItemID,si.StockItemName FROM Warehouse.StockItems AS si
ORDER BY si.StockItemID desc