/* DELIMITER */
USE storedProcedures;

-- Consulta los datos de la tabla customers
select * from customers;
    
-- Cambia el dilimitador para que se // y vuelve a ejecutar la consulta anterior
delimiter //
select * from customers//    

-- Vuelve a cambiar el delimitador a ;
delimiter ;

-- ¿Por qué es necesario cambiar el delimitador en un procedimiento?
-- para poder ejecutar el codigo del procedimiento en un unico bloque.
-- si no lo cambiamos, terminaria el procedimiento en el primer ; que encontrase en el cuerpo del proceso
-- sin llegar a ejecutarlo completamente

-- ¿Qué se ha visto en este tutorial?
-- como cambiar el delimitador y por que es importante cambiar el delimitador para la creacion de un procedimiento



