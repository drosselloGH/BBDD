/* MYSQL DELETE */
CREATE SCHEMA IF NOT EXISTS ejemploDeletes;
USE ejemploDeletes;

CREATE TABLE offices (
    officeCode VARCHAR(10) NOT NULL,
    city VARCHAR(50) NOT NULL,
    phone VARCHAR(50) NOT NULL,
    addressLine1 VARCHAR(50) NOT NULL,
    addressLine2 VARCHAR(50) DEFAULT NULL,
    state VARCHAR(50) DEFAULT NULL,
    country VARCHAR(50) NOT NULL,
    postalCode VARCHAR(15) NOT NULL,
    territory VARCHAR(10) NOT NULL,
    PRIMARY KEY (officeCode)
);

CREATE TABLE employees (
    employeeNumber INT NOT NULL,
    lastName VARCHAR(50) NOT NULL,
    firstName VARCHAR(50) NOT NULL,
    extension VARCHAR(10) NOT NULL,
    email VARCHAR(100) NOT NULL,
    officeCode VARCHAR(10) NOT NULL,
    reportsTo INT DEFAULT NULL,
    jobTitle VARCHAR(50) NOT NULL,
    PRIMARY KEY (employeeNumber),
    KEY reportsTo (reportsTo),
    CONSTRAINT employees_ibfk_1 FOREIGN KEY (reportsTo)
        REFERENCES employees (employeeNumber)
        ON DELETE SET NULL,
    CONSTRAINT employees_ibfk_2 FOREIGN KEY (officeCode)
        REFERENCES offices (officeCode)
);

CREATE TABLE customers (
    customerNumber INT NOT NULL,
    customerName VARCHAR(50) NOT NULL,
    contactLastName VARCHAR(50) NOT NULL,
    contactFirstName VARCHAR(50) NOT NULL,
    phone VARCHAR(50) NOT NULL,
    addressLine1 VARCHAR(50) NOT NULL,
    addressLine2 VARCHAR(50) DEFAULT NULL,
    city VARCHAR(50) NOT NULL,
    state VARCHAR(50) DEFAULT NULL,
    postalCode VARCHAR(15) DEFAULT NULL,
    country VARCHAR(50) NOT NULL,
    salesRepEmployeeNumber INT DEFAULT NULL,
    creditLimit DECIMAL(10 , 2 ) DEFAULT NULL,
    PRIMARY KEY (customerNumber),
    CONSTRAINT customers_ibfk_1 FOREIGN KEY (salesRepEmployeeNumber)
        REFERENCES employees (employeeNumber)
        ON DELETE SET NULL
);

CREATE TABLE orders (
    orderNumber INT NOT NULL,
    orderDate DATE NOT NULL,
    requiredDate DATE NOT NULL,
    shippedDate DATE DEFAULT NULL,
    status VARCHAR(15) NOT NULL,
    comments TEXT,
    customerNumber INT NOT NULL,
    PRIMARY KEY (orderNumber),
    CONSTRAINT orders_ibfk_1 FOREIGN KEY (customerNumber)
        REFERENCES customers (customerNumber)
);

-- insert data for office table
INSERT INTO offices SELECT * FROM classicmodels.offices;

-- insert data for employees table
INSERT INTO employees SELECT * FROM classicmodels.employees;

-- insert data for cutomers table
INSERT INTO customers SELECT * FROM classicmodels.customers;

-- insert data for orders table
INSERT INTO orders SELECT * FROM classicmodels.orders;

-- Borrar los empleados cuya oficina es la número 4

DELETE FROM employees 
WHERE
    officeCode = 1;
    
    select * from employees;

    
-- Borrar todos los datos de la tabla employees

DELETE FROM employees;


-- Borrar los 10 primeros clientes ordenados alfabéticamente

DELETE FROM customers ORDER BY customerName LIMIT 10;


-- Borrar los 5 clientes de Francia con menor límite de crédito

DELETE FROM customers 
WHERE
    country LIKE 'France' ORDER BY creditLimit LIMIT 5;




