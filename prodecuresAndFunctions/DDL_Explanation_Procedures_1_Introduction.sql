/* INTRODUCTION TO STORED PROCEDURES */
USE storedProcedures;

-- Comprueba que los datos de la tabla customers
select * from customers;
    
-- Almacena consulta en el servidor de la BD para ejecutarla más tarde utilizando procedimientos
DELIMITER $$
	-- cambia ; por $$
	-- recomendable utilizar elementos repetidos
    
CREATE PROCEDURE getAllCustomers()
BEGIN
select * from customers;
END$$
	-- considera a todo esto como un bloque
    
DELIMITER ;

-- Llama al procedimiento que se acaba de crear
CALL getAllCustomers();

-- ¿Cuál es el proceso interno de ejecución la primera vez que se ejecuta un procedimiento?
-- 1. Complilar el codigo del procedimiento y guardarlo en caché 
-- 2. Ejecutar el codigo

-- ¿Cuál es el proceso interno de ejecución una vez ya se ha ejecutado el procedimiento una vez?
-- 1. Ejecutar el codigo guardado en caché

-- ¿Puede un procedimiento llamar a otro procedimiento?
-- si

-- ¿Cuáles son la ventajas de usar procedimientos?
-- reduce el tráfico de red (una vez compilado el codigo ya esta hecho)
-- permite modularizar el código
-- permite reutilizar codigo. 

-- ¿Cuáles son las desventajas de usar procedimientos?
-- si se usan muchos procedimientos, se puede sobrecargar la cpu
-- dificultad para detectar errores
-- se necesita alguien especializado para su mantenimiento/creacion
