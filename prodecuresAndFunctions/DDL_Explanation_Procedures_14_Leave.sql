/* LEAVE */
USE storedProcedures;

select * from customers order by customerNumber;

-- Crea un procedimiento llamado checkCustomer  que compruebe si un cliente aparece en la tabla
-- customers y si el cliente no existe muestre un mensaje y salga del procedimiento
DELIMITER $$
CREATE PROCEDURE checkCustomer(IN cliente INTEGER)
bucle1:BEGIN
	DECLARE numVecesCliente INTEGER;
    
    SELECT 
		COUNT(*)
	INTO numVecesCliente FROM
		customers
	WHERE
		customerNumber = cliente;
        
	IF numVecesCliente = 0 THEN 
		SELECT 'El cliente no existe';
		LEAVE bucle1;
    END IF;
END$$

DELIMITER ;

-- Busca el cliente con customerNumber 114
CALL checkCustomer(114);

-- Busca el cliente con customerNumber 100
CALL checkCustomer(100);

-- Crea un procedimiento que se llame leaveDemo que devuelva una cadena de caracteres desde el 1
-- hasta un número aleatorio entre el 4 y el 10. Utiliza la sentencia LOOP para hacer este ejecicio
-- NOTA. Utiliza las funciones FLOOP y RAND para poder obtener el límite superior de la cadena de caracteres.
DELIMITER $$
CREATE PROCEDURE leaveDemo(OUT resultado VARCHAR(100))
BEGIN
	DECLARE contador INTEGER DEFAULT 1;
    DECLARE limSuperior INTEGER DEFAULT 0;
    
    SET limSuperior = FLOOR(RAND()*(10 - 4 + 1) + 4);
    SET resultado = '';
    
    iteraciones:LOOP
		SET resultado = CONCAT(resultado, contador, ',');
        
        IF CONTADOR = limSuperior THEN
			LEAVE iteraciones;
        END IF;
        
        SET contador = contador + 1;
    END LOOP;
END$$

DELIMITER ;

-- Llama al procedimiento leaveDemo varias veces y comprueba que cada vez da un límite superior
CALL leaveDemo(@resultado);
SELECT @resultado;
CALL leaveDemo(@resultado);
SELECT @resultado;
CALL leaveDemo(@resultado);
SELECT @resultado;
CALL leaveDemo(@resultado);
SELECT @resultado;

-- ¿En qué bucles se puede utilizar la sentencia LEAVE?
-- En LOOP, WHILE y REPEAT