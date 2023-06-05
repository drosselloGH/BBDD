drop trigger trigger_guardar_alumnos_eliminados;
drop table log_alumnos_eliminados;

create table log_alumnos_eliminados(
	id integer auto_increment primary key,
    id_alumnos integer,
    fecha_hora datetime,
    nombre varchar(50),
    apellido1 varchar(50),
    apellido2 varchar(50),
    email varchar(255)
);

delimiter $$
create trigger trigger_guardar_alumnos_eliminados
after delete on alumnos
for each row
	begin
		insert into log_alumnos_eliminados(id_alumnos, fecha_hora, nombre, apellido1, apellido2, email)
        values (old.id, now(), old.nombre, old.apellido1, old.apellido2, old.email);
    end $$
delimiter ;

select * from alumnos;
select * from log_alumnos_eliminados;

delete from alumnos where id = 1;