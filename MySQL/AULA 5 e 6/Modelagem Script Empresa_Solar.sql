create DATABASE EMPRESA_SOLAR;
USE EMPRESA_SOLAR;

CREATE TABLE Clientes (
nome_cliente varchar(100),
id_cliente int PRIMARY KEY
);

CREATE TABLE Produtos (
id_produto int PRIMARY KEY,
nome_produto varchar(100)
);

CREATE TABLE compra (
id_compra int auto_increment primary key not null,
id_produto int,
id_cliente int,
FOREIGN KEY(id_produto) REFERENCES Produtos (id_produto),
FOREIGN KEY(id_cliente) REFERENCES Clientes (id_Cliente)
);

create table Vendedores (
id_vendedor int primary key auto_increment,
nome_vendedor varchar(100),
salario_vendedor decimal(10,2),
fsalarial_vendedor char(1)
);

drop table Vendedores;
insert into Produtos values (2, 'Teclado');

update Produtos set nome_produto = 'Mouse'
where id_produto = 2;

select * from Vendedores;

insert into Vendedores (nome_vendedor, salario_vendedor, fsalarial_vendedor) values ('Matheus', 5000.00, 1);
insert into Vendedores (nome_vendedor, salario_vendedor, fsalarial_vendedor) values ('Bruno', 6000.00, 2);
insert into Vendedores (nome_vendedor, salario_vendedor, fsalarial_vendedor) values ('Gabriel', 7000.00, 1);

update Vendedores set salario_vendedor = 3150
where fsalarial_vendedor = 1;

update Vendedores set salario_vendedor = (salario_vendedor * 1.10)
where fsalarial_vendedor = 2;

update Vendedores set salario_vendedor = 3500.00
where fsalarial_vendedor = 1;

delete from Vendedores
where salario_vendedor < 4000;

delete from Produtos where id_produtos = 1;
delete from Clientes where nome_clientes = 'Matheus';
delete from Vendedores where id_vendedor >=1 and id_vendedor <=10;
delete from Vendedores where id_vendedor <=10 or id_vendedor >=20;
delete from Clientes;
truncate table Clientes;

-- AUTORIZAR UPDATE EM FORMA DE COMANDO --
set sql_safe_updates = 0;
