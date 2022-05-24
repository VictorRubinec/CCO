create database exemplo_tipo_relacionamento;

use exemplo_tipo_relacionamento;

create table tbFuncionario
	(
	idFuncionario int primary key auto_increment,
    nome varchar (60),
    salario decimal(7,2) check (salario > 0),
    sexo char(1) check (sexo = 'm' or sexo = 'f' or sexo = 'n'),
    -- sexo enum('f', 'm', 'n') / alternativa para o comando acima
    fkSupervisor int,
    foreign key(fkSupervisor) references tbFuncionario(idFUncionario)
    )
    auto_increment = 1000
;

create table tbDependente
	(
    fkFuncionario int,
    foreign key(fkFuncionario) references tbFuncionario(idFuncionario),
    idDependente int,
    primary key(fkFuncionario, idDependente), -- caso seja chave primaria composta
    nome varchar(60),
    dataNasc date,
    tipo varchar(60)
    )
;

insert into tbFuncionario values
	(null, 'João Nunes', 30000, 'm', null),
	(null, 'Cláudio Souza', 20000, 'm', 1000),
	(null, 'Ana Teixeira', 18000, 'f', 1000),
	(null, 'Paulo Silva', 10000, 'm', 1001),
	(null, 'Carol Rangel', 8000, 'f', 1002)
;

select * from tbFuncionario;

insert into tbDependente values
	(1000, 1, 'Joana Nunes', '1990-03-04', 'conjuge'),
	(1000, 2, 'Joaquim Nunes', '2020-07-01', 'filho'),
	(1001, 1, 'Cláudia Souza', '1997-08-10', 'conjuge'),
	(1001, 2, 'Claudete Souza', '2015-10-09', 'filho'),
	(1002, 1, 'José Teixeira', '2000-05-03', 'conjuge')
;

select * from tbDependente;

select * from tbFuncionario, tbDependente where fkFuncionario = idFuncionario;

select * from tbFuncionario, tbDependente where fkFuncionario = idFuncionario and tbFuncionario.nome = 'João Nunes';

select * from 	tbFuncionario as funcionario, -- pode ser qualquer apelido
				tbFuncionario as supervisor
	where funcionario.fkSupervisor = supervisor.idFuncionario;
    
    
select * from 	tbFuncionario as funcionario,
				tbFuncionario as supervisor,
                tbDependente
	where funcionario.fkSupervisor = supervisor.idFuncionario
    and fkFuncionario = funcionario.idFuncionario;
