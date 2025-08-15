create database Solar;

use Solar;

create table if not exists Clientes (
id_cliente int  auto_increment not null,
nome_cliente varchar(100) not null,
CPF varchar(14) not null,
endereco varchar(255) not null,
celular varchar(19),
primary key (id_cliente)
);

create table if not exists Produtos (
id_produto int auto_increment not null,
nome_produto varchar(100) not null,
quantidade int not null,
valor decimal(5,2) not null,
descricao varchar(255),
primary key (id_produto)
);

create table if not exists Fornecedores (
id_fornecedor int  auto_increment not null,
nome_fornecedor varchar(100) not null,
celular varchar(19),
CNPJ varchar(18) not null,
endereco varchar(255) not null,
estado char(2) default 'SP' not null,
cidade varchar(100) not null,
primary key (id_fornecedor)
);

create table if not exists Venda (
id_venda int primary key auto_increment not null,
id_fornecedor int not null,
id_produto int not null,
foreign key (id_produto) references	Produtos (id_produto),
foreign key (id_fornecedor) references Fornecedores (id_fornecedor)
);

create table if not exists Compra (
id_compra int primary key auto_increment not null,
id_cliente int not null,
id_produto int not null,
foreign key (id_produto) references	Produtos (id_produto),
foreign key (id_cliente) references Clientes (id_cliente)
);

create table if not exists Funcionarios (
id_funcionario int  auto_increment not null,
nome_funcionario varchar(100) not null,
CPF_funcionario varchar(14) not null,
endereco_funcionario varchar(255) not null,
celular_funcionario varchar(19),
salario_funcionario decimal (5,2) not null,
data_nascimento_funcionario datetime not null,
primary key (id_funcionario),
id_departamento int not null,
foreign key (id_departamento) references Departamento (id_departamento)
);

create table if not exists Departamento (
id_departamento int auto_increment not null,
nome_departamento varchar(100) not null,
setor_departamento varchar(50) not null,
responsavel_departamento varchar(100) not null,
primary key (id_departamento)
);

-- Consultar --
select * from Empregado;

-- Alterações em tabelas --
alter table Funcionarios
add sexo char(1) not null;

-- Adicionar --
alter table Funcionarios
drop column sexo;

-- Renomear --
alter table Funcionarios
rename to Empregado;

-- Alterar --
alter table Empregado
change CIC_funcionaro CIC_funcionario varchar(18);

-- Modificar --
alter table Empregado
modify column nome_funcionario varchar(200);

alter table Fornecedores
modify column estado Char(2) default 'MG';

-- Adicionar Chave Primária --
 -- alter table Empregado
-- add primary key (id_funcionario,CIC_funcionaro);


