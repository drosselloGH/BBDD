/* LISTING STORED PROCEDURES */
USE storedProcedures;

-- Muestra todos los procedimientos almacenados en MySQL
show procedure status;

-- Muestra todos los procedimientos almacenados en la BD storedProcedures
show procedure status where db like "storedProcedures";

-- Muestra todos los procedimentos almacenados en MySQL que contengan la palabra Order
show procedure status where name LIKE "%order%";

/* MOSTRAR LOS PROCEDIMIENTOS ALMACENADOS UTILIZANDO EL DICCIONARIO DE DATOS */
-- Mostrar los procedimientos almacenados de una base de datos particular
select * from information_schema.routines where ROUTINE_TYPE = "PROCEDURE" and ROUTINE_SCHEMA = "storedProcedures";
