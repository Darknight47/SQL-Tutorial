/*
What is the Update Clause?
    The UPDATE clause is used to modify existing records in a table. It allows you to change the values of one or more columns in one or more rows. 
    This is particularly useful when data in your database needs to be corrected, adjusted, or updated due to changes in business logic or user requirements.

When to Use the Update Clause?
You should use the UPDATE clause when:
    1. You need to correct inaccurate or outdated data.
    2. You want to adjust values due to changes in business processes.
    3. You need to populate new data fields added to an existing table.

Basic Syntax Of UPDATE Clause:
    UPDATE table_name
    SET column1 = value1, column2 = value2, ...
    WHERE condition;
*/
-- Example 1: Suppose you want to update the name of a genre from 'Rock' to 'Rock and Roll'.
UPDATE genres
SET Name = 'Rock and Roll'
WHERE Name = 'Rock';

-- Checking if the nams has successfully updated.
SELECT Name
FROM genres

-- Example 2: You realized that the media type 'MPEG audio file' was misspelled and needs to be corrected to 'MPEG(UPDATED) audio file'.
UPDATE media_types
SET Name = 'MPEG(UPDATED) audio file'
WHERE Name = 'MPEG audio file'

-- Checking if the name has successfully updated.
SELECT Name
FROM media_types

-- Example 3: You need to update the title of an album for the artist with ArtistId 1.
UPDATE albums
SET Title = 'Big Ones (UPDATED)'
WHERE ArtistId = '3'

-- Checking if the name has successfully updated.
SELECT Title
FROM albums
WHERE ArtistId = '3'

-- Example 4: Updating an email address
UPDATE customers
SET Email = 'stevensvictor@yahoo.com'
WHERE CustomerId = '25'

-- Checking if the name has successfully updated.
SELECT CustomerId, FirstName, LastName, Email
FROM customers
WHERE CustomerId = '25'

----------------------------------------------------- SCENARIOS ------------------------------------------
-- Scenario 1: Imagine you need to increase the price of all tracks in the 'Rock and Roll' genre by $0.50.
-- Price Adjustment for a Track
UPDATE tracks
SET UnitPrice = UnitPrice + 0.50
WHERE GenreId = (
    SELECT GenreId
    FROM genres
    WHERE Name = 'Rock and Roll'
)

-- Checking the prices has successfully raised
SELECT TrackId, Name, UnitPrice
FROM tracks
WHERE GenreId = (
    SELECT GenreId
    FROM genres
    WHERE Name = 'Rock and Roll'
)

-- Scenario 2: A customer has moved to a new city. Update the city and state for the customer with CustomerId 5.
-- Updating Customer Information
UPDATE customers
SET City = 'NYC', STATE = 'NYC'
WHERE CustomerId = '5';

-- Checking if the City and STATE has successfully updated
SELECT FirstName, LastName, City, State
FROM customers
WHERE CustomerId = '5'


-- Scenario 3: An employee has been promoted to a new title. Change the title of the employee with EmployeeId 3 to 'Senior Sales Support Agent'.
-- Employee Promotio
UPDATE employees
SET Title = 'Senior Sales Support Agent'
WHERE EmployeeId = '3'

-- Checking if the title has successfully updated.
SELECT FirstName, LastName, Title
FROM employees
WHERE EmployeeId = '3'

-- Scenario 4: An error was found in an invoice. Update the Total amount for InvoiceId 101.
--  Correcting Invoice Details
UPDATE invoices
SET Total = 6.94
WHERE InvoiceId = '101'

-- Checking if the total amount for InvoiceId 101 has successfully changed.
SELECT Total
FROM invoices
WHERE InvoiceId = '101'