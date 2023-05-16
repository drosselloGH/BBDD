/* ÍNDICES DESCENDENTES */
USE classicmodels;

CREATE TABLE t (
    a INT NOT NULL,
    b INT NOT NULL,
    INDEX a_asc_b_desc (a ASC , b DESC)
);

-- Mostra la tabla creada

SHOW CREATE TABLE t;

-- Borrar la tabla t

DROP TABLE t;

-- Volver a crear la tabla t con varios índices
CREATE TABLE t (
    a INT NOT NULL,
    b INT NOT NULL,
    INDEX a_asc_b_asc (a ASC , b ASC),
    INDEX a_asc_b_desc (a ASC , b DESC),
    INDEX a_desc_b_asc (a DESC , b ASC),
    INDEX a_desc_b_desc (a DESC , b DESC)
);

-- Crear un procedimiento para insertar filas en la tabla t de valores aleatorios
DELIMITER $$
CREATE PROCEDURE insertSampleData(
	IN rowCount  INT,
	IN low INT,
	IN high INT
) 
BEGIN 
DECLARE counter INT DEFAULT 0;
	REPEAT
		SET counter := counter + 1;
		-- insertar datos
		INSERT INTO t(a,b)
			VALUES (
				ROUND((RAND() * (high-low)) + high),
				ROUND((RAND() * (high-low)) + high)
			);
		UNTIL counter >= rowCount
	END REPEAT;
END $$
DELIMITER ;

-- Insertamos 10000 filas de valores entre 1 y 1000 en la tabla t utilizando el procedimiento insertSampleData
CALL insertSampleData(1000,1,1000);

-- Mostrar como gestiona MySQL los valores ordenados de la tabla t de manera ascendente para ambas columnas

EXPLAIN SELECT 
    *
FROM
    t
ORDER BY a , b;

-- Mostrar como gestiona MySQL los valores ordenados de la tabla t de manera ascendente para 
-- la columan a y descendente para la columna b

EXPLAIN SELECT 
    *
FROM
    t
ORDER BY a , b DESC;

-- Mostrar como gestiona MySQL los valores ordenados de la tabla t de manera descendente para 
-- la columan a y ascendente para la columna b

EXPLAIN SELECT 
    *
FROM
    t
ORDER BY a DESC, b;

-- Mostrar como gestiona MySQL los valores ordenados de la tabla t de manera descendente para 
-- ambas columna

EXPLAIN SELECT 
    *
FROM
    t
ORDER BY a DESC, b DESC;