SELECT   c.customerid,
         c.firstname,
         c.lastname,
         CONCAT(c.firstname,' ',c.LastName) AS customername,
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




SELECT   i.customerid,
         c.firstname,
         c.LastName,
         CONCAT(c.firstname, ' ', c.lastname) AS CustomerName,
         SUM(i.Total) AS Invoicetotal,
         COUNT(*) AS NumberofInvoices
FROM     Invoice AS i
         INNER JOIN
         Customer AS C
         ON i.CustomerId = c.CustomerId
GROUP BY i.CustomerId, c.firstname, c.LastName, CONCAT(c.firstname, ' ', c.lastname)
ORDER BY i.CustomerId;

--Alternative way to Group By
SELECT ibc.customerid,
       CONCAT(c.firstname, ' ', c.lastname) AS CustomerName,
       CONCAT(e.firstname, ' ', e.lastname) AS EmployeeName,
       ibc.InvoiceTotal,
       ibc.NumberOfInvoices
FROM   (SELECT   i.CustomerId,
                 SUM(i.Total) AS InvoiceTotal,
                 COUNT(*) AS NumberOfInvoices
        FROM     Invoice AS i
        GROUP BY i.CustomerId) AS ibc
       INNER JOIN
       Customer AS c
       ON ibc.Customerid = c.customerid
       INNER JOIN
       Employee AS e
       ON e.employeeid = c.supportrepid;


-- customers and employees
SELECT e.EmployeeId,
 --      e.FirstName,
  --     e.LastName,
       CONCAT(e.firstname,' ',e.lastname) AS EmployeeName,
       CONCAT(c.firstname,' ',c.lastname) AS CustomerName
FROM   Employee AS e JOIN Customer c on e.employeeid = c.supportrepid;
