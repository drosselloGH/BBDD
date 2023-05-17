/* MYSQL STORED PROCEDURE PARAMETERS */
USE storedProcedures;

/* PARÁMETROS DE ENTRADA (IN)*/
-- Crea una consulta que muestre todos los datos de las oficinas de USA
SELECT * FROM offices where country like "USA";
    
-- Crea una consulta que muestre todos los datos de las oficinas de France
SELECT * FROM offices where country like "France";
    
-- Crea una consulta que muestre todos los datos de las oficinas de Japan
SELECT * FROM offices where country like "Japan";
    
-- Crea un procedimiento que encuentre todos los datos de la oficinas de un país que se pasará como parámetro
DELIMITER $$
CREATE PROCEDURE getOfficeByCountry(in pais VARCHAR(50))
-- "in" indica parametro de entrada
BEGIN
SELECT * FROM offices where UPPER(country) like pais;
END $$
DELIMITER ;

-- Llama al procedimiento getOfficeByCountry para encontrar los datos de las oficinas de USA
call getOfficeByCountry("USA");

-- Llama al procedimiento getOfficeByCountry para encontrar los datos de las oficinas de France
call getOfficeByCountry("France");

-- Llama al procedimiento getOfficeByCountry sin pasar ningún argumento
call getOfficeByCountry();

-- ¿Qué indica el output?
-- Error Code: 1318. Incorrect number of arguments for PROCEDURE storedProcedures.getOfficeByCountry; expected 1, got 0

-- ¿Por qué nos devuelve esta respuesta?-
-- porque no se le ha pasado el parámetro esperado para ese procedimiento

/* PARÁMETROS DE SALIDA (OUT)*/
-- Crea una consulta que devuelva el número de pedidos en estado 'Shipped'
SELECT COUNT(*) cantPedidos FROM orders where UPPER(status) like "Shipped";
    
-- Almacena en un procedimiento al anterior consulta para que se le indique el estado a comprobar y devuelva 
-- el número de pedidos en dicho estado
DELIMITER $$
CREATE PROCEDURE getQtyProductsStatus(in estado VARCHAR(20), out total integer)
-- indicamos parametros de entrada y de salida
BEGIN
SELECT COUNT(*) into total /*donde salen los datos*/ FROM orders where UPPER(status) like upper(estado);
END $$
DELIMITER ;

drop procedure getProductsStatus;

-- Llama al procedimiento para obtener el número de pedidos en estado 'Shipped'
CALL getQtyProductsStatus("Shipped", @total);
-- se guarda el valor de lo que devuelve el procedimiento en @total
SELECT @total;

-- ¿Qué tipo de variable es @total?
-- Es una variable de sesión. Sólo se usa al abrir sesión

-- Llama al procedimiento para obtener el número de pedidos en estado 'Canceled'
CALL getQtyProductsStatus("Cancelled", @total);
select @total;


/* PARÁMETROS DE ENTRADA/SALIDA (INOUT)*/
-- Crea un procedimiento que tenga una parámetro de entrada/salida que incremente un contador
-- con el valor que se le pase como parámetro de entrada
delimiter $$
create procedure contador(inout cont Integer, in incr integer)
BEGIN
set cont = cont + incr;
END $$
delimiter ;

-- Llama al procedimiento contador para que le pasemos un contador con valor 1 y lo incremente en 1
set @contador = 1;
call contador(@contador, 1);
select @contador;

-- Llama al procedimiento setCounter para que al valor anterior lo incremente en 1
call contador(@contador, 1);
select @contador;

-- Llama al procedimiento setCounter para que al valor anterior lo incremente en 5
call contador(@contador, 5);
select @contador;

set @contador = 0;
-- se resetea el valor de la variable

-- ¿Qué se ha visto en este tutorial?
-- parametros de entrada/salida(INOUT)
-- parametros de entrada(IN)
-- parametros de salida(OUT)
-- llamar a un procedimiento con parámetros

