/* CARDINALIDAD DE LOS ÍNDICES */
USE classicmodels;

-- Mostrar los índices de la tabla orders para ver cuantos valores únicos contiene los índices

SHOW INDEXES FROM orders;

-- Actualizar la cardinalidad

ANALYZE TABLE orders;
