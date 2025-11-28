create database Oficina_Malaman;

use Oficina_Malaman;


CREATE TABLE Clientes (
nome_cliente varchar(100) not null,
id_cliente int auto_increment not null PRIMARY KEY,
email_cliente varchar(100),
telefone_cliente varchar(14) not null,
CPF_cliente varchar(14) not null
);

CREATE TABLE Veiculos (
id_veiculo int auto_increment not null PRIMARY KEY,
ano_veiculo year not null,
marca_veiculo varchar(100) not null,
modelo_veiculo varchar(100) not null,
cor_veiculo varchar(100) not null,
placa_veiculo varchar(7) not null
);

CREATE TABLE Pecas (
id_peca int auto_increment not null PRIMARY KEY,
qtde_peca int not null,
tipo_peca varchar(100) not null,
nome_peca varchar(100) not null,
preco_peca decimal (10,2) not null
);

CREATE TABLE Mecanicos (
nome_mecanico varchar(100) not null,
id_mecanico int auto_increment not null PRIMARY KEY,
email_mecanico varchar(100) not null,
telefone_mecanico varchar(14) not null,
CPF_mecanico varchar(14) not null,
salario_mecanico decimal (10,2) not null
);

CREATE TABLE Servicos (
tipo_servico varchar(100),
preco_servico decimal (10,2) not null,
descricao_servico varchar(100),
nome_servico varchar(100) not null,
id_servico int auto_increment not null PRIMARY KEY
);

CREATE TABLE OS (
tipo_os varchar(100) not  null,
data_termino_os datetime not null,
descricao_os varchar(100) not null,
id_os int auto_increment not null PRIMARY KEY,
preco_os decimal (10,2) not null,
data_incio_os datetime,
id_cliente int not null,
id_veiculo int not null,
id_peca int null,
id_mecanico int not null,
id_servico int not null,
FOREIGN KEY(id_cliente) REFERENCES Clientes (id_cliente),
FOREIGN KEY(id_veiculo) REFERENCES Veiculos (id_veiculo),
FOREIGN KEY(id_peca) REFERENCES Pecas (id_peca),
FOREIGN KEY(id_mecanico) REFERENCES Mecanicos (id_mecanico),
FOREIGN KEY(id_servico) REFERENCES Servicos (id_servico)
);


CREATE TABLE possui (
id_possui int auto_increment PRIMARY KEY not null,
id_veiculo int not null,
id_cliente int not null,
FOREIGN KEY(id_veiculo) REFERENCES Veiculos (id_veiculo),
FOREIGN KEY(id_cliente) REFERENCES Clientes (id_cliente)
);

ALTER TABLE OS ADD FOREIGN KEY(id_peca) REFERENCES Pecas (id_peca);
ALTER TABLE OS ADD FOREIGN KEY(id_mecanico) REFERENCES Mecanicos (id_mecanico);
ALTER TABLE OS ADD FOREIGN KEY(id_servico) REFERENCES Servicos (id_servico);


-- INSERTS --

-- INSERT Clientes --
INSERT INTO Clientes (nome_cliente, email_cliente, telefone_cliente, CPF_cliente)
VALUES ('João Silva', 'joao@gmail.com', '11987654321', '123.456.789-10');

-- INSERT Veiculos --
INSERT INTO Veiculos (ano_veiculo, marca_veiculo, modelo_veiculo, cor_veiculo, placa_veiculo)
VALUES ('2018', 'Honda', 'Civic', 'Preto', 'ABC1234');

-- INSERT PECAS --
INSERT INTO Pecas (qtde_peca, tipo_peca, nome_peca, preco_peca)
VALUES (10, 'Motor', 'Correia Dentada', 150.00);

-- INSERT MECANICOS --
INSERT INTO Mecanicos (nome_mecanico, email_mecanico, telefone_mecanico, CPF_mecanico, salario_mecanico)
VALUES ('Carlos Mecânico', 'carlosmec@gmail.com', '11999998888', '987.654.321-00', 3500.00);

-- INSERT SERVICOS --
INSERT INTO Servicos (tipo_servico, preco_servico, descricao_servico, nome_servico)
VALUES ('Revisão', 200.00, 'Revisão geral do veículo', 'Revisão Completa');

-- INSERT OS --
INSERT INTO OS (tipo_os, data_termino_os, descricao_os, preco_os, data_incio_os, id_cliente, id_veiculo, id_peca, id_mecanico, id_servico)
VALUES ('Manutenção', '2025-01-15 10:00:00', 'Troca de peça e revisão', 500.00, '2025-01-14 08:00:00', 2, 2, 2, 2, 2);

-- INSERT POSSUI --
INSERT INTO possui (id_veiculo, id_cliente)
VALUES (2, 2);


-- SELECT --
select * from Clientes;
select * from Veiculos;
select *from Pecas;
select * from Mecanicos;
select * from Servicos;
select * from OS;
select * from possui;

-- ATIVIDADES SELECTS
-- 1.Selecione todos os veículos cadastrados que são da marca "Ford
SELECT * 
FROM Veiculos
WHERE marca_veiculo = 'Ford';

-- 2.Clientes que abriram OS nos últimos 6 meses
SELECT * FROM Clientes
WHERE id_cliente IN (
    SELECT id_cliente FROM OS
    WHERE data_incio_os >= DATE_SUB(CURDATE(), INTERVAL 6 MONTH)
);

-- 3.Mecânicos com “Injeção Eletrônica” no nome
SELECT * FROM Mecanicos
WHERE nome_mecanico LIKE '%Injeção Eletrônica%';

-- 4.OS com status “Aguardando Peça”
SELECT * FROM OS
WHERE tipo_os = 'Aguardando Peça';

-- 5.Peças com estoque abaixo de 5
SELECT * FROM Pecas
WHERE qtde_peca < 5;

-- 6.Veículos que tiveram mais de uma OS
SELECT * FROM Veiculos
WHERE (SELECT COUNT(*) FROM OS WHERE OS.id_veiculo = Veiculos.id_veiculo) > 1;

-- 7.OS feitas pelo mecânico 3
SELECT * FROM OS
WHERE id_mecanico = 3;

-- 8.Peças com preço acima de 200
SELECT nome_peca, preco_peca FROM Pecas
WHERE preco_peca > 200;

SET SQL_SAFE_UPDATES = 0;


