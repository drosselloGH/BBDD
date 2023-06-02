/* CREATE TRIGGER */
USE ejTriggers;

-- ¿Para que sirven los modificadores NEW y OLD?
-- diferencia los valores previos a la ejecucion triggerlas y los valores nuevos tras la ejecucion del trigger

-- Crea un trigger llamado before_employee_update que almacene los cambios realizados 
-- en la tabla employees en la tabla employees_audit;
delimiter $$
	create trigger before_employee_update
	-- cada vez que hagamos un update en esta tabla, se ejecutara el trigger
    before update on employees
    for each row
	begin
		insert into employees_audit(employeeNumber, lastName, changedat, action)
        values(OLD.employeeNumber, OLD.lastName, CURDATE(), "UPDATE");
	end $$
delimiter ;

-- Muestra los trigger en la BD ejTriggers;
SHOW TRIGGERS;

-- Modifica el apellido de un empleado en la tabla employees
update employees set lastName = "xxx" where employeeNumber = 1088;
    
-- Comprueba que se ha insertado una fila en la tabla employees_audit con 
-- la  modificación realizada
