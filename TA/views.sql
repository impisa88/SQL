CREATE VIEW GolsPorTime(Gols,Nome_jogador,Nome_time) as
	SELECT sum(Desempenho.G) as Gols, jogador.Nome_jogador, Partida.Nome_time
	FROM ((Desempenho
	INNER JOIN Partida ON Desempenho.id_desempenho = Partida.id_desempenho)
	INNER JOIN jogador ON partida.id_jogador = jogador.id_jogador)
	GROUP BY Partida.id_jogador, Partida.Nome_time
	ORDER BY Nome_jogador asc;
	
create view GolsPorCampeonatoAtleta(Gols,Nome_jogador,Nome_time,Nome_camp) as
	SELECT sum(Desempenho.G) as Gols, Jogador.Nome_jogador, partida.Nome_time, Campeonato.Nome_camp
		FROM (((Desempenho
		INNER JOIN Partida ON Desempenho.id_desempenho = Partida.id_desempenho)
		INNER JOIN Campeonato ON partida.id_camp = Campeonato.id_camp)
		INNER JOIN jogador ON partida.id_jogador = jogador.id_jogador)
		GROUP BY partida.id_jogador, partida.id_camp, partida.nome_time
		ORDER BY Nome_jogador asc;
		
CREATE VIEW GolsPorCampeonatoTime(Nome_time,Nome_camp, GolsFeitos, GolsSofridos, SaldoGols) as
	SELECT  
		partida.Nome_time
		,Campeonato.Nome_camp
		,sum(Desempenho.G) as Gols
		,sum(Desempenho.GS) as GolsSofridos
		,sum(Desempenho.G-Desempenho.GS) as SG
	FROM ((Desempenho
	INNER JOIN Partida ON Desempenho.id_desempenho = Partida.id_desempenho)
	INNER JOIN Campeonato ON partida.id_camp = Campeonato.id_camp)
	GROUP BY partida.nome_time;
	
CREATE VIEW ItensPorJogador(G,RB,A,SG,FS,FF,FD,FT,DD,DP,GC,CV,CA,GS,PP,FC, I, PE,Nome_time, Nome_jogador, Nome_camp) as
	SELECT sum(Desempenho.G) as G 
	  ,sum(Desempenho.RB) as RB
	  ,sum(Desempenho.A) as A
	  ,sum(Desempenho.SG) as SG
	  ,sum(Desempenho.FS) as FS
	  ,sum(Desempenho.FF) as FF
	  ,sum(Desempenho.FD) as FD
	  ,sum(Desempenho.FT) as FT
	  ,sum(Desempenho.DD) as DD
	  ,sum(Desempenho.DP) as DP
	  ,sum(Desempenho.GC) as GC 
	  ,sum(Desempenho.CV) as CV
	  ,sum(Desempenho.CA) as CA
	  ,sum(Desempenho.GS) as GS
	  ,sum(Desempenho.PP) as PP
	  ,sum(Desempenho.FC) as FC
	  ,sum(Desempenho.I) as I
	  ,sum(Desempenho.PE) as PE
	  ,partida.Nome_time
	  ,jogador.Nome_jogador
	  ,Campeonato.Nome_camp
	FROM (((Desempenho
	INNER JOIN Partida ON Desempenho.id_desempenho = Partida.id_desempenho)
	INNER JOIN jogador ON partida.id_jogador = jogador.id_jogador)
	INNER JOIN Campeonato ON partida.id_camp = Campeonato.id_camp)
	GROUP BY partida.id_jogador, partida.id_camp;
	