drop view if exists visao;

CREATE VIEW visao(id_marin, id_barco, tempo_reserva, nome_marin, nome_barco) as
	SELECT id_marin, id_barco, DATEDIFF(devolucao, dia) as tempo_reserva, nome_marin, nome_barco FROM  Reservas
	NATURAL JOIN Marinheiros
	NATURAL JOIN Barcos;
