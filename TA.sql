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
	"Nome" TEXT
);

CREATE TABLE "Partida"	(
	"Data" date,
	"Resultado" INTEGER,
	id_partida INTEGER,
	Nome TEXT,
	PRIMARY KEY ("id_partida"),
	FOREIGN KEY ("Nome") REFERENCES "Time"("Nome")
);
	
create TABLE "Campeonato" (
	Nome TEXT,
	id_camp INTEGER,
	Ano INTEGER,
	id_partida INTEGER,
	FOREIGN KEY ("id_partida") REFERENCES "Partida"("id_partida")
);
