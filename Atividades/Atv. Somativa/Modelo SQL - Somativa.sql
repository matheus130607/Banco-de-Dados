-- Geração de Modelo físico
-- Sql ANSI 2003 - brModelo.

create database Somativa;

use Somativa;

-- SELECTS --
select * from Alunos;
select * from Cursos;
select * from Inscricoes;
select * from Avaliacoes;


CREATE TABLE Alunos (
email_aluno varchar(255) not null,
nome_aluno varchar(100),
id_aluno int auto_increment not null PRIMARY KEY,
data_nasc_aluno datetime not null
);

CREATE TABLE Cursos (
titulo_curso varchar(100) not null,
carga_horaria_curso int not null,
descricao_curso varchar(100),
id_curso int auto_increment not null PRIMARY KEY,
status_curso varchar(100) default 'active' not null
);

CREATE TABLE Inscricoes (
data_inscricao datetime not null,
id_inscricao int auto_increment not null PRIMARY KEY,
id_aluno int not null,
id_curso int not null,
FOREIGN KEY(id_aluno) REFERENCES Alunos (id_aluno),
FOREIGN KEY(id_curso) REFERENCES Cursos (id_curso)
);

CREATE TABLE Avaliacoes (
comentario_avaliacao varchar(255),
id_avaliacao int auto_increment not null PRIMARY KEY,
nota_avaliacao decimal(4,2) not null,
id_inscricao int not null,
FOREIGN KEY(id_inscricao) REFERENCES Inscricoes (id_inscricao)
);


-- INSERTS ALUNOS -- 

insert into Alunos (nome_aluno,email_aluno, data_nasc_aluno) values
('Gabriel Cruz', 'gabrielcruz@gmail.com', '2007-12-09'),
('Matheus Malaman', 'matheusmalaman@gmail.com', '2007-06-13'),
('Joel Schnoor', 'joelschnoor@gmail.com', '2008-09-25'),
('Maria Soares','mariasoares@gmail.com', '2009-07-30'),
('Guilherme Cruz', 'guilhermecruz@gmail.com', '2006-09-10');

-- INSETS CURSOS --
insert into Cursos (titulo_curso, carga_horaria_curso, descricao_curso, status_curso) values
('Desenvolvimento  de Sistemas', '4', 'Curso de tecnologia','inactive');

insert into Cursos (titulo_curso, carga_horaria_curso, descricao_curso) values
('Eletroeletronica', '6', 'Curso de eletrica'),
('Mecanica', '8', 'Curso de mecanica'),
('Administração', '3', 'Curso de administração'),
('Usinagem', '20', 'Curso de Usinagem');


-- INSERTS INSCRICOES --
insert into Inscricoes(data_inscricao, id_aluno, id_curso) values
('2025-09-09', '3', '1'),
('2024-12-19', '2', '1'),
('2023-08-09', '1', '5'),
('2025-06-20', '4', '3'),
('2024-10-07', '5', '2');


-- INSERTS AVALIACOES --
insert into Avaliacoes(comentario_avaliacao, nota_avaliacao, id_inscricao) values 
('Curso muito bom', '7.3', '16'),
('Curso mediano', '5.4', '17'),
('Curso ruim', '3.2', '18');



-- Parte 4 — Atualização de Dados --


-- Atualizar email de um aluno --
update Alunos set email_aluno = 'matheus@gmail.com'
where id_aluno = 2;


-- Alterar carga horária de um curso --
update Cursos set carga_horaria_curso = '20'
where id_curso = 1;


-- Corrigir nome de aluno --
update Alunos set nome_aluno = 'Matheus Malaman Schnoor'
where id_aluno = 2;


-- Mudar status de curso --
update Cursos set status_curso = 'inactive'
where id_curso =  2;


-- Alterar nota de uma avaliação --
update Avaliacoes set nota_avaliacao = '6.2'
where id_inscricao = 17;



-- Parte 5 — Exclusão de Dados --

delete from Inscricoes
where id_inscricao = 17;

delete from Curso
where id_curso = 3;

delete from Avaliacoes
where nota_avaliacao < 5;

delete from  Alunos 
where id_aluno = 1;

delete from Cursos
where status_curso = 'inactive';



-- Parte 6 — Consultas com Critérios e Agrupamentos --

-- 1. Listar todos os alunos cadastrados --
select * from Alunos;


-- 2. Exibir apenas os nomes e e-mails dos alunos --
select nome_aluno, email_aluno
from Alunos;


-- 3. Listar cursos com carga horária maior que 20 horas --
select titulo_curso, carga_horaria_curso >= 20
from Cursos;


-- 4. Exibir cursos que estão inativos --
select titulo_curso, status_curso = 'inactive'
from Cursos;


-- 5. Buscar alunos nascidos após o ano 2007 --
select nome_aluno, data_nasc_aluno > '2007-01-01'
from Alunos;


-- 6. Exibir avaliações com nota acima de 6 --
select nota_avaliacao > 6
from Avaliacoes;


-- 7. Contar quantos cursos estão cadastrados --
select count(*) id_aluno
from Alunos;


-- 8. Listar os 3 cursos com maior carga horária --
select carga_horaria_curso
from Cursos
order by carga_horaria_curso desc  limit 3;

-- Parte 7 — Desafios Extras --
 
create index Index_email on Alunos (email_aluno);
show index from Alunos;

