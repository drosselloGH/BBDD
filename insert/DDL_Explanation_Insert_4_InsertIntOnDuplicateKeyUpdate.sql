/* MYSQL INSERT ON DUPLICATE KEY UPDATE */
CREATE SCHEMA IF NOT EXISTS ejemploInserts;
USE ejemploInserts;

CREATE TABLE devices (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100)
);

-- Muestra los datos de la tabla devices y comprueba que no se han introducido los datos

SELECT 
    *
FROM
    devices;

    
/*
Inserta los siguientes valores utilizando una única sentencia:
	1er Dispositivo:
	- name: 'Router F1'
    
    2o Dispositivo:
    - name: 'Switch 1'
    
    3er Dispositivo:
    - name: 'Switch 2'
*/

INSERT INTO devices (name)
VALUES ('Router F1'),
	   ('Switch 1'),
       ('Switch 2');

    
-- Muestra los datos de la tabla devices y comprueba que se han introducido los datos

SELECT 
    *
FROM
    devices;

    
/*
Añadir un dispositivo más a la tabla devices:
	DISPOSITIVO:
	- name: 'Printer'
*/

INSERT INTO devices (name)
VALUES ('Printer');

-- ¿Cuántas filas indica el output que han sido afectadas?
-- 1


-- Muestra los datos de la tabla devices y comprueba que se han introducido los datos

SELECT 
    *
FROM
    devices;

    
-- Vuelve a insertar el último dispositivo utilizando el mismo valor de id con el que ya se ha insertado
-- si el valor está duplicado se utilizará el nombre Central Printer

INSERT INTO devices (id, name)
VALUES (4, 'Printer')
ON DUPLICATE KEY update NAME = 'Central Printer';


-- ¿Cuántas filas indica el output que han sido afectadas?
-- 2


-- Muestra los datos de la tabla devices y comprueba que se ha introducido

SELECT 
    *
FROM
    devices;


-- Vuelve a insertar el último dispositivo utilizando el mismo valor de id con el que ya se ha insertado
-- si el valor está duplicado se utilizará el nombre Central Printer

INSERT INTO devices (id, name)
VALUES (4, 'Printer')
ON DUPLICATE KEY UPDATE NAME = 'Central Printer';

-- ¿Cuántas filas indica el output que han sido afectadas?
-- 0
