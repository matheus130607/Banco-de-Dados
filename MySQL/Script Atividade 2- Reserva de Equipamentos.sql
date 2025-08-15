create database Reserva_Equipamentos;

use Reserva_Equipamentos;

-- Tabela Cliente --
create table if not exists Fornecedores (
id_fornecedor int  auto_increment not null,
nome_fornecedor varchar(100) not null,
celular_fornecedor varchar(19),
CNPJ_fornecedor varchar(18) not null,
endereco_fornecedor varchar(255) not null,
estado_fornecedor char(2) default 'SP' not null,
cidade_fornecedor varchar(100) not null,
primary key (id_fornecedor)
);

-- Relação Venda --
create table if not exists Venda (
id_venda int primary key auto_increment not null,
id_fornecedor int not null,
id_equipamento int not null,
foreign key (id_equipamento) references	Equipamentos (id_equipamento),
foreign key (id_fornecedor) references Fornecedores (id_fornecedor)
);

-- Tabela Equipamentos --
create table if not exists Equipamentos (
id_equipamento int auto_increment not null,
nome_equipamento varchar(100) not null,
quantidade_equipamento int not null,
valor_equipamento decimal(5,2) not null,
descricao_equipamento varchar(255),
primary key (id_equipamento)
);

-- Relação Reserva --
create table if not exists Reserva (
id_compra int primary key auto_increment not null,
id_cliente int not null,
id_equipamento int not null,
foreign key (id_equipamento) references	Equipamentos (id_equipamento),
foreign key (id_cliente) references Clientes (id_cliente)
);

-- Tabela Clientes --
create table if not exists Clientes (
id_cliente int  auto_increment not null,
nome_cliente varchar(100) not null,
CPF_cliente varchar(14) not null,
endereco_cliente varchar(255) not null,
celular_cliente varchar(19),
primary key (id_cliente)
);
