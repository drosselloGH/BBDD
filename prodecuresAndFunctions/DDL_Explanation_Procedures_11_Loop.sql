/* LOOP */
USE storedProcedures;

-- Crea un procedimiento que devuelva un mensaje con los número pares desde el 2 al 10 (sin incluir el 10)
DELIMITER  $$
CREATE PROCEDURE loopDemo()
BEGIN
DECLARE contador integer default 2;
declare numeros varchar(50) default "";
contador: loop
	if contador < 10 then
		if contador = 2 then
			set numeros = concat(numeros, contador);
		else 
			set numeros = concat(numeros,', ' ,contador);
		end if;
		set contador = contador +2;            
	ELSE
		leave contador;
	END IF;
end loop;
    
select numeros;		
		
END $$
DELIMITER ;

drop procedure loopDemo;

-- Llama al procedimiento loopDemo
CALL loopDemo();