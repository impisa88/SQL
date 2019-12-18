drop table if exists Reservas;
drop table if exists Marinheiros;
drop table if exists Barcos;

create table Marinheiros (
  id_marin integer primary key,
  nome_marin varchar(255),
  avaliacao integer,
  idade real
);

create table Barcos (
  id_barco integer primary key,
  nome_barco varchar(255),
  cor varchar(255),
  categoria varchar(10)
);

create table Reservas (
  id_marin integer,
  id_barco integer,
  dia date,
  devolucao date,
  recebido integer,
  primary key (id_marin, id_barco, dia),
  FOREIGN KEY (id_marin) references Marinheiros(id_marin),
  FOREIGN KEY (id_barco) references Barcos(id_barco)
);

insert into Marinheiros
(id_marin, nome_marin, avaliacao, idade) values
(22, 'Dustin', 7, 45.0),
(29, 'Brutus', 1, 33),
(31, 'Lubber', 8, 55.5),
(32, 'Andy', 8, 25.5),
(58, 'Rusty', 10, 35),
(64, 'Horatio', 7, 35),
(71, 'Zorba', 9, 25.5),
(74, 'Horatio', 9, 35),
(85, 'Art', 3, 25.5),
(95, 'Bob', 3, 63.5);

insert into Barcos
(id_barco, nome_barco, cor, categoria) values
(101, 'Interlake', 'azul', 'A'),
(102, 'Interlake', 'vermelho', 'B'),
(103, 'Clipper', 'verde', 'C'),
(104, 'Marine', 'vermelho', 'B');

insert into Reservas
(id_marin, id_barco, dia, devolucao, recebido) values
(22, 101, '1998-10-10', '1998-10-12',1),
(22, 102, '1998-10-10', '1998-10-12',1),
(22, 103, '1998-08-10', '1998-08-12',1),
(22, 104, '1998-07-10', '1998-07-12',1),
(31, 102, '1998-10-11', '1998-10-13',1),
(31, 103, '1998-06-11', '1998-06-14',1),
(31, 104, '1998-12-11', '1998-12-13',1),
(64, 101, '1998-05-09', '1998-05-11',1),
(64, 102, '1998-05-09', '1998-05-11',1),
(74, 103, '1998-08-09', '1998-08-11',1);

