/* STORED PROCEDURE VARIABLES */
USE storedProcedures;

-- Crea una consulta que permita contar el número total de pedidos
SELECT COUNT(*) total FROM orders;

-- Crea un procedimiento llamado getTotalOrder que permita contar el número total de pedidos
-- Para ello utiliza una variable que permita almacenar el valor de la consulta y otra variable diferente al que se 
-- le asignará el valor de la consulta más 10

DELIMITER $$
CREATE PROCEDURE getTotalOrder()
BEGIN
DECLARE total, totalIncr integer default 0;
-- recomendable usar el default

SELECT COUNT(*) into total FROM orders;

set totalIncr = total + 10;

select total;
-- mostramos el total

select totalIncr;
-- mostramos el total incrementado

END $$
DELIMITER ;

drop procedure getTotalOrder;

-- Llama al procedimiento getTotalOrder
call getTotalOrder();
