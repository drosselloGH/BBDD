/* MOSTRAR LOS ÍNDICES classicmodels */
USE classicmodels;

CREATE TABLE contacts(
	contact_id INT AUTO_INCREMENT PRIMARY KEY,
	first_name VARCHAR(100) NOT NULL,
	last_name VARCHAR(100) NOT NULL,
	email VARCHAR(100),
	phone VARCHAR(20),
	UNIQUE (email),
	INDEX phone(phone) INVISIBLE,
	INDEX idx_name (first_name, last_name) comment 'By first name and/or last name'
);

-- Mostrar los índices de la tabla contacts

SHOW INDEX FROM contacts;


-- Mostrar los índices de la tabla contacts que sean invisibles

SHOW INDEX FROM contacts WHERE VISIBLE = 'NO';


-- Mostrar los índices de la tabla que su nombre comience por idx_

SHOW INDEX FROM contacts WHERE Key_name LIKE 'idx_%';

-- Mostrar los índices de la tabla cuya columan puede contener valores duplicados

SHOW INDEX FROM contacts WHERE Non_unique = 1;
