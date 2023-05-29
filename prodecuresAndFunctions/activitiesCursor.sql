/*1*/
create schema if not exists test;

use test;

create table alumno(
id integer unsigned primary key,
name varchar(50) not null ,
surname1 varchar(50) not null,
surname2 varchar(50),
dateOfBirth date not null
);

insert into alumno(id, name, surname1, surname2, dateOfBirth)
VALUES(1, "Pepe", "Mayol", "Ramis", "2001-01-02"), 
(2, "Si", "Adios", "Ahola", "2011-03-01"),
(3, "jkabfñaf", "Ayuda", "apellido", "2003-11-23"),
(4, "Pepa", "Maagfaf", "ahbfasf", "2001-10-31");

select * from alumnos;

alter table alumnos add column edad integer;

DELIMITER $$
CREATE PROCEDURE calcular_edad(in fecha date, out numAnyos integer)
	BEGIN
		-- diferencia de años entre una fecha y otra, 
        -- 1r como queremos que nos devuelva el valor de la restar (month, year, day...)
		set numAnyos = timestampdiff(year, fecha, curdate());
	END $$
DELIMITER ;

drop procedure calcular_edad;
call calcular_edad('2005-05-30', @edad); 
select @edad;

/*parte 2*/
delimiter $$
create procedure actualizar_columna_edad()
	begin
        declare var_fecha date;
        declare finalizado integer default 0;
        -- cursor
		declare alumno cursor for select dateOfBirth from alumnos;
        declare continue handler for not found set finalizado = 1;
			open alumno;
				bucle: loop
					fetch alumno into var_id, var_fecha;
						if(finalizado = 1) then
							leave bucle;
						end if;
                        call calcular_edad(var_fecha, @edad);
                        update alumno set edad = @edad where id = var_id;
				end loop;
            close alumno;
	end $$
delimiter ;

call actualizar_columna_edad();
