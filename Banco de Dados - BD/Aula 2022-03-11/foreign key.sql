create database sptech;

use sptech;

create table curso
	(
    idCurso int primary key auto_increment,
    nome char (3),
    coodernador varchar (100)
    )
    auto_increment=100
;

insert into curso 
	(nome, coodernador) 
values 
	('ADS', 'Gerson'),
	('CCO', 'Marise'),
	('SIS', 'Alex')
;

create table aluno
	(
	ra int primary key auto_increment,
    nome varchar (100),
    bairro varchar (100),
    fkCurso int,
    foreign key(fkCurso) references curso(idCurso)
    )
    auto_increment=50000
;

insert into aluno
	(nome, bairro, fkCurso) 
values 
	('Victor Zanin Rubinec', 'Isolinna Mazzei', 101),
	('Ravindra Almeida', 'Tupiauí', 101),
	('Maria Paula', 'Maúa', 102),
    ('Gabriel Duarte', 'Guianazes', 100)
;

select * from aluno, curso where idCurso = fkCurso;

select * from aluno, curso where idCurso = fkCurso and curso.nome = 'CCO';

select ra, aluno.nome, bairro, curso.nome, coodernador from aluno, curso where idCurso = fkCurso;

select aluno.*, curso.nome, coodernador from aluno, curso where idCurso = fkCurso;

create table professor 
	(
	idProf int primary key auto_increment,
    nomeProf varchar(60),
    disciplina varchar(20)
    )
    auto_increment=1000
;

insert into professor 
	(nomeProf, disciplina)
values
	('Frizza', 'Algoritmos'),
	('Vivian', 'BD'),
	('Yoshi', 'Algoritmos'),
	('Marise', 'Arq Comp')
;

alter table professor add fkCurso int;

alter table professor add foreign key(fkCurso) references curso(idCurso);

update professor set fkCurso = 100 where idProf in (1000, 1003);
update professor set fkCurso = 101 where idProf=1001;
update professor set fkCurso = 102 where idProf=1002;

select * from professor;