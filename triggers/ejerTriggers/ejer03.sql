
create table log_alumnos_eliminados(
id integer auto_increment primary key,
id_alumno integer,
fecha_hora datetime,
nombre varchar(50),
apellido1 varchar(50),
apellido2 varchar(50),
email varchar(255)
);

select now();

delimiter $$
create trigger trigger_guardar_alumnos_eliminados
after delete on alumnos
for each row
	begin
		insert into log_alumnos_eliminados(id_alumno, fecha_hora, nombre, apellido1, apellido2, email)
        values (old.id, now(), old.nombre, old.apellido1, old.apellido2, old.email);
	end $$
delimiter ;

select * from alumnos;
select * from log_alumnos_eliminados;

delete from alumnos where id = 4;