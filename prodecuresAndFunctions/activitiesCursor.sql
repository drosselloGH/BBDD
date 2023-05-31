CREATE SCHEMA IF NOT EXISTS test;
USE test;

CREATE TABLE alumno (
    id INTEGER UNSIGNED PRIMARY KEY,
    nombre VARCHAR(25),
    apellido1 VARCHAR(50),
    apellido2 VARCHAR(50),
    fecha_nacimiento DATE
);

INSERT alumno(id, nombre, apellido1, apellido2, fecha_nacimiento)
VALUES 
	(1, 'Belen','Laserna','Belenguer', '2022-02-02'),
    (2, 'Elena','Nito','DelBosque', '1986-05-04'),
    (3, 'Maria','De la O','Curvada', '1954-08-20'),
    (4, 'Juan','Nadie','Meconoce', '1945-01-01');
    
SELECT * FROM alumno;

ALTER TABLE alumno ADD COLUMN edad integer;

DROP PROCEDURE calcular_edad;

DELIMITER $$
CREATE PROCEDURE calcular_edad(IN fecha DATE, OUT numAnyos INTEGER)
BEGIN
    SET numAnyos = timestampdiff(year, fecha, curdate());
END$$

DELIMITER ;

CALL calcular_edad('2005-05-30', @edad);
SELECT @edad;

DROP PROCEDURE actualizar_columna_edad;

DELIMITER $$
CREATE PROCEDURE actualizar_columna_edad()
BEGIN
    DECLARE var_fecha DATE;
    DECLARE finalizado INTEGER DEFAULT 0;
    DECLARE var_edad INTEGER DEFAULT 0;
    
    DECLARE cur_fechas cursor for
		SELECT DISTINCT
			fecha_nacimiento
		FROM
			alumno;
        
	DECLARE CONTINUE HANDLER FOR not found 
		SET finalizado = 1;
        
	OPEN cur_fechas;
		bucle: LOOP 
			FETCH cur_fechas INTO var_fecha;
            
            IF (finalizado = 1) THEN
				LEAVE bucle;
			END IF;
            
            CALL calcular_edad(var_fecha, var_edad);
            
            UPDATE alumno 
			SET 
				edad = var_edad
			WHERE
				fecha_nacimiento = var_fecha;
			END LOOP;
    CLOSE cur_fechas;
END$$

DELIMITER ;

CALL actualizar_columna_edad();
SELECT * FROM alumno;