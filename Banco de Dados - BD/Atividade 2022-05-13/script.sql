create database Sprints;

use Sprints;

-- 1. --
create table tbProfessor
	(
	idProfessor int primary key auto_increment,
    nomeProfessor varchar(100),
    disciplina varchar(100)
    )
    auto_increment = 10000
;

create table tbGrupo
	(
	idGrupo int primary key auto_increment,
    nomeGrupo varchar(100),
    descricao varchar(100)
    )
;

create table tbAluno
	(
	ra int primary key,
    nomeAluno varchar(100),
    email varchar(100),
    fkGrupo int,
    foreign key(fkGrupo) references tbGrupo(idGrupo)
    )
;

create table tbApresentacao
	(
    fkGrupo int,
    foreign key(fkGrupo) references tbGrupo(idGrupo),
    fkProfessor int,
    foreign key(fkProfessor) references tbProfessor(idProfessor),
    idSprint int check (idSprint = 1 or idSprint = 2 or idSprint = 3),
    primary key (fkGrupo, fkProfessor, idSprint),
    dataHora datetime,
    nota decimal(4,2) check (nota >= 0 and nota <= 10)
    )
;

-- 2. --
insert into tbProfessor
	(nomeProfessor, disciplina)
values
	('Fernando', 'Pesquisa e Inovação'),
	('Rafael', 'Tecnologia da Informação'),
	('Marise', 'Arquitetura Computacional'),
	('Célia', 'Banco de Dados')
;

insert into tbGrupo
	(nomeGrupo, descricao)
values
	('Sentinel Track', 'Fluxo de pessoas no shopping'),
	('Greentech', 'Estufas Inteligentes de morango')
;

insert into tbGrupo
	(nomeGrupo, descricao)
values
	('Sentinel Track', 'Fluxo de pessoas no shopping'),
	('Greentech', 'Estufas Inteligentes de morango')
;

insert into tbAluno
	(ra, nomeAluno, email, fkGrupo)
values
	(100, 'Victor Zanin Rubinec', 'victor.rubinec@sptech.school', 1),
	(101, 'Gabriel Duarte', 'gabriel.duarte@sptech.school', 1),
	(102, 'Daniel Freitas', 'daniel.freitas@sptech.school', 1),
	(103, 'Maria Paula', 'maria.paula@sptech.school', 2),
	(104, 'Julia Maria', 'julia.maria@sptech.school', 2),
	(105, 'Ravindra Almeida', 'ravindra.almeida@sptech.school', 2)
;

insert into tbApresentacao
	(fkGrupo, fkProfessor, idSprint, dataHora, nota)
values
	(1, 10000, 1, '2022-03-10 12:50:00', 9.2),
	(1, 10001, 1, '2022-03-10 13:20:00', 8.5),
	(1, 10002, 1, '2022-03-10 15:10:00', 8.0),
	(1, 10000, 2, '2022-04-29 12:50:00', 7.2),
	(1, 10001, 2, '2022-04-29 13:20:00', 7.5),
	(1, 10002, 2, '2022-04-29 15:10:00', 7.0),
    
	(2, 10000, 1, '2022-03-11 12:50:00', 9.7),
	(2, 10003, 1, '2022-03-11 13:20:00', 9.5),
	(2, 10002, 1, '2022-03-11 15:10:00', 9.0),
	(2, 10000, 2, '2022-04-30 12:50:00', 8.2),
	(2, 10003, 2, '2022-04-30 13:20:00', 8.5),
	(2, 10002, 2, '2022-04-30 15:10:00', 8.0)
;

-- 3. --
select * from tbProfessor;
select * from tbgrupo;
select * from tbAluno;
select * from tbApresentacao;

-- 5. --
select * from tbGrupo, tbAluno where idGrupo = fkGrupo;

-- 6. --
select * from tbGrupo, tbAluno where idGrupo = fkGrupo and idGrupo = 1; 

-- 7. --
select nomeGrupo, truncate(avg(nota),2) as 'Média Sprint 1' from tbGrupo, tbApresentacao 
	where idSprint = 1 and fkGrupo = idGrupo group by idGrupo; 

-- 8. --
select nomeGrupo, max(nota) as 'Nota Máxima Sprint 1', min(nota) as 'Nota Mínima Sprint 1' from tbGrupo, tbApresentacao 
	where idSprint = 1 and fkGrupo = idGrupo group by idGrupo; 

-- 9. --
select nomeGrupo, sum(nota) as 'Soma nota Sprint 1' from tbGrupo, tbApresentacao 
	where idSprint = 1 and fkGrupo = idGrupo group by idGrupo; 

-- 10. --
select * from tbProfessor, tbGrupo, tbApresentacao where idGrupo = fkGrupo and idProfessor = fkProfessor; 

-- 11. --
select * from tbProfessor, tbGrupo, tbApresentacao where idGrupo = fkGrupo and idProfessor = fkProfessor and idGrupo = 1; 

-- 12. --
select nomeGrupo, nomeProfessor from tbProfessor, tbGrupo, tbApresentacao 
	where idGrupo = fkGrupo and idProfessor = fkProfessor and idProfessor = 10000 and idSprint = 2; 
    
-- 13. --
select * from tbGrupo, tbAluno, tbProfessor, tbApresentacao 
	where idGrupo = tbApresentacao.fkGrupo and idProfessor = fkProfessor and idGrupo = tbAluno.fkGrupo;
    
-- 14. --
select Count(distinct(nota)) as 'Quantidade Notas Distintas' from tbGrupo, tbApresentacao 
	where idGrupo = fkGrupo;
    
-- 15. --
select nomeProfessor, truncate(avg(nota),2) as 'Média Sprint 2', sum(nota) as 'Soma Médias Sprint 2' from tbProfessor, tbApresentacao
	where idProfessor = fkProfessor and idSprint = 2 group by idProfessor;
    
-- 16. --
select nomeGrupo, truncate(avg(nota),2) as 'Média Sprint 1', sum(nota) as 'Soma Médias Sprint 1' from tbGrupo, tbApresentacao
	where idGrupo = fkGrupo and idSprint = 1 group by idGrupo;
    
-- 17. --
select nomeProfessor, min(nota) as 'Menor Nota Sprint 1', max(nota) as 'Maior Nota Sprint 1' from tbProfessor, tbApresentacao
	where idProfessor = fkProfessor and idSprint = 1 group by idProfessor;
    
-- 18. --
select nomeGrupo, min(nota) as 'Menor Nota Sprint 1', max(nota) as 'Maior Nota Sprint 1' from tbGrupo, tbApresentacao
	where idGrupo = fkGrupo and idSprint = 1 group by idGrupo;