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
INSERT INTO `os` (`tipo_os`, `data_termino_os`, `descricao_os`, `id_os`, `preco_os`, `data_incio_os`, `id_cliente`, `id_veiculo`, `id_peca`, `id_mecanico`, `id_servico`) VALUES ('Manutenção','2025-01-15 10:00:00','Troca de peça e revisão',2,500.00,'2025-01-14 08:00:00',2,2,2,2,2),('Reparo','2025-11-28 18:58:09','teste',4,300.00,'2025-11-28 18:58:09',4,3,3,2,11),('Reparo','2025-11-28 19:54:09','teste',5,300.00,'2025-11-28 19:54:09',2,2,3,2,12);
/*!40000 ALTER TABLE `os` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-12-05 14:21:11
