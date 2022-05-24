create database Musica;

use Musica;

create table Musica
(
	idMusica int Primary key,
    titulo varchar(40),
    artista varchar(40),
    genero varchar(40)
);

insert into Musica values
	(152, 'Lost Chapter', 'Pentakill', 'Rock'),
    (153, 'Call by you name', 'Lil Nas X', 'Pop'),
    (154, 'Conqueror', 'Pentakill', 'Rock'),
    (155, 'Farol', 'Supercombo', 'Pop rock'),
    (156, 'Yellow', 'Coldplay', 'Pop rock'),
    (157, 'Lightbringer', 'Pentakill', 'Rock'),
    (158, 'Smile', 'Charles Chaplin', 'Classico')
;

select * from Musica;

select titulo, artista from Musica;

select genero, artista from Musica;

select * from Musica where genero = 'Pop rock';

select * from Musica where artista = 'Pentakill';

select titulo from Musica where genero = 'Rock';

select titulo, genero from Musica where artista = 'Pentakill';

select * from Musica where idMusica between 153 and 156;

select * from Musica where idMusica <= 155;

select * from Musica where idMusica >= 154;

select * from Musica where idMusica <> 153 and idMusica <> 155;

select * from Musica order by titulo;

select * from Musica order by artista desc;

select * from Musica where titulo like 'f%';

select * from Musica where titulo like '%e';

select * from Musica where titulo like '_a%';

select * from Musica where titulo like '%e_';

update Musica set genero = 'Rock Metal' where idMusica = 152;

update Musica set 
	artista = 'Quadrakill', 
    genero = 'Rock Metal' 
where idMusica = 157;

delete from Musica where idMusica = 156;

drop table Musica;

-- atividade 18/03/2022 chave estrageira --

create table album 
	(
	idAlbum int primary key auto_increment,
    nome varchar(40),
    gravadora varchar(40)
    )
;

insert into album 
	(nome, gravadora)
values
	('Montero','Top'),
	('Supercombo','Indie BR'),
	('Pentakill III','Riot'),
	('Musicas Classicas','Preto e Branco')
;

alter table musica add fkAlbum int; 

alter table musica add foreign key(fkAlbum) references album(idAlbum);

update musica set fkAlbum = 3 where idMusica in (152, 154, 157);
update musica set fkAlbum = 1 where idMusica = 153;
update musica set fkAlbum = 2 where idMusica = 155;
update musica set fkAlbum = 4 where idMusica = 158;

select * from musica, album where fkAlbum = idAlbum;

select * from musica, album where album.nome = 'Pentakill III' and idAlbum = fkAlbum; 

select * from musica, album where gravadora = 'Top' and idAlbum = fkAlbum; 