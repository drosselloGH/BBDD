/* MYSQL INSERT INTO SELECT */
CREATE SCHEMA IF NOT EXISTS ejemploInserts;
USE ejemploInserts;

CREATE TABLE suppliers (
    supplierNumber INT AUTO_INCREMENT,
    supplierName VARCHAR(50) NOT NULL,
    phone VARCHAR(50),
    addressLine1 VARCHAR(50),
    addressLine2 VARCHAR(50),
    city VARCHAR(50),
    state VARCHAR(50),
    postalCode VARCHAR(50),
    country VARCHAR(50),
    customerNumber INT,
    PRIMARY KEY (supplierNumber)
);

-- Muestra los datos de la tabla suppliers y comprueba que no se han introducido los datos

SELECT 
    *
FROM
    suppliers;
    
-- Muestra todos los clientes de la BD classicmodels que sean de California ('CA'), USA

SELECT 
    *
FROM
    classicmodels.customers
WHERE
    state LIKE 'CA' AND country LIKE 'USA';

    
/* 
Utilizando la sentencia INSERT INTO ... SELECT introduce en la tabla creada suppliers
los clientes de la BD classicmodels que sean de California ('CA'), USA
*/

INSERT INTO suppliers (
	supplierName, 
    phone, 
    addressLine1,
    addressLine2,
    city,
    state,
    postalCode,
    country,
    customerNumber
    ) 
SELECT 
    customerName,
    phone,
    addressLine1,
    addressLine2,
    city,
    state ,
    postalCode,
    country,
    customerNumber
FROM
    classicmodels.customers
WHERE
    state LIKE 'CA' AND country LIKE 'USA';

    
-- Muestra los datos de la tabla suppliers y comprueba que se han introducido los datos

SELECT 
    *
FROM
    suppliers;


-- Crea una nueva tabla en el schema ejemploInserts
CREATE SCHEMA IF NOT EXISTS ejemploInserts;
USE ejemploInserts;

CREATE TABLE stats (
    totalProduct INT,
    totalCustomer INT,
    totalOrder INT
);

/* 
Utilizando una única sentencia INSERT INTO ... SELECT introduce en la tabla creada stats:
	- la cantidad total de productos introducidos en la BD, 
    - la cantidad total de clientes introducidos en la BD,
    - la cantidad total de pedidos introducidos en la BD
*/

INSERT INTO stats (totalProduct, totalCustomer, totalOrder)
VALUES (
	(SELECT COUNT(*) FROM classicmodels.products),
    (SELECT COUNT(*) FROM classicmodels.customers),
    (SELECT COUNT(*) FROM classicmodels.orders)
);


-- Muestra los datos de la tabla stats y comprueba que se han introducido los datos

SELECT 
    *
FROM
    stats;
