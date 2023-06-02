/* AFTER UPDATE TRIGGER */
USE ejTriggers;

-- ¿Qué valores puedes modificar en un trigger después de una modificación?
-- los nuevos(new)

/* Inserta los siguientes valores en la tabla sales:
	VENTA 1:
		- producto: '2001 Ferrari Enzo'
        - cantidad: 140
        - año fiscal: 2021
        - mes fiscal: 1
	VENTA 2:
		- producto: '1998 Chrysler Plymouth Prowler'
        - cantidad: 110
        - año fiscal: 2021
        - mes fiscal: 1
	VENTA 3:
		- producto: '1913 Ford Model T Speedster'
        - cantidad: 120
        - año fiscal: 2021
        - mes fiscal: 1
*/

insert into sales(product, quantity, fiscalYear, fiscalMonth)
VALUES ("2001 Ferrari Enzo", 140, 2021, 1), 
("1998 Chryslet Plymouth Prowler", 110, 2021, 1), 
("1913 Ford Model T Speedster", 120, 2021, 1);

select * from sales;
    
-- Crea un trigger llamado after_sales_update en la tabla sales que guarde un log de los
-- cambios en la tabla SalesChanges cada vez que se modifique una fila del tabla sales
delimiter $$
create trigger after_sales_update
after update on sales
for each row
	begin 
		insert into SalesChanges(salesId, beforeQuantity, afterQuantity, changedAt)
        values(new.id, old.quantity, new.quantity, now());
	end $$
delimiter ;

-- Modifica la venta con id 1 para que la cantidad sea 350
update sales set quantity = 350 where id = 2;
select * from SalesChanges;
select * from sales;
    
-- Comprueba que se ha almacenado en log en la tabla SalesChanges
drop trigger after_sales_update;
    
-- Modifica todas las filas de la tabla sales e incrementa la cantidad
-- en un 10%
update sales set quantity = quantity * 1.10;

select * from SalesChanges;
select * from sales;

-- Comprueba que se han almacenado los logs de todas las modificaciones en 
-- la tabla SalesChanges
