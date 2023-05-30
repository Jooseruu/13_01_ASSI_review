## Query 1

**SQL**: `SELECT * FROM Menu;`
**Relational Algebra**: `Menu`

This query selects all columns from the `Menu` table. In relational algebra, this is represented by simply writing the name of the table.

## Query 2

**SQL**: `SELECT item_name, price FROM Menu WHERE price < 10;`
**Relational Algebra**: `π item_name, price (σ price < 10 (Menu))`

This query selects the `item_name` and `price` columns from the `Menu` table where the `price` is less than 10. In relational algebra, this is represented using the projection operator `π` to select the desired columns and the selection operator `σ` to filter rows based on a condition.

## Query 3

**SQL**: `SELECT customer_name, order_date FROM Orders ORDER BY order_date DESC;`
**Relational Algebra**: `π customer_name, order_date (Orders) ⋈ order_date`

This query selects the `customer_name` and `order_date` columns from the `Orders` table and orders the results by the `order_date` column in descending order. In relational algebra, this is represented using the projection operator `π` to select the desired columns and the sorting operator `⋈` to sort rows based on a column.

## Query 4

**SQL**: `SELECT AVG(price) FROM Menu;`
**Relational Algebra**: `avg(price) (Menu)`

This query calculates the average value of the `price` column in the `Menu` table. In relational algebra, this is represented using the aggregate function `avg()` applied to the desired column.

## Query 5

**SQL**: `SELECT customer_name, COUNT(*) FROM Orders GROUP BY customer_name;`
**Relational Algebra**: `π customer_name, count(*) (Orders) ⋈ customer_name`

This query groups rows in the `Orders` table by the `customer_name` column and calculates the count of rows in each group. In relational algebra, this is represented using the projection operator `π` to select the desired columns and the grouping operator `⋈` to group rows based on a column.

## Query 6

**SQL**: `SELECT item_name FROM Menu WHERE item_id IN (SELECT item_id FROM OrderItems WHERE order_id = 1);`
**Relational Algebra**: `π item_name (σ item_id ∈ π item_id (σ order_id = 1 (OrderItems)) (Menu))`

This query selects the `item_name` column from the `Menu` table where the `item_id` is in a subquery that selects the `item_id` column from the `OrderItems` table where the `order_id` is 1. In relational algebra, this is represented using nested projection and selection operators to represent subqueries and set membership.
