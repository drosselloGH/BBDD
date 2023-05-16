/*  FORCE INDEX */
USE classicmodels;

-- Mostrar los índices de la tabla products

SHOW INDEXES FROM products;


-- Mostrar los productos cuyos precios están entre 10 y 80 ordenados por precio

SELECT 
    *
FROM
    products
WHERE
    buyPrice BETWEEN 10 AND 80
ORDER BY buyPrice;

-- Mostrar como ejecuta MySQL la consulta anterior

EXPLAIN SELECT 
    *
FROM
    products
WHERE
    buyPrice BETWEEN 10 AND 80
ORDER BY buyPrice;

-- Crear un índice en la columna buyPrice

CREATE INDEX idx_buyPrice ON products (buyPrice); 

-- Mostrar los índices de la tabla products

SHOW INDEXES FROM products;

-- Mostrar como ejecuta MySQL la consulta anterior otra vez

EXPLAIN SELECT 
    *
FROM
    products
WHERE
    buyPrice BETWEEN 10 AND 80
ORDER BY buyPrice;

-- Forzar a que el optimizador de consultas use el índice idx_buyPrice

SELECT 
    *
FROM
    products FORCE INDEX (IDX_BUYPRICE)
WHERE
    buyPrice BETWEEN 10 AND 80
ORDER BY buyPrice;

-- Mostrar como ejecuta MySQL la consulta anterior otra vez

EXPLAIN SELECT 
    *
FROM
    products FORCE INDEX (idx_buyPrice)
WHERE
    buyPrice BETWEEN 10 AND 80
ORDER BY buyPrice;