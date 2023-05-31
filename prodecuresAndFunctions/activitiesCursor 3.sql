DELIMITER $$
CREATE PROCEDURE crear_lista_emails_alumnos(out listaEmails varchar(255))
begin
	declare var_email varchar(255) default "";
    declare finalizado integer default 0;
    
    declare cursor_emails cursor for select email from alumno;
    
    declare continue handler for not found set finalizado = 1;
    
    -- hay que declarar
    set listaEmails = "";
    
    open cursor_emails;
		bucle: loop
			fetch cursor_emails into var_email;
            
            if(finalizado = 1) then
				leave bucle;
			end if;
            
            set listaEmails = concat(listaEmails, var_email, ";");
            
		end loop;
	close cursor_emails;
        
end $$
DELIMITER ;

drop procedure crear_lista_emails_alumnos;

select email from alumno;

call crear_lista_emails_alumnos(@listaEmails);

select @listaEmails;