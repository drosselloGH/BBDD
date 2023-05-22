create schema if not exists prueba;

use prueba;

/*Escribe un procedimiento que reciba un número real de entrada y muestre un mensaje indicando si el número es positivo, negativo o cero.*/
DELIMITER $$
CREATE PROCEDURE esPositivo(in entrada integer)
BEGIN
declare mensaje varchar(15);
if entrada >= 0 then
	set mensaje = "positivo";
else 
	set mensaje = "negativo";
end if;

select mensaje;

END $$
DELIMITER ;

call esPositivo(-2);


/*Modifique el procedimiento diseñado en el ejercicio anterior para que tenga un parámetro de entrada, 
con el valor un número real, y un parámetro de salida, con una cadena de caracteres indicando si el número es positivo, negativo o cero.*/

drop procedure esPositivo;

DELIMITER $$
CREATE PROCEDURE esPositivo(in entrada integer, out resultado varchar(10))
BEGIN
if entrada > 0 then
	set resultado = "positivo";
elseif entrada < 0 then
	set resultado = "negativo";
else
	set resultado = "cero";
end if;
END $$
DELIMITER ;

call esPositivo(0, @resultado);

select @resultado;

/*Escribe un procedimiento que reciba un número real de entrada, que representa el valor de la nota de un alumno, 
y muestre un mensaje indicando qué nota ha obtenido teniendo en cuenta las siguientes condiciones:
			[0,5) = Insuficiente
			[5,6) = Aprobado
			[6, 7) = Bien
			[7, 9) = Notable
			[9, 10] = Sobresaliente
En cualquier otro caso la nota no será válida.
*/

DELIMITER $$
create procedure puntuacion(in nota integer, out resultado VARCHAR(15))
BEGIN
if(nota < 5) then
	set resultado = "Insuficiente";
elseif (nota >= 5 and nota < 6) then
	set resultado = "Aprobado";
elseif (nota >= 6 and nota < 7) then
	set resultado = "Bien";
elseif (nota >= 7 and nota < 9) then
	set resultado = "Notable";
else 
	set resultado = "Sobresaliente";
end if;
END $$
DELIMITER ;

call puntuacion(9, @resultado);

select @resultado;

/*Modifique el procedimiento diseñado en el ejercicio anterior para que tenga un parámetro de entrada,
 con el valor de la nota en formato numérico y un parámetro de salida, con una cadena de texto indicando la nota correspondiente.*/
 
 drop procedure puntuacion;
 
 DELIMITER $$
create procedure puntuacion(in nota integer, out nombre VARCHAR(15))
BEGIN 
if (nota = 0) then
	set nombre = "cero";
elseif (nota = 1) then 
	set nombre = "uno";
elseif nota = 2 then 
	set nombre = "dos";
elseif nota = 3 then 
	set nombre = "tres";
elseif nota = 4 then 
	set nombre = "cuatro";
elseif nota = 5 then 
	set nombre = "cinco";
elseif nota = 6 then
	set nombre = "seis";
elseif nota = 7 then 
	set nombre = "siete";
elseif nota = 8 then 
	set nombre = "ocho";
elseif nota = 9 then 
	set nombre = "nueve";
elseif nota = 10 then 
	set nombre = "diez";
end if;
END $$
DELIMITER ;

call puntuacion(1, @resultado);

select @resultado;

/*Resuelva el procedimiento diseñado en el ejercicio anterior haciendo uso de la estructura de control CASE.*/

drop procedure puntuacion;
 
 DELIMITER $$
create procedure puntuacion(in nota integer, out nombre VARCHAR(15))
BEGIN
CASE 
	WHEN nota = 0 then set nombre = "cero";
    WHEN nota = 1 then set nombre = "uno";
    WHEN nota = 2 then set nombre = "dos";
    WHEN nota = 3 then set nombre = "tres";
    WHEN nota = 4 then set nombre = "cuatro";
    WHEN nota = 5 then set nombre = "cinco";
    WHEN nota = 6 then set nombre = "seis";
    WHEN nota = 7 then set nombre = "siete";
    WHEN nota = 8 then set nombre = "ocho";
    WHEN nota = 9 then set nombre = "nueve";
    WHEN nota = 10 then set nombre = "diez";
end case;
END $$
DELIMITER ;

call puntuacion(10, @resultado);

select @resultado;

/*Escribe un procedimiento que reciba como parámetro de entrada un valor numérico que represente 
un día de la semana y que devuelva una cadena de caracteres con el nombre del día de la semana correspondiente. 
Por ejemplo, para el valor de entrada 1 debería devolver la cadena lunes.
Resuelva el procedimiento haciendo uso de la estructura de control IF.*/

DELIMITER $$
create procedure diaSemana(in dia integer, out nombre varchar(15))
BEGIN
	if dia = 1 then set nombre = "Lunes";
    elseif dia = 2 then set nombre = "Martes";
    elseif dia = 3 then set nombre = "Miércoles";
    elseif dia = 4 then set nombre = "Jueves";
    elseif dia = 5 then set nombre = "Viernes";
    elseif dia = 6 then set nombre = "Sábado";
    else set nombre = "Domingo";
end if;
END $$
DELIMITER ;

call diaSemana(1, @nombre);

select @nombre;

/*Resuelva el procedimiento diseñado en el ejercicio anterior haciendo uso de la estructura de control CASE.*/

drop procedure diaSemana;

DELIMITER $$
create procedure diaSemana(in dia integer, out nombre varchar(15))
BEGIN
CASE 
	when dia = 1 then set nombre = "Lunes";
    when dia = 2 then set nombre = "Martes";
    when dia = 3 then set nombre = "Miércoles";
    when dia = 4 then set nombre = "Jueves";
    when dia = 5 then set nombre = "Viernes";
    when dia = 6 then set nombre = "Sábado";
    when dia = 7 then set nombre = "Domingo";
end case;
END $$
DELIMITER ;

call diaSemana(7, @nombre);

select @nombre;