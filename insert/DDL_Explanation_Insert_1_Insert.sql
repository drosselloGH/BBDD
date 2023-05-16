/* MYSQL INSERT */
CREATE SCHEMA IF NOT EXISTS ejemploInserts;
USE ejemploInserts;

CREATE TABLE IF NOT EXISTS tasks (
    task_id INT AUTO_INCREMENT,
    title VARCHAR(255) NOT NULL,
    start_date DATE,
    due_date DATE,
    priority TINYINT NOT NULL DEFAULT 3,
    description TEXT,
    PRIMARY KEY (task_id)
);

-- Muestra los datos de la tabla tasks para comprobar que está vacía

SELECT 
    *
FROM
    tasks;

/*
Inserta los siguientes datos en la tabla tasks utilizando una sentencia simple:
	- title: 'Learn MYSQL INSERT Statement'
    - priority: 1
*/

INSERT INTO tasks (title, priority) 
VALUES ('Learn MYSQL INSERT Statement', 1);

    
-- Muestra los datos de la tabla tasks y comprueba que se han introducido los datos

SELECT 
    *
FROM
    tasks;
    
-- ¿Qué valores utiliza MySQL para las columnas task_id, start_date, due_date y description?
-- task_id: utiliza el primer valor incremental, es decir, 1.
-- start_date, due_date, description: utiliza el valor NULL que es el valor por defecto.

/* 
Inserta los siguientes datos en la tabla tasks utilizando una sentencia simple y la palabra DEFAULT:
	- title: 'Undertstanding DEFAULT keyword in INSERT statement'
    - priority: el valor por defecto
*/

INSERT INTO tasks (title, priority)
VALUES ('Undertstanding DEFAULT keyword in INSERT statement', DEFAULT);

    
-- Muestra los datos de la tabla tasks y comprueba que se han introducido los datos

SELECT 
    *
FROM
    tasks;

    
/*
Inserta los siguientes datos en la tabla tasks utilizando una sentencia simple:
	- title: 'Insert date into table'
    - start_date: 9-1-2018
    - due_date: 15-9-2018
*/

INSERT INTO tasks (title, start_date, due_date)
VALUES ('Insert date into table', '2018-01-09', '2018-09-15');

    
-- Muestra los datos de la tabla tasks y comprueba que se han introducido los datos

SELECT 
    *
FROM
    tasks;

    
/*
Inserta los siguientes datos en la tabla tasks utilizando una sentencia simple:
	- title: 'Use current date for the task'
    - start_date: fecha actual
    - due_date: fecha actual
*/

INSERT INTO tasks (title, start_date, due_date)
VALUES ('Use current date for the task', CURDATE(), CURDATE());

    
-- Muestra los datos de la tabla tasks y comprueba que se han introducido los datos

SELECT 
    *
FROM
    tasks;

    
/*
Inserta múltiple filas con una única sentencia y con los siguientes datos en la tabla tasks:
	1a Tarea:
	- title: 'My First task'
    - priority: 1
    
    2a Tarea:
    - title: 'It is the second task'
    - priority: 2
    
    3a Tarea:
    - title: 'This is the third task of the week'
    - priority: 3
*/

INSERT INTO tasks(title, priority)
VALUES ('My First task', 1),
	   ('It is the second task', 2),
       ('This is the third task of the week', 3); 

    
-- Muestra los datos de la tabla tasks y comprueba que se han introducido los datos

SELECT 
    *
FROM
    tasks;

