create database SPTech;

use SPTech;

create table empresa
	(
	idEmpresa int primary key auto_increment,
    nome varchar(100),
    representante varchar(100)
    )
;

insert into empresa
	(nome, representante)
values
	('Accenture','Renata'),
	('Safra','Claudia'),
	('C6','Roberta')
;

create table instituicao
	(
	idInstituicao int primary key auto_increment,
    nome varchar(100),
    bairro varchar(100)
    )
;

insert into instituicao
	(nome, bairro)
values
	('Alcina','Nova Gerti'),
	('Termomecanica','Jardim Sao Caetano'),
	('Nostradamus','Luz da Vila')
;

create table aluno
	(
	ra int primary key,
    nome varchar(100),
    hobby varchar(100),
    fkEmpresa int,
    foreign key(fkEmpresa) references empresa(idEmpresa),
    fkInstituicao int,
	foreign key(fkInstituicao) references instituicao(idInstituicao)
    )
;

insert into aluno values
	(02221020,'Agda Taniguchi', 'Jogar', 2, 1),
	(02221034,'Gabriel Vannucche', 'Vôlei', 2, 1),
	(02221006,'Vinicius Alves', 'Desenhar', 1, 2),
	(02221055,'Davi Bordon', 'Vôlei', 1, 3),
	(02221016,'Pedro Henrique', 'Ler', 3, 1)
;

select * from aluno, instituicao where fkInstituicao = idInstituicao;

select * from aluno, empresa where fkEmpresa = idEmpresa;

select * from aluno, instituicao, empresa where fkInstituicao = idInstituicao and fkEmpresa = idEmpresa;
