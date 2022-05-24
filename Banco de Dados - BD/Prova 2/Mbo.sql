create database ac2;
 
use ac2;
 
create table tbFuncionario
	(
	idFuncionario int primary key auto_increment,
    nome varchar(100),
    sexo char(1) check (sexo='n' or sexo='m' or sexo='f'),
    login varchar(100),
    senha varchar(100),
    fkGestor int,
    foreign key(fkGestor) references tbFuncionario(idFuncionario)
    )
    auto_increment = 100
;
 
create table tbCiclo
	(
	idCiclo int primary key auto_increment,
    nomenclatura varchar(100),
    ano year,
    fkGestor int,
    foreign key(fkGestor) references tbFuncionario(fkGestor)
    )
    auto_increment = 10
;
 
create table tbItem
	(
	fkCiclo int,
    foreign key(fkCiclo) references tbCiclo(idCiclo),
    idItem int,
    primary key(idItem, fkCiclo),
    objetivo varchar(200),
    categoria varchar(100),
    peso decimal(3,2),
    prazo date
    )
;
 
create table tbFuncionariosCiclo
	(
	fkFuncionario int,
    foreign key(fkFuncionario) references tbFuncionario(idFuncionario),
	fkCiclo int,
    foreign key(fkCiclo) references tbCiclo(idCiclo)
    )
;
 
insert into tbFuncionario values
	(null, 'Jorge Mendes', 'm', 'jorge_mendes', 'jordes', null),
	(null, 'Thiago Dias', 'm', 'thiago_dias', 'DIAS321', 100),
	(null, 'Marcela Costa', 'f', 'marcela_costa', 'marcela123', null),
	(null, 'Roger Barthe', 'm', 'roger_barthe', 'RB67293', 102),
	(null, 'Maria Paula', 'f', 'maria_paula', '5132d2', 102)
;
    
insert into tbCiclo values
	(null, 'Melhorias Prédio', '2022', 100),
	(null, 'Melhorias Prédio', '2023', 100),
	(null, 'Acquatec', '2022', 102),
	(null, 'Novo Moodle', '2022', 102),
	(null, 'Melhorias Rede', '2023', 102)
;
    
insert into tbItem values
	(10, 1, 'catraca nova', 'infra', 0.2, '2022-03-12'),
	(10, 2, 'limpeza computadores', 'suporte ti', 0.6, '2022-07-14'),
	(11, 1, 'reforma sala', 'infra', 0.1, '2023-12-01'),
	(11, 2, 'imagem notebooks nova', 'suporte ti', 0.5, '2023-01-30'),
	(12, 1, 'Dashboard', 'back-end', 0.7, '2022-05-27'),
	(12, 2, 'Tela Cadastro', 'back-end', 0.2, '2022-08-02'),
	(13, 1, 'Protótipo', 'front-end', 0.3, '2023-01-30'),
	(13, 2, 'MER', 'dba', 0.2, '2023-01-15'),
	(14, 1, 'Compra switch /10000', 'infra', 0.4, '2023-01-10')
;
 
insert into tbFuncionariosCiclo values
	(101, 10),
	(101, 11),
	(103, 12),
	(103, 13),
	(104, 12),
	(104, 13),
	(104, 14)
;

alter table tbItem modify objetivo varchar(150);
desc tbItem;
 
select * from tbFuncionario;
select * from tbCiclo;
select * from tbItem;
select * from tbFuncionariosCiclo;
  
update tbFuncionario set senha='mendes980' where idFuncionario=100;
select * from tbFuncionario;
  
select * from tbFuncionario, tbCiclo where tbFuncionario.idFuncionario = tbCiclo.fkGestor;
  
select * from tbFuncionario, tbCiclo where tbFuncionario.idFuncionario = tbCiclo.fkGestor and nomenclatura like '%a%';
  
select nome, idCiclo, nomenclatura, ano from tbFuncionario, tbCiclo where tbFuncionario.idFuncionario = tbCiclo.fkGestor;
 
select * from tbFuncionario, tbCiclo where tbFuncionario.idFuncionario = tbCiclo.fkGestor and ano='2022';
  
select * from tbItem, tbCiclo, tbFuncionario where tbItem.fkCiclo = idCiclo and tbFuncionario.idFuncionario = tbCiclo.fkGestor;
  
select * from tbItem, tbCiclo, tbFuncionario where tbItem.fkCiclo = idCiclo and tbFuncionario.idFuncionario = tbCiclo.fkGestor and ano='2022';
 
select * from tbFuncionario as funcionario, tbFuncionario as gestor where funcionario.fkGestor = gestor.idFuncionario;
  
select * from tbFuncionario as funcionario, tbFuncionario as gestor where funcionario.fkGestor = gestor.idFuncionario and funcionario.fkGestor=102;
  
delete from tbItem where fkCiclo=10 and idItem=2;
select * from tbItem;