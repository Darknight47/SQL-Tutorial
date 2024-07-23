/*
What is a Subquery?
A subquery, also known as an inner query or nested query, is a query within another SQL query. 
The subquery is executed first, and its result is passed to the outer query. 
Subqueries can be used in SELECT, INSERT, UPDATE, and DELETE statements, and they can return individual values or a set of rows.

When to Use Subqueries
    1. Filtering Results: To filter results based on the results of another query.
    2. Complex Joins: When complex joins are difficult to manage or read.
    3. Aggregations: To perform aggregations and use the results in a higher-level query.
    4. Dynamic Values: When the value needed is not static and needs to be calculated on the fly.

Basic Syntax Of Subqueries
    SELECT column1, column2
    FROM table1
    WHERE column3 = (SELECT column FROM table2 WHERE condition);
*/
-- Example 1: Find all tracks that belong to the album with the title 'Greatest Hits'
-- Subquery in WHERE Clause
SELECT TrackId, Name
FROM tracks
-- The subquery is executed first, and its result is passed to the outer query.
WHERE AlbumId = (
    SELECT AlbumId
    FROM albums
    WHERE Title = 'Greatest Hits'
);


-- Example 2: List all employees and the number of customers they support.
-- Subquery in SELECT Clause
-- The Subquery calculates the number of customers each employee supports.
SELECT employees.EmployeeId, employees.FirstName, employees.LastName,
    (SELECT COUNT(*)
     FROM customers
     WHERE customers.SupportRepId = employees.EmployeeId
    ) AS CustomerCount
FROM employees


-- Example 3: Find the customers who have made purchases greater than the average total invoice amount.
-- Subquery with Aggregate Function
SELECT CustomerId, FirstName, LastName
FROM customers
WHERE CustomerId IN (
    SELECT CustomerId
    FROM invoices
    GROUP BY CustomerId
-- The subquery (SELECT AVG(Total) FROM invoices) calculates the average total of all invoices. 
-- The outer query selects customers whose total purchases are greater than this average.
    HAVING SUM(Total) > (
        SELECT AVG(Total)
        FROM invoices
    )
)

-- Example 4: Find the names of tracks that are the longest in their respective albums.
-- Correlated Subquery
SELECT Name
FROM tracks t1
WHERE Milliseconds = (
    SELECT MAX(Milliseconds)
    FROM tracks t2
    WHERE t1.AlbumId = t2.AlbumId
)


-- Scenario 1: Find the artists who have more tracks than the average number of tracks per artist.
SELECT ArtistId, Name
FROM artists
WHERE ArtistId IN 
    (
        SELECT ArtistId
        FROM albums
        WHERE AlbumId IN 
        (
            SELECT AlbumId
            FROM tracks
            GROUP BY AlbumId
            HAVING COUNT(*) > 
                                (
                                    SELECT AVG(track_count)
                                    FROM(
                                            SELECT COUNT(*) AS track_count
                                            FROM tracks
                                            GROUP BY AlbumId
                                        ) AS avg_track_count 
                                )
        )
    );