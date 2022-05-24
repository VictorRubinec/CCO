create database atleta;

use atleta;

create table atleta
(
	idAtleta int primary key,
    nome varchar (40),
    modalidade varchar (40),
    qtdMedalha int
);

insert into atleta values
	(100, 'Julia Martins', 'Vôlei', 3),
	(101, 'Roberto Dias', 'Vôlei', 5),
	(102, 'Felipe Torten', 'Basquete', 2),
	(103, 'Igor Hugo', 'Basquete', 0),
	(104, 'Claudia Nunes', 'Natação', 4),
	(105, 'Otávio Mesquita', 'Judô', 1),
	(106, 'Gabriela Dellbue', 'Basquete', 2)
;

select * from atleta;

select nome, qtdMedalha from atleta;

select modalidade, nome from atleta;

select * from atleta where modalidade = "Basquete";

select * from atleta where qtdMedalha >= 3;

select * from atleta where idAtleta < 103;

select nome from atleta where modalidade = "Basquete";

select * from atleta where idAtleta between 102 and 104;

select * from atleta where idAtleta <> 103;

select * from atleta order by modalidade;

select * from atleta order by qtdMedalha desc;

select * from atleta where nome like '%e%';

select * from atleta where nome like 'r%';

select * from atleta where nome like '%s';

select * from atleta where nome like '%e_';

update atleta set qtdMedalha = 2 where idAtleta = 100;

update atleta set 
	nome = 'Roberto Noites', 
    qtdMedalha = 2 
where idAtleta = 101;

delete from atleta where idAtleta = 104;

drop table atleta;

-- atividade 18/03/2022 chave estrageira --

create table pais 
	(
	idPais int primary key auto_increment,
    nome varchar(40),
    capital varchar(40)
    )
;

insert into pais 
	(nome, capital)
values
	('Brasil','Brasília'),
	('Alemanha','Berlim'),
	('Argentina','Buenos Aires'),
	('Japão','Tóquio')
;

alter table atleta add fkPais int; 

alter table atleta add foreign key(fkPais) references pais(idPais);

update atleta set fkPais = 1 where idAtleta in (101,102,105);
update atleta set fkPais = 2 where idAtleta in (100,103);
update atleta set fkPais = 3 where idAtleta = 106;
update atleta set fkPais = 4 where idAtleta = 104;

select * from atleta, pais where fkPais = idPais;

select * from atleta, pais where fkPais = 2 and idPais = 2; 