SELECT TOP 10 *
FROM OnlineRetail;


SELECT COUNT(*) AS TotalRows
FROM OnlineRetail;


SELECT COUNT(*) AS TotalColumns
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'OnlineRetail';




SELECT COLUMN_NAME,
       DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'OnlineRetail';



SELECT
SUM(CASE WHEN InvoiceNo IS NULL THEN 1 ELSE 0 END) AS InvoiceNoMissing,
SUM(CASE WHEN StockCode IS NULL THEN 1 ELSE 0 END) AS StockCodeMissing,
SUM(CASE WHEN Description IS NULL THEN 1 ELSE 0 END) AS DescriptionMissing,
SUM(CASE WHEN Quantity IS NULL THEN 1 ELSE 0 END) AS QuantityMissing,
SUM(CASE WHEN InvoiceDate IS NULL THEN 1 ELSE 0 END) AS InvoiceDateMissing,
SUM(CASE WHEN UnitPrice IS NULL THEN 1 ELSE 0 END) AS UnitPriceMissing,
SUM(CASE WHEN CustomerID IS NULL THEN 1 ELSE 0 END) AS CustomerIDMissing,
SUM(CASE WHEN Country IS NULL THEN 1 ELSE 0 END) AS CountryMissing
FROM OnlineRetail;


SELECT *
FROM OnlineRetail
WHERE Description = '';



UPDATE OnlineRetail
SET CustomerID = 'Unknown'
WHERE CustomerID IS NULL;


UPDATE OnlineRetail
SET Description = 'Unknown Product'
WHERE Description IS NULL;



SELECT InvoiceNo,
       StockCode,
       Description,
       COUNT(*) AS DuplicateCount
FROM OnlineRetail
GROUP BY InvoiceNo,
         StockCode,
         Description
HAVING COUNT(*) > 1;





WITH Duplicates AS
(
SELECT *,
ROW_NUMBER() OVER(
PARTITION BY InvoiceNo,
             StockCode,
             Description,
             Quantity,
             InvoiceDate,
             UnitPrice,
             CustomerID,
             Country
ORDER BY InvoiceNo
) AS rn
FROM OnlineRetail
)

SELECT COUNT(*) AS DuplicateRows
FROM Duplicates
WHERE rn > 1;




WITH Duplicates AS
(
SELECT *,
ROW_NUMBER() OVER(
PARTITION BY InvoiceNo,
             StockCode,
             Description,
             Quantity,
             InvoiceDate,
             UnitPrice,
             CustomerID,
             Country
ORDER BY InvoiceNo
) AS rn
FROM OnlineRetail
)

DELETE
FROM Duplicates
WHERE rn > 1;


UPDATE OnlineRetail
SET Description = LTRIM(RTRIM(Description));




UPDATE OnlineRetail
SET Description = UPPER(Description);




UPDATE OnlineRetail
SET Country = UPPER(Country);




SELECT *
FROM OnlineRetail
WHERE TRY_CAST(Quantity AS FLOAT) < 0;



SELECT *
FROM OnlineRetail
WHERE TRY_CAST(Quantity AS FLOAT) = 0;




SELECT *
FROM OnlineRetail
WHERE TRY_CAST(UnitPrice AS FLOAT) < 0;





SELECT *
FROM OnlineRetail
WHERE TRY_CAST(UnitPrice AS FLOAT) = 0;



SELECT
ROUND(SUM(
TRY_CAST(Quantity AS FLOAT) *
TRY_CAST(UnitPrice AS FLOAT)
),2) AS TotalRevenue
FROM OnlineRetail;



SELECT
AVG(TRY_CAST(Quantity AS FLOAT)) AS AvgQuantity,
AVG(TRY_CAST(UnitPrice AS FLOAT)) AS AvgPrice
FROM OnlineRetail;



SELECT
MIN(TRY_CAST(Quantity AS FLOAT)) AS MinQuantity,
MAX(TRY_CAST(Quantity AS FLOAT)) AS MaxQuantity,
MIN(TRY_CAST(UnitPrice AS FLOAT)) AS MinPrice,
MAX(TRY_CAST(UnitPrice AS FLOAT)) AS MaxPrice
FROM OnlineRetail;




SELECT
STDEV(TRY_CAST(Quantity AS FLOAT)) AS StdQuantity,
STDEV(TRY_CAST(UnitPrice AS FLOAT)) AS StdPrice
FROM OnlineRetail;


SELECT DISTINCT
PERCENTILE_CONT(0.5)
WITHIN GROUP (ORDER BY TRY_CAST(Quantity AS FLOAT))
OVER() AS MedianQuantity
FROM OnlineRetail;


SELECT TOP 10
Description,
SUM(TRY_CAST(Quantity AS FLOAT)) AS TotalSold
FROM OnlineRetail
GROUP BY Description
ORDER BY TotalSold DESC;



SELECT
Country,
ROUND(SUM(
TRY_CAST(Quantity AS FLOAT) *
TRY_CAST(UnitPrice AS FLOAT)
),2) AS Revenue
FROM OnlineRetail
GROUP BY Country
ORDER BY Revenue DESC;



SELECT
YEAR(InvoiceDate) AS SalesYear,
MONTH(InvoiceDate) AS SalesMonth,
ROUND(SUM(
TRY_CAST(Quantity AS FLOAT) *
TRY_CAST(UnitPrice AS FLOAT)
),2) AS Revenue
FROM OnlineRetail
GROUP BY YEAR(InvoiceDate),
         MONTH(InvoiceDate)
ORDER BY SalesYear,
         SalesMonth;





SELECT TOP 10
Description,
COUNT(*) AS PurchaseFrequency
FROM OnlineRetail
GROUP BY Description
ORDER BY PurchaseFrequency DESC;


SELECT TOP 10
CustomerID,
ROUND(SUM(
TRY_CAST(Quantity AS FLOAT) *
TRY_CAST(UnitPrice AS FLOAT)
),2) AS TotalSpent
FROM OnlineRetail
WHERE CustomerID IS NOT NULL
GROUP BY CustomerID
ORDER BY TotalSpent DESC;


SELECT TOP 10
Description,
ROUND(SUM(
TRY_CAST(Quantity AS FLOAT) *
TRY_CAST(UnitPrice AS FLOAT)
),2) AS Revenue
FROM OnlineRetail
GROUP BY Description
ORDER BY Revenue DESC;

