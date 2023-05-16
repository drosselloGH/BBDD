/* MYSQL UPDATE STATEMENT */
CREATE SCHEMA IF NOT EXISTS ejemploUpdates;
USE ejemploUpdates;

CREATE TABLE IF NOT EXISTS employees (
    id INTEGER PRIMARY KEY,
    firstName VARCHAR(50) NOT NULL,
    lastName VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL,
    jobTitle VARCHAR(50),
    officeCode VARCHAR(10)
    
);

CREATE TABLE `customers` (
    id INT NOT NULL PRIMARY KEY,
    customerName VARCHAR(50) NOT NULL,
    salesRepEmployeeNumber INT DEFAULT NULL,
    CONSTRAINT `customers_ibfk_1` FOREIGN KEY (salesRepEmployeeNumber)
        REFERENCES employees (id)
);


INSERT INTO employees (id, firstName, lastName, email, jobTitle, officeCode) SELECT 
    employeeNumber,
    firstname, 
    lastname, 
    email, 
    jobTitle, 
    officeCode
FROM
    classicmodels.employees;
    
INSERT INTO customers (id, customerName, salesRepEmployeeNumber) SELECT 
    customerNumber, customerName, salesRepEmployeeNumber
FROM
    classicmodels.customers;
    
-- Muestra que se han creado correctamente las tablas con los valores

SELECT 
    *
FROM
    customers;
    
SELECT 
    *
FROM
    employees;

    
-- Modifica el email del empleado con id 1056 a a mary.patterson@classicmodelcars.com

UPDATE employees 
SET 
    email = 'mary.patterson@classicmodelcars.com'
WHERE
    id = 1056;

    
-- Muestra los valores de la tabla employees y comprueba que se ha modificado correctamente el valor

SELECT 
    *
FROM
    employees
WHERE
    id = 1056;

    
-- Modifica el apellido del empleado con id 1056 a Hill y su email a mary.hill@classicmodelcars.com

UPDATE employees 
SET 
    lastName = 'Hill',
    email = 'mary.hill@classicmodelcars.com'
WHERE
    id = 1056;

    
-- Muestra los valores de la tabla employees y comprueba que se han modificado correctamente los valores

SELECT 
    *
FROM
    employees
WHERE
    id = 1056;

    
-- Modifica el correo de todos los empleado del departamento de ventas 'Sales Reps' que sean de la oficina 6
-- para que en lugar de usar @classicmodelcars.com utilice @iessonferrer.net

UPDATE employees 
SET 
    email = REPLACE(email,
        '@classicmodelcars.com',
        '@iessonferrer.net')
WHERE
    jobTitle LIKE 'Sales Rep'
        AND officeCode = 6;

   
-- Muestra los valores de la tabla employees y comprueba que se han modificado correctamente los valores

SELECT 
    *
FROM
    employees;

    
-- Muestra los cliente que no tengan asignado un vendedor

SELECT 
    *
FROM
    customers
WHERE
    salesRepEmployeeNumber IS NULL
        OR salesRepEmployeeNumber LIKE 'NULL';

    
-- Obtener de manera aleatoria el id de un empleado que sea del departamento de ventas

SELECT 
    id
FROM
    employees
ORDER BY RAND()
LIMIT 1;


-- Modificar los valores de la tabla customers de todos aquellos clientes que no tengan asignado
-- un vendedor y asignaler el valor que se ha obtenido en la consulta anterior

UPDATE customers 
SET 
    salesRepEmployeeNumber = (SELECT 
            id
        FROM
            employees
        ORDER BY RAND()
        LIMIT 1)
WHERE
    salesRepEmployeeNumber IS NULL;

    
-- Muestra los cliente que no tengan asignado un vendedor

SELECT 
    *
FROM
    customers
WHERE
    salesRepEmployeeNumber IS NULL
        OR salesRepEmployeeNumber LIKE 'NULL';
