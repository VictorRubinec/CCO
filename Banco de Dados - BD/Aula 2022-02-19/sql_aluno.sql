-- Isso é um comentário
-- Criação de um banco de dados (schema)
create database aluno_cco;

-- Selecionar o banco de dados aluno_cco
use aluno_cco;

-- Criação de uma tabela
create table Aluno (
  ra int primary key,  --ra é a chave primária
  nome varchar(50),
  bairro varchar(40)
);

-- Exibir os dados da tabela
-- * significa todas as colunas
-- no lugar do *, vc pode colocar os nomes das colunas que vc quer exibir
select * from Aluno;

-- Exibir apenas a coluna ra
select ra from Aluno;

-- Exibir apenas as colunas ra e nome
select ra, nome from Aluno;

-- Exibir as colunas nome, bairro e ra, nessa ordem
select nome, bairro, ra from Aluno;

-- Inserir dados de um aluno
-- valor de campo int é inserido sem aspas
-- valor de campo varchar ou char é inserido com aspas simples
insert into Aluno values (02221020,'Agda Taniguchi','Jd Maria Estela');

-- Inserir dados de mais alunos
insert into Aluno values (02221003,'Alessandra do Carmo','Vila Matilde'),
                         (02221038,'Victor Hugo','Pq Boa Esperança'),
                         (02221031,'Maria Paula','Jd Dona Sinhá'),
                         (02221000,'Maria Eduarda','Vila Piauí'),
                         (02221054,'Pedro Gustavo','Vila Nova Curuça');

-- Exibir os dados dos alunos de RA <= 02221031
select * from Aluno where ra <= 02221031;

-- Exibir os dados dos alunos de RA < 02221031
select * from Aluno where ra < 02221031;

-- Exibir os dados dos alunos de RA >= 02221031
select * from Aluno where ra >= 02221031;

-- Exibir os dados dos alunos de RA > 02221031
select * from Aluno where ra > 02221031;

-- Exibir os dados dos alunos de RA = 02221031
select * from Aluno where ra = 02221031;

-- Exibir os dados dos alunos de RA diferente de 02221031
select * from Aluno where ra <> 02221031;  -- sinal padrão de direrente: <>
select * from Aluno where ra != 02221031;  -- MySql aceita != como sinal de diferente,
                                           -- mas não é o padrão

-- Exibir os dados dos alunos de RA entre 02221003 e 02221038
-- os 2 comandos abaixo são equivalentes
select * from Aluno where ra between 02221003 and 02221038;
select * from Aluno where ra >= 02221003 and ra <= 02221038;

-- Exibir os dados do aluno cujo nome é 'Victor Hugo'
select * from Aluno where nome = 'Victor Hugo';
-- Exibir os dados dos alunos cujo nome começa com A
select * from Aluno where nome like 'A%';
-- Exibir os dados dos alunos cujo nome começa com Maria
select * from Aluno where nome like 'Maria%';
-- Exibir os dados dos alunos cujo nome termina com a
select * from Aluno where nome like '%a';
-- Exibir os dados dos alunos cujo bairro começa com Vila
select * from Aluno where bairro like 'Vila%';

-- Exibir os dados dos alunos cujo nome tenha a letra a como 2a letra
select * from Aluno where nome like '_a%';

-- Exibir os dados dos alunos cujo nome tenha a letra d como 3a letra
select * from Aluno where nome like '__d%';

-- Exibir os dados dos alunos cujo nome tenha a letra r como 3a letra de trás para frente
select * from Aluno where nome like '%r__';

-- Exibir os dados da tabela
select * from Aluno;

-- Exibir os dados da tabela ordenados pelo nome
-- Se não especificar asc nem desc, assume asc. Ou seja, assume ordem ascendente
select * from Aluno order by nome;
select * from Aluno order by nome asc;

-- Se não especificar asc nem desc, assume asc. Ou seja, assume ordem ascendente
select * from Aluno order by nome desc;

-- Atualizar o nome da Maria Paula
-- Muita atenção aqui: se não colocar where, vai atualizar para a tabela inteira
-- O MySQL Server tem uma proteção para não deixar isso acontecer, mas essa proteção
-- pode ser desativada e outros SGBDs não tem essa proteção
update Aluno set nome = 'Maria Paula Barbosa' where ra = 2221031;
-- Atualizar o nome e o bairro do Victor Hugo
update Aluno set nome = 'Victor Hugo Marques',
                 bairro = 'Jardins' where ra = 2221038;
                 
-- Exclui o aluno Victor Hugo
-- ATENÇÂO aqui tb: sem o where, exclui todas as linhas da tabela
-- MySQL Server tem uma proteção para não deixar isso acontecer, mas essa proteção 
-- pode ser desativada e outros SGBDs não tem essa proteção
delete from Aluno where ra = 2221038;

-- Exibir os dados dos alunos de ra 2221000, 2221031
select * from Aluno where ra in (2221000, 2221031);
select * from Aluno where ra = 2221000 or ra = 2221031; -- comando equivalente ao anterior
-- Exibir os dados de todos os alunos menos os de ra 2221000 e 2221031, ordenados em ordem decrescente do RA
select * from Aluno where ra not in (2221000, 2221031) order by ra desc;

-- Exibir a descrição da tabela
desc Aluno;
describe Aluno;

-- Excluir a tabela Aluno
drop table Aluno;

-- Excluir o banco de dados aluno_cco
drop database aluno_cco;