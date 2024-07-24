/*
What is a View?
A view in SQL is essentially a virtual table. Unlike a regular table, a view does not store data itself. Instead, it provides a way to look at data stored in other tables. 
It is defined by a SQL query that selects data from one or more tables, creating a new perspective of the data without altering the actual tables.

When to Use Views?
    1. Simplify Complex Queries: They can encapsulate complex joins and aggregations, providing a simpler interface for querying.
    2. Security: By restricting access to certain columns or rows, views can provide a layer of security.
    3. Data Abstraction: They allow developers to present a consistent interface even if the underlying database schema changes.
    4. Reusability: Commonly used queries can be saved as views, promoting code reuse and consistency.

Basic Syntax of a View
    CREATE VIEW view_name AS
    SELECT column1, column2, ...
    FROM table_name
    WHERE condition;
*/
-- Example 1: View of All Tracks with Genre Names
CREATE VIEW AllTracksWithGenres AS
SELECT tracks.TrackId, tracks.Name AS TrackName, genres.Name AS GenreName
FROM tracks
JOIN genres ON tracks.GenreId = genres.GenreId;
-- Usage of the AllTracksWithGenres
SELECT * 
FROM AllTracksWithGenres

-- Example 2: Find the total duration of tracks for each genre, but only for genres with a total duration greater than 1,000,000 milliseconds.
CREATE VIEW TrackDetails AS
SELECT tracks.TrackId, tracks.Name AS TrackName,  tracks.Milliseconds, genres.Name AS GenreName
FROM tracks
JOIN genres ON tracks.GenreId = genres.GenreId;
-- Usage of the TrackDetails
SELECT GenreName, SUM(Milliseconds) AS TotalDuration
FROM TrackDetails
GROUP BY GenreName
HAVING TotalDuration > 1000000
ORDER BY TotalDuration DESC;

-- Example 3: Retrieve detailed information about invoices for a specific month, including the number of items sold per invoice.
CREATE VIEW CustomerInvoices AS
SELECT invoices.InvoiceId, customers.FirstName, customers.LastName, invoices.InvoiceDate, invoices.Total
FROM invoices
JOIN customers ON invoices.CustomerId = customers.CustomerId
-- Usage of the CustomerInvoices
SELECT ci.InvoiceId, ci.FirstName, ci.LastName, ci.InvoiceDate, ci.Total, COUNT(ii.InvoiceLineId) AS ItemSold
FROM CustomerInvoices ci
JOIN invoice_items ii ON ci.InvoiceId = ii.InvoiceId
WHERE ci.InvoiceDate BETWEEN '2009-01-01' AND '2010-01-01'
GROUP BY ci.InvoiceId, ci.FirstName, ci.LastName, ci.InvoiceDate, ci.Total
ORDER BY ci.InvoiceDate DESC;

-- Example 4: View of Playlist Details with Track Names
CREATE VIEW PlaylistDetails AS
SELECT playlists.PlaylistId, playlists.Name AS PlaylistName, tracks.Name AS TrackName
FROM playlist_track
JOIN playlists ON playlist_track.PlaylistId = playlists.PlaylistId
JOIN tracks ON playlist_track.TrackId = tracks.TrackId
-- Usage of the PlaylistDetails VIEW
SELECT *
FROM PlaylistDetails