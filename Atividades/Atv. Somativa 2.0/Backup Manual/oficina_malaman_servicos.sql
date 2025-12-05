CREATE DATABASE  IF NOT EXISTS `oficina_malaman` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `oficina_malaman`;
-- MySQL dump 10.13  Distrib 8.0.43, for Win64 (x86_64)
--
-- Host: localhost    Database: oficina_malaman
-- ------------------------------------------------------
-- Server version	8.0.43

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

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
INSERT INTO `servicos` (`tipo_servico`, `preco_servico`, `descricao_servico`, `nome_servico`, `id_servico`) VALUES ('Revisão',200.00,'Revisão geral do veículo','Revisão Completa',2),('Ordem de Serviço',250.00,'Trocar','OS - 2025-11-28 16:38:51',3),('Ordem de Serviço',250.00,'Trocar','OS - 2025-11-28 16:39:20',4),('Ordem de Serviço',250.00,'Troca de correia dentada','OS - 2025-11-28 16:48:37',5),('Ordem de Serviço',250.00,'teste','OS - 2025-11-28 16:51:42',6),('Ordem de Serviço',250.00,'teste','OS - 2025-11-28 16:52:52',7),('Ordem de Serviço',250.00,'teste','OS - 2025-11-28 16:52:56',8),('Ordem de Serviço',250.00,'teste','OS - 2025-11-28 16:56:59',9),('Ordem de Serviço',250.00,'teste','OS - 2025-11-28 17:01:22',10),('Ordem de Serviço',300.00,'teste','OS - 2025-11-28 18:58:09',11),('Ordem de Serviço',300.00,'teste','OS - 2025-11-28 19:54:09',12);
/*!40000 ALTER TABLE `servicos` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-12-05 14:21:10
