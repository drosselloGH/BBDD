 /* IF STATEMENT */
USE storedProcedures;

-- Obtener todos los clientes que tiene un límite de crédito superior a 50000. Muestra sólo el número 
-- de cliente y el límite de crédito. Ordénalo de mayor a menor crédito.
SELECT customerNumber, creditLimit from customers where creditLimit > 50000 order by creditLimit DESC;
    
-- Obtener todos los clientes que tiene un límite de crédito se encuentre entre 10000 y 50000 (50000 inlcuido). 
-- Muestra sólo el número de cliente y el límite de crédito. Ordénalo de mayor a menor crédito.
select customerNumber, creditLimit from customers where creditLimit Between 10000.01 and 50000 ORDER BY creditLimit DESC;

-- Obtener todos los clientes que tiene un límite de crédito sea inferior o igual a 10000. 
-- Muestra sólo el número de cliente y el límite de crédito. Ordénalo de mayor a menor crédito.
select customerNumber, creditLimit from customers where creditLimit <= 10000 order by creditLimit DESC
    
-- crear procedimiento "getCustomerLevel" que dado un numero de cliente devuelva el credito de ese cliente
DELIMITER $$
create procedure getCustomerLevel(in numero int, out credito decimal(10,2))
begin
select creditLimit into credito from customers where customerNumber = numero;
end $$
DELIMITER ;

call getCustomerLevel(121, @credito);
select @credito;
    
-- Modifica el procedimiento llamado getCustomerLevel para comprobar el nivel de crédito de un cliente. 
-- El procedimiento ha de devolver la palabra 'PLATINUM' si dado un cliente este tiene un límite de 
-- crédito superior a 50000.
DELIMITER $$
create procedure getCustomerLevel(in cliente int, out level varchar(15))
begin
declare credito decimal (10, 2) default 0.0;
SELECT 
    creditLimit into credito
FROM
    customers
WHERE
    customerNumber = cliente;

if(credito > 50000) then 

	set level = "PLATINUM";
END IF;

end $$
DELIMITER ;

drop procedure getCustomerLevel;

-- Utiliza el procedimiento getCustomerLevel para comprobar el nivel de crédito del cliente 141
call getCustomerLevel(141, @nivel);
select @nivel;

-- Utiliza el procedimiento getCustomerLevel para comprobar el nivel de crédito del cliente 447
call getCustomerLevel(447, @nivel);
select @nivel;

-- Modifica el procedimiento getCustomerLevel para que devuelva 'PLATINUM' si el crédito del cliente
-- es superior a 50000 y 'NO PLATINUM' en el resto de casos
drop procedure getCustomerLevel;

DELIMITER $$
create procedure getCustomerLevel(in cliente int, out level varchar(15))
begin
declare credito decimal (10, 2) default 0.0;
SELECT 
    creditLimit into credito
FROM
    customers
WHERE
    customerNumber = cliente;

if(credito > 50000) then 

	set level = "PLATINUM";
else
	set level = "NO PLATINO";
END IF;

end $$
DELIMITER ;

-- Utiliza el procedimiento getCustomerLevel para comprobar el nivel de crédito del cliente 141
call getCustomerLevel(141, @nivel);
select @nivel;

-- Utiliza el procedimiento getCustomerLevel para comprobar el nivel de crédito del cliente 447
call getCustomerLevel(447, @nivel);
select @nivel;

/* Modifica el procedimiento getCustomerLevel para que devuelva:
		- 'PLATINUM', si el crédito del cliente es superior a 50000,
        - 'GOLD', si el crédito del cliente está entre 10000 y 50000 (sólo el 50000 incluido),
        - 'SILVER', para el resto de casos
*/


-- Utiliza el procedimiento getCustomerLevel para comprobar el nivel de crédito del cliente 141


-- Utiliza el procedimiento getCustomerLevel para comprobar el nivel de crédito del cliente 447


-- Utiliza el procedimiento getCustomerLevel para comprobar el nivel de crédito del cliente 125
