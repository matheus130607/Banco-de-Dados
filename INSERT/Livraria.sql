create database Livraria;
use Livraria;

create table Usuarios (
id_usuario int auto_increment primary key not null,
nome varchar(255) not null,
email varchar(255) not null
);