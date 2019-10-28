drop trigger if exists MonitoraBarco;

delimiter $$

create trigger MonitoraBarco BEFORE insert ON Reservas
  for each row 

  begin
	IF ((SELECT id_barco FROM Reservas WHERE devolucao IS NULL) AND new.id_barco = id_barco AND new.id_marin = id_marin) THEN
		signal sqlstate '45000' set MESSAGE_TEXT = 'Este barco está reservado';
	END IF;
  END; $$

delimiter ;
