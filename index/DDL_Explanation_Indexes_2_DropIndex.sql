/* BORRADO DE ÍNDICES classicmodels */
USE classicmodels;

-- Crear la tabla leads con un índice compuesto que se llama name sobre las columnas
-- first_name, last_name
CREATE TABLE leads (
    lead_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    email VARCHAR(255) NOT NULL,
    information_source VARCHAR(255),
    INDEX idx_name (first_name , last_name),
    UNIQUE email (email)
);

-- Mostrar los índices de la tabla leads

SHOW INDEX FROM leads;

-- Borrar el índice idx_name

DROP INDEX idx_name ON leads;

-- Mostrar los índices de la tabla leads

SHOW INDEX FROM leads;

-- Borrar el índice email de la tabla leads con un algoritmo específico

DROP INDEX email ON leads ALGORITHM = COPY LOCK = EXCLUSIVE;

-- Mostrar los índices de la tabla leads

SHOW INDEX FROM leads;

-- Borrar el índice de la PRIMARY KEY de la tabla leads

alter table leads DROP INDEX `PRIMARY`;

-- Borrar el índice de la PRIMARY KEY
CREATE TABLE t (
    pk INT PRIMARY KEY,
    c VARCHAR(10)
);

alter table t drop index `PRIMARY`;

-- Mostrar los índices de la tabla t

SHOW INDEX FROM t;

-- Borrar la tabla t

DROP TABLE t;

-- Borrar la tabla leads

DROP TABLE leads;
