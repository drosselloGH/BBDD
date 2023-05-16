/* CREACIÓN DE ÍNDICES classicmodels */
USE classicmodels;

-- Obtener el número de empleado, apellidos y nombre de todos los empleados
-- que trabajen de Sales Rep

SELECT 
    employeeNumber, lastName, firstName
FROM
    employees
WHERE
    UPPER(jobTitle) LIKE 'SALES REP';
    
-- Mostrar como MySQL realiza internamente esta consulta

EXPLAIN SELECT 
    employeeNumber, lastName, firstName
FROM
    employees
WHERE
    UPPER(jobTitle) LIKE 'SALES REP';
    
-- Mostrar cuantas filas tiene la tabla employees

SELECT 
    COUNT(*)
FROM
    employees;    
    
-- Crear un índice para la columna jobTitle de la tabla employees

CREATE INDEX idx_jobTitle ON employees (jobTitle);

ALTER TABLE employees ADD INDEX idx_jobTitle (jobTitle);
ALTER TABLE employees DROP INDEX idx_jobTitle;

-- Volver a mostrar como ejecuta internamente MySQL la consulta anterior

EXPLAIN SELECT 
    employeeNumber, lastName, firstName
FROM
    employees
WHERE
    UPPER(jobTitle) LIKE 'SALES REP';
    
-- Mostrar los índices de la tabla employees

SHOW INDEX FROM employees;
