/*ejer 2*/
alter table alumno add column email varchar(255);

drop procedure crear_email;

delimiter $$
create procedure crear_email(in nombre varchar(259), in apellido1 varchar(50), in apellido2 varchar(50), in dominio varchar(50), out email varchar(255))
	begin
		-- separa las columnas (nombre, desde donde empezar, donde acabar)
		set email = concat(substring(nombre, 1, 1), substring(apellido1, 1, 3), substring(apellido2, 1, 3), "@", dominio);
	end $$
delimiter ;

call crear_email('Daniel', "Rosselló", "Oliver", "jkabfñkaf", @email);

select @email;

delimiter $$
create procedure actualizar_columna_email()
	begin
		declare var_email varchar(255) default "";
        declare var_id integer default 0;
        declare var_nombres varchar(50) default "";
        declare var_apellido1 varchar(50) default "";
        declare var_apellido2 varchar(50) default "";
        declare finalizado integer default 0;
        
        declare cur_alumnos cursor for select id, nombre, apellido1, apellido2 from alumno;
        
        declare continue handler for not found set finalizado = 1;
        
        open cur_alumnos;
			bucle: loop
				fetch cur_alumnos into var_id, var_nombre, var_apellido1, var_apellido2;
                
                if (finalizado = 1) then
					leave bucle;
				end if;
                
                call crear_email(var_nombre, var_apellido1, var_apellido2, "bfbafafb.com", var_email);
                
                insert into alumnos(id, email) values (var_id, var_email) on duplicate key update id = var_id, email = var_email;
			end loop;
                
                
                
        close cur_alumnos;
	end $$
delimiter ;
