/*
What is an Index?
An index in SQL is a database object that improves the speed of data retrieval operations on a table at the cost of additional storage
space and some maintenance overhead. Indexes work similarly to an index in a book, allowing the database engine to find data quickly
without scanning the entire table.

How to Use Indexes? What Do They Solve?
Indexes are used to speed up the retrieval of rows by using a pointer. They solve performance issues related to slow query execution, 
especially when dealing with large datasets. By creating an index on one or more columns, the database can quickly locate the data without 
performing a full table scan.

When to Use Indexes?
    1. Frequent Searches: Use indexes on columns that are frequently searched or queried.
    2. Join Operations: Indexes can significantly speed up join operations.
    3. Order By and Group By: Indexes are beneficial for columns involved in ORDER BY and GROUP BY clauses.
    4. Primary Keys: Automatically indexed to enforce uniqueness.
However, indexes should be used judiciously, as they come with some trade-offs:
    1. Insert/Update/Delete Performance: Indexes slow down these operations because the index must also be updated.
    2. Storage: Indexes consume additional disk space.

Basic syntax of creating an INDEX
    CREATE INDEX index_name
    ON table_name (column1, column2, ...);
*/
-- Example 1: A music streaming service has a large database of customers. 
-- Administrators frequently search for customers by their last names. The performance of these search queries is currently slow.

-- The Query WITHOUT INDEX
SELECT *
FROM customers
WHERE LastName = 'Smith';
/*
Without an index, the database must perform a full table scan to find all rows where LastName is 'Smith'. 
This can be very slow, especially if the customers table has a large number of rows.
*/

-- The Query WITH INDEX
CREATE INDEX idx_customers_lastname 
ON customers (LastName)

\d customers