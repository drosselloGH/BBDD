/* ÍNDICES INVISIBLES */
USE classicmodels;

-- Crear un índice deshabilitado en la columna extension de la tabla employees

CREATE INDEX idx_extension ON employees(extension) INVISIBLE;

-- Mostrar los índices de la tabla employees

SHOW INDEXES FROM employees;

-- Otra forma de mostrar los índices a través de la tabla statistics de information_schema

SELECT 
    *
FROM
    information_schema.statistics;

-- Habilitar el índice idx_extension para el optimizador de consultas

ALTER TABLE employees ALTER INDEX idx_extension VISIBLE;

-- Mostrar los índices de la tabla employees

SHOW INDEXES FROM employees;

-- Crear la tabla discount
CREATE TABLE discounts (
    discount_id INT NOT NULL,
    name VARCHAR(50) NOT NULL,
    valid_from DATE NOT NULL,
    valid_to DATE NOT NULL,
    amount DEC(5 , 2 ) NOT NULL DEFAULT 0,
    UNIQUE discount_id (discount_id)
);

-- Hacer invisible el índice discount_id

ALTER TABLE discounts ALTER INDEX discount_id INVISIBLE;