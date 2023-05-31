/* CURSORES EJ2 */
USE test;
ALTER TABLE alumno add column email varchar(255);

DROP PROCEDURE crear_email;

DELIMITER $$
CREATE PROCEDURE crear_email(
	IN nombre VARCHAR(25),
    IN apellido1 VARCHAR(50),
    IN apellido2 VARCHAR(50),
    IN dominio VARCHAR(50),
    OUT email VARCHAR(255)
)
BEGIN
	SET email = CONCAT(substring(nombre,1,1), substring(apellido1,1,3), substring(apellido2,1,3),'@',dominio);
END$$

DELIMITER ;

call crear_email('Belen', 'Laserna', 'Belenguer', 'iessonferrer.net', @email);

DROP PROCEDURE actualizar_columna_email;

DELIMITER $$
CREATE PROCEDURE actualizar_columna_email()
BEGIN
	DECLARE var_email VARCHAR(255) DEFAULT '';
    DECLARE var_id INTEGER DEFAULT 0;
    DECLARE var_nombres VARCHAR(50) DEFAULT '';
    DECLARE var_apellido1 VARCHAR(70) DEFAULT '';
    DECLARE var_apellido2 VARCHAR(70) DEFAULT '';
    DECLARE finalizada INTEGER DEFAULT 0;
    
    DECLARE cur_alumnos CURSOR FOR
		SELECT id, nombre, apellido1, apellido1 FROM alumno;
        
	DECLARE CONTINUE HANDLER FOR NOT FOUND 
		SET finalizada = 1;
        
	OPEN cur_alumnos;
		
	bucle: LOOP
		FETCH cur_alumnos INTO var_id, var_nombres, var_apellido1, var_apellido2;
        
        IF (finalizada = 1) THEN
			LEAVE bucle;
		END IF;
        
        CALL crear_email(var_nombres, var_apellido1, var_apellido2, 'iessonferrer.net', var_email);
        
        INSERT INTO alumno(id, email)
		VALUES 	(var_id, var_email) ON DUPLICATE KEY UPDATE id=var_id, email=var_email;
	END LOOP;
    
    CLOSE cur_alumnos;
END$$

DELIMITER ;

CALL actualizar_columna_email();
SELECT 
    *
FROM
    alumno;
