create database Pet;

use Pet;

create table tbCliente
	(
    idCliente int primary key auto_increment,
    nome varchar(60),
    telefone_f char(9),
    telefone_c char(10),
    endereco varchar(60)
    )
;

create table tbPet
	(
    idPet int primary key auto_increment,
    tipo varchar(60),
    nome varchar(60),
    raca varchar(60),
    peso decimal(5,2) check (peso > 0),
    fkCliente int,
    foreign key(fkCliente) references tbCliente(idCliente)
    )
    auto_increment = 101
;

insert into tbCliente
	(nome, telefone_f, telefone_c, endereco)
values
	('Renato Almeida', '5456-5412', '92135-8463', 'Rua Alamo, 34'),
	('Roberta Taváres', '4616-5414', '96542-5456', 'Avenida Clark, 1204'),
	('Julia Zurking', '3456-1564', '94558-5644', 'Rua Thomas Costa, 468'),
	('Maria Dias', '4926-1165', '94894-5156', 'Rua Santos, 546'),
	('Jorge Curt', '4535-1268', '98956-1355', 'Rua Martha, 1')
;

insert into tbPet
	(tipo, nome, raca, peso, fkCliente)
values
	('Cachorro', 'Luna', 'Chitsu', 8.4, 1),
	('Cachorro', 'Rex', 'Doberman', 10.2, 2),
	('Gato', 'Megumi', 'Siamês', 5.1, 2),
	('Pássaro', 'Loro', 'Papagaio', 1.3, 5),
	('Gato', 'Chunchumaru', 'Persa', 5.4, 3),
	('Cachorro', 'Roberto', 'Bulldog', 18.4, 4)
;

select * from tbCliente;
select * from tbPet;

alter table tbCliente modify nome varchar(100);

desc tbCliente;

select * from tbPet where tipo='Gato';

select nome, peso from tbPet;

select * from tbCliente order by endereco desc;

select * from tbPet where nome like 'L%';

select * from tbCliente where nome like '% Almeida';

update tbCliente set telefone_f = '4564-9526' where idCliente = '4';

select * from tbcliente;

select * from tbPet, tbCliente where fkCLiente = idCLiente;

select * from tbPet, tbCliente where fkCLiente = idCLiente and tbCliente.nome = 'Roberta Taváres';

select * from tbPet, tbCliente where fkCLiente = idCLiente and telefone_c = '94558-5644';

delete from tbPet where idPet = '103';

select * from tbPet;

drop table tbCliente;
drop table tbPet;