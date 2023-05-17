-- Create the "Restaurant" database if it doesn't exist
CREATE DATABASE IF NOT EXISTS Restaurant;

-- Switch to the "Restaurant" database
USE Restaurant;

-- Create the "Menu" table to store kebab items
CREATE TABLE IF NOT EXISTS Menu (
    item_id INT PRIMARY KEY,
    item_name VARCHAR(100) NOT NULL,
    description VARCHAR(255),
    price DECIMAL(8, 2) NOT NULL
);

-- Create the "Orders" table to store customer orders
CREATE TABLE IF NOT EXISTS Orders (
    order_id INT PRIMARY KEY,
    customer_name VARCHAR(100) NOT NULL,
    order_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    total_amount DECIMAL(8, 2) NOT NULL
);

-- Create the "OrderItems" table to associate menu items with orders
CREATE TABLE IF NOT EXISTS OrderItems (
    order_id INT,
    item_id INT,
    quantity INT,
    FOREIGN KEY (order_id) REFERENCES Orders(order_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    FOREIGN KEY (item_id) REFERENCES Menu(item_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    PRIMARY KEY (order_id, item_id)
);

-- Create the "Customers" table to store customer information
CREATE TABLE IF NOT EXISTS Customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100) NOT NULL,
    email VARCHAR(100),
    phone_number VARCHAR(20)
);

-- Create the "Reviews" table to store customer reviews
CREATE TABLE IF NOT EXISTS Reviews (
    review_id INT PRIMARY KEY,
    customer_id INT,
    rating INT,
    comment VARCHAR(255),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

-- Create the "Employees" table to store employee information
CREATE TABLE IF NOT EXISTS Employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(100) NOT NULL,
    position VARCHAR(100) NOT NULL,
    hire_date DATE NOT NULL,
    salary DECIMAL(10, 2) NOT NULL
);

-- Create indexes for faster data retrieval
CREATE INDEX idx_menu_item_name ON Menu(item_name);
CREATE INDEX idx_orders_customer_name ON Orders(customer_name);
CREATE INDEX idx_customers_email ON Customers(email);
CREATE INDEX idx_employees_employee_name ON Employees(employee_name);
