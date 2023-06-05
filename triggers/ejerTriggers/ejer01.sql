use test;

alter table alumnos add column nota integer;

delete from alumnos;

select * from alumnos;

insert into alumnos(id, nombre, apellido1, apellido2, fechaNacimiento, nota)
values(2, "Daniel", "Rosselló", "Oliver", "2001/12/19", 12);

drop trigger trigger_check_nota_before_insert;

delimiter $$
create trigger trigger_check_nota_before_insert
before insert on alumnos
for each row
begin
	if(new.nota < 0) then
		set new.nota = 0;
	elseif(new.nota > 10) then
		set new.nota = 10;
	end if;
end $$
delimiter ;

insert into alumnos(id, nombre, apellido1, apellido2, fechaNacimiento, nota)
values(1, "Andrés", "Rosselló", "Oliver", "1994/08/27", -3);

delimiter $$
create trigger trigger_check_nota_before_update
before update on alumnos
for each row
	begin
		if(new.nota < 0) then
			set new.nota = 0;
		elseif(new.nota > 10) then
			set new.nota = 10;
		end if;
	end $$
delimiter ;

update alumnos set nota = 13 where id = 1;

