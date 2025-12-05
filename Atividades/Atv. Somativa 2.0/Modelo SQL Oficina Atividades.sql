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

-- Atividades --

-- 1. SELECT

SELECT * 
FROM Veiculos
WHERE marca_veiculo = 'Ford';


SELECT * FROM Clientes
WHERE id_cliente IN (
    SELECT id_cliente FROM OS
    WHERE data_incio_os >= DATE_SUB(CURDATE(), INTERVAL 6 MONTH)
);


SELECT * FROM Mecanicos
WHERE nome_mecanico LIKE '%Injeção Eletrônica%';


SELECT * FROM OS
WHERE tipo_os = 'Aguardando Peça';


SELECT * FROM Pecas
WHERE qtde_peca < 5;


SELECT * FROM Veiculos
WHERE (SELECT COUNT(*) FROM OS WHERE OS.id_veiculo = Veiculos.id_veiculo) > 1;


SELECT * FROM OS
WHERE id_mecanico = 3;


SELECT nome_peca, preco_peca FROM Pecas
WHERE preco_peca > 200;

-- 2. UPDATE 

UPDATE Pecas 
SET preco_peca = preco_peca * 1.05
WHERE nome_peca LIKE '%Bosch%';

ALTER TABLE OS ADD status_os VARCHAR(50);

UPDATE OS
SET status_os = 'Concluída'
WHERE id_os = 105;

UPDATE OS
SET data_termino_os = NOW()
WHERE status_os = 'Em Execução'
  AND data_incio_os < DATE_SUB(NOW(), INTERVAL 30 DAY);

UPDATE Pecas
SET qtde_peca = qtde_peca * 2
WHERE id_peca = 20;

-- 3. ALTER TABLE

ALTER TABLE Clientes ADD email2 VARCHAR(100);

ALTER TABLE Mecanicos ADD especialidade VARCHAR(150);

ALTER TABLE OS DROP COLUMN descricao_os;

ALTER TABLE Pecas ADD preco_custo DECIMAL(10,2);

ALTER TABLE Pecas
ADD CONSTRAINT chk_preco CHECK (preco_peca >= preco_custo);

-- 4. JOIN 

SELECT OS.id_os, Clientes.nome_cliente, Veiculos.placa_veiculo, OS.data_incio_os
FROM OS
JOIN Clientes ON OS.id_cliente = Clientes.id_cliente
JOIN Veiculos ON OS.id_veiculo = Veiculos.id_veiculo;

SELECT OS.id_os, Pecas.nome_peca, Pecas.qtde_peca
FROM OS
JOIN Pecas ON OS.id_peca = Pecas.id_peca
WHERE OS.id_os = 50;

SELECT Mecanicos.nome_mecanico
FROM OS
JOIN Mecanicos ON OS.id_mecanico = Mecanicos.id_mecanico
WHERE OS.id_os = 75;

SELECT Veiculos.placa_veiculo, Veiculos.modelo_veiculo, Clientes.nome_cliente
FROM Veiculos
JOIN possui ON possui.id_veiculo = Veiculos.id_veiculo
JOIN Clientes ON Clientes.id_cliente = possui.id_cliente;

-- 5. INNER JOIN

SELECT Veiculos.placa_veiculo, Veiculos.modelo_veiculo
FROM OS
JOIN Veiculos ON OS.id_veiculo = Veiculos.id_veiculo
WHERE OS.status_os = 'Em Execução';

SELECT DISTINCT Clientes.nome_cliente
FROM Clientes
JOIN possui ON possui.id_cliente = Clientes.id_cliente
JOIN Veiculos ON Veiculos.id_veiculo = possui.id_veiculo
WHERE Veiculos.marca_veiculo = 'Volkswagen';

SELECT DISTINCT Mecanicos.nome_mecanico
FROM Mecanicos
JOIN OS ON OS.id_mecanico = Mecanicos.id_mecanico;

SELECT DISTINCT Servicos.nome_servico
FROM Servicos
JOIN OS ON OS.id_servico = Servicos.id_servico;

-- 6. LEFT JOIN 

SELECT Clientes.nome_cliente, OS.id_os
FROM Clientes
LEFT JOIN OS ON OS.id_cliente = Clientes.id_cliente;

SELECT Mecanicos.nome_mecanico,
       COUNT(OS.id_os) AS total_os
FROM Mecanicos
LEFT JOIN OS ON OS.id_mecanico = Mecanicos.id_mecanico
GROUP BY Mecanicos.id_mecanico;

