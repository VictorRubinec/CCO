create database GreenTech;

use GreenTech;

create table empresa 
	(
	idEmpresa int Primary key auto_increment,
    nomeEmpresa varchar(100),
    CNPJ char(14),
    idGestor int,
    login varchar(60),
    senha varchar(60)
    )
;

insert into empresa 
	(nomeEmpresa, CNPJ, idGestor, login, senha) 
values 
	('Tomates e Cia','09218923233','2','toma_e_cia','443'),
	('Tomates do João','02318892233','1','toma_joao','5re3f3'),
	('Tom Tomates','09292837233','3','tom_toma','4123')
;
  
create table gestor 
	(
	idGestor int Primary key auto_increment,
    nomeGestor varchar(60),
    numero char(11),
    email varchar(60)
    )
;

insert into gestor 
	(nomeGestor, numero, email) 
values 
	('Ravindro Peruzzi','11939329312','ravindro@gamil.com'),
	('João Perreira','1193935283','joaotomates@hotmail.com'),
	('Tomas Castro Dias','11939372032','tomascastro@gmail.com')
;

create table estufa 
	(
	idEstufa int Primary key auto_increment,
    idEmpresa int,
    identificador varchar(60)
    )
;

insert into estufa 
	(idEmpresa, identificador) 
values 
	(2,'Estufa lado A'),
	(2,'Estufa lado B'),
	(1,'Plantação tomates'),
    (3, 'estufa tomates')
;

create table monitoramento 
	(
	idMonitoramento int Primary key auto_increment,
    idEstufa int,
    temperatura decimal(5,2),
    umidade decimal(5,2),
    hora time,
    dia date
    )
;

insert into monitoramento 
	(idEstufa, temperatura, umidade, hora, dia) 
values 
	(1, 23.80, 61.03, '18:30:00', '2022-12-01'),
    (1, 24.00, 62.00, '18:45:00', '2022-12-01'),
    (1, 23.50, 61.46, '19:00:00', '2022-12-01'),
    (2, 24.10, 58.63, '16:15:00', '2022-09-02'),
    (2, 22.80, 58.73, '16:30:00', '2022-09-02'),
    (2, 23.20, 59.02, '16:45:00', '2022-09-02'),
    (3, 23.10, 60.04, '00:00:00', '2022-11-01'),
    (3, 23.20, 60.92, '00:15:00', '2022-11-01'),
    (3, 23.50, 60.67, '00:30:00', '2022-11-01'),
    (4, 24.10, 62.32, '10:45:00', '2022-08-03'),
    (4, 24.80, 62.14, '11:00:00', '2022-08-03'),
    (4, 22.10, 61.97, '11:15:00', '2022-08-03')
;