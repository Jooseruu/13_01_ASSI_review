

Query 1: Get the name and price of all menu items with a price greater than $10.


SELECT item_name, price
FROM Menu
WHERE price > 10;


Relational Algebra 1:

π item_name, price (σ price > 10 (Menu))


Query 2: Get the names of customers who have placed at least one order with a total amount greater than $50.


SELECT DISTINCT customer_name
FROM Orders
WHERE total_amount > 50;


Relational Algebra 2:

π customer_name (σ total_amount > 50 (Orders))


Query 3: Get the name and salary of employees whose salary is higher than the average salary of all employees.


SELECT employee_name, salary
FROM Employees
WHERE salary > (SELECT AVG(salary) FROM Employees);


Relational Algebra 3:

π employee_name, salary (σ salary > (ρ AVG(salary) (Employees)) (Employees))


Query 4: Get the customer name and menu item name for all orders placed by a customer with the name "Fabicon".


SELECT C.customer_name, M.item_name
FROM Customers C
JOIN Orders O ON C.customer_id = O.customer_id
JOIN OrderItems OI ON O.order_id = OI.order_id
JOIN Menu M ON OI.item_id = M.item_id
WHERE C.customer_name = 'Fabicon';


Relational Algebra 4:

π C.customer_name, M.item_name ((Customers ⨝ (customer_id = customer_id) Orders) ⨝ (order_id = order_id) OrderItems) ⨝ (item_id = item_id) Menu)


