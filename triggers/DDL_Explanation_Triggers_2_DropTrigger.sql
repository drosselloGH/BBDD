/* DROP TRIGGER */
USE ejTriggers;

-- ¿Qué privilegios se necesitan tener para borrar un trigger?
-- create trigger

-- Crea un trigger llamado before_billings_update asociado a la tabla billing que lance un mensaje
-- si al modificar una cantidad es más de 10 veces superior a la cantida actual.
delimiter $$
create trigger before_billing_update
before update on billings
for each row
	begin
    declare mensaje varchar(255) default "";
		if(NEW.amount > (OLD.amount*10)) then
			set mensaje = "La cantidad es mas de 10 veces superior a la cantidad actual";
		end if;  
    end $$
delimiter ;
 
-- Muestra los triggers de la BD


-- Borra el trigger before_billings_update
drop trigger before_billings_update

-- Muestra los triggers de la BD
