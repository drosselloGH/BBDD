/*1*/
create schema if not exists test;

use test;

create table alumnos(
id integer primary key,
name varchar(50) not null ,
surname1 varchar(50) not null,
surname2 varchar(50),
dateOfBirth date not null
);

alter table alumnos
add column age integer not null;

alter table alumnos drop column age;

insert into alumnos(id, name, surname1, surname2, dateOfBirth)
VALUES(1, "Pepe", "Mayol", "Ramis", "2001-01-02"), 
(2, "Si", "Adios", "Ahola", "2011-03-01"),
(3, "jkabfñaf", "Ayuda", "apellido", "2003-11-23"),
(4, "Pepa", "Maagfaf", "ahbfasf", "2001-10-31"),
(5, "No", "hola", "saludos", "2000-04-18");

select * from alumnos;

DELIMITER $$
CREATE PROCEDURE calcular_edad(in fecha date, out edades varchar(100))
BEGIN

declare edad varchar(10) default "";

declare finished integer default 0;

-- declaramos el cursor
declare cur_Edades cursor for 
	select age from alumnos;
    
-- manejador: cuando encuentre not fount, haga que finished = 1
declare continue handler for not found set finished = 1;

set edades = "";

open cur_Edades;

	bucleListado: loop
		fetch  cur_Edades into edad;
		set edades = concat();
		
		if(finished = 1) then
			leave bucleListado;
		end if;
		
	end loop;
	
    
END $$
DELIMITER ;
