/* CASE STATEMENT */
USE storedProcedure;

/* SIMPLE CASE STATEMENT */

-- crear prodecimiento getCustomerShipping que devuelva el pais de un cliente dado su numerod de cliente

SELECT * FROM customers;

SELECT country from customers where customerNumber = 112;

DELIMITER $$
CREATE PROCEDURE getCustomerShipping(in numCliente integer, out pais VARCHAR(50))
BEGIN
SELECT country into pais from customers where customerNumber = numCliente;
END$$

DELIMITER ;

call getCustomerShipping(103, @pais);
select @pais;


/* Modificar el procedimento llamado getCustomerShipping para gestionar el tiempo de envío de los pedidos.
El procedimiento ha de devolver para el cliente indicado lo siquiente:
		- '2-day shipping', si el cliente es de USA,
        - '3-day shipping', si el cliente es de Canada
*/
drop procedure getCustomerShipping;

DELIMITER $$
CREATE PROCEDURE getCustomerShipping(in numCliente integer, out tiempoEnvio VARCHAR(50))
BEGIN
declare pais varchar(50) default null;
SELECT country into pais from customers where customerNumber = numCliente;

case pais
	when "USA" then set tiempoEnvio = "2-day shipping";
    when "Canada" then set tiempoEnvio = "3-day shipping";
end case;
END$$

DELIMITER ;


-- Obtener el tiempo de envío para el cliente 112
call getCustomerShipping(112, @shipping);
select @shipping;

-- ¿Qué valor tiene la variable @shipping?
select @shipping;

-- Obtener el tiempo de envío para el cliente 103.
call getCustomerShipping(103, @shipping);
select @shipping;

-- ¿Qué valor tiene la variable @shipping?
select @shipping;
-- el de la consulta anterior

-- ¿Qué respuesta se obtiene en el output en el caso del cliente 103? ¿Por qué es debido?
-- Error Code: 1339. Case not found for CASE statement
-- porque el pais del cliente 103 no se encuentra en ninugno de los casos definidos en la sentencia CASE

-- Modifica el procedimiento getCustomerShipping para que además de los valores que ya devuelve,
-- devuelva también '5-day Shipping' en el resto de casos no contemplados
drop procedure getCustomerShipping;

DELIMITER $$
CREATE PROCEDURE getCustomerShipping(in numCliente integer, out tiempoEnvio VARCHAR(50))
BEGIN
declare pais varchar(50) default null;
SELECT country into pais from customers where customerNumber = numCliente;

case pais
	when "USA" then set tiempoEnvio = "2-day shipping";
    when "Canada" then set tiempoEnvio = "3-day shipping";
    else set tiempoEnvio = "5-day shipping";
end case;
END$$

DELIMITER ;


-- Obtener el tiempo de envío para el cliente 103.
call getCustomerShipping(103, @shipping);
select @shipping;


-- ¿Qué respuesta devuelve el output en este caso?
-- 1 row(s) returned

-- ¿Qué valor tiene la variable @shipping?
select @shipping;

/* SEARCHED CASE STATEMENT */
/* Crea un procedimiento llamado getDeliveryStatus que devuelva el estado de entrega de un pedido. Los estados de entrega serán:
		- 'On time', si llega con 0 días de retraso,
        - 'Late', si llega entre 1 y 5 días de retraso,
        - 'Very Late', si llega con 5 o más días de retraso,
        - 'No information', para cualquier otro caso.
	Para saber los días retraso hace falta calculas el tiempo transcurrido entre la fecha de envío (shippedDate) y la fecha esperada
    (requiredDate).
*/

select datediff(requiredDate, shippedDate) dias from orders;

DELIMITER $$
create procedure getDeliveryStatus(in pedido integer, out estadoEntrega varchar(20))
BEGIN
declare diasPasados integer default 0; 
select datediff(requiredDate, shippedDate) dias into diasPasados from orders where orderNumber = pedido;
case 
	when diasPasados = 0 then set estadoEntrega = "On time";
    when diasPasados >= 1 and diasPasados <= 5 then set estadoEntrega = "Late";
    when diasPasados > 5 then set estadoEntrega = "Very late";
    else set estadoEntrega = "No information";
end case;
END$$

DELIMITER ;

drop procedure getDeliveryStatus;

-- Muestra el estado de envío del pedido 10100
call getDeliveryStatus(10100, @estadoEntrega);
select @estadoEntrega;