/*
What is GROUP BY?
The GROUP BY clause is used in SQL to group rows that have the same values in specified columns into aggregated data. 
This is useful for summarizing data, such as calculating sums, averages, counts, or other aggregate measures for each group of rows.

Important Notes about GROUP BY:
    1. Grouping Columns: You can group by one or more columns. Each unique combination of values in the grouping columns forms a group.

    2. Aggregate Functions: The GROUP BY clause is often used with aggregate functions (like COUNT(), SUM(), AVG(), MIN(), MAX()) to perform calculations on each group.

    3. HAVING Clause: The HAVING clause is used to filter groups based on aggregate calculations. It is similar to the WHERE clause but applies to groups rather than individual rows.
    
    4. Order of Execution: The GROUP BY clause comes after the WHERE clause and before the ORDER BY clause in the SQL statement.

    5. Null Values: Rows with NULL values in the grouping columns are considered a group.

Basic Syntax of GROUP BY:
-- Basic syntax for GROUP BY
SELECT column1, column2, AGGREGATE_FUNCTION(column3)
FROM table_name
WHERE condition
GROUP BY column1, column2
ORDER BY column1, column2;
*/
---------------------------------------------------------- EXAMPLES ---------------------------------------------
-- Example 1: Count the number of tracks per genre
SELECT GenreId, COUNT(*) AS NumberOfTracks
FROM tracks
GROUP BY GenreId
ORDER BY NumberOfTracks ASC;

-- Example 2: Calculate the total revenue for each customer
SELECT CustomerId, SUM(Total) AS TotalRevenue
FROM invoices
GROUP BY CustomerId
ORDER BY TotalRevenue DESC;

-- Example 3: Find the average track length for each album
SELECT AlbumID, AVG(Milliseconds) AS AverageTrackLength
FROM tracks
GROUP BY AlbumId
ORDER BY AverageTrackLength DESC;

-- Example 4: Determine the minimum and maximum track price for each media type
SELECT MediaTypeId, MIN(UnitPrice) AS MinimumPrice, MAX(UnitPrice) AS MaximumPrice
FROM tracks
GROUP BY MediaTypeID

-- Example 5: Get the total number of invoices and average invoice total per billing city
SELECT BillingCity, COUNT(*) AS NumberOfInvoices, AVG(Total) AS AverageInvoiceTotal
FROM invoices
GROUP BY BillingCity
ORDER BY NumberOfInvoices DESC;

-- Example 6: Find the number of employees per country
SELECT Country, COUNT(*) AS NumberOfEmployees
FROM employees
GROUP BY Country

--------------------------------------------------------- SCENARIOS ------------------------------------------------

-- Scenario 1: Longest track per album
-- Identifying longest track in terms of duration for each album.
SELECT AlbumId, MAX(Milliseconds) AS LongestTrack
FROM tracks
GROUP BY AlbumId

-- Scenario 2: Get statistics for customer invoices, including total invoices, average invoice total, and maximum invoice total.
SELECT CustomerId, COUNT(*) AS TotalInvoices, AVG(Total) AS AverageInvoiceTotal, MAX(Total) AS MaxInvoiceTotal
FROM invoices
GROUP BY CustomerId
ORDER BY TotalInvoices DESC;

-- Scenario 3: Find the number of tracks in each album.
SELECT AlbumId, COUNT(*) AS NumberOfTracks
FROM tracks
GROUP BY AlbumId
ORDER BY NumberOfTracks DESC;

-- Scenario 4: Calculate the total invoice amounts for each month.
SELECT strftime('%Y-%m', InvoiceDate) AS Month, SUM(Total) AS MonthlyTotal
FROM invoices
GROUP BY Month
ORDER BY Month DESC;

-- Scenario 5: Determine how frequently each customer makes a purchase, measured by the number of invoices.
SELECT CustomerId, COUNT(*) AS PurchaseFrequency
FROM invoices
GROUP BY CustomerId
ORDER BY PurchaseFrequency ASC;

-- Scenario 6: Identify the longest and shortest track duration for each genre.
SELECT GenreId, MAX(Milliseconds) AS MaximumDuration, MIN(Milliseconds) AS MinimumDuration
FROM tracks
GROUP BY GenreId
ORDER BY GenreId;