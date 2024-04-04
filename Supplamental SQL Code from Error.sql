SELECT
	c.Country, 
    SUM(f.TotalPrice) AS TotalSales, 
    COUNT(f.InvoiceNo) AS NumberOfInvoices
    
    
FROM
	(SELECT * FROM fact_sales ORDER BY InvoiceDate ASC LIMIT 1000) f 
JOIN 
	dim_customer c ON f.CustomerID = c.CustomerID
JOIN
	dim_product p ON f.StockCode = p.StockCode
GROUP BY
	c.Country
ORDER BY
	TotalSales DESC;