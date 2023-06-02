use test;

alter table alumno rename to alumnos;

alter table alumnos drop column edad;
alter table alumnos drop column email;

alter table alumnos add column nota integer;

alter table alumnos drop column fecha_nacimiento;

delimiter $$
create trigger trigger_check_nota_before_insert
before insert on alumnos
for each row
	begin
			if(new.nota < 0) then
				set new.nota = 0;
			elseif (new.nota > 10) then
				set new.nota = 10;
			end if;
	end $$
delimiter ;

delimiter $$
create trigger trigger_check_notas_before_update
before update on alumnos
for each row
	begin
			if(new.nota < 0) then
				set new.nota = 0;
			elseif (new.nota > 10) then
				set new.nota = 10;
			end if;
	end $$
delimiter ;

select * from alumnos;

insert into alumnos(id, nombre, apellido1, apellido2, nota)
values(7, "hola", "adios", "adios3", 2);

update alumnos set nota = 6 where id = 7;