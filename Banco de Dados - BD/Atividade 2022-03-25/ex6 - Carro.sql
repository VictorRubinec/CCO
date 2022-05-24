cd C:\Program Files\MySQL\MySQL Server 8.0\bin

mysql.exe -u aluno -p

create database Carro;

use Carro;

create table tbDono 
	(
	idDono int primary key auto_increment,
    nome varchar(40),
    nasc date,
    salario decimal(10,2)
    )
;

create table tbCarro 
	(
	idCarro int primary key auto_increment,
    modelo varchar(40),
    marca varchar(40),
    placa char(8),
    anoFabr int,
    fkDono int,
    foreign key(fkDono) references tbDono(idDono)
    )
    auto_increment = 101
;

insert into tbDono 
	(nome, nasc, salario) 
values
	('Roger Dias', '1994-02-11', 3920),
	('Pedro Silva', '1984-05-01', 6800),
	('Giulia Okter', '1999-12-07', 1920),
	('Marcelo Álvaro', '1993-11-02', 2000),
	('Julias Martins', '2000-02-12', 2520)
;

insert into tbCarro 
	(modelo, marca, placa, anoFabr, fkDono) 
values
	('HB20', 'Hyundai', 'FAS-3543', 2012, 3),
	('Argo', 'Fiat', 'ADS-4678', 2014, 3),
	('Onix', 'Chevrolet', 'YUO-7845', 2004, 2),
	('Gol', 'Volkswagen', 'DSA-9875', 2009, 4),
	('Mobi', 'Fiat', 'DAS-4561', 2015, 5),
	('Onix Plus', 'Chevrolet', 'AAS-8948', 2018, 5),
	('Kwid', 'Renault', 'WDA-1516', 2011, 1)
;

select * from tbDono;
select * from tbCarro;

select * from tbDono order by nasc;

select * from tbCarro order by anoFabr desc;

select * from tbCarro where placa like '%5';

select * from tbCarro where marca = 'Fiat';

desc tbCarro;

alter table tbCarro modify modelo varchar(50);

desc tbCarro;

update tbDono set salario = '7000' where idDono = 104;

select * from tbCarro, tbDono where idDono = fkDono;

select * from tbCarro, tbDono where idDono = fkDono and nome = 'Giulia Okter';

select * from tbCarro, tbDono where idDono = fkDono and marca = 'Chevrolet';

select * from tbCarro, tbDono where idDono = fkDono and placa like 'D%';

drop table tbCarro;
drop table tbDono;