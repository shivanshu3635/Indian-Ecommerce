--Total Sales Calculation--
SELECT 
    SUM(SalesAmount) AS TotalSales
FROM 
    Sales;

--Sales by Product Category-- 
SELECT 
    P.Category, 
    SUM(S.SalesAmount) AS TotalSales
FROM 
    Sales S
JOIN 
    Products P ON S.OrderID = P.OrderID
GROUP BY 
    P.Category
ORDER BY 
    TotalSales DESC;

--Monthly Sales Trend--
SELECT 
    FORMAT(OrderDate_Temp, 'yyyy-MM') AS Month,
    SUM(SalesAmount) AS MonthlySales
FROM 
    Customers c inner join Sales s on c.OrderID=s.OrderID
GROUP BY 
    FORMAT(OrderDate_Temp, 'yyyy-MM')
ORDER BY 
    Month;

--Customer Segmentation by State--
SELECT 
    C.State, 
    COUNT(DISTINCT C.CustomerName) AS NumberOfCustomers, 
    SUM(S.SalesAmount) AS TotalSales
FROM 
    Sales S
INNER JOIN 
    Customers C ON S.OrderID = C.OrderID
GROUP BY 
    C.State
ORDER BY 
    TotalSales DESC;

--Average Order Value (AOV)--
SELECT 
    AVG(SalesAmount) AS AverageOrderValue
FROM 
    Sales;

--Top 5 Customers by Sales--
SELECT top 5
    C.CustomerName, 
    SUM(S.SalesAmount) AS TotalSales
FROM 
    Sales S
INNER JOIN 
    Customers C ON S.OrderID = C.OrderID
GROUP BY 
    C.CustomerName
ORDER BY 
    TotalSales DESC;