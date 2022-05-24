create database PraticaJogador;

use PraticaJogador;

create table tbTime
	(
	idTime int primary key auto_increment,
    nome varchar(60),
    tecnico varchar(60),
    dataFormacao date
    )
;

create table tbJogador
	(
	idJogador int primary key auto_increment,
    nome varchar(60),
    posicao varchar(60),
    salario decimal(7,2),
    fkConselheiro int,
    foreign key(fkConselheiro) references tbTime(idTime),
    fkTime int,
    foreign key(fkTime) references tbJogador(idJogador)
    )
;


create table tbSeguidor
	(
    fkJogador int,
    foreign key(fkJogador) references tbJogador(idJogador),
	idSeguidor int,
    primary key(fkJogador, idSeguidor),
    nome varchar(60),
    nickname varchar(60),
    sexo char(1) check (sexo = 'm' or sexo = 'f' or sexo = 'n')
    )
;

insert into tbTime
	(nome, tecnico, dataFormacao)
values
	('Os Manitos Clube', 'Jorge Dias', '2016-04-15'),
	('Piratas Clube', 'Alessandro Marcos', '2001-12-17'),
	('Diadema Clube', 'Oliver Turk', '2011-12-25'),
	('São Caetano do Sul Clube', 'Tort Lorth', '2006-01-05')
;

insert into tbJogador
	(nome, posicao, salario, fkConselheiro, fkTime)
values
	('Vitos Oliver', 'atacante', 3180.34, null, 1),
	('Oliver Marcos', 'goleiro', 3180.34, 1, 1),
	('Marcos Claudio', 'goleiro', 3180.34, null, 2),
	('Claudio Roger', 'zagueiro', 3180.34, 2, 2),
	('Roger Mathias', 'lateralD', 3180.34, null, 3)
;

insert into tbSeguidor
	(fkJogador, idSeguidor, nome, nickname, sexo)
values
	(1, 1, 'Marcia Okner', 'marcinha_do_fut', 'f'),
	(1, 2, 'Tarso Marimo', 'tarsinho', 'm'),
	(2, 1, 'Sarah Danziger', 'raposinha', 'f'),
	(3, 1, 'Guilherme Silva', 'guisilva', 'm'),
	(3, 2, 'Pedro Henrique', '_gelado_', 'm')
;

select * from tbTime;
select * from tbJogador;
select * from tbSeguidor;

select nome, tecnico from tbTime where nome like "s%";

select * from tbJogador order by posicao desc;

select * from tbJogador where posicao = 'goleiro';

select * from tbTime where tecnico like "%o_";

select * from tbTime order by tecnico asc;

select * from tbTime order by dataFormacao desc;

update tbJogador set posicao = 'lateralL' where idJogador = 5;

select * from tbJogador;

select * from tbTime, tbJogador where idTime = fkTime;

select * from tbTime, tbJogador where idTime = fkTime and tbTime.nome = 'Os Manitos Clube';

select * from 	tbJogador as jogador,
				tbJogador as conselheiro
			where jogador.fkConselheiro = conselheiro.idJogador;
            
select * from 	tbJogador as jogador,
				tbJogador as conselheiro
			where jogador.fkConselheiro = conselheiro.idJogador
            and jogador.nome = 'Oliver Marcos';
            
select * from tbJogador, tbSeguidor where idJogador = fkJogador;

select * from tbJogador, tbSeguidor where idJogador = fkJogador and tbJogador.nome = 'Marcos Claudio';

delete from tbJogador where idJogador = '5';

select * from tbJogador;

drop table tbSeguidor;
drop table tbJogador;
drop table tbTime;
