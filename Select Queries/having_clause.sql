/*
What is HAVING Clause?
The HAVING clause is used in SQL to filter records that have been grouped by the GROUP BY clause. It is similar to the WHERE clause but is used to filter groups of rows rather than individual rows. 
This means you can apply conditions on aggregate functions, like SUM, COUNT, AVG, etc.

When to Use HAVING Clause?
    1. After GROUP BY: Use HAVING after GROUP BY to filter groups based on aggregate calculations.
    2. Filtering Aggregated Results: When you need to filter records after aggregation, such as finding groups with a certain count or sum.
    3. Complex Conditions: Use HAVING for complex conditions that involve aggregate functions which cannot be handled by the WHERE clause.

-- Basic syntax for HAVING clause
    SELECT column1, AGGREGATE_FUNCTION(column2)
    FROM table_name
    GROUP BY column1
    HAVING condition
    ORDER BY column1;
*/
---------------------------------------------------------------------- EXAMPLES --------------------------------------------------------------
-- Example 1: Find genres with more than 10 tracks
SELECT GenreId, COUNT(*) AS NumberOfTracks
FROM tracks
GROUP BY GenreId
HAVING NumberOfTracks > 10
ORDER BY NumberOfTracks DESC;

-- Example 2: Customers with Total Invoices Exceeding $40
SELECT CustomerId, SUM(Total) AS TotalSpent
FROM invoices
GROUP BY CustomerId
HAVING TotalSpent > 40
ORDER BY TotalSpent ASC;

-- Example 3: Albums with average track length exceeding 300000 milliseconds
SELECT AlbumId, AVG(Milliseconds) AS TrackLength
FROM tracks
GROUP BY AlbumId
HAVING TrackLength > 300000
ORDER BY TrackLength DESC;

-- Example 4: Media Types with Total Bytes Greater than 1 000 000 000
SELECT MediaTypeId, SUM(Bytes) AS TotalBytes
FROM tracks
GROUP BY MediaTypeId
HAVING TotalBytes > 1000000000

---------------------------------------------------------------- SCENARIOS ---------------------------------------------------
-- Scenario 1: Identifying Popular Playlists (Those that have more than 50 tracks)
SELECT PlaylistId, COUNT(*) AS NumberOfTracks
FROM playlist_track
GROUP BY PlaylistId
HAVING NumberOfTracks > 50
ORDER BY NumberOfTracks DESC;

-- Scenario 2: High-Spending Customers
SELECT CustomerId, SUM(Total) AS TotalSpent
FROM invoices
GROUP BY CustomerId
HAVING TotalSpent > 35
ORDER BY TotalSpent DESC;

-- Scenario 3: Artists with multiple albums (Those with 2 or more albums)
SELECT ArtistId, COUNT(*) NumberOfAlbums
FROM albums
GROUP BY ArtistId
HAVING NumberOfAlbums >= 2

-- Scenario 4: Recent Invoices from a specific Year
SELECT CustomerId, COUNT(*) AS NumberOfInvoices
FROM invoices
WHERE strftime('%Y', InvoiceDate) = '2010'
GROUP BY CustomerId
HAVING NumberOfInvoices > 2
