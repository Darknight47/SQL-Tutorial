/*
What is the Delete Clause?
The DELETE clause is used to remove one or more records from a table. This is useful when you need to eliminate obsolete, incorrect, or irrelevant data from your database.

When to Use the Delete Clause?
    1. You need to remove records that are no longer needed.
    2. You want to delete data that was inserted incorrectly.
    3. You need to clean up duplicate records.
    4. You're implementing data purges or archival processes.

The Basic Syntax Of A 'DELETE' statement is:
    DELETE FROM table_name
    WHERE condition;
*/

-- Example 1: Suppose you want to delete the promotion with PromotionId '3' from the Promotion table.
DELETE FROM Promotions
WHERE PromotionId = '3';

-- Checking if the promotion with PromotionId '3' has successfully deleted.
SELECT *
FROM Promotions

-- Scenario 1: Delete all promotions that have DiscountPercentage '11'
DELETE FROM Promotions
WHERE DiscountPercentage = '11';

SELECT *
FROM Promotions;