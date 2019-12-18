drop trigger if exists MonitoraBarco;
drop trigger if exists AtualizaBarco;

delimiter $$

create trigger MonitoraBarco BEFORE insert ON Reservas
  for each row 

  begin
	
	if (select recebido from Reservas where new.id_barco = id_barco and new.id_marin = id_marin) = 0 THEN 
	
		signal sqlstate '45000' set MESSAGE_TEXT = 'Este barco esta reservado';		
	end if;

  END; $$

delimiter ;


delimiter $$

create trigger AtualizaBarco before update ON Reservas
  for each row 

  begin
	
	if (select old.devolucao from Reservas where new.id_barco = id_barco and new.id_marin = id_marin) is null THEN 
	
		set new.recebido = 1;
	else
		set new.recebido = old.recebido;
	end if;

  END; $$

delimiter ;