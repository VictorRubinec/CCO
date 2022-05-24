create database AlunoDisciplina;

use AlunoDisciplina;

create table tbAluno
	(
    ra int primary key auto_increment,
    nome varchar(100),
    bairro varchar(100)
    )
    auto_increment = 1000;
;

create table tbDisciplina
	(
    idDisciplina int primary key,
    nome varchar(100),
    coordenador varchar(100)
    )
;

create table tbAlunoDisciplina
	(
	fkRa int,
    foreign key(fkRa) references tbAluno(ra),
    fkDisciplina int,
    foreign key(fkDisciplina) references tbDisciplina(idDisciplina),
    dataInicio date,
    primary key (fkRa, fkDisciplina, dataInicio),
    qtdeFaltas int,
    media decimal(4,2) check (media >= 0 and media <= 10),
    statusCurso varchar(100)
    )
;

insert into tbAluno 
	(nome, bairro)
values
	('Victor Zanin', 'Barcelona'),
	('Bruno Piaza', 'Vila Guilherme'),
	('Renato Jesus', 'Vila Nova'),
	('Bruna Dias', 'Jardim SCS'),
	('Amanda Neves', 'Cerqueiro César')
;

insert into tbDisciplina
	(idDisciplina, nome, coordenador)
values
	(1, 'Ciância da Computação', 'Marise'),
	(2, 'Sistemas da Informação', 'Alexander'),
	(3, 'Análise e Desenvolvimento de Sistemas', 'Gerson')
;

insert into tbAlunoDisciplina 
	(fkRa, fkDisciplina, dataInicio, qtdeFaltas, media, statusCurso)
values
	(1000, 1, "2018-01-30", 26, 8.9, "Finalizado"),
	(1001, 1, "2019-07-30", 14, 7.0, "Cursando"),
	(1002, 2, "2020-07-30", 22, 6.8, "Desistência"),
	(1003, 3, "2017-01-30", 8, 9.0, "Finalizado"),
	(1004, 3, "2022-01-30", 30, 5.2, "Reprovado")
;

select * from tbAluno;
select * from tbDisciplina;
select * from tbAlunoDisciplina;

select * from tbAluno, tbDisciplina, tbAlunoDisciplina where ra = fkRa and fkDisciplina = idDisciplina;
                                   
select * from tbAluno, tbDisciplina, tbAlunoDisciplina where ra = fkRa and fkDisciplina = idDisciplina and fkDisciplina = 1;
                                   
select * from tbAluno, tbDisciplina, tbAlunoDisciplina where ra = fkRa and fkDisciplina = idDisciplina and ra = 1000;

select sum(media) as 'Soma médias', sum(qtdeFaltas) as 'Soma faltas' from tbAlunoDisciplina;

select truncate(avg(media),2) as 'Média das médias', truncate(avg(qtdeFaltas),2) as 'Média de Faltas' from tbAlunoDisciplina;

select max(media) as 'Maior média', min(media) as 'Menor média' from tbAlunoDisciplina;

select count(qtdeFaltas) as 'Quantidade de faltas acima de 20' from tbAlunoDisciplina where qtdeFaltas > 20;

select tbDisciplina.nome , max(media) as 'Maior média', min(media) as 'Menor média' 
	from tbAlunoDisciplina, tbDisciplina 
	where fkDisciplina = idDisciplina group by fkDisciplina;
    
select tbAluno.nome , max(media) as 'Maior média', min(media) as 'Menor média' 
	from tbAlunoDisciplina, tbAluno 
	where fkRa = ra group by fkRa;
    
select media from tbalunodisciplina;

select distinct(media) as 'Médias distintas' from tbalunodisciplina;

select count(media) as 'Quantidade médias'  from tbalunodisciplina;

select count(distinct(media)) as 'Quantidade médias distintas'  from tbalunodisciplina;
