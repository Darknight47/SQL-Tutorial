/*
The INSERT statement in SQL is used to add new rows of data to a table in a database. This statement allows you to insert data into all columns of a table or into specific columns, depending on your needs.   
The INSERT statement adds new records to a table. You can insert data into a table in several ways:

1. Inserting data into all columns.

2. Inserting data into specific columns.

3. Inserting multiple rows at once.

4. Inserting data from another table.

### Basic Syntax Of 'INSERT INTO':
    INSERT INTO table_name (column1, column2, ...)
    VALUES (value1, value2, ...);

*/
-- An Empty Table
SELECT * 
FROM Promotions
/*
1. Inserting Data into All Columns:
If you are inserting data into all columns of a table, you can omit the column names, 
provided you supply a value for every column in the correct order:
*/

/*
Promotions Table Properties: 
    PromotionId (INTEGER), 
    Description (NVARCHAR(255)), 
    StartDate (DATETIME), 
    EndDate (DATETIME), 
    DiscountPercentage (NUMERIC(5,2))
*/
INSERT INTO Promotions
VALUES(1, 'First Promotion', '2024-01-02', '2025-01-02', 2)

-- Checking the Promotions table to see if we have successfully added values to the table.
SELECT * 
FROM Promotions

/*
2. Inserting Data into Specific Columns
The values for the fields that are NOT being chosen are NULL.
*/
INSERT INTO Promotions (PromotionId, Description, DiscountPercentage)
VALUES(2, 'Inserting Data into Specific Columns', 3);

-- Checking the Promotions table to see if we have successfully added values to the table.
SELECT * 
FROM Promotions;

/*
3. Inserting Multiple Rows
*/
INSERT INTO Promotions
VALUES 
(3, 'Inserting Multiple Rows1', '2024-01-02', '2025-01-02', 3),
(4, 'Inserting Multiple Rows2', '2024-01-02', '2025-01-02', 3),
(5, 'Inserting Multiple Rows3', '2024-01-02', '2025-01-02', 3);

-- Checking the Promotions table to see if we have successfully added values to the table.
SELECT * 
FROM Promotions;

/*
4. Inserting Data from Another Table
Adding into two specific columns of Promotions table from two specific columns of 'albums' table.
*/
INSERT INTO Promotions(Description, DiscountPercentage)
SELECT Title, ArtistId
FROM albums;

-- Checking the Promotions table to see if we have successfully added values to the table.
SELECT * 
FROM Promotions