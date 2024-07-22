/*
What is ORDER BY?
The ORDER BY clause is used in SQL to sort the result set of a query by one or more columns. 
It can sort the data in ascending (default) or descending order. This is particularly useful when you need to 
organize your results in a specific sequence, such as alphabetical order, chronological order, or by numerical value.

When to Use ORDER BY?
You use the ORDER BY clause when you need your query results sorted in a particular order. 
This is helpful for reports, ordered lists, dashboards, and anywhere you need data presented in a specific sequence.

-- Basic ORDER BY clause syntax
SELECT column1, column2, ...
FROM table_name
ORDER BY column1 [ASC|DESC], column2 [ASC|DESC], ...;

*/
------------------------------------------------- EXAMPLES ------------------------------------------------
-- Example 1: Sort tracks by name in ascending order
SELECT Name, Composer, UnitPrice
FROM tracks
ORDER BY Name ASC;

-- Example 2: Sort customers by country then by city
SELECT FirstName, LastName, Country, City
FROM customers
ORDER BY Country ASC, City ASC;

-- Example 3: Get invoices sorted by total amount in descending order
SELECT InvoiceId, CustomerId, Total
FROM invoices
ORDER BY Total DESC;

------------------------------------------------ SCENARIOS ---------------------------------------------------
-- Scenrio 1: List all tracks sorted by price in descending order
SELECT Name, UnitPrice
FROM tracks
ORDER BY UnitPrice ASC;

-- Scenario 2: Display customers sorted by last name in ascending order
SELECT FirstName, LastName, Email
FROM customers
ORDER BY LastName ASC;

-- Scenario 3: Get the top 5 most recent invoices
SELECT InvoiceId, InvoiceDate, Total
FROM invoices
ORDER BY InvoiceDate DESC
LIMIT 5;

-- Scenario 4: Retrieve employee details sorted by hire-date
SELECT FirstName, LastName, HireDate
FROM employees
ORDER BY HireDate DESC;