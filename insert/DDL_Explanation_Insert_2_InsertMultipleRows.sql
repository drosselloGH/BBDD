/* MYSQL INSERT MULTIPLE ROWS */
CREATE SCHEMA IF NOT EXISTS ejemploInserts;
USE ejemploInserts;

CREATE TABLE projects(
	project_id INT AUTO_INCREMENT, 
	name VARCHAR(100) NOT NULL,
	start_dateprojects DATE,
	end_date DATE,
	PRIMARY KEY(project_id)
);

-- Muestra los datos de la tabla projects y comprueba que no se han introducido los datos

SELECT 
    *
FROM
    projects;

/* 
Inserta múltiple filas con una única sentencia y con los siguientes datos en la tabla projects:
	1er Proyecto:
	- name: 'AI for marketing'
    - start_date: 1-8-2019
    - end_date: 31-12-2019
    
    2o Proyecto:
    - name: 'ML for Sales'
    - start_date: 15-5-2019
    - end_date: 20-11-2019
*/

INSERT INTO projects (name, start_date, end_date)
VALUES ('AI for marketing', '2019-08-01', '2019-12-31'),
	   ('ML for Sales', '2019-05-15', '2019-11-20');
    
-- Muestra los datos de la tabla projects y comprueba que se han introducido los datos

SELECT 
    *
FROM
    projects;

    

