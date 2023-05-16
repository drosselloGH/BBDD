/* UNIQUE INDEX classicmodels */
USE classicmodels;

drop table contacts;

CREATE TABLE IF NOT EXISTS contacts (
    id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    phone VARCHAR(16) NOT NULL,
    email VARCHAR(100) NOT NULL,
    UNIQUE KEY unique_email (email)
);

-- Mostrar los índices de la tabla contacts

SHOW INDEXES FROM contacts;

-- Introducir una fila en la tabla contacts

INSERT INTO contacts(id, first_name,last_name,phone,email) VALUES ('1','Juan', 'Nadie','(+34)665-665-665','juan.nadie@iessonferrer.net');

    
-- Introducir otra fila en la tabla contacts con el mismo email que la fila anterior

INSERT INTO contacts(first_name,last_name,phone,email) VALUES ('Maria', 'de la O','(+34)565-565-565','juan.nadie@iessonferrer.net');    
    
-- Crear una restricción UNIQUE de las columnas first_name, last_name y phone

CREATE UNIQUE INDEX idx_name_phone ON contacts(first_name,last_name,phone);

-- Introducir otra fila en la que la combinación de nombre, apellido y teléfono se repita

INSERT INTO contacts(first_name,last_name,phone,email) VALUES ('Maria', 'de la O','(+34)565-565-565','juan@iessonferrer.net'); 
