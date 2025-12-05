-- MySQL dump 10.13  Distrib 8.0.43, for Win64 (x86_64)
--
-- Host: localhost    Database: Oficina_Malaman
-- ------------------------------------------------------
-- Server version	8.0.43

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `Oficina_Malaman`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `Oficina_Malaman` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `Oficina_Malaman`;

--
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientes` (
  `nome_cliente` varchar(100) NOT NULL,
  `id_cliente` int NOT NULL AUTO_INCREMENT,
  `email_cliente` varchar(100) DEFAULT NULL,
  `telefone_cliente` varchar(14) NOT NULL,
  `CPF_cliente` varchar(14) NOT NULL,
  PRIMARY KEY (`id_cliente`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES ('João',2,'joao@gmail.com','11987654321','123.456.789-10'),('Matheus',4,'matheusmalaman2014@gmail.com','23123','3123'),('Matheus',5,'matheusmalaman2014@gmail.com','12121313','545646'),('Bruno da Costa',6,'bruno@gmail.com','19997622','123123123-11'),('Matheus',7,'matheus@techfit.com','19997622','312312313123');
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mecanicos`
--

DROP TABLE IF EXISTS `mecanicos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mecanicos` (
  `nome_mecanico` varchar(100) NOT NULL,
  `id_mecanico` int NOT NULL AUTO_INCREMENT,
  `email_mecanico` varchar(100) NOT NULL,
  `telefone_mecanico` varchar(14) NOT NULL,
  `CPF_mecanico` varchar(14) NOT NULL,
  `salario_mecanico` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id_mecanico`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mecanicos`
--

LOCK TABLES `mecanicos` WRITE;
/*!40000 ALTER TABLE `mecanicos` DISABLE KEYS */;
INSERT INTO `mecanicos` VALUES ('Carlos Mecânico',2,'carlosmec@gmail.com','11999998888','987.654.321-00',3500.00),('Matheus',3,'matheus@techfit.com','19997622','123.456.789-10',2.00);
/*!40000 ALTER TABLE `mecanicos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `os`
--

DROP TABLE IF EXISTS `os`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `os` (
  `tipo_os` varchar(100) NOT NULL,
  `data_termino_os` datetime NOT NULL,
  `descricao_os` varchar(100) NOT NULL,
  `id_os` int NOT NULL AUTO_INCREMENT,
  `preco_os` decimal(10,2) NOT NULL,
  `data_incio_os` datetime DEFAULT NULL,
  `id_cliente` int NOT NULL,
  `id_veiculo` int NOT NULL,
  `id_peca` int DEFAULT NULL,
  `id_mecanico` int NOT NULL,
  `id_servico` int NOT NULL,
  PRIMARY KEY (`id_os`),
  KEY `id_cliente` (`id_cliente`),
  KEY `id_veiculo` (`id_veiculo`),
  KEY `id_mecanico` (`id_mecanico`),
  KEY `id_servico` (`id_servico`),
  KEY `id_peca` (`id_peca`),
  CONSTRAINT `os_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id_cliente`),
  CONSTRAINT `os_ibfk_2` FOREIGN KEY (`id_veiculo`) REFERENCES `veiculos` (`id_veiculo`),
  CONSTRAINT `os_ibfk_3` FOREIGN KEY (`id_peca`) REFERENCES `pecas` (`id_peca`),
  CONSTRAINT `os_ibfk_4` FOREIGN KEY (`id_mecanico`) REFERENCES `mecanicos` (`id_mecanico`),
  CONSTRAINT `os_ibfk_5` FOREIGN KEY (`id_servico`) REFERENCES `servicos` (`id_servico`),
  CONSTRAINT `os_ibfk_6` FOREIGN KEY (`id_peca`) REFERENCES `pecas` (`id_peca`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `os`
--

LOCK TABLES `os` WRITE;
/*!40000 ALTER TABLE `os` DISABLE KEYS */;
INSERT INTO `os` VALUES ('Manutenção','2025-01-15 10:00:00','Troca de peça e revisão',2,500.00,'2025-01-14 08:00:00',2,2,2,2,2),('Reparo','2025-11-28 18:58:09','teste',4,300.00,'2025-11-28 18:58:09',4,3,3,2,11),('Reparo','2025-11-28 19:54:09','teste',5,300.00,'2025-11-28 19:54:09',2,2,3,2,12);
/*!40000 ALTER TABLE `os` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pecas`
--

DROP TABLE IF EXISTS `pecas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pecas` (
  `id_peca` int NOT NULL AUTO_INCREMENT,
  `qtde_peca` int NOT NULL,
  `tipo_peca` varchar(100) NOT NULL,
  `nome_peca` varchar(100) NOT NULL,
  `preco_peca` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id_peca`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pecas`
--

LOCK TABLES `pecas` WRITE;
/*!40000 ALTER TABLE `pecas` DISABLE KEYS */;
INSERT INTO `pecas` VALUES (2,10,'Motor','Correia Dentada',150.00),(3,30,'motor','oleo',90.00);
/*!40000 ALTER TABLE `pecas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `possui`
--

DROP TABLE IF EXISTS `possui`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `possui` (
  `id_possui` int NOT NULL AUTO_INCREMENT,
  `id_veiculo` int NOT NULL,
  `id_cliente` int NOT NULL,
  PRIMARY KEY (`id_possui`),
  KEY `id_veiculo` (`id_veiculo`),
  KEY `id_cliente` (`id_cliente`),
  CONSTRAINT `possui_ibfk_1` FOREIGN KEY (`id_veiculo`) REFERENCES `veiculos` (`id_veiculo`),
  CONSTRAINT `possui_ibfk_2` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id_cliente`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `possui`
--

LOCK TABLES `possui` WRITE;
/*!40000 ALTER TABLE `possui` DISABLE KEYS */;
INSERT INTO `possui` VALUES (2,2,2);
/*!40000 ALTER TABLE `possui` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `servicos`
--

DROP TABLE IF EXISTS `servicos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `servicos` (
  `tipo_servico` varchar(100) DEFAULT NULL,
  `preco_servico` decimal(10,2) NOT NULL,
  `descricao_servico` varchar(100) DEFAULT NULL,
  `nome_servico` varchar(100) NOT NULL,
  `id_servico` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id_servico`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `servicos`
--

LOCK TABLES `servicos` WRITE;
/*!40000 ALTER TABLE `servicos` DISABLE KEYS */;
INSERT INTO `servicos` VALUES ('Revisão',200.00,'Revisão geral do veículo','Revisão Completa',2),('Ordem de Serviço',250.00,'Trocar','OS - 2025-11-28 16:38:51',3),('Ordem de Serviço',250.00,'Trocar','OS - 2025-11-28 16:39:20',4),('Ordem de Serviço',250.00,'Troca de correia dentada','OS - 2025-11-28 16:48:37',5),('Ordem de Serviço',250.00,'teste','OS - 2025-11-28 16:51:42',6),('Ordem de Serviço',250.00,'teste','OS - 2025-11-28 16:52:52',7),('Ordem de Serviço',250.00,'teste','OS - 2025-11-28 16:52:56',8),('Ordem de Serviço',250.00,'teste','OS - 2025-11-28 16:56:59',9),('Ordem de Serviço',250.00,'teste','OS - 2025-11-28 17:01:22',10),('Ordem de Serviço',300.00,'teste','OS - 2025-11-28 18:58:09',11),('Ordem de Serviço',300.00,'teste','OS - 2025-11-28 19:54:09',12);
/*!40000 ALTER TABLE `servicos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `veiculos`
--

DROP TABLE IF EXISTS `veiculos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `veiculos` (
  `id_veiculo` int NOT NULL AUTO_INCREMENT,
  `ano_veiculo` year NOT NULL,
  `marca_veiculo` varchar(100) NOT NULL,
  `modelo_veiculo` varchar(100) NOT NULL,
  `cor_veiculo` varchar(100) NOT NULL,
  `placa_veiculo` varchar(7) NOT NULL,
  PRIMARY KEY (`id_veiculo`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `veiculos`
--

LOCK TABLES `veiculos` WRITE;
/*!40000 ALTER TABLE `veiculos` DISABLE KEYS */;
INSERT INTO `veiculos` VALUES (2,2018,'Honda','Civic','Preto','ABC1234'),(3,1970,'Fiat','Corsa','preto','123-sdt');
/*!40000 ALTER TABLE `veiculos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'Oficina_Malaman'
--

--
-- Dumping routines for database 'Oficina_Malaman'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-12-05 14:25:52
