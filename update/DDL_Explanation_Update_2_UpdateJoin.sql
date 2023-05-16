/* MYSQL UPDATE JOIN */
CREATE SCHEMA IF NOT EXISTS ejemploUpdates;
USE ejemploUpdates;

CREATE TABLE merits (
    performance INT(11) NOT NULL,
    percentage FLOAT NOT NULL,
    PRIMARY KEY (performance)
);

CREATE TABLE employees2 (
    emp_id INT(11) NOT NULL AUTO_INCREMENT,
    emp_name VARCHAR(255) NOT NULL,
    performance INT(11) DEFAULT NULL,
    salary FLOAT DEFAULT NULL,
    PRIMARY KEY (emp_id),
    CONSTRAINT fk_performance FOREIGN KEY (performance)
        REFERENCES merits (performance)
);
-- insert data for merits table
INSERT INTO merits(performance,percentage)
VALUES(1,0),
      (2,0.01),
      (3,0.03),
      (4,0.05),
      (5,0.08);
-- insert data for employees table
INSERT INTO employees2(emp_name,performance,salary)      
VALUES('Mary Doe', 1, 50000),
      ('Cindy Smith', 3, 65000),
      ('Sue Greenspan', 4, 75000),
      ('Grace Dell', 5, 125000),
      ('Nancy Johnson', 3, 85000),
      ('John Doe', 2, 45000),
      ('Lily Bush', 3, 55000);
      
-- Muestra que las tablas se han creado correctamente con sus valores

SELECT 
    *
FROM
    merits;
    
SELECT 
    *
FROM
    employees2;

    
-- Modifica los salarios de los empleados incrementándolo el valor del porcentaje que aparece en la tabla
-- merits

UPDATE employees2
        JOIN
    merits USING (performance) 
SET 
    salary = salary + salary * percentage;

    
-- Muestra los valores de la tabla employees2 y comprueba que se han modificado sus valores

SELECT 
    *
FROM
    employees2;
    
/* MYSQL UPDATE JOIN con LEFT JOIN */
USE ejemploUpdates;

INSERT INTO employees2(emp_name,performance,salary)
VALUES('Jack William',NULL,43000),
      ('Ricky Bond',NULL,52000);
      
SELECT 
    *
FROM
    employees2
        LEFT JOIN
    merits ON employees2.performance = merits.performance
WHERE
    merits.performance IS NULL;
      
-- Modifica el salario de aquellos que no tengan un valor de la tabla merits asignado incrementándolo un 1,5%

select * from employees2 left join merits on employees2.performance = merits.performance where merits.performance is null;

UPDATE employees2
        LEFT JOIN
    merits USING (performance) 
SET 
    salary = salary + salary * 0.015
WHERE
    merits.performance IS NULL;
    
-- Muestra los valores de la tabla employees2 y comprueba que se han modificado sus valores

SELECT 
    *
FROM
    employees2;
