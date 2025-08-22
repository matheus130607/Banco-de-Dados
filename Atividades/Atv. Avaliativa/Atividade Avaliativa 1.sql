create database Instituição;

use Instituição;

create table Fornecedor (
fornecedor_cod int auto_increment primary key not null,
fornecedor_nome varchar(100),
fornecedor_status varchar(10) default 'Ativo',
fornecedor_cidade varchar(100)
);

create table Peca (
peca_cod int auto_increment primary key not null,
cor varchar(100) not null,
peca_cidade varchar(100) not null,
peca_nome varchar(100) not null,
peso int not null
);

create table Projeto (
projeto_cod int auto_increment primary key not null,
projeto_cidade varchar(100),
projeto_nome varchar(100),
instituicao_cod int,
foreign key (instituicao_cod) references Instituicao (instituicao_cod)
);

create table Instituicao (
instituicao_cod int auto_increment primary key not null,
instituicao_nome varchar(100)
);

create table Fornecimento (
fornecimento_cod int auto_increment primary key not null,
quantidade int,
fornecedor_cod int,
peca_cod int,
projeto_cod int,
foreign key (fornecedor_cod) references Fornecedor (fornecedor_cod),
foreign key (peca_cod) references Peca (peca_cod),
foreign key (projeto_cod) references Projeto (projeto_cod)
);

-- ALTERAÇÕES --

drop table Instituicao;

create table Cidade(
cidade_cod int auto_increment primary key not null,
cidade_nome varchar(100),
cidade_UF char(2) default 'SP'
);
