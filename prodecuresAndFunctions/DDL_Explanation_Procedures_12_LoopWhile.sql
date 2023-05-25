/* WHILE LOOP */
USE storedProcedures;

CREATE TABLE calendars (
    id INTEGER AUTO_INCREMENT,
    fullDate DATE UNIQUE,
    day TINYINT NOT NULL,
    month TINYINT NOT NULL,
    quarter TINYINT NOT NULL,
    year INTEGER NOT NULL,
    PRIMARY KEY (id)
);

-- Crea un procedimiento llamado insertCalendar que inserte un nuevo día en la tabla calendars
DELIMITER $$
CREATE PROCEDURE insertCalendar(in fecha date)
BEGIN

insert INTO calendars(fulldate, day, month, quarter, year)
values(fecha, day(fecha), month(fecha), quarter(fecha), year(fecha));

END$$

delimiter ;

-- Inserta en la tabla calendars la fecha de hoy
call insertCalendar(curdate());

-- Muestra los valores de la tabla calendars
SELECT * FROM calendars;

/* 
Crea  un procedimiento llamado loadCalendars que permita insertar la cantidad de fechas que indique 
el usuario a partir de una fecha que también indicará el usuario. Para insertar los días en la tabla
calendars ha de utilizarse el procedimiento insertCalendar.
NOTA. Para incrementar fecha puedes utilizar la función ADD_DATE
*/
DELIMITER $$
create procedure loadCalendars(in fecha date, in numDias integer)
BEGIN
declare contador integer default 0;

	while (contador < numDias) do
		-- insertamos la fecha
		call insertCalendar(fecha);
        -- añade un dia a fecha
        set fecha = date_add(fecha, interval 1 day);
        -- sumamos +1 al contador
        set contador = contador +1;
	end while;
    
END $$
DELIMITER ;

drop procedure loadCalendars;

-- Inserta 10 días en la tabla calendars desde 01-01-2023
call loadCalendars('2023-01-01', 10);

-- Muestra los valores de la tabla calendars
select * from calendars;