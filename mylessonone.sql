SELECT   c.customerid,
         c.firstname,
         c.lastname,
         c.city,
         c.company
FROM     Customer AS C
WHERE    c.company IS NOT NULL
--WHERE c.city IN ('London', 'Paris', 'Rome', 'Berlin')
--WHERE c.lastname NOT LIKE '%R'
ORDER BY c.company ASC;


SELECT
    c.country,
    COUNT(*) AS Numberofcustomers
FROM   Customer AS C
GROUP BY c.Country
ORDER BY Numberofcustomers DESC

-- Looking at Invoice

SELECT i.invoiceid,
       i.InvoiceDate,
       i.customerid,
       i.Total
FROM   Invoice AS i
ORDER BY i.CustomerId;

SELECT i.customerid,
       SUM(i.Total) AS Invoicetotal
FROM   Invoice AS i
GROUP BY i.CustomerId
ORDER BY i.CustomerId;