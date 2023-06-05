drop trigger trigger_guardar_email_before_insert;

select * from alumnos;

delimiter $$
create trigger trigger_crear_email_before_insert
before insert on alumnos
for each row
	condicion: begin
		if(new.email is null) then
			call crear_email(new.nombre, new.apellido1, new.apellido2, "iessonferrer.net", new.email);
		elseif(new.email is not null) then
			leave condicion;
		end if;
	end $$
delimiter ;

insert into alumnos(id, nombre, apellido1, apellido2, fechaNacimiento, nota)
values(3, "Hola", "apellido", "otroapellido", "1999/01/01", 6);

insert into alumnos(id, nombre, apellido1, apellido2, fechaNacimiento, email, nota)
values(4, "Adios", "apellido", "otroapellido", "1999/01/01", "holaamifoscomoestan", 6);

insert into alumnos(id, nombre, apellido1, apellido2, fechaNacimiento, email, nota)
values(5, "siu", "messi", "piedrasderiño", "1999/01/01", "drossrotzank@coñooooo", 9);

create table log_cambios_email(
id integer auto_increment primary key,
id_alumno integer,
fecha_hora date,
old_email varchar(255),
new_email varchar(255)
);

drop table log_cambios_email;
select * from log_cambios_email;

drop trigger trigger_guardar_email_after_update;

delimiter $$
create trigger trigger_guardar_email_after_update
after update on alumnos
for each row
	begin
		insert into log_cambios_email(id_alumno, fecha_hora, old_email, new_email)
        values (new.id, now(), old.email, new.email);
	end $$
delimiter ;

update alumnos set email = "drosseselmejor@.com" where id = 5;