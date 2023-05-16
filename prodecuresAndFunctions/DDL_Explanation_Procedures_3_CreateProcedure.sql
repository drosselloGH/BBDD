/* MYSQL CREATE PROCEDURE */
USE storedProcedures;

-- Consulta los datos de la tabla products
select * from products;
    
-- Almacena de el servidor de la BD la consulta para poder utilizarla más tarde
DELIMITER $$
CREATE PROCEDURE getAllProducts()
BEGIN
select * from products;
END$$

DELIMITER ;

-- Llama al procedimiento para comprobar si funciona
CALL getAllProducts();
-- ¿Cuáles son los pasos que debemos realizar siempre que creemos un procedimiento?
-- poner un delimitador, 
-- CREATE PROCEDURE nombre(listado separado por comas de los parametros del procedimiento)
-- BEGIN codigo END
-- volver a poner el delimiter ;

-- ¿Cómo es la sintaxis del procedimiento?
-- CREATE PROCEDURE nombre(listado separado por comas de los parametros del procedimiento)
-- BEGIN codigo END

-- ¿Cómo es la sintaxis para llamar a un procedimiento?
-- CALL nombreProcedimiento(nombre parametros);

-- ¿Qué se ha visto en este tutorial?

