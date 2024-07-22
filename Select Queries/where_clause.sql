/*
SQL WHERE Clause Tutorial

The WHERE clause is used to filter records. It's used to extract only those records that fulfill a specified condition.

Basic Syntax:
SELECT column1, column2, ...
FROM table_name
WHERE condition;

The condition must be a logical expression that evaluates to true or false.

Let's look at some examples using the database schema you provided.

*/
--------------------------------- EXAMPLES ---------------------------------------
-- Example 1: Filter tracks by a specific genre (e.g., GenreId = 1)
SELECT Name, Composer, UnitPrice
FROM tracks
WHERE GenreId = 1;

-- Example 2: Find customers from a specific country
SELECT FirstName, LastName, Country
FROM customers
WHERE Country = 'USA';

-- Example 3: Get invoices with a total amount greater than $10
SELECT InvoiceId, CustomerId, Total
FROM invoices
WHERE Total > 10

-- Example 4: Filter tracks by price or duration
SELECT Name, UnitPrice, Milliseconds
FROM tracks
WHERE UnitPrice > 2.00 OR Milliseconds > 300000

-- Example 5: Get invoices with a total amount greater than $5 AND billed in a specific city
SELECT InvoiceId, BillingCity, Total
FROM invoices
WHERE Total > 4.00 AND BillingCity = 'London';

---------------------------------- SCENARIOS ---------------------------------------
-- Date functions like (strftime) and (date) in SQLite are used to manipulate and format date values.
-- Scenario 1: Get the details of invoices made in 2023.
SELECT InvoiceId, InvoiceDate, Total
FROM invoices
WHERE strftime('%Y', InvoiceDate) = '2013';

-- Pattern matching (LIKE), 
-- Scenario 2: Find all albums with titles containing the word "Greatest".
SELECT Title, AlbumId
FROM albums
WHERE Title LIKE '%Greatest%';

-- Scenario 3: Retrieve invoices with billing addresses in "Stockholm".
SELECT InvoiceId, BillingAddress, BillingCity, BillingState
FROM invoices
WHERE BillingCity = 'Stockholm';

-- Scenario 4: List all customers living in either Canada or Sweden
SELECT FirstName, LastName, Country
FROM customers
WHERE Country = 'Canada' OR Country = 'Sweden';

-- Scenario 5: Get the details of invoices made in 2013 for amounts less than $10
SELECT InvoiceId, InvoiceDate, Total
FROM invoices
WHERE strftime('%Y', InvoiceDate) = '2013' AND Total < 10.00

-- Scenario 6: Show employees who work in either 'Calgary' or 'Lethbridge' and have the title 'IT Manager'
SELECT FirstName, LastName, Title, City
from employees
WHERE (City = 'Calgary' OR City = 'Lethbridge') AND Title = 'IT Manager';

-- Scenario 7: Retrieve albums with titles containing the word "Love" or "Heart"
SELECT Title, AlbumId
FROM albums
WHERE Title LIKE '%Love%' OR Title LIKE '%Heart%';