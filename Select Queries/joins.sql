/*
What is a JOIN?
In SQL, a JOIN clause is used to combine rows from two or more tables based on a related column between them. 
Joins allow you to retrieve data from multiple tables in a single query, enabling complex queries and comprehensive data analysis.

Types of JOINs
    1. INNER JOIN: Returns only the rows that have matching values in both tables.

    2. LEFT JOIN (or LEFT OUTER JOIN): Returns all rows from the left table and the matched rows from the right table. 
    If no match, NULL values are returned for columns from the right table.

    3. RIGHT JOIN (or RIGHT OUTER JOIN): Returns all rows from the right table and the matched rows from the left table. 
    If no match, NULL values are returned for columns from the left table.

    4. FULL JOIN (or FULL OUTER JOIN): Returns rows when there is a match in one of the tables. 
    If there is no match, NULL values are returned for columns from the table without a match.

    5. CROSS JOIN: Returns the Cartesian product of the two tables, i.e., all possible combinations of rows.

    6. SELF JOIN: A regular join, but the table is joined with itself.

When to Use JOINs?
    1. Combining Data: When you need to combine data from multiple tables to get a complete dataset.

    2. Relational Data: When working with relational databases where data is normalized into different tables.

    3. Complex Queries: When performing complex queries that require data from different tables.

Basic Syntax of JOINs:
    -- Basic syntax for INNER JOIN
    SELECT table1.column1, table2.column2
    FROM table1
    INNER JOIN table2 ON table1.common_column = table2.common_column;

    -- Basic syntax for LEFT JOIN
    SELECT table1.column1, table2.column2
    FROM table1
    LEFT JOIN table2 ON table1.common_column = table2.common_column;

    -- Basic syntax for RIGHT JOIN
    SELECT table1.column1, table2.column2
    FROM table1
    RIGHT JOIN table2 ON table1.common_column = table2.common_column;

    -- Basic syntax for FULL JOIN
    SELECT table1.column1, table2.column2
    FROM table1
    FULL JOIN table2 ON table1.common_column = table2.common_column;
*/
-- Example 1: List All Tracks with Their Album Titles
SELECT tracks.TrackId, tracks.Name AS TrackName, albums.Title AS AlbumTitle
FROM tracks
INNER JOIN albums ON tracks.AlbumId = albums.AlbumId
-- This join combines the tracks table with the albums table where the AlbumId matches.
-- INNER JOIN: Returns only the rows that have matching values in both tables.
ORDER BY tracks.TrackId

-- Example 2: Find customers with their invoice totals
SELECT customers.CustomerId, customers.FirstName, customers.LastName, SUM(invoices.Total) AS TotalSpent
FROM customers
INNER JOIN invoices ON customers.CustomerId = invoices.CustomerId
-- INNER JOIN: Returns only the rows that have matching values in both tables.
GROUP BY customers.CustomerId
HAVING TotalSpent > 10
ORDER BY TotalSpent DESC;

-- Example 3: List employees with their assigned customers
SELECT employees.EmployeeId, employees.FirstName AS EmpName, employees.LastName AS EmpLastName, customers.FirstName AS CustName, customers.LastName AS CustLastName
FROM employees
LEFT JOIN customers ON employees.EmployeeId = customers.SupportRepId
-- Returns all rows from the left table and the matched rows from the right table. 
ORDER BY employees.EmployeeId

-- Example 4: List all playlists with the number of tracks
SELECT playlists.PlaylistId, playlists.Name AS PlayListName, COUNT(playlist_track.TrackId) AS NumberOfTracks
FROM playlists
LEFT JOIN playlist_track ON playlists.PlaylistId = playlist_track.PlaylistId
-- Returns all rows from the left table and the matched rows from the right table. 
GROUP BY playlists.PlaylistId
ORDER BY NumberOfTracks DESC;

----------------------------------------------- SCENARIOS -----------------------------------------
-- Scenario 1: Detailed Customer Invoices
-- Generate a detailed report of invoices including customer names and invoice totals.
SELECT customers.CustomerId, customers.FirstName, customers.LastName, invoices.InvoiceId, invoices.Total
FROM customers
INNER JOIN invoices ON customers.CustomerId = invoices.CustomerId
ORDER BY customers.CustomerId, invoices.InvoiceId;

-- Scenario 2: Employee Sales Performance
--  List employees along with the total sales they have managed.
SELECT employees.EmployeeId, employees.FirstName, employees.LastName, SUM(invoices.Total) as TotalSales
FROM employees
LEFT JOIN customers ON employees.EmployeeId = customers.SupportRepId
LEFT JOIN invoices ON customers.CustomerId = invoices.CustomerId
GROUP BY employees.EmployeeId
HAVING TotalSales > 500

-- Scenario 3: Popular Albums by genres
-- Identify the most popular albums within each genre based on the number of tracks.
SELECT genres.Name AS GenreName, albums.Title AS AlbumTitle, COUNT(tracks.TrackId) AS NumberOfTracks
FROM genres
INNER JOIN tracks ON genres.GenreId = tracks.TrackId
INNER JOIN albums ON tracks.AlbumId = albums.AlbumId
GROUP BY genres.Name, albums.Title

-- Scenario 4: Customer Purchases By City
-- Generate a report of total customer purchases grouped by city.
SELECT customers.City, SUM(invoices.Total) AS TotalPurchases
FROM customers
INNER JOIN invoices ON customers.CustomerId = invoices.CustomerId
GROUP BY customers.City
ORDER BY TotalPurchases DESC;

-- Scenario 5: Retrieving all playlists and their tracks
SELECT playlists.PlaylistId, playlists.Name AS PlayListName, tracks.TrackId, tracks.Name AS TrackName
FROM playlists
LEFT JOIN playlist_track ON playlists.PlaylistId = playlist_track.PlaylistId
LEFT JOIN tracks ON playlist_track.TrackId = tracks.TrackId