/* 
The SELECT statement is used to select data from a database. The data returned is stored in a result table, called the result-set.

-- Baic Syntax of SELECT QUERY
-- SELECT columnName1, columnName2, ..., columnName(n)
-- FROM table_name

Here, column1, column2, ... are the field names of the table you want to select data from.
*/

-- Example 1: Select ALL columns from the 'customers' table
SELECT *
FROM customers;

-- Example 2: Select specific columns from the 'tracks' table
SELECT TrackId, Name, Composer, UnitPrice
FROM tracks;

-- Example 3: Select all albums with their titles:
SELECT AlbumId, Title
FROM albums;

-- Example 4: Select names of all artists:
SELECT Name
FROM artists;

-- Scenario 1: List all the names and prices of tracks
SELECT Name, UnitPrice
FROM tracks;

-- Scenario 2: Find all customers and display their first and last names
SELECT FirstName, LastName
FROM customers;

-- Scenario 3: Get the invoice dates from the invoices table
SELECT InvoiceDate
FROM invoices;

-- Scenario 4: Show all media types
SELECT Name
FROM media_types;