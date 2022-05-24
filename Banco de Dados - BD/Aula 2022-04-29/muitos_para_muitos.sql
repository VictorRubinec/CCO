create database escola_idioma;

use escola_idioma;

create table tbAluno
	(
    ra int primary key auto_increment,
    nome varchar(100),
    bairro varchar(100)
    )
    auto_increment = 1000 
;

create table tbCurso
	(
    idCurso int primary key auto_increment,
    nome varchar(100),
    coordenador varchar(100)
    )
;

create table tbAlunoCurso
	(
    fkAluno int,
    foreign key(fkAluno) references tbAluno(ra),
    fkCurso int,
    foreign key(fkCurso) references tbCurso(idCurso),
    datainicio date,
    primary key(fkAluno, fkCurso, dataInicio),
    nivel char(2),
    media decimal(4,2) check (media >= 0 and media <=10)
    )
;

insert into tbAluno values
	(null, 'Maria', 'Saúde'),
	(null, 'João', 'Consolação')
;

insert into tbCurso values
	(null, 'Espanhol', 'Juan'),
	(null, 'Inglês', 'Beth')
;

insert into tbAlunoCurso values
	(1000, 1, '2015-02-01', 'A1', 9.0),
	(1000, 2, '2017-02-01', 'I3', 7.0),
	(1001, 1, '2020-02-01', 'B1', 6.5),
	(1001, 2, '2019-02-01', 'I2', 10)
;

select * from tbAluno;
select * from tbCurso;
select * from tbAlunoCurso;

select * from tbAluno, tbCurso, tbAlunoCurso where fkAluno = ra and fkCurso = idCurso;

select * from tbAluno, tbCurso, tbAlunoCurso where fkAluno = ra and fkCurso = idCurso and tbCurso.nome = 'Espanhol';