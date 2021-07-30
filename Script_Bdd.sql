-- MySQL dump 10.13  Distrib 8.0.26, for Win64 (x86_64)
--
-- Host: localhost    Database: materiel_cabinet
-- ------------------------------------------------------
-- Server version	8.0.26

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
-- Table structure for table `categorie`
--

DROP TABLE IF EXISTS `categorie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categorie` (
  `id_categorie` int NOT NULL AUTO_INCREMENT,
  `code_categorie` varchar(45) DEFAULT NULL,
  `libelle` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_categorie`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categorie`
--

LOCK TABLES `categorie` WRITE;
/*!40000 ALTER TABLE `categorie` DISABLE KEYS */;
INSERT INTO `categorie` VALUES (1,'OI','Outillage industriel'),(2,'MB','Matériel de Bureau'),(3,'MI','Matériel Industriel');
/*!40000 ALTER TABLE `categorie` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `client`
--

DROP TABLE IF EXISTS `client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `client` (
  `code_client` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(120) DEFAULT NULL,
  `adresse` varchar(255) DEFAULT NULL,
  `numero_tel` varchar(120) DEFAULT NULL,
  `id_type` int NOT NULL,
  PRIMARY KEY (`code_client`),
  KEY `fk_client_type_client_idx` (`id_type`),
  CONSTRAINT `fk_client_type_client` FOREIGN KEY (`id_type`) REFERENCES `type_client` (`id_type`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client`
--

LOCK TABLES `client` WRITE;
/*!40000 ALTER TABLE `client` DISABLE KEYS */;
INSERT INTO `client` VALUES (1,'yaya','6 rue de la promenade, 59491 Villeneuve','0700000000',1),(2,'toto','15 rue de lens, 59300 Valenciennes','0700000000',2);
/*!40000 ALTER TABLE `client` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fiche_location`
--

DROP TABLE IF EXISTS `fiche_location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fiche_location` (
  `numero_location` int NOT NULL AUTO_INCREMENT,
  `code_client` int NOT NULL,
  `ref_materiel` int NOT NULL,
  `date_location` date DEFAULT NULL,
  PRIMARY KEY (`numero_location`),
  UNIQUE KEY `numero_location_UNIQUE` (`numero_location`),
  KEY `fk_client_has_materiel_materiel1_idx` (`ref_materiel`),
  KEY `fk_client_has_materiel_client1_idx` (`code_client`),
  CONSTRAINT `fk_client_has_materiel_client1` FOREIGN KEY (`code_client`) REFERENCES `client` (`code_client`),
  CONSTRAINT `fk_client_has_materiel_materiel1` FOREIGN KEY (`ref_materiel`) REFERENCES `materiel` (`ref_materiel`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fiche_location`
--

LOCK TABLES `fiche_location` WRITE;
/*!40000 ALTER TABLE `fiche_location` DISABLE KEYS */;
/*!40000 ALTER TABLE `fiche_location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `materiel`
--

DROP TABLE IF EXISTS `materiel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `materiel` (
  `ref_materiel` int NOT NULL AUTO_INCREMENT,
  `designation` varchar(255) DEFAULT NULL,
  `date_achat` date DEFAULT NULL,
  `prix_jour` double DEFAULT NULL,
  `id_categorie` int NOT NULL,
  PRIMARY KEY (`ref_materiel`),
  KEY `fk_materiel_categorie1_idx` (`id_categorie`),
  CONSTRAINT `fk_materiel_categorie1` FOREIGN KEY (`id_categorie`) REFERENCES `categorie` (`id_categorie`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `materiel`
--

LOCK TABLES `materiel` WRITE;
/*!40000 ALTER TABLE `materiel` DISABLE KEYS */;
INSERT INTO `materiel` VALUES (1,'design 1','2020-12-25',15.16,1),(2,'design 2','2020-05-20',35.16,2),(3,'design 3','2020-05-20',20.16,3);
/*!40000 ALTER TABLE `materiel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `type_client`
--

DROP TABLE IF EXISTS `type_client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `type_client` (
  `id_type` int NOT NULL AUTO_INCREMENT,
  `libelle` varchar(120) DEFAULT NULL,
  PRIMARY KEY (`id_type`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `type_client`
--

LOCK TABLES `type_client` WRITE;
/*!40000 ALTER TABLE `type_client` DISABLE KEYS */;
INSERT INTO `type_client` VALUES (1,'Particulier'),(2,'Professionnel');
/*!40000 ALTER TABLE `type_client` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-07-30 15:29:19
