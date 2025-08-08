create database Empresa_Clean_House;

use Empresa_Clean_House;

create table Produtos (
cod_produto int,
nome_produto varchar(100),
preco_produto decimal,
descricao varchar(255),
validade_produto datetime
);

create table Funcionarios (
cod_funcionario int,
nome_funcionario varchar(100),
CPF varchar(14),
data_nascimento datetime,
salario decimal
);

create table Estoque (
cod_estoque int,
quantidade int,
cod_produto int,
local_estoque varchar(255),
observacao varchar(255)
);

create table Cliente (
cod_cliente int,
nome_cliente varchar(100),
CPF varchar(14),
endereco varchar(255),
data_nascimento datetime
);

create table Pedidos (
cod_pedido int,
cod_produto int,
cod_cliente int,
endereco varchar(255),
data_compra datetime
);
