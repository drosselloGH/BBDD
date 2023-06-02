/* DROP TRIGGER */
USE ejTriggers;

-- ¿Qué privilegios se necesitan tener para borrar un trigger?
-- create trigger

-- Crea un trigger llamado before_billings_update asociado a la tabla billing que lance un mensaje
-- si al modificar una cantidad es más de 10 veces superior a la cantida actual.
delimiter $$
create trigger before_billings_update
before update on billings
for each row
	begin
    declare mensaje varchar(255) default "La cantidad es mas de 10 veces superior a la cantidad actual";
		-- si se cumple esta condicion
        -- cuando no queremos que se ejcute el update
		if(NEW.amount > (OLD.amount*10)) then
			-- lanzamos este error
            -- numero del error (error generico)
			signal sqlstate "45000"
				-- mostramos el mensaje de error
				set message_text = mensaje;
		end if;  
    end $$
delimiter ;
 
-- Muestra los triggers de la BD

-- Borra el trigger before_billings_update
drop trigger before_billings_update;

-- Muestra los triggers de la BD
show triggers;


-- demostrar como funciona el trigger
insert billings(billingNo, customerNo, billingDate, amount)
values(1456, 1456, "2023-06-01", 30);

select * from billings;

update billings set amount = 310 where billingNo = 1456;