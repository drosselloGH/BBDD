/* MYSQL INSERT IGNORE STATEMENT */
CREATE SCHEMA IF NOT EXISTS ejemploInserts;
USE ejemploInserts;

CREATE TABLE subscribers (
    id INT PRIMARY KEY AUTO_INCREMENT,
    email VARCHAR(50) NOT NULL UNIQUE
);

-- Muestra los datos de la tabla subscribers y comprueba que no se han introducido los datos

SELECT 
    *
FROM
    subscribers;
    
/*
Inserta el siguiente valor en la tabla subscribers:
	- email: john.doe@gmail.com
*/

INSERT INTO subscribers (email)
VALUES ('john.doe@gmail.com');


-- Muestra los datos de la tabla subscribers y comprueba que se han introducido los datos

SELECT 
    *
FROM
    subscribers;


/*
Inserta los siguientes valores en la tabla subscribers con un única sentencia:
	- email 1: john.doe@gmail.com
    - email 2: jane.smith@ibm.com
*/

INSERT INTO subscribers (email)
VALUES ('john.doe@gmail.com'),
	   ('jane.smith@ibm.com');

    
-- ¿Por qué no se ha introducido el valor? ¿Qué error da?
-- El valor esta duplicado


-- Muestra los datos de la tabla subscribers y comprueba que se no ha introducido ninguno de los datos

SELECT 
    *
FROM
    subscribers;

    
/*
Inserta los siguientes valores en la tabla subscribers con un única sentencia y 
utilizando la sentencia INSERT IGNORE:
	- email 1: john.doe@gmail.com
    - email 2: jane.smith@ibm.com
*/

INSERT IGNORE INTO subscribers (email)
VALUES ('john.doe@gmail.com'),
	   ('jane.smith@ibm.com');
    
-- Muestra los detalles de los warnings

SHOW WARNINGS;

    
-- ¿Qué mensaje indica el output?
-- 'Warning', '1062', 'Duplicate entry \'john.doe@gmail.com\' for key \'subscribers.email\''


-- Muestra los datos de la tabla subscribers y comprueba que datos se han introducido

SELECT 
    *
FROM
    subscribers;

    
/* MYSQL INSERT IGNORE AND STRICT MODE */
CREATE SCHEMA IF NOT EXISTS ejemploInserts;
USE ejemploInserts;

CREATE TABLE tokens (
    s VARCHAR(6)
);

-- Muestra los datos de la tabla tokens y comprueba que no contiene datos

SELECT 
    *
FROM
    tokens;


-- ¿Qué valores acepta la columna s? ¿Qué longitud deben tener como máximo dichos valores?
-- Acepta valores VARCHAR con longitud máximo de 6 caracteres


-- Inserta el valor 'abcdefg' en la tabla tokens

INSERT INTO tokens (s) 
VALUES ('abcdefg');


-- ¿Por qué no se ha introducido el valor?¿Qué error muestra?
-- Porque tiene mas de 6 caracteres.
-- 'Error', '1406', 'Data too long for column \'s\' at row 1'


-- Muestra los datos de la tabla tokens y comprueba que no se han introducido los datos

SELECT 
    *
FROM
    tokens;


-- Utiliza la sentencia INSERT IGNORE para introducir la misma cadena de caracteres

INSERT IGNORE INTO tokens (s) 
VALUES ('abcdefg');


-- ¿Qué nos indica el warning?

SHOW WARNINGS;
-- 'Warning', '1265', 'Data truncated for column \'s\' at row 1'

-- Muestra los datos de la tabla tokens y comprueba como se han introducido los datos

SELECT 
    *
FROM
    tokens;

