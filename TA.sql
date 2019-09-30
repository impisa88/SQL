create TABLE "Jogador" (
	"id_jogador" INTEGER,
	"Nome" TEXT,
	"Posicao" TEXT,
	PRIMARY KEY ("id_jogador")
);

CREATE TABLE "Desempenho" (
	"RB" INTEGER,
	"G"  INTEGER,
	"A"  INTEGER,
	"SG" INTEGER,
	"FS" INTEGER,
	"FF" INTEGER,
	"FD" INTEGER,
	"FT" INTEGER,
	"DD" INTEGER,
	"DP" INTEGER,
	"GC" INTEGER,
	"CV" INTEGER,
	"CA" INTEGER,
	"GS" INTEGER,
	"PP" INTEGER,
	"FC" INTEGER,
	"I"  INTEGER,
	"PE" INTEGER,
	"id_jogador" INTEGER,
	"Nome" TEXT,
	"Posicao" TEXT,
	PRIMARY KEY ("id_jogador"),
	FOREIGN KEY ("id_jogador","Nome","Posicao") REFERENCES "Jogador"("id_jogador","Nome","Posicao")
);

CREATE TABLE "Time" (
	"Nome_time" TEXT,
	PRIMARY KEY ("Nome")
);

CREATE TABLE "Partida"	(
	"Data" date,
	"Resultado" INTEGER,
	id_partida INTEGER,
	Nome_time TEXT,
	PRIMARY KEY ("id_partida"),
	FOREIGN KEY ("Nome_time") REFERENCES "Time"("Nome_time")
);
	
create TABLE "Campeonato" (
	Nome TEXT,
	id_camp INTEGER,
	Ano INTEGER,
	id_partida INTEGER,
	PRIMARY KEY ("id_camp"),
	FOREIGN KEY ("id_partida") REFERENCES "Partida"("id_partida")
);

create TABLE "Contrato" (
	Num_contrato  INTEGER,
	id_camp INTEGER,
	id_jogador INTEGER,
	Nome_time TEXT,
	PRIMARY KEY ("Num_contrato"),
	FOREIGN KEY ("id_camp") REFERENCES "Campeonato"("id_camp"),
	FOREIGN KEY ("Nome_time") REFERENCES "Time"("Nome_time"),
	FOREIGN KEY ("id_jogador") REFERENCES "Jogador"("id_jogador")
);

-- to do 

CREATE VIEW "GolsPorTime" (Nome, Nome_time, G) as SELECT A.G as Gols from Desempenho A
	
	WHERE Nome = 1;

CREATE VIEW "GolsPorTime" as
	
CREATE VIEW "GolsPorTime" as
	
CREATE VIEW "GolsPorTime" as
