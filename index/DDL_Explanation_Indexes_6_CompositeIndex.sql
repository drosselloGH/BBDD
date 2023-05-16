/* ÍNDICES COMPUESTOS */
USE classicmodels;

-- Crear un índice compuesto en la tabla employees formado por la columna lastName y firstName

CREATE INDEX idx_name ON employees(lastName,firstName);

-- Mostrar los empleados cuyo apellido sea Patterson

SELECT 
    *
FROM
    employees
WHERE
    lastName LIKE 'Patterson';
    
-- Mostrar como funciona la consulta anterior

EXPLAIN SELECT 
    *
FROM
    employees
WHERE
    lastName LIKE 'Patterson';

    
-- Mostrar los empleados cuyo apellido es Patterson y su nombre es Steve

SELECT 
    *
FROM
    employees
WHERE
    lastName LIKE 'Patterson'
        AND firstName LIKE 'Steve';
        
-- Mostrar como funciona la consulta anterior

EXPLAIN SELECT 
    *
FROM
    employees
WHERE
    lastName LIKE 'Patterson'
        AND firstName LIKE 'Steve';

        
-- Mostrar los empleados cuyo apellido es Patterson y su nombre es Steve o Mary

SELECT 
    *
FROM
    employees
WHERE
    lastName LIKE 'Patterson'
        AND (firstName LIKE 'Steve'
        OR firstName LIKE 'Mary');

        
-- Mostrar como funciona la consulta anterior

EXPLAIN SELECT 
    *
FROM
    employees
WHERE
    lastName LIKE 'Patterson'
        AND (firstName LIKE 'Steve'
        OR firstName LIKE 'Mary');
        
-- Mostrar los empledos cuyo nombre sea Leslie

SELECT 
    *
FROM
    employees
WHERE
    firstName LIKE 'Leslie';
    
-- Mostrar como funciona la consulta anterior

EXPLAIN SELECT 
    *
FROM
    employees
WHERE
    firstName LIKE 'Leslie';
    
-- Mostrar los empleados cuyo nombre sea Leslie o Anthony

SELECT 
    *
FROM
    employees
WHERE
    firstName LIKE 'Leslie'
        OR firstName LIKE 'Anthony';
        
-- Mostrar como funciona la consulta anterior

EXPLAIN SELECT 
    *
FROM
    employees
WHERE
    firstName LIKE 'Leslie'
        OR firstName LIKE 'Anthony';