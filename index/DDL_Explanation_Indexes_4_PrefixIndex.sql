/* PREFIX INDEX classicmodels */
USE classicmodels;

-- Muestra los productos cuyos nombre comiencen por 1970

SELECT 
    *
FROM
    products
WHERE
    productName LIKE '1970%';
    
-- Mostrar como ejecuta internamente MySQL la consulta anterior

EXPLAIN SELECT 
    *
FROM
    products
WHERE
    productName LIKE '1970%';
    
-- Mostrar cuantas filas tiene la tabla products

SELECT 
    COUNT(*)
FROM
    products;
    
-- Evaluar diferentes longitudes de prefijos hasta alcanzar una singularidad 
-- razonable de las filas

    
-- Crear un índice con el prefijo 20 para la columna productName de la tabla products

CREATE INDEX idx_productName ON products(productName(20));

SHOW INDEXES FROM products;


-- Mostrar como ejecuta internamente MySQL la consulta de los productos cuyo nombre
-- empieza por 1970
