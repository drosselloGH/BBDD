/* CURSORES */
USE storedProcedures;

/* ¿Qué significa que los cursores son sólo-lectura, no-desplazable y no-sensible?
	- Solo-lectura: los datos que obtengamos de la consulta no se pueden actualizar desde el cursor
    - no-desplazable: sólo se pueden obtener las filas en el orden determinado por el cursor (la consulta SELECT)
    - no-sensible: hay dos tipos de curspres en SQL: sensibles y no-sensibles:
			- insensible: trabaja sobre los datos reales de las tablas
			- no-sensible: trabaja sobre una tabla teporal con los datos
*/

-- Obtener los emails de todos los empleados de la tabla employees. Muestra sólo los emails.
select email from employees;
    
-- Crea un procedimiento llamado createEmailList que cree una lista de email de los empleados de la tabla
-- employees. Este procedimiento debe devolver la lista de emails separados por puntos y comas.
DELIMITER $$
CREATE PROCEDURE createEmailList(out listado varchar(4000))
BEGIN
-- aqui metemos cada correo, temporalmente
declare correo varchar(255) default "";
-- fin de la tabla
declare finished integer default 0;

-- este cursor apunta a los emails
declare cur_Email cursor for select email from employees;

-- manejador: cuando encuentre not fount, haga que finished = 1
declare continue handler for not found set finished = 1;
	set listado = "";
    -- abrimos el cursor
    open cur_Email;
    bucleListado: loop
		fetch cur_Email into correo;
		set listado = concat(correo, ';', listado);
		if(finished = 1) then
			leave bucleListado;
		end if;
	end loop;
    close cur_Email;
select listado;
END $$
DELIMITER ;

-- Crea la lista de email utilizando el procedimiento createEmailList
call createEmailList(@listado);