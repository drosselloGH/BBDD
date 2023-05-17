/* ALTER STORED PROCEDURE */
USE storedProcedures;

-- Crea una consulta que devuelva la cantidad total de todas la ventas
SELECT quantityOrdered * priceEach as cantDinero FROM orderdetails;
select sum(cantDinero) totalDinero from (SELECT quantityOrdered * priceEach as cantDinero FROM orderdetails) as t1;
    
-- Crea un procedimiento que guarde la consulta enterior
DELIMITER $$
create procedure getOrderAmount()
BEGIN
select sum(cantDinero) totalDinero from (SELECT quantityOrdered * priceEach as cantDinero FROM orderdetails) as t1;
END $$
DELIMITER ;

-- Crea una consulta que permita obtener la cantidad total para el pedido 10110
SELECT sum(quantityOrdered * priceEach) total FROM orderdetails where orderNumber = 10110;
    
-- Modifica el procedimiento getOrderAmount para que pueda pasarse como parámetro de entrada el número de pedido
-- del que se desea el total

-- no se puede alterar directamente, hay que borrarlo y crearlo de nuevo, modificado.

drop procedure getOrderAmount;

DELIMITER $$
create procedure getOrderAmount(in p_orderNumber integer)
BEGIN
SELECT sum(quantityOrdered * priceEach) total FROM orderdetails where orderNumber = p_orderNumber;
END $$
DELIMITER ;

call getOrderAmount(10110);

-- ¿Cuál es el proceso para modificar un procedimiento?
-- borrarlo primero y luego volver a crearlo, con los cambios necesarioscontador

-- click derecho sobre el procedimiento --> copy to clipboard --> create statement --> pegar
