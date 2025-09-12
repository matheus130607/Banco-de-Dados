-- Geração de Modelo físico
-- Sql ANSI 2003 - brModelo.
CREATE DATABASE Book_Master; 

Use Book_Master;


CREATE TABLE Livros (
id_livro int auto_increment not null PRIMARY KEY,
quant_livro int not null,
preco_livro decimal(5,2) not null,
editora_livro varchar(100) not null,
genero_livro varchar(50) not null,
autor_livro varchar(100) not null,
titulo_livro varchar(100) not null
);

CREATE TABLE Autores (
id_autor int auto_increment not null PRIMARY KEY,
data_nasc_autor datetime not null,
nacionalidade_autor varchar(20) not null,
nome_autor varchar(100) not null
);

CREATE TABLE Editoras (
telefone_editora varchar(14) not null,
cidade_editora varchar(100) not null,
nome_editora varchar(100) not null,
id_editora int auto_increment not null PRIMARY KEY,
CNPJ_editora varchar(14) not null,
endereco_editora varchar(255) not null,
contato_editora varchar(100)
);

CREATE TABLE Clientes (
nome_cliente varchar(100),
email_cliente varchar(50) not null,
CPF_cliente varchar(14) not null,
id_cliente int auto_increment not null PRIMARY KEY,
telefone_cliente varchar(14) not null,
data_nasc_cliente datetime not null
);

CREATE TABLE Vendas (
data_venda datetime not null,
quant_venda int not null,
id_venda int auto_increment not null PRIMARY KEY,
valor_total_venda decimal(7,2) not null,
id_livro int,
id_cliente int,
FOREIGN KEY(id_livro) REFERENCES Livros (id_livro),
FOREIGN KEY(id_cliente) REFERENCES Clientes (id_cliente)
);

-- INSERIR --

-- LIVROS HARRY POTTER --
INSERT INTO Livros (quant_livro, preco_livro, editora_livro, genero_livro, autor_livro, titulo_livro) VALUES
(10, 59.90, 'Rocco', 'Fantasia', 'J.K. Rowling', 'Harry Potter e a Pedra Filosofal'),
(8, 62.50, 'Rocco', 'Fantasia', 'J.K. Rowling', 'Harry Potter e a Câmara Secreta'),
(12, 65.00, 'Rocco', 'Fantasia', 'J.K. Rowling', 'Harry Potter e o Prisioneiro de Azkaban'),
(7, 70.00, 'Rocco', 'Fantasia', 'J.K. Rowling', 'Harry Potter e o Cálice de Fogo'),
(9, 75.00, 'Rocco', 'Fantasia', 'J.K. Rowling', 'Harry Potter e a Ordem da Fênix'),
(6, 80.00, 'Rocco', 'Fantasia', 'J.K. Rowling', 'Harry Potter e o Enigma do Príncipe'),
(5, 85.00, 'Rocco', 'Fantasia', 'J.K. Rowling', 'Harry Potter e as Relíquias da Morte');
 
 select * from Livros;



