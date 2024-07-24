/*

The CREATE statement in SQL is used to create various database objects such as tables, indexes, views, and more.  
The most common use of CREATE is to create tables to store data. When you create a table, you define its structure, specifying the columns and their data types, as well as any constraints like primary keys, foreign keys, and unique constraints.

### Basic Syntax of 'CREATE TABLE'
    CREATE TABLE table_name (
        column1 datatype constraint,
        column2 datatype constraint,
        ...
    );

1. table_name: The name of the table you want to create.
2. column1, column2, ...: The names of the columns in the table.
3. datatype: The data type for each column (e.g., INTEGER, NVARCHAR, DATETIME).
4. constraint: Optional constraints on the columns (e.g., PRIMARY KEY, FOREIGN KEY, NOT NULL).
*/

-- Listing all the tables in the sample database.
SELECT name 
FROM sqlite_master
WHERE type = 'table';

/*
### New Tables To Our Sample Database:
#### Promotions
    1. **Properties**: PromotionId (INTEGER), Description (NVARCHAR(255)), StartDate (DATETIME), EndDate (DATETIME), DiscountPercentage (NUMERIC(5,2))
    2. **Connections**: No direct foreign key connections to existing tables.
*/
CREATE TABLE Promotions(
    PromotionId INTEGER PRIMARY KEY,
    Description NVARCHAR(255),
    StartDate DATETIME,
    EndDate DATETIME,
    DiscountPercentage NUMERIC(5,2)
)
-- Listing all the tables in the sample database.
SELECT name 
FROM sqlite_master
WHERE type = 'table';

/*
#### SalesRegions
    1. **Properties**: RegionId (INTEGER), RegionName (NVARCHAR(100))
    2. **Connections**: RegionId is connected to the RegionId in the “customers” table (we need to add RegionId to the customers table).
*/
CREATE TABLE sales_regions(
    RegionId INTEGER PRIMARY KEY,
    RegionName NVARCHAR(100)
);

-- ALTER 'customers' table to add RegionId
ALTER TABLE customers ADD RegionId INTEGER;

-- Create foreign key constraint for 'customers' table.
ALTER TABLE customers ADD CONSTRAINT fk_customers_RegionId
    FOREIGN KEY (RegionId) REFERENCES sales_regions(RegionId)

-- Listing all the tables in the sample database.
SELECT name 
FROM sqlite_master
WHERE type = 'table';
