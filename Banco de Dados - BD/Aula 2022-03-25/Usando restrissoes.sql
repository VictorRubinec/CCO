create database restrissoes;

use restrissoes;

create table tbfuncionario 
    (
        idFuncionario int primary key auto_increment,
        nome varchar(40) not null,
        cpf char(14) unique,
        sexo char(1) check (sexo = 'm' or sexo = 'f' or sexo = 'n'),
        salario decimal(7,2) check (salario > 0),
        avaliacao decimal(4,2) check (avaliacao >= 0 and avaliacao <= 10)
    )
;

insert into tbfuncionario 
    (nome, cpf, sexo, salario, avaliacao)
values
    ('Roger Braga', '231.312.412-00', 'm', 1520.91, 9.4),
    ('Julio Dias', '243.089.322-53', 'n', 1520.91, 2.3),
    ('Maria Paula', '099.423.092-20', 'f', 1520.91, 10.0)
;