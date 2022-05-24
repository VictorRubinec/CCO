create Database Gasto;

use Gasto;

create table tbPessoa
	(
    idPessoa int primary key,
    nome varchar(60),
    dataNasc date,
    profissao varchar(60),
    idioma varchar(60)
    )
;

create table tbGasto
	(
    idGasto int primary key auto_increment,
    data_g date,
    valor decimal(7,2) check (valor > 0),
    descricao varchar(60),
    fkPessoa int,
    foreign key(fkPessoa) references tbPessoa(idPessoa)
    )
;

insert into tbPessoa values
	(10, 'Matha Dias Ramos', '1964-05-25', 'Gestor de Projetos', 'Português, Inglês, Espanhol'),
	(11, 'Carlos Lorte Ramos', '1968-04-05', 'Empresário', 'Português, Inglês'),
	(12, 'Clarisa Dias Ramos', '2001-09-21', 'DBA', 'Português, Inglês'),
	(13, 'Julia Dias Ramos', '1998-11-12', 'Professor de Matemática', 'Português')
;

insert into tbGasto 
	(data_g, valor, descricao, fkPessoa)
values
	('2022-02-17', 27.50, 'Mercado Big Bom', 11),
	('2022-02-18', 120.20, 'Bar do Jó', 12),
	('2022-02-22', 225.80, 'Outback', 11),
	('2022-03-02', 7.99, 'Mercado do Sé', 13),
	('2022-03-06', 10.00, 'Amazon', 13),
	('2022-03-12', 99.50, 'Amazon', 12),
	('2022-03-16', 800.90, 'Kabum', 10),
	('2022-03-23', 2.50, 'Mercado Dia', 10)
;

select * from tbPessoa;
select * from tbGasto;

select * from tbPessoa where profissao = 'DBA';

select * from tbGasto order by data_g desc;

select * from tbGasto, tbPessoa  where fkPessoa = idPessoa;

select * from tbGasto, tbPessoa  where fkPessoa = idPessoa and nome = 'Carlos Lorte Ramos';

select * from tbGasto, tbPessoa  where fkPessoa = idPessoa and data_g = '2022-02-22';

update tbGasto set data_g = '2022-02-28' where idGasto in (1, 5, 6);
update tbPessoa set idioma = 'Português, Espanhol' where idPessoa = 13;

select * from tbGasto;
select * from tbPessoa;

delete from tbGasto where idGasto = 4;

select * from tbGasto;