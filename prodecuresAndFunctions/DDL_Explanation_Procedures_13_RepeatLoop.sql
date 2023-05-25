/* REPEAT LOOP */
USE storedProcedures;

-- Crea un procedimiento llamado repeatDemo que muestre en un mensaje los números del 1 al 9 concatenados
DELIMITER $$
CREATE PROCEDURE repeatDemo()
BEGIN
	declare num integer default 1;
	declare numeros varchar(50) default num;
		REPEAT
			set num = num +1;
			set numeros = concat(numeros, ", ", num);
		UNTIL num >= 9
		end repeat;
    select numeros;
END $$
DELIMITER ;

drop procedure repeatDemo;

-- Llama al procedimiento repeatDemo y comprueba el mensaje de salida
call repeatDemo();

