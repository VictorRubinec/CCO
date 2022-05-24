create database Revista;

use Revista;

create table Revista
	(
    idRevista int primary key auto_increment,
    nome varchar(40),
    categoria varchar(30)
    )
    auto_increment=1
;

insert into Revista 
	(nome) 
values 
	('Village People'),
    ('Época'),
    ('Enemy'),
    ('Veja')
;

select * from Revista;

update Revista set categoria = 'Música' where idRevista = 1;
update Revista set categoria = 'Notícias' where idRevista = 2;
update Revista set categoria = 'Jogos' where idRevista = 3;
update Revista set categoria = 'Notícias' where idRevista = 4;

insert into Revista 
	(nome, categoria) 
values 
	('Valorant', 'Jogos'),
    ('Super Geek', 'Jogos'),
    ('Fofocando', 'Fofocas')
;

select * from Revista;

describe Revista;

alter table Revista modify categoria varchar(40);

describe Revista;

alter table Revista rename column nome to nomeRevista;

select * from Revista;

alter table Revista add periodicidade varchar(15);

select * from Revista;

update Revista set periodicidade = 'Semanal' where idRevista = 1;
update Revista set periodicidade = 'Diaria' where idRevista = 2;
update Revista set periodicidade = 'Mensal' where idRevista = 3;
update Revista set periodicidade = 'Mensal' where idRevista = 4;
update Revista set periodicidade = 'Semanal' where idRevista = 5;
update Revista set periodicidade = 'Semanal' where idRevista = 6;
update Revista set periodicidade = 'Diaria' where idRevista = 7;

insert into Revista 
	(nomeRevista, categoria, periodicidade) 
values 
	('Mobilia Center', 'Mobilia', 'Diária')
;

alter table Revista drop periodicidade;

create table Editora
	(
    idEditora int primary key auto_increment,
    nomeEditora varchar(40),
    dataFund date
    )
    auto_increment=1000
;

insert into Editora 
	(nomeEditora, dataFund) 
values 
	('AmoLer', '2010-06-16'),
	('Sorva', '2015-01-30'),
    ('Panini', '2003-04-25'),
    ('Jimba', '2005-12-10')
;

-- atividade 18/03/2022 chave estrageira --

alter table Revista add fkEditora int; 

alter table Revista add foreign key(fkEditora) references Editora(idEditora);

update Revista set fkEditora = 1000 where idRevista in (1,3,4,7);
update Revista set fkEditora = 1001 where idRevista = 2;
update Revista set fkEditora = 1002 where idRevista = 5;
update Revista set fkEditora = 1003 where idRevista in (6,8);

select * from Revista;

select * from Revista, Editora where fkEditora = idEditora;

select * from Revista, Editora where idEditora = 1000 and fkEditora = 1000;