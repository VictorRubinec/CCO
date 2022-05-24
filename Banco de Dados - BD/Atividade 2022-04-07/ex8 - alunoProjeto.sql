create database AlunoProjeto;

use AlunoProjeto;

create table tbProjeto
	(
	idProjeto int primary key auto_increment,
    nome varchar(60),
    descricao varchar(200)
    )
;

create table tbAluno
	(
	ra int primary key auto_increment,
    nome varchar(60),
    telefone char(11),
    fkRepresentante int,
    foreign key(fkRepresentante) references tbAluno(ra),
    fkProjeto int,
    foreign key(fkProjeto) references tbProjeto(idProjeto)
    )
;

create table tbAcompanhante
	(
    fkAluno int,
    foreign key(fkAluno) references tbAluno(ra),
	idAcompanhante int,
    primary key(fkAluno, idAcompanhante),
    nome varchar(60),
    relacao varchar(60)
    )
;

insert into tbProjeto 
	(nome, descricao)
values
	('Sentinel Track', 'Fluxo de pessoas no shopping'),
	('GreenTech', 'Estufas inteligentes'),
	('AquacTec', 'Aquários inteligentes'),
	('Latech', 'Controle de estacionamento')
;

insert into tbAluno 
	(nome, telefone, fkRepresentante, fkProjeto)
values
	('Victor Zanin', '11952343541', null, 1),
	('Victor Hugo', '11945646842', 1, 1),
	('Gabriel Duarte', '11915641315', 1, 1),
	('Julia Das', '11913543155', null, 2),
	('Maria Paula', '11903213155', 2, 2),
	('Rafael Dias', '11945545555', 2, 2)
;

insert into tbAcompanhante 
	(fkAluno, idAcompanhante, nome, relacao)
values
	(1, 1, 'Sandra Zanin', 'mãe'),
	(2, 1, 'Roberto Hugo', 'pai'),
	(6, 1, 'Roger Dias', 'pai'),
	(4, 1,'Clara Das', 'mãe')
;

select * from tbProjeto;
select * from tbAluno;
select * from tbAcompanhante;

select * from tbAluno, tbProjeto where idProjeto = fkProjeto;

select * from tbAluno, tbAcompanhante where ra = fkAluno;

select * from 	tbAluno as aluno,
				tbAluno as representante
			where aluno.fkRepresentante = representante.ra;

select * from tbAluno, tbProjeto where idProjeto = fkProjeto and tbProjeto.nome = 'GreenTech';

select * from tbAluno, tbProjeto, tbAcompanhante where idProjeto = fkProjeto and fkAluno = ra;