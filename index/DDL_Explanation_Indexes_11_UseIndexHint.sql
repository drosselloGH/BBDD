/* USE INDEX HINT */
USE classicmodels;

-- Mostrar todos los índices de la tabla customers

SHOW INDEXES FROM customers;


/*
 Crear los siguientes índices:
	1. Un índice llamado idx_c_ln en la columna del apellido de la persona de contacto
    2. Un índice llamado idx_c_fn en la columna del nombre de la persona de contacto
    3. Un índice llamado idx_name_fl compuesto de las columnas del nombre y apellido de la persona de contacto (en este orden)
	4. Un índice llamado idx_name_lf compuesto de las columnas del apellido y nombre de la persona de contacto (en este orden)
*/

CREATE INDEX idx_c_ln ON customers (contactLastName);
CREATE INDEX idx_c_fn ON customers (contactFirstName);
CREATE INDEX idx_name_fl ON customers (contactFirstName, contactLastName);
CREATE INDEX idx_name_lf ON customers (contactLastName, contactFirstName);

-- Mostrar los clientes dónde el nombre o apellido de su persona de contacto comience por A 

SELECT 
    *
FROM
    customers
WHERE
    contactFirstName LIKE 'A%'
        OR contactLastName LIKE 'A%';
        
-- Mostrar como ejecuta interamente la consulta anterior MySQL

EXPLAIN SELECT 
    *
FROM
    customers
WHERE
    contactFirstName LIKE 'A%'
        OR contactLastName LIKE 'A%';
        
-- Forzar que la consulta anterior utilice los índices idx_name_fl y idx_name_lf

SELECT 
    *
FROM
    customers USE INDEX (IDX_NAME_FL , IDX_NAME_LF)
WHERE
    contactFirstName LIKE 'A%'
        OR contactLastName LIKE 'A%';

-- Mostrar como ejecuta interamente la consulta anterior MySQL

EXPLAIN SELECT 
    *
FROM
    customers USE INDEX (IDX_NAME_FL , IDX_NAME_LF)
WHERE
    contactFirstName LIKE 'A%'
        OR contactLastName LIKE 'A%';
