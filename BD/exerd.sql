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
drop trigger if exists MonitoraBarco;



delimiter $$

create trigger MonitoraBarco BEFORE insert ON Reservas
  for each row 

  begin
<<<<<<< HEAD
	if (select IFNULL(devolucao,1) from Reservas where 101 = id_barco) = 1 THEN 
		
		signal sqlstate '45000' set MESSAGE_TEXT = 'Este barco está reservado';		
	end if;
=======
	IF ((SELECT id_barco FROM Reservas WHERE devolucao IS NULL) AND new.id_barco = id_barco AND new.id_marin = id_marin) THEN
		signal sqlstate '45000' set MESSAGE_TEXT = 'Este barco está reservado';
	END IF;
>>>>>>> 50c1acec2900a37f50dc3bf262838617b1686773
  END; $$

delimiter ;
