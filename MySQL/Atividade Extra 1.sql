create database REMOTERC;

use REMOTERC;


-- TABELA PRODUTOS --
create table Produtos (
codigo_produto  int primary key auto_increment not null,
descricao_produto varchar(255),
peso_produto char(2) not null,
valorunit_produto decimal not null
);

-- TABELA VENDEDORES --
create table Vendedores (
codigo_vendedor int primary key auto_increment not null,
nome_vendedor varchar(100) not null,
salario_vendedor decimal not null,
fsalario_vendedor int not null
);

-- TABELA CLIENTES --
create table Clientes (
codigo_cliente int primary key auto_increment not null,
nome_cliente varchar(100) not null,
endereco_cliente varchar(255) not null,
cidade_cliente varchar(100) not null,
uf_cliente char(2) not null
);

-- INSERIR PRODUTOS --
insert into Produtos(codigo_produto, descricao_produto, peso_produto, valorunit_produto) values
(1, 'Teclado', 'KG', 35.00),
(2, 'Mouse', 'KG', 25.00),
(3, 'HD', 'KG', 350.00);


-- INSERIR VENDEDORES --
insert into Vendedores(codigo_vendedor, nome_vendedor, salario_vendedor, fsalario_vendedor) values
(1, 'Ronaldo', 3512.00, 1),
(2, 'Robertson', 3225.00, 2),
(3, 'Clodoaldo', 4350.00, 3);


-- INSERIR CLIENTES --
insert into Clientes(codigo_cliente, nome_cliente, endereco_cliente, cidade_cliente, uf_cliente) values
(11 , 'Bruno', 'Rua 1 456', 'Rio Claro', 'SP'),
(12 , 'Cláudio', 'Rua Quadrada 234', 'Campinas', 'SP'),
(13 , 'Cremilda', 'Rua das Flores 666', 'São Paulo', 'SP');


-- ALTERAÇÕES --

alter table Vendedores
modify column salario_vendedor decimal(10,2);

update Vendedores 
set salario_vendedor = 3150.00
where codigo_vendedor = 1;

update Vendedores 
set salario_vendedor = salario_vendedor * 1.10
where codigo_vendedor = 2;

update Vendedores 
set salario_vendedor = 3500.00
where codigo_vendedor = 3; 	

select * from Vendedores

