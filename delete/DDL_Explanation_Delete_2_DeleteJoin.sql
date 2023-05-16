/* MYSQL DELETE JOIN */
CREATE SCHEMA IF NOT EXISTS ejemploDeletes;
USE ejemploDeletes;

CREATE TABLE t1 (
    id INT PRIMARY KEY AUTO_INCREMENT
);

CREATE TABLE t2 (
    id VARCHAR(20) PRIMARY KEY,
    ref INT NOT NULL
);

INSERT INTO t1 VALUES (1),(2),(3),(4);

INSERT INTO t2 VALUES('A',1),('B',2),('C',3);

-- Muestra los valores de t1 y t2 cuando el id de t1 es 1

SELECT 
    *
FROM
    t1
WHERE
    id = 1;


-- Borrar la tabla con id 1 en la tabla t1 y ref 1 en la tabla t2

DELETE t1 , t2 FROM t1
        JOIN
    t2 ON t1.id = t2.ref 
WHERE
    t1.id = 1 AND t2.ref = 1;

    
-- ¿Cuántas filas indica el output que se han borrado?¿Por qué?
-- 2, porque se han borrado de las dos tablas


-- Muestra los valores de t1 y t2

SELECT 
    *
FROM
    t1
        JOIN
    t2 ON t1.id = t2.ref;

    
-- Muestra las filas de la tabla t1 que no tengan correspondencia con ninguna fila de la tabla t2

SELECT 
    *
FROM
    t1
        LEFT JOIN
    t2 ON t1.id = t2.ref
WHERE
    ref IS NULL;

    
-- Borrar las filas de la tabla t1 que no tengan correspondencia con ninguna fila de la tabla t2

DELETE t1 , t2 FROM t1
        LEFT JOIN
    t2 ON t1.id = t2.ref 
WHERE
    ref IS NULL;
    
-- Muestra todos los valores de la tabla t1

SELECT 
    *
FROM
    t1;

    
-- Mostrar los clientes que no tienen ningún pedido en la BD

SELECT 
    *
FROM
    customers
        LEFT JOIN
    orders USING (customerNumber)
WHERE
    orders.customerNumber IS NULL;


-- Borrar los clientes que no tengan ningún pedido en la BD

DELETE customers FROM customers
        LEFT JOIN
    orders USING (customerNumber) 
WHERE
    orders.customerNumber IS NULL;
    
-- Mostrar los clientes que no tienen ningún pedido en la BD

SELECT 
    *
FROM
    customers
        LEFT JOIN
    orders USING (customerNumber)
WHERE
    orders.customerNumber IS NULL;
