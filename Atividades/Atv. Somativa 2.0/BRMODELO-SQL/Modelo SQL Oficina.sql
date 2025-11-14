-- Geração de Modelo físico
-- Sql ANSI 2003 - brModelo.



CREATE TABLE Clientes (
nome_cliente varchar(100) not null,
id_cliente int auto_increment not null PRIMARY KEY,
email_cliente varchar(100),
telefone_cliente varchar(14) not null,
CPF_cliente varchar(14) not null
)

CREATE TABLE Veiculos (
id_veiculo int auto_increment not null PRIMARY KEY,
ano_veiculo datetime not null,
marca_veiculo varchar(100) not null,
modelo_veiculo varchar(100) not null,
cor_veiculo varchar(100) not null,
placa_veiculo varchar(7) not null
)

CREATE TABLE OS (
tipo_os varchar(100) not  null,
data_termino_os datetime not null,
descricao_os varchar(,
id_os int auto_increment not null PRIMARY KEY,
preco_os decimal (10,2) not null,
data_incio_os datetime,
id_cliente int auto_increment not null,
id_veiculo int auto_increment not null,
id_peca int auto_increment not null,
id_mecanico int auto_increment not null,
id_servico int auto_increment not null,
FOREIGN KEY(id_cliente) REFERENCES Clientes (id_cliente),
FOREIGN KEY(id_veiculo) REFERENCES Veiculos (id_veiculo)
)

CREATE TABLE Pecas (
id_peca int auto_increment not null PRIMARY KEY,
qtde_peca int,
tipo_peca varchar(100) not null,
nome_peca varchar(100) not null,
preco_peca decimal (10,2) not null
)

CREATE TABLE Mecanicos (
nome_mecanico varchar(100) not null,
id_mecanico int auto_increment not null PRIMARY KEY,
email_mecanico varchar(100),
telefone_mecanico varchar(14) not null,
CPF_mecanico varchar(14) not null,
salario_mecanico decimal (10,2) not null
)

CREATE TABLE Servicos (
tipo_servico varchar(100),
preco_servico decimal (10,2) not null,
descricao_servico varchar(200) ,
nome_servico varchar(100) not null,
id_servico int auto_increment not null PRIMARY KEY
)

CREATE TABLE possui (
id_veiculo int auto_increment not null,
id_cliente int auto_increment not null,
FOREIGN KEY(id_veiculo) REFERENCES Veiculos (id_veiculo),
FOREIGN KEY(id_cliente) REFERENCES Clientes (id_cliente)
)

ALTER TABLE OS ADD FOREIGN KEY(id_peca) REFERENCES Pecas (id_peca)
ALTER TABLE OS ADD FOREIGN KEY(id_mecanico) REFERENCES Mecanicos (id_mecanico)
ALTER TABLE OS ADD FOREIGN KEY(id_servico) REFERENCES Servicos (id_servico)
