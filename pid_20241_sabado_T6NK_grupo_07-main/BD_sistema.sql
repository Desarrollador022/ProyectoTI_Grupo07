-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: sistema_prestamos
-- ------------------------------------------------------
-- Server version	8.0.36

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
-- Table structure for table `invercionista`
--

DROP TABLE IF EXISTS `invercionista`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `invercionista` (
  `idinvercionista` int NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `idusuario` int DEFAULT NULL,
  PRIMARY KEY (`idinvercionista`),
  KEY `idusuariofk_idx` (`idusuario`),
  CONSTRAINT `idusuariofk` FOREIGN KEY (`idusuario`) REFERENCES `usuario` (`idusuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invercionista`
--

LOCK TABLES `invercionista` WRITE;
/*!40000 ALTER TABLE `invercionista` DISABLE KEYS */;
/*!40000 ALTER TABLE `invercionista` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jefeprestamista`
--

DROP TABLE IF EXISTS `jefeprestamista`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jefeprestamista` (
  `idjefePrestamista` int NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `idusuario` int NOT NULL,
  `idinvercionista` int NOT NULL,
  `idzona` int NOT NULL,
  PRIMARY KEY (`idjefePrestamista`),
  KEY `fkusuario_idx` (`idusuario`),
  KEY `fkinvercionista_idx` (`idinvercionista`),
  KEY `fkzona1_idx` (`idzona`),
  CONSTRAINT `fkinvercionista` FOREIGN KEY (`idinvercionista`) REFERENCES `invercionista` (`idinvercionista`),
  CONSTRAINT `fkusuario` FOREIGN KEY (`idusuario`) REFERENCES `usuario` (`idusuario`),
  CONSTRAINT `fkzona1` FOREIGN KEY (`idzona`) REFERENCES `zona` (`idzona`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jefeprestamista`
--

LOCK TABLES `jefeprestamista` WRITE;
/*!40000 ALTER TABLE `jefeprestamista` DISABLE KEYS */;
/*!40000 ALTER TABLE `jefeprestamista` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `opcion`
--

DROP TABLE IF EXISTS `opcion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `opcion` (
  `idopcion` int NOT NULL AUTO_INCREMENT,
  `estado` int DEFAULT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `ruta` varchar(100) DEFAULT NULL,
  `tipo` int DEFAULT NULL,
  PRIMARY KEY (`idopcion`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `opcion`
--

LOCK TABLES `opcion` WRITE;
/*!40000 ALTER TABLE `opcion` DISABLE KEYS */;
INSERT INTO `opcion` VALUES (1,1,'Crud Jefe de Prestamista','verCrudJefePrestamista',1);
/*!40000 ALTER TABLE `opcion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prestamista`
--

DROP TABLE IF EXISTS `prestamista`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prestamista` (
  `idprestamista` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  `idusuario` int NOT NULL,
  `idjefeprestamista` int NOT NULL,
  `idzona` int NOT NULL,
  PRIMARY KEY (`idprestamista`),
  KEY `fk_usuario_idx` (`idusuario`),
  KEY `fk_jefeprestamista_idx` (`idjefeprestamista`),
  KEY `fkzona2_idx` (`idzona`),
  CONSTRAINT `fkjefeprestamista` FOREIGN KEY (`idjefeprestamista`) REFERENCES `jefeprestamista` (`idjefePrestamista`),
  CONSTRAINT `fkusuariotipo3` FOREIGN KEY (`idusuario`) REFERENCES `usuario` (`idusuario`),
  CONSTRAINT `fkzona2` FOREIGN KEY (`idzona`) REFERENCES `zona` (`idzona`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prestamista`
--

LOCK TABLES `prestamista` WRITE;
/*!40000 ALTER TABLE `prestamista` DISABLE KEYS */;
/*!40000 ALTER TABLE `prestamista` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prestatario`
--

DROP TABLE IF EXISTS `prestatario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prestatario` (
  `idprestatario` int NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `idusuario` int NOT NULL,
  `idprestamista` int NOT NULL,
  `idzona` int NOT NULL,
  PRIMARY KEY (`idprestatario`),
  KEY `fkusuariotipo4_idx` (`idusuario`),
  KEY `fkprestamista_idx` (`idprestamista`),
  KEY `fkzona3_idx` (`idzona`),
  CONSTRAINT `fkprestamista` FOREIGN KEY (`idprestamista`) REFERENCES `prestamista` (`idprestamista`),
  CONSTRAINT `fkusuariotipo4` FOREIGN KEY (`idusuario`) REFERENCES `usuario` (`idusuario`),
  CONSTRAINT `fkzona3` FOREIGN KEY (`idzona`) REFERENCES `zona` (`idzona`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prestatario`
--

LOCK TABLES `prestatario` WRITE;
/*!40000 ALTER TABLE `prestatario` DISABLE KEYS */;
/*!40000 ALTER TABLE `prestatario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rol`
--

DROP TABLE IF EXISTS `rol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rol` (
  `idrol` int NOT NULL AUTO_INCREMENT,
  `estado` int DEFAULT NULL,
  `nombre` varchar(100) NOT NULL,
  PRIMARY KEY (`idrol`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rol`
--

LOCK TABLES `rol` WRITE;
/*!40000 ALTER TABLE `rol` DISABLE KEYS */;
INSERT INTO `rol` VALUES (1,1,'Invercionista'),(2,1,'Jefe de Prestamista'),(3,1,'Prestamista'),(4,1,'Prestatario');
/*!40000 ALTER TABLE `rol` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rol_has_opcion`
--

DROP TABLE IF EXISTS `rol_has_opcion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rol_has_opcion` (
  `idOpcion` int NOT NULL,
  `idRol` int NOT NULL,
  KEY `fkrol_idx` (`idRol`),
  KEY `fkopcion_idx` (`idOpcion`),
  CONSTRAINT `fkopcion` FOREIGN KEY (`idOpcion`) REFERENCES `opcion` (`idopcion`),
  CONSTRAINT `fkrol` FOREIGN KEY (`idRol`) REFERENCES `rol` (`idrol`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rol_has_opcion`
--

LOCK TABLES `rol_has_opcion` WRITE;
/*!40000 ALTER TABLE `rol_has_opcion` DISABLE KEYS */;
INSERT INTO `rol_has_opcion` VALUES (1,1);
/*!40000 ALTER TABLE `rol_has_opcion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `idusuario` int NOT NULL AUTO_INCREMENT,
  `dni` varchar(8) NOT NULL,
  `password` varchar(15) NOT NULL,
  PRIMARY KEY (`idusuario`),
  UNIQUE KEY `password_UNIQUE` (`password`),
  UNIQUE KEY `dni_UNIQUE` (`dni`),
  UNIQUE KEY `idusuario_UNIQUE` (`idusuario`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'77777777','77777777');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario_has_rol`
--

DROP TABLE IF EXISTS `usuario_has_rol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario_has_rol` (
  `idusuario` int DEFAULT NULL,
  `idrol` int DEFAULT NULL,
  KEY `fkusuario_idx` (`idusuario`),
  KEY `fkrol_idx` (`idrol`),
  CONSTRAINT `fkrolusuario` FOREIGN KEY (`idrol`) REFERENCES `rol` (`idrol`),
  CONSTRAINT `fkusuariorol` FOREIGN KEY (`idusuario`) REFERENCES `usuario` (`idusuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario_has_rol`
--

LOCK TABLES `usuario_has_rol` WRITE;
/*!40000 ALTER TABLE `usuario_has_rol` DISABLE KEYS */;
INSERT INTO `usuario_has_rol` VALUES (1,1);
/*!40000 ALTER TABLE `usuario_has_rol` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zona`
--

DROP TABLE IF EXISTS `zona`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zona` (
  `idzona` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(200) NOT NULL,
  PRIMARY KEY (`idzona`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zona`
--

LOCK TABLES `zona` WRITE;
/*!40000 ALTER TABLE `zona` DISABLE KEYS */;
/*!40000 ALTER TABLE `zona` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-04-25  0:02:11
