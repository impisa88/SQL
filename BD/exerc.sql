drop trigger if exists MonitoraReserva;

delimiter $$

create trigger MonitoraReserva before insert ON Reservas
  for each row begin


	IF ((SELECT categoria FROM Barcos WHERE new.id_barco = id_barco) = 'C') THEN
            IF ((SELECT avaliacao from Marinheiros where id_marin = new.Id_marin) < 9 ) THEN
                signal sqlstate '45000' set MESSAGE_TEXT = 'Este barco nao pode ser retirado por este marinheiro';    
            END IF;
        END IF;

	IF ((SELECT categoria FROM Barcos WHERE new.id_barco = id_barco) = 'B') THEN
            IF ((SELECT avaliacao from Marinheiros where id_marin = new.Id_marin) < 6 ) THEN
                signal sqlstate '45000' set MESSAGE_TEXT = 'Este barco nao pode ser retirado por este marinheiro';    
            END IF;
        END IF;

  end; $$

delimiter ;

