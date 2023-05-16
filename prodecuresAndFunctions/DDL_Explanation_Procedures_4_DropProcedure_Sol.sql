/* MYSQL DROP PROCEDURE */
USE storedProcedures;

/*    
Crea una consulta que devuelva los siguientes datos:
		- firstName del empleado,
        - lastName del empleado,
        - city de la oficina del empleado,
        - state de la oficina del empleado,
        - country de la oficina del empleado
de la BD storedProcedures;
*/

SELECT firstName, lastName, city, state, country from employees join offices using (officeCode);

 -- Almacena la consulta en el servidor para poder utilizarla posteriormente a través de un procedimiento   
DELIMITER $$
CREATE PROCEDURE getEmployees()
BEGIN
SELECT firstName, lastName, city, state, country from employees join offices using (officeCode);
END $$
DELIMITER ;

call getEmployees();

-- Elimina el procedimiento getEmployees
drop procedure getEmployees;

-- Elimina el procedimiento abc
drop procedure abc;

-- ¿Qué nos indica el output?
-- Error Code: 1305. PROCEDURE storedProcedures.abc does not exist

-- Borra el procedimiento abc para que de un warning en lugar de un error si no existe
drop procedure if exists abc;

-- ¿Qué nos indica el output?
-- 0 row(s) affected, 1 warning(s): 1305 PROCEDURE storedProcedures.abc does not exist


-- ¿Qué se ha visto en este tutorial?
-- como borrar procedures si existen
