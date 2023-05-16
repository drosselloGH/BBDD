/* ON DELETE CASCADE */
CREATE SCHEMA IF NOT EXISTS ejemploDeletes;
USE ejemploDeletes;

CREATE TABLE buildings (
    building_no INT PRIMARY KEY AUTO_INCREMENT,
    building_name VARCHAR(255) NOT NULL,
    address VARCHAR(255) NOT NULL
);

CREATE TABLE rooms (
    room_no INT PRIMARY KEY AUTO_INCREMENT,
    room_name VARCHAR(255) NOT NULL,
    building_no INT NOT NULL,
    FOREIGN KEY (building_no)
        REFERENCES buildings (building_no)
        ON DELETE CASCADE
);

-- NOTA. Un edificio tiene una o muchas habitaciones pero una habitación pertenece a un único edificio

-- insert data for buildings table
INSERT INTO buildings(building_name,address)
VALUES('ACME Headquaters','3950 North 1st Street CA 95134'),
      ('ACME Sales','5000 North 1st Street CA 95134');

-- insert data for rooms table	
INSERT INTO rooms(room_name,building_no)
VALUES('Amazon',1),
      ('War Room',1),
      ('Office of CEO',1),
      ('Marketing',2),
      ('Showroom',2);
      
-- Mostrar todos los datos de la tabla buildings
select * from buildings;
    
-- Mostrar todos los datos de la tabla rooms
select * from rooms;
    
-- Borrar los edificios con building_no 2
delete from buildings where building_no = 2;
    
-- Mostrar todos los datos de la tabla rooms
select * from rooms;
    
-- ¿Cuántas filas indica el output que se han borrado?¿Por qué?
-- 1, la que pertenecia al edificio numero 2

-- ¿Qué filas se han borrado en la BD?


-- Muestra la información de la tabla referential_constraints de la BD information_schema

-- Muestra las tablas asociadas a la tabla buildings que tengan borrado en CASCADA en la BD ejemploDeletes

        
