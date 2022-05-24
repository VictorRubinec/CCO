create database filme;

use filme;

create table Filme 
(
	idFilme int primary key,
    titulo varchar(50),
    genero varchar(40),
    diretor varchar(40)
);

insert into Filme 
	(idFilme, titulo) 
Values
	(1,'Homem Aranha 3'),
	(2,'Velozes e Furiosos 17'),
	(3,'Mogli'),
	(4,'Duna')
;

insert into Filme 
	(titulo, idFilme) 
Values
	('O Auto da Compadecida', 5),
	('Tropa de Elite', 6)
;

update Filme set genero = 'Ação' where idFilme in (1, 2);
update Filme set genero = 'Animação' where idFilme in (3);
update Filme set genero = 'Ficção Científica' where idFilme = 4;
update Filme set genero = 'Drama' where idFilme in (5, 6);

update Filme set diretor = 'José' where idFilme in (1, 4, 6);
update Filme set diretor = 'Ricardo' where idFilme in (2, 3);
update Filme set diretor = 'Batista' where idFilme = 5;

select * from Filme order by genero;
select * from Filme order by genero, titulo;
select * from Filme order by genero, titulo desc;
select * from Filme order by genero, diretor;
select * from Filme order by genero desc, diretor;

create table Pessoas 
	(
		idPessoa int primary key auto_increment,
        nome varchar(40),
        dataNascimento date
    )
;

insert into Pessoa values
	(null, 'Roberto Dias', '2000-09-24')
;

insert into Pessoas 
	(nome, dataNascimento)
values
	('Maria Do Carmo', '2002-11-09'),
	('Júlio Marques', '2006-01-30'),
	('Túlio Zanon', '1999-02-12')
;

describe Pessoas;

alter table Pessoas add sexo char(1);
alter table Pessoas add column sexo char(1);

select * from Pessoas;

insert into Pessoas values
	(null, 'Marina Silva', '1998-03-26', 'M');
;

alter table Pessoas drop sexo;

alter table Pessoas modify nome varchar(50);
alter table Pessoas modify nome varchar(5);

alter table Pessoas auto_increment = 20;

update Pessoas set idPessoa = idPessoa + 100 where idPessoa <20;

alter table Pessoas rename column nome to nomePessoa;
alter table Pessoas change nomePessoa nome varchar(50);