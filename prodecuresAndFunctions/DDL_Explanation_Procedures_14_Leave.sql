/* LEAVE */
USE storedProcedures;

select * from customers order by customerNumber;

-- Crea un procedimiento llamado checkCustomer  que compruebe si un cliente aparece en la tabla
-- customers y si el cliente no existe muestre un mensaje y salga del procedimiento

select * from customers where customerNumber = 0;

DELIMITER $$
CREATE PROCEDURE checkCustomer(in cliente integer)
condicion:BEGIN

declare nombre varchar(100) default "";
declare mensaje varchar(20) default "";

select customerName into nombre from customers where customerNumber = cliente;

if(nombre is null or nombre = "") then
	set mensaje = "NO ESTÁ";
    select mensaje;
    LEAVE condicion;
else 
	set mensaje = "ESTÁ";
    select mensaje;
    LEAVE condicion;
end if;

END $$
DELIMITER ;

drop procedure checkCustomer;

-- Busca el cliente con customerNumber 114
call checkCustomer(103);

-- Busca el cliente con customerNumber 100
call checkCustomer(100);


-- Crea un procedimiento que se llame leaveDemo que devuelva una cadena de caracteres desde el 1
-- hasta un número aleatorio entre el 4 y el 10. Utiliza la sentencia LOOP para hacer este ejecicio
-- NOTA. Utiliza las funciones FLOOP y RAND para poder obtener el límite superior de la cadena de caracteres.
DELIMITER $$
CREATE PROCEDURE leaveDemo(out numeros varchar(50))
BEGIN
	declare numMax integer default 0;
	declare contador integer default 1;
    -- 0.5 * (max - min) + min
    -- FLOOR() redondea hacia abajo
    set numMax = FLOOR(rand()*10-4)+4;
    set numeros = "";
    iteraciones:LOOP
		if(contador = 1) then
			set numeros = concat(numeros, contador);
		else 
			set numeros = concat(numeros, ", ",contador);
		end if;
		if(contador = numMax) then
			leave iteraciones;
		end if;
		set contador = contador +1;
	end loop;
END $$
DELIMITER ;

drop procedure leaveDemo;

-- Llama al procedimiento leaveDemo varias veces y comprueba que cada vez da un límite superior
call leaveDemo(@numeros);
select @numeros;

-- ¿En qué bucles se puede utilizar la sentencia LEAVE?
-- En LOOP, WHILE y REPEAT