SELECT Pecas.nome_peca,
       COUNT(OS.id_os) AS vezes_usada
FROM Pecas
LEFT JOIN OS ON OS.id_peca = Pecas.id_peca
GROUP BY Pecas.id_peca;

SELECT Veiculos.placa_veiculo, Veiculos.modelo_veiculo,
       MAX(OS.data_incio_os) AS ultima_os
FROM Veiculos
LEFT JOIN OS ON OS.id_veiculo = Veiculos.id_veiculo
GROUP BY Veiculos.id_veiculo;

-- 7. RIGHT JOIN

SELECT OS.id_os, Clientes.nome_cliente
FROM Clientes
RIGHT JOIN OS ON OS.id_cliente = Clientes.id_cliente;

SELECT Servicos.nome_servico, OS.id_os
FROM Servicos
RIGHT JOIN OS ON OS.id_servico = Servicos.id_servico;

SELECT OS.id_os, Mecanicos.nome_mecanico
FROM Mecanicos
RIGHT JOIN OS ON OS.id_mecanico = Mecanicos.id_mecanico;

SELECT Veiculos.placa_veiculo, OS.id_os
FROM OS
RIGHT JOIN Veiculos ON Veiculos.id_veiculo = OS.id_veiculo;

-- 8. SUBQUERIES

SELECT id_cliente
FROM OS
GROUP BY id_cliente
HAVING COUNT(*) > 3;

SELECT nome_peca
FROM Pecas
WHERE id_peca IN (
   SELECT id_peca FROM OS WHERE id_mecanico = 4
);

SELECT placa_veiculo, modelo_veiculo
FROM Veiculos
WHERE id_veiculo NOT IN (SELECT id_veiculo FROM OS);

SELECT nome_servico
FROM Servicos
WHERE preco_servico > (SELECT AVG(preco_servico) FROM Servicos);

-- 9. AGREGAÇÃO

SELECT preco_os AS faturamento_total
FROM OS
WHERE id_os = 100;

SELECT AVG(DATEDIFF(data_termino_os, data_incio_os)) AS media_dias
FROM OS;

SELECT COUNT(*) AS total_veiculos
FROM Veiculos;

SELECT SUM(qtde_peca * preco_custo) AS total_inventario
FROM Pecas;

SELECT AVG(preco_servico) AS media_servicos
FROM Servicos;

SELECT marca_veiculo, COUNT(*) AS total
FROM Veiculos
GROUP BY marca_veiculo;

SELECT MONTH(data_incio_os) AS mes, COUNT(*) AS total
FROM OS
GROUP BY MONTH(data_incio_os);

SELECT status_os, COUNT(*) AS total
FROM OS
GROUP BY status_os;

SELECT COUNT(*) AS total
FROM OS
WHERE status_os = 'Concluída';

SELECT SUM(preco_os) AS faturamento
FROM OS
JOIN Veiculos ON OS.id_veiculo = Veiculos.id_veiculo
WHERE Veiculos.marca_veiculo = 'Fiat'
  AND OS.data_incio_os >= DATE_SUB(NOW(), INTERVAL 1 YEAR);

SELECT AVG(preco_servico) AS media_motor
FROM Servicos
WHERE nome_servico LIKE '%Motor%' OR descricao_servico LIKE '%Motor%';

SELECT id_cliente, SUM(preco_os) AS total_gasto
FROM OS
GROUP BY id_cliente
HAVING SUM(preco_os) > 5000;

SELECT id_peca, COUNT(*) AS vezes_usada
FROM OS
GROUP BY id_peca
HAVING COUNT(*) > 100;

SELECT especialidade, COUNT(OS.id_os) AS total_os
FROM Mecanicos
LEFT JOIN OS ON OS.id_mecanico = Mecanicos.id_mecanico
GROUP BY especialidade
HAVING COUNT(OS.id_os) > 20;

SELECT Mecanicos.nome_mecanico, COUNT(OS.id_os) AS total_os
FROM Mecanicos
LEFT JOIN OS ON OS.id_mecanico = Mecanicos.id_mecanico
GROUP BY Mecanicos.id_mecanico
ORDER BY total_os DESC
LIMIT 1;

-- 10. INDEXAÇÃO

CREATE INDEX idx_placa ON Veiculos(placa_veiculo);

CREATE INDEX idx_os_veiculo ON OS(id_veiculo);

CREATE INDEX idx_os_peca_composto ON OS(id_os, id_peca);

SET SQL_SAFE_UPDATES = 0;


