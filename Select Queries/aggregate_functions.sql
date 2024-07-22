/*
What are Aggregate Functions?
Aggregate functions perform a calculation on a set of values and return a single value. 
They are often used with the GROUP BY clause to perform operations on subsets of data, but they can also be used 
without GROUP BY to perform calculations on entire tables.

Important Notes about Aggregate Functions
1. Common Aggregate Functions:
    1. COUNT(): Returns the number of rows.
    2. SUM(): Returns the sum of a numeric column.
    3. AVG(): Returns the average value of a numeric column.
    4. MIN(): Returns the smallest value of a column.
    5. MAX(): Returns the largest value of a column.
2. NULL Values: Aggregate functions typically ignore NULL values except for COUNT(*), which counts all rows including those with NULL values.
3. Usage with GROUP BY: When used with GROUP BY, aggregate functions perform their operations on each subset of data defined by the grouping columns.

Basic syntax of Aggregate Functions:
-- Basic syntax for COUNT
SELECT COUNT(column_name)
FROM table_name;

-- Basic syntax for SUM
SELECT SUM(column_name)
FROM table_name;

-- Basic syntax for AVG
SELECT AVG(column_name)
FROM table_name;

-- Basic syntax for MIN
SELECT MIN(column_name)
FROM table_name;

-- Basic syntax for MAX
SELECT MAX(column_name)
FROM table_name;
*/
--------------------------------------------------- EXAMPLES -------------------------------------
-- Example 1: Count the number of tracks in the database
-- The AS command is used to rename a column or table with an alias. An alias only exists for the duration of the query.
SELECT COUNT(*) AS NumberOfTracks
FROM tracks;

-- Example 2: Calculate the total revenue from invoices
-- The AS command is used to rename a column or table with an alias. An alias only exists for the duration of the query.
SELECT SUM(Total) AS TotalRevenue
FROM invoices;

-- Example 3: Find the average track length in milliseconds
-- The AS command is used to rename a column or table with an alias. An alias only exists for the duration of the query.
SELECT AVG(Milliseconds) AS AverageTrackLength
FROM tracks;

-- Example 4: Determine the minimum and maximum track price
-- The AS command is used to rename a column or table with an alias. An alias only exists for the duration of the query.
SELECT MIN(UnitPrice) AS MinimumPrice, MAX(UnitPrice) AS MaximumPrice
FROM tracks;
