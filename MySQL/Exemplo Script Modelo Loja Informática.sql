-- CRIAR BANCO DE DADOS
create database Loja_Informatica;

-- ATIVAR O BD
use Loja_Informatica;

-- TABELA PRODUTOS
create table Produtos (
cod_produto int,
descricao varchar(255),
nome_produto varchar(100),
preco_produto decimal,
imagem blob
);

-- TABELA ESTOQUE
create table Estoque (
cod_estoque int,
quantidade int,
local_estoque varchar(255),
nome_produto varchar(100),
observacao varchar(255)
);

-- TABELA FUNCIONÁRIOS
create table Funcionarios (
cod_funcionario int,
nome_funcionario varchar(100),
data_nascimento datetime,
CPF varchar(14),
salario decimal
);

-- TABELA SERVIÇOS
create table Servicos (
cod_servico int,
tipo_servico varchar(255),
agendamento datetime,
preco_servico decimal,
observacao varchar(255)
);

-- TABELA CLIENTE
create table Cliente (
cod_cliente int,
nome_cliente varchar(100),
CPF varchar(14),
endereco varchar(255),
data_nascimento datetime
);


