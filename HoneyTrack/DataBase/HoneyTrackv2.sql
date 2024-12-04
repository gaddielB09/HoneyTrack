-- MySQL dump 10.13  Distrib 8.0.40, for Linux (x86_64)
--
-- Host: localhost    Database: HoneyTrackv2
-- ------------------------------------------------------
-- Server version	8.0.40-0ubuntu0.24.04.1

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
-- Table structure for table `AREA`
--

DROP TABLE IF EXISTS `AREA`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AREA` (
  `code` varchar(5) NOT NULL,
  `description` varchar(32) NOT NULL,
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AREA`
--

LOCK TABLES `AREA` WRITE;
/*!40000 ALTER TABLE `AREA` DISABLE KEYS */;
INSERT INTO `AREA` VALUES ('FPARE','Finished Products Area'),('RMARE','Raw Material Area');
/*!40000 ALTER TABLE `AREA` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `EMPLOYEE`
--

DROP TABLE IF EXISTS `EMPLOYEE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `EMPLOYEE` (
  `num` int NOT NULL AUTO_INCREMENT,
  `firstName` varchar(16) NOT NULL,
  `lastName` varchar(24) NOT NULL,
  `middleName` varchar(24) DEFAULT NULL,
  `phone` varchar(10) NOT NULL,
  `email` varchar(32) NOT NULL,
  `taxId` varchar(13) NOT NULL,
  `jobPosition` varchar(5) DEFAULT NULL,
  `employeeStatus` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`num`),
  KEY `jobPosition` (`jobPosition`),
  KEY `employeeStatus` (`employeeStatus`),
  CONSTRAINT `EMPLOYEE_ibfk_1` FOREIGN KEY (`jobPosition`) REFERENCES `JOB_POSITION` (`code`) ON DELETE CASCADE,
  CONSTRAINT `EMPLOYEE_ibfk_2` FOREIGN KEY (`employeeStatus`) REFERENCES `EMPLOYEE_STATUS` (`code`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EMPLOYEE`
--

LOCK TABLES `EMPLOYEE` WRITE;
/*!40000 ALTER TABLE `EMPLOYEE` DISABLE KEYS */;
INSERT INTO `EMPLOYEE` VALUES (1,'Gaddiel','Barrios','Uriarte','6641234567','Gaddiel@gmail.com','BAUG8007229H5','ADMIN','ACTIV'),(2,'Brandon','Gonzalez','Gonzalez','6649876543','Brandon@gmail.com','GOGB9803024B7','ADMIN','ACTIV'),(3,'Andres','Cuevas','Zapata','6644567890','Andres@gmail.com','CZAA9205103A6','ADMIN','ACTIV'),(4,'Yadira','Salazar','Urtuzuastegui','6643456789','Yadira@gmail.com','SAUY7606113N6','ADMIN','ACTIV'),(5,'Alexa','Perez','Morales','6648765432','Alexa@gmail.com','PEMA980503V7','INANA','INACT'),(6,'Omar','Gonzalez','Gonzalez','6642345678','Omar@gmail.com','GOGO9208211M0','INANA','ACTIV'),(7,'Axl','Gonzalez','Penaloza','6645678901','Axl@gmail.com','GOPA8906206L5','INANA','INACT'),(8,'Horus','Gonzalez','Penaloza','6647654321','Horus@gmail.com','GOPH9403229J9','INANA','ACTIV'),(9,'Eduardo','Ruiz','Garcia','6646543210','Eduardo@gmail.com','RUGE750711M9','INANA','ACTIV'),(10,'Carlos','Martinez','Gutierrez','6648901234','Carlos@gmail.com','MAGC8905174M3','RECEP','ACTIV'),(11,'Esperanza','Salazar','Espinoza','6643128907','Esperanza@gmail.com','SAEE6709226L0','RECEP','INACT'),(12,'Cathy','Soto','Garcia','6647683410','Cathy@gmail.com','SOGC9212102V9','RECEP','ACTIV'),(13,'Kira','Garfias','Gonzalez','6645392718','Kira@gmail.com','GAGK950512H1','RECEP','ACTIV'),(14,'Cesar','Soto','Quintana','6642048756','Cesar@gmail.com','SOQC8807235A5','RECEP','INACT'),(15,'Gabriel','Herrera','Gonzalez','6649435102','Gabriel@gmail.com','HEGG9509201B3','RAWMM','ACTIV');
/*!40000 ALTER TABLE `EMPLOYEE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `EMPLOYEE_STATUS`
--

DROP TABLE IF EXISTS `EMPLOYEE_STATUS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `EMPLOYEE_STATUS` (
  `code` varchar(5) NOT NULL,
  `description` varchar(32) NOT NULL,
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EMPLOYEE_STATUS`
--

LOCK TABLES `EMPLOYEE_STATUS` WRITE;
/*!40000 ALTER TABLE `EMPLOYEE_STATUS` DISABLE KEYS */;
INSERT INTO `EMPLOYEE_STATUS` VALUES ('ACTIV','Active'),('INACT','Inactive'),('TERMI','Terminated');
/*!40000 ALTER TABLE `EMPLOYEE_STATUS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FINISHED_PRODUCT`
--

DROP TABLE IF EXISTS `FINISHED_PRODUCT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FINISHED_PRODUCT` (
  `code` varchar(8) NOT NULL,
  `name` varchar(32) NOT NULL,
  `description` varchar(256) NOT NULL,
  `netCost` decimal(10,2) DEFAULT NULL,
  `length` decimal(10,2) NOT NULL,
  `height` decimal(10,2) NOT NULL,
  `width` decimal(10,2) NOT NULL,
  `weight` decimal(10,2) NOT NULL,
  `volume` decimal(10,2) NOT NULL,
  `stock` int NOT NULL,
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FINISHED_PRODUCT`
--

LOCK TABLES `FINISHED_PRODUCT` WRITE;
/*!40000 ALTER TABLE `FINISHED_PRODUCT` DISABLE KEYS */;
INSERT INTO `FINISHED_PRODUCT` VALUES ('GS24P','Galaxy S24+','High-end smartphone with large screen',14940.00,16.10,7.80,0.80,200.00,100.46,20),('GS24U','Galaxy S24 Ultra','Smartphone with advanced camera, 5G',18810.00,16.50,7.80,0.90,228.00,115.83,16),('GYS24','Galaxy S24','High-end smartphone, 5G',12870.00,15.60,7.30,0.80,168.00,91.10,0),('GZFL6','Galaxy Z Flip 6','Compact foldable smartphone',16670.00,8.50,7.20,1.00,187.00,61.20,18),('GZFO6','Galaxy Z Fold 6','Foldable smartphone with flexible screen',21090.00,16.70,7.80,1.30,280.00,169.34,12);
/*!40000 ALTER TABLE `FINISHED_PRODUCT` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`cisco`@`localhost`*/ /*!50003 TRIGGER `calculateFinishedProductVolume` BEFORE INSERT ON `FINISHED_PRODUCT` FOR EACH ROW BEGIN
    SET NEW.volume = NEW.length * NEW.height * NEW.width;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`cisco`@`localhost`*/ /*!50003 TRIGGER `updateVolumeProduct` BEFORE UPDATE ON `FINISHED_PRODUCT` FOR EACH ROW BEGIN
    SET NEW.volume = (NEW.length * NEW.height * NEW.width);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `JOB_POSITION`
--

DROP TABLE IF EXISTS `JOB_POSITION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `JOB_POSITION` (
  `code` varchar(5) NOT NULL,
  `description` varchar(32) NOT NULL,
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `JOB_POSITION`
--

LOCK TABLES `JOB_POSITION` WRITE;
/*!40000 ALTER TABLE `JOB_POSITION` DISABLE KEYS */;
INSERT INTO `JOB_POSITION` VALUES ('ADMIN','Administrator'),('INANA','Inventory Analyst'),('RAWMM','Raw Material Manager'),('RECEP','Receptionist');
/*!40000 ALTER TABLE `JOB_POSITION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `LOCATION`
--

DROP TABLE IF EXISTS `LOCATION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `LOCATION` (
  `code` varchar(8) NOT NULL,
  `containerName` varchar(12) NOT NULL,
  `aisle` varchar(2) NOT NULL,
  `side` varchar(1) NOT NULL,
  `bay` varchar(2) NOT NULL,
  `level` varchar(1) NOT NULL,
  `position` varchar(2) NOT NULL,
  `capacity` int NOT NULL,
  `length` decimal(10,2) NOT NULL,
  `height` decimal(10,2) NOT NULL,
  `width` decimal(10,2) NOT NULL,
  `volume` decimal(10,2) NOT NULL,
  `area` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`code`),
  KEY `area` (`area`),
  CONSTRAINT `LOCATION_ibfk_1` FOREIGN KEY (`area`) REFERENCES `AREA` (`code`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `LOCATION`
--

LOCK TABLES `LOCATION` WRITE;
/*!40000 ALTER TABLE `LOCATION` DISABLE KEYS */;
INSERT INTO `LOCATION` VALUES ('01A01A01','Bin','01','A','01','A','01',200,17.78,22.86,17.78,7226.69,'RMARE'),('01A01A02','Bin','01','A','01','A','02',200,17.78,22.86,17.78,7226.69,'RMARE'),('01A01A03','Bin','01','A','01','A','03',200,17.78,22.86,17.78,7226.69,'RMARE'),('01A01A04','Bin','01','A','01','A','04',2064,17.78,22.86,17.78,7226.69,'RMARE'),('01A01B01','Bin','01','A','01','B','01',200,17.78,22.86,17.78,7226.69,'RMARE'),('01A01B02','Bin','01','A','01','B','02',200,17.78,22.86,17.78,7226.69,'RMARE'),('01A01B03','Bin','01','A','01','B','03',200,17.78,22.86,17.78,7226.69,'RMARE'),('01A01B04','Bin','01','A','01','B','04',3687,17.78,22.86,17.78,7226.69,'RMARE'),('01A01C01','Bin','01','A','01','C','01',200,17.78,22.86,17.78,7226.69,'RMARE'),('01A01C02','Bin','01','A','01','C','02',200,17.78,22.86,17.78,7226.69,'RMARE'),('01A01C03','Bin','01','A','01','C','03',200,17.78,22.86,17.78,7226.69,'RMARE'),('01A01C04','Bin','01','A','01','C','04',9635,17.78,22.86,17.78,7226.69,'RMARE'),('01A02A01','Bin','01','A','02','A','01',16424,17.78,22.86,17.78,7226.69,'RMARE'),('01A02A02','Bin','01','A','02','A','02',11470,17.78,22.86,17.78,7226.69,'RMARE'),('01A02A03','Bin','01','A','02','A','03',1642,17.78,22.86,17.78,7226.69,'RMARE'),('01A02A04','Bin','01','A','02','A','04',12459,17.78,22.86,17.78,7226.69,'RMARE'),('01A02B01','Bin','01','A','02','B','01',60222,17.78,22.86,17.78,7226.69,'RMARE'),('01A02B02','Bin','01','A','02','B','02',277,17.78,22.86,17.78,7226.69,'RMARE'),('01A02B03','Bin','01','A','02','B','03',3226,17.78,22.86,17.78,7226.69,'RMARE'),('01A02B04','Bin','01','A','02','B','04',30111,17.78,22.86,17.78,7226.69,'RMARE'),('01A02C01','Bin','01','A','02','C','01',6882,17.78,22.86,17.78,7226.69,'RMARE'),('01A02C02','Bin','01','A','02','C','02',657,17.78,22.86,17.78,7226.69,'RMARE'),('01A02C03','Bin','01','A','02','C','03',5275,17.78,22.86,17.78,7226.69,'RMARE'),('01A02C04','Bin','01','A','02','C','04',5161,17.78,22.86,17.78,7226.69,'RMARE'),('01A03A01','Bin','01','A','03','A','01',9899,17.78,22.86,17.78,7226.69,'RMARE'),('01A03A02','Bin','01','A','03','A','02',1313,17.78,22.86,17.78,7226.69,'RMARE'),('01A03A03','Bin','01','A','03','A','03',9635,17.78,22.86,17.78,7226.69,'RMARE'),('01A03A04','Bin','01','A','03','A','04',5161,17.78,22.86,17.78,7226.69,'RMARE'),('01A03B01','Bin','01','A','03','B','01',215,17.78,22.86,17.78,7226.69,'RMARE'),('01A03B02','Bin','01','A','03','B','02',2890,17.78,22.86,17.78,7226.69,'RMARE'),('01A03B03','Bin','01','A','03','B','03',20647,17.78,22.86,17.78,7226.69,'RMARE'),('01A03B04','Bin','01','A','03','B','04',9899,17.78,22.86,17.78,7226.69,'RMARE'),('01A03C01','Bin','01','A','03','C','01',555,17.78,22.86,17.78,7226.69,'RMARE'),('01A03C02','Bin','01','A','03','C','02',3226,17.78,22.86,17.78,7226.69,'RMARE'),('01A03C03','Bin','01','A','03','C','03',60222,17.78,22.86,17.78,7226.69,'RMARE'),('01A03C04','Bin','01','A','03','C','04',215,17.78,22.86,17.78,7226.69,'RMARE'),('01A04A01','Bin','01','A','04','A','01',36,17.78,22.86,17.78,7226.69,'RMARE'),('01A04A02','Bin','01','A','04','A','02',4301,17.78,22.86,17.78,7226.69,'RMARE'),('01A04A03','Bin','01','A','04','A','03',60222,17.78,22.86,17.78,7226.69,'RMARE'),('01A04A04','Bin','01','A','04','A','04',344,17.78,22.86,17.78,7226.69,'RMARE'),('01A04B01','Bin','01','A','04','B','01',2064,17.78,22.86,17.78,7226.69,'RMARE'),('01A04B02','Bin','01','A','04','B','02',9635,17.78,22.86,17.78,7226.69,'RMARE'),('01A04B03','Bin','01','A','04','B','03',6882,17.78,22.86,17.78,7226.69,'RMARE'),('01A04B04','Bin','01','A','04','B','04',71,17.78,22.86,17.78,7226.69,'RMARE'),('01A04C01','Bin','01','A','04','C','01',9033,17.78,22.86,17.78,7226.69,'RMARE'),('01A04C02','Bin','01','A','04','C','02',20647,17.78,22.86,17.78,7226.69,'RMARE'),('01A04C03','Bin','01','A','04','C','03',12248,17.78,22.86,17.78,7226.69,'RMARE'),('01A04C04','Bin','01','A','04','C','04',200,17.78,22.86,17.78,7226.69,'RMARE'),('01B01A01','Bin','01','B','01','A','01',200,17.78,22.86,17.78,7226.69,'RMARE'),('01B01A02','Bin','01','B','01','A','02',200,17.78,22.86,17.78,7226.69,'RMARE'),('01B01A03','Bin','01','B','01','A','03',200,17.78,22.86,17.78,7226.69,'RMARE'),('01B01A04','Bin','01','B','01','A','04',200,17.78,22.86,17.78,7226.69,'RMARE'),('01B01B01','Bin','01','B','01','B','01',200,17.78,22.86,17.78,7226.69,'RMARE'),('01B01B02','Bin','01','B','01','B','02',200,17.78,22.86,17.78,7226.69,'RMARE'),('01B01B03','Bin','01','B','01','B','03',200,17.78,22.86,17.78,7226.69,'RMARE'),('01B01B04','Bin','01','B','01','B','04',200,17.78,22.86,17.78,7226.69,'RMARE'),('01B01C01','Bin','01','B','01','C','01',200,17.78,22.86,17.78,7226.69,'RMARE'),('01B01C02','Bin','01','B','01','C','02',200,17.78,22.86,17.78,7226.69,'RMARE'),('01B01C03','Bin','01','B','01','C','03',200,17.78,22.86,17.78,7226.69,'RMARE'),('01B01C04','Bin','01','B','01','C','04',200,17.78,22.86,17.78,7226.69,'RMARE'),('01B02A01','Bin','01','B','02','A','01',200,17.78,22.86,17.78,7226.69,'RMARE'),('01B02A02','Bin','01','B','02','A','02',200,17.78,22.86,17.78,7226.69,'RMARE'),('01B02A03','Bin','01','B','02','A','03',200,17.78,22.86,17.78,7226.69,'RMARE'),('01B02A04','Bin','01','B','02','A','04',200,17.78,22.86,17.78,7226.69,'RMARE'),('01B02B01','Bin','01','B','02','B','01',200,17.78,22.86,17.78,7226.69,'RMARE'),('01B02B02','Bin','01','B','02','B','02',200,17.78,22.86,17.78,7226.69,'RMARE'),('01B02B03','Bin','01','B','02','B','03',200,17.78,22.86,17.78,7226.69,'RMARE'),('01B02B04','Bin','01','B','02','B','04',200,17.78,22.86,17.78,7226.69,'RMARE'),('01B02C01','Bin','01','B','02','C','01',200,17.78,22.86,17.78,7226.69,'RMARE'),('01B02C02','Bin','01','B','02','C','02',200,17.78,22.86,17.78,7226.69,'RMARE'),('01B02C03','Bin','01','B','02','C','03',200,17.78,22.86,17.78,7226.69,'RMARE'),('01B02C04','Bin','01','B','02','C','04',200,17.78,22.86,17.78,7226.69,'RMARE'),('01B03A01','Bin','01','B','03','A','01',200,17.78,22.86,17.78,7226.69,'RMARE'),('01B03A02','Bin','01','B','03','A','02',200,17.78,22.86,17.78,7226.69,'RMARE'),('01B03A03','Bin','01','B','03','A','03',200,17.78,22.86,17.78,7226.69,'RMARE'),('01B03A04','Bin','01','B','03','A','04',200,17.78,22.86,17.78,7226.69,'RMARE'),('01B03B01','Bin','01','B','03','B','01',200,17.78,22.86,17.78,7226.69,'RMARE'),('01B03B02','Bin','01','B','03','B','02',200,17.78,22.86,17.78,7226.69,'RMARE'),('01B03B03','Bin','01','B','03','B','03',200,17.78,22.86,17.78,7226.69,'RMARE'),('01B03B04','Bin','01','B','03','B','04',200,17.78,22.86,17.78,7226.69,'RMARE'),('01B03C01','Bin','01','B','03','C','01',200,17.78,22.86,17.78,7226.69,'RMARE'),('01B03C02','Bin','01','B','03','C','02',200,17.78,22.86,17.78,7226.69,'RMARE'),('01B03C03','Bin','01','B','03','C','03',200,17.78,22.86,17.78,7226.69,'RMARE'),('01B03C04','Bin','01','B','03','C','04',200,17.78,22.86,17.78,7226.69,'RMARE'),('01B04A01','Bin','01','B','04','A','01',200,17.78,22.86,17.78,7226.69,'RMARE'),('01B04A02','Bin','01','B','04','A','02',200,17.78,22.86,17.78,7226.69,'RMARE'),('01B04A03','Bin','01','B','04','A','03',200,17.78,22.86,17.78,7226.69,'RMARE'),('01B04A04','Bin','01','B','04','A','04',200,17.78,22.86,17.78,7226.69,'RMARE'),('01B04B01','Bin','01','B','04','B','01',200,17.78,22.86,17.78,7226.69,'RMARE'),('01B04B02','Bin','01','B','04','B','02',200,17.78,22.86,17.78,7226.69,'RMARE'),('01B04B03','Bin','01','B','04','B','03',200,17.78,22.86,17.78,7226.69,'RMARE'),('01B04B04','Bin','01','B','04','B','04',200,17.78,22.86,17.78,7226.69,'RMARE'),('01B04C01','Bin','01','B','04','C','01',200,17.78,22.86,17.78,7226.69,'RMARE'),('01B04C02','Bin','01','B','04','C','02',200,17.78,22.86,17.78,7226.69,'RMARE'),('01B04C03','Bin','01','B','04','C','03',200,17.78,22.86,17.78,7226.69,'RMARE'),('01B04C04','Bin','01','B','04','C','04',200,17.78,22.86,17.78,7226.69,'RMARE'),('02A01A01','Bin','02','A','01','A','01',71,17.78,22.86,17.78,7226.69,'FPARE'),('02A01A02','Bin','02','A','01','A','02',118,17.78,22.86,17.78,7226.69,'FPARE'),('02A01A03','Bin','02','A','01','A','03',20,17.78,22.86,17.78,7226.69,'FPARE'),('02A01A04','Bin','02','A','01','A','04',20,17.78,22.86,17.78,7226.69,'FPARE'),('02A01B01','Bin','02','A','01','B','01',62,17.78,22.86,17.78,7226.69,'FPARE'),('02A01B02','Bin','02','A','01','B','02',20,17.78,22.86,17.78,7226.69,'FPARE'),('02A01B03','Bin','02','A','01','B','03',20,17.78,22.86,17.78,7226.69,'FPARE'),('02A01B04','Bin','02','A','01','B','04',20,17.78,22.86,17.78,7226.69,'FPARE'),('02A01C01','Bin','02','A','01','C','01',42,17.78,22.86,17.78,7226.69,'FPARE'),('02A01C02','Bin','02','A','01','C','02',20,17.78,22.86,17.78,7226.69,'FPARE'),('02A01C03','Bin','02','A','01','C','03',20,17.78,22.86,17.78,7226.69,'FPARE'),('02A01C04','Bin','02','A','01','C','04',20,17.78,22.86,17.78,7226.69,'FPARE'),('02A02A01','Bin','02','A','02','A','01',20,17.78,22.86,17.78,7226.69,'FPARE'),('02A02A02','Bin','02','A','02','A','02',20,17.78,22.86,17.78,7226.69,'FPARE'),('02A02A03','Bin','02','A','02','A','03',20,17.78,22.86,17.78,7226.69,'FPARE'),('02A02A04','Bin','02','A','02','A','04',20,17.78,22.86,17.78,7226.69,'FPARE'),('02A02B01','Bin','02','A','02','B','01',20,17.78,22.86,17.78,7226.69,'FPARE'),('02A02B02','Bin','02','A','02','B','02',20,17.78,22.86,17.78,7226.69,'FPARE'),('02A02B03','Bin','02','A','02','B','03',20,17.78,22.86,17.78,7226.69,'FPARE'),('02A02B04','Bin','02','A','02','B','04',20,17.78,22.86,17.78,7226.69,'FPARE'),('02A02C01','Bin','02','A','02','C','01',20,17.78,22.86,17.78,7226.69,'FPARE'),('02A02C02','Bin','02','A','02','C','02',20,17.78,22.86,17.78,7226.69,'FPARE'),('02A02C03','Bin','02','A','02','C','03',20,17.78,22.86,17.78,7226.69,'FPARE'),('02A02C04','Bin','02','A','02','C','04',20,17.78,22.86,17.78,7226.69,'FPARE'),('02A03A01','Bin','02','A','03','A','01',20,17.78,22.86,17.78,7226.69,'FPARE'),('02A03A02','Bin','02','A','03','A','02',20,17.78,22.86,17.78,7226.69,'FPARE'),('02A03A03','Bin','02','A','03','A','03',20,17.78,22.86,17.78,7226.69,'FPARE'),('02A03A04','Bin','02','A','03','A','04',20,17.78,22.86,17.78,7226.69,'FPARE'),('02A03B01','Bin','02','A','03','B','01',20,17.78,22.86,17.78,7226.69,'FPARE'),('02A03B02','Bin','02','A','03','B','02',20,17.78,22.86,17.78,7226.69,'FPARE'),('02A03B03','Bin','02','A','03','B','03',20,17.78,22.86,17.78,7226.69,'FPARE'),('02A03B04','Bin','02','A','03','B','04',20,17.78,22.86,17.78,7226.69,'FPARE'),('02A03C01','Bin','02','A','03','C','01',20,17.78,22.86,17.78,7226.69,'FPARE'),('02A03C02','Bin','02','A','03','C','02',20,17.78,22.86,17.78,7226.69,'FPARE'),('02A03C03','Bin','02','A','03','C','03',20,17.78,22.86,17.78,7226.69,'FPARE'),('02A03C04','Bin','02','A','03','C','04',20,17.78,22.86,17.78,7226.69,'FPARE'),('02A04A01','Bin','02','A','04','A','01',20,17.78,22.86,17.78,7226.69,'FPARE'),('02A04A02','Bin','02','A','04','A','02',20,17.78,22.86,17.78,7226.69,'FPARE'),('02A04A03','Bin','02','A','04','A','03',20,17.78,22.86,17.78,7226.69,'FPARE'),('02A04A04','Bin','02','A','04','A','04',20,17.78,22.86,17.78,7226.69,'FPARE'),('02A04B01','Bin','02','A','04','B','01',20,17.78,22.86,17.78,7226.69,'FPARE'),('02A04B02','Bin','02','A','04','B','02',20,17.78,22.86,17.78,7226.69,'FPARE'),('02A04B03','Bin','02','A','04','B','03',20,17.78,22.86,17.78,7226.69,'FPARE'),('02A04B04','Bin','02','A','04','B','04',20,17.78,22.86,17.78,7226.69,'FPARE'),('02A04C01','Bin','02','A','04','C','01',20,17.78,22.86,17.78,7226.69,'FPARE'),('02A04C02','Bin','02','A','04','C','02',20,17.78,22.86,17.78,7226.69,'FPARE'),('02A04C03','Bin','02','A','04','C','03',20,17.78,22.86,17.78,7226.69,'FPARE'),('02A04C04','Bin','02','A','04','C','04',20,17.78,22.86,17.78,7226.69,'FPARE'),('02B01A01','Bin','02','B','01','A','01',20,17.78,22.86,17.78,7226.69,'FPARE'),('02B01A02','Bin','02','B','01','A','02',20,17.78,22.86,17.78,7226.69,'FPARE'),('02B01A03','Bin','02','B','01','A','03',20,17.78,22.86,17.78,7226.69,'FPARE'),('02B01A04','Bin','02','B','01','A','04',20,17.78,22.86,17.78,7226.69,'FPARE'),('02B01B01','Bin','02','B','01','B','01',20,17.78,22.86,17.78,7226.69,'FPARE'),('02B01B02','Bin','02','B','01','B','02',20,17.78,22.86,17.78,7226.69,'FPARE'),('02B01B03','Bin','02','B','01','B','03',20,17.78,22.86,17.78,7226.69,'FPARE'),('02B01B04','Bin','02','B','01','B','04',20,17.78,22.86,17.78,7226.69,'FPARE'),('02B01C01','Bin','02','B','01','C','01',20,17.78,22.86,17.78,7226.69,'FPARE'),('02B01C02','Bin','02','B','01','C','02',20,17.78,22.86,17.78,7226.69,'FPARE'),('02B01C03','Bin','02','B','01','C','03',20,17.78,22.86,17.78,7226.69,'FPARE'),('02B01C04','Bin','02','B','01','C','04',20,17.78,22.86,17.78,7226.69,'FPARE'),('02B02A01','Bin','02','B','02','A','01',20,17.78,22.86,17.78,7226.69,'FPARE'),('02B02A02','Bin','02','B','02','A','02',20,17.78,22.86,17.78,7226.69,'FPARE'),('02B02A03','Bin','02','B','02','A','03',20,17.78,22.86,17.78,7226.69,'FPARE'),('02B02A04','Bin','02','B','02','A','04',20,17.78,22.86,17.78,7226.69,'FPARE'),('02B02B01','Bin','02','B','02','B','01',20,17.78,22.86,17.78,7226.69,'FPARE'),('02B02B02','Bin','02','B','02','B','02',20,17.78,22.86,17.78,7226.69,'FPARE'),('02B02B03','Bin','02','B','02','B','03',20,17.78,22.86,17.78,7226.69,'FPARE'),('02B02B04','Bin','02','B','02','B','04',20,17.78,22.86,17.78,7226.69,'FPARE'),('02B02C01','Bin','02','B','02','C','01',20,17.78,22.86,17.78,7226.69,'FPARE'),('02B02C02','Bin','02','B','02','C','02',20,17.78,22.86,17.78,7226.69,'FPARE'),('02B02C03','Bin','02','B','02','C','03',20,17.78,22.86,17.78,7226.69,'FPARE'),('02B02C04','Bin','02','B','02','C','04',20,17.78,22.86,17.78,7226.69,'FPARE'),('02B03A01','Bin','02','B','03','A','01',20,17.78,22.86,17.78,7226.69,'FPARE'),('02B03A02','Bin','02','B','03','A','02',20,17.78,22.86,17.78,7226.69,'FPARE'),('02B03A03','Bin','02','B','03','A','03',20,17.78,22.86,17.78,7226.69,'FPARE'),('02B03A04','Bin','02','B','03','A','04',20,17.78,22.86,17.78,7226.69,'FPARE'),('02B03B01','Bin','02','B','03','B','01',20,17.78,22.86,17.78,7226.69,'FPARE'),('02B03B02','Bin','02','B','03','B','02',20,17.78,22.86,17.78,7226.69,'FPARE'),('02B03B03','Bin','02','B','03','B','03',20,17.78,22.86,17.78,7226.69,'FPARE'),('02B03B04','Bin','02','B','03','B','04',20,17.78,22.86,17.78,7226.69,'FPARE'),('02B03C01','Bin','02','B','03','C','01',20,17.78,22.86,17.78,7226.69,'FPARE'),('02B03C02','Bin','02','B','03','C','02',20,17.78,22.86,17.78,7226.69,'FPARE'),('02B03C03','Bin','02','B','03','C','03',20,17.78,22.86,17.78,7226.69,'FPARE'),('02B03C04','Bin','02','B','03','C','04',20,17.78,22.86,17.78,7226.69,'FPARE'),('02B04A01','Bin','02','B','04','A','01',20,17.78,22.86,17.78,7226.69,'FPARE'),('02B04A02','Bin','02','B','04','A','02',20,17.78,22.86,17.78,7226.69,'FPARE'),('02B04A03','Bin','02','B','04','A','03',20,17.78,22.86,17.78,7226.69,'FPARE'),('02B04A04','Bin','02','B','04','A','04',20,17.78,22.86,17.78,7226.69,'FPARE'),('02B04B01','Bin','02','B','04','B','01',20,17.78,22.86,17.78,7226.69,'FPARE'),('02B04B02','Bin','02','B','04','B','02',20,17.78,22.86,17.78,7226.69,'FPARE'),('02B04B03','Bin','02','B','04','B','03',20,17.78,22.86,17.78,7226.69,'FPARE'),('02B04B04','Bin','02','B','04','B','04',20,17.78,22.86,17.78,7226.69,'FPARE'),('02B04C01','Bin','02','B','04','C','01',20,17.78,22.86,17.78,7226.69,'FPARE'),('02B04C02','Bin','02','B','04','C','02',20,17.78,22.86,17.78,7226.69,'FPARE'),('02B04C03','Bin','02','B','04','C','03',20,17.78,22.86,17.78,7226.69,'FPARE'),('02B04C04','Bin','02','B','04','C','04',20,17.78,22.86,17.78,7226.69,'FPARE');
/*!40000 ALTER TABLE `LOCATION` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`cisco`@`localhost`*/ /*!50003 TRIGGER `beforeInsertLocation` BEFORE INSERT ON `LOCATION` FOR EACH ROW BEGIN
    SET NEW.code = CONCAT(NEW.aisle, NEW.side, NEW.bay, NEW.level, NEW.position);
    SET NEW.volume = (NEW.length * NEW.height * NEW.width);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`cisco`@`localhost`*/ /*!50003 TRIGGER `updateCodeOrVolumeLocation` BEFORE UPDATE ON `LOCATION` FOR EACH ROW BEGIN
    SET NEW.code = CONCAT(NEW.aisle, NEW.side, NEW.bay, NEW.level, NEW.position);
    SET NEW.volume = (NEW.length * NEW.height * NEW.width);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `LOT`
--

DROP TABLE IF EXISTS `LOT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `LOT` (
  `num` int NOT NULL AUTO_INCREMENT,
  `description` varchar(256) NOT NULL,
  `percentage` float DEFAULT NULL,
  `lotStatus` varchar(5) DEFAULT NULL,
  `purchaseRequest` int DEFAULT NULL,
  PRIMARY KEY (`num`),
  KEY `lotStatus` (`lotStatus`),
  KEY `purchaseRequest` (`purchaseRequest`),
  CONSTRAINT `LOT_ibfk_1` FOREIGN KEY (`lotStatus`) REFERENCES `LOT_STATUS` (`code`) ON DELETE CASCADE,
  CONSTRAINT `LOT_ibfk_2` FOREIGN KEY (`purchaseRequest`) REFERENCES `PURCHASE_REQUEST` (`num`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `LOT`
--

LOCK TABLES `LOT` WRITE;
/*!40000 ALTER TABLE `LOT` DISABLE KEYS */;
INSERT INTO `LOT` VALUES (1,'Raw material batch for request 1',100,'VALID',1),(2,'Raw material batch for request 2',100,'VALID',2),(3,'Raw material batch for request 3',100,'VALID',3);
/*!40000 ALTER TABLE `LOT` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`cisco`@`localhost`*/ /*!50003 TRIGGER `insertMaterialToLot` AFTER INSERT ON `LOT` FOR EACH ROW BEGIN

    INSERT INTO RAW_MATERIAL_LOT(rawMaterial, lot, quantity)
    SELECT rawMaterial, NEW.num, quantity FROM PURCHASE_RAW_MATERIAL WHERE purchaseRequest = NEW.purchaseRequest;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`cisco`@`localhost`*/ /*!50003 TRIGGER `updateLotStatus` BEFORE UPDATE ON `LOT` FOR EACH ROW BEGIN
    IF NEW.percentage = 100 THEN
        SET NEW.lotStatus = 'VALID';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `LOT_STATUS`
--

DROP TABLE IF EXISTS `LOT_STATUS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `LOT_STATUS` (
  `code` varchar(5) NOT NULL,
  `description` varchar(16) NOT NULL,
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `LOT_STATUS`
--

LOCK TABLES `LOT_STATUS` WRITE;
/*!40000 ALTER TABLE `LOT_STATUS` DISABLE KEYS */;
INSERT INTO `LOT_STATUS` VALUES ('PENDI','Pending'),('VALID','Validated');
/*!40000 ALTER TABLE `LOT_STATUS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `LOT_VERIFICATION`
--

DROP TABLE IF EXISTS `LOT_VERIFICATION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `LOT_VERIFICATION` (
  `num` int NOT NULL AUTO_INCREMENT,
  `lot` int NOT NULL,
  `verification` int NOT NULL,
  `date` datetime NOT NULL,
  PRIMARY KEY (`num`,`verification`,`lot`),
  KEY `verification` (`verification`),
  KEY `lot` (`lot`),
  CONSTRAINT `LOT_VERIFICATION_ibfk_1` FOREIGN KEY (`verification`) REFERENCES `VERIFICATION` (`num`) ON DELETE CASCADE,
  CONSTRAINT `LOT_VERIFICATION_ibfk_2` FOREIGN KEY (`lot`) REFERENCES `LOT` (`num`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `LOT_VERIFICATION`
--

LOCK TABLES `LOT_VERIFICATION` WRITE;
/*!40000 ALTER TABLE `LOT_VERIFICATION` DISABLE KEYS */;
INSERT INTO `LOT_VERIFICATION` VALUES (1,1,1,'2024-11-05 12:57:25'),(2,1,2,'2024-11-05 12:58:25'),(3,1,3,'2024-11-05 12:59:25'),(4,1,4,'2024-11-05 13:00:25'),(5,1,5,'2024-11-05 13:01:25'),(6,1,6,'2024-11-05 13:02:25'),(7,1,7,'2024-11-05 13:03:25'),(8,1,8,'2024-11-05 13:04:25'),(9,1,9,'2024-11-05 13:05:25'),(10,2,10,'2024-11-05 13:06:25'),(11,2,11,'2024-11-05 13:07:25'),(12,2,12,'2024-11-05 13:08:25'),(13,2,13,'2024-11-05 13:09:25'),(14,2,14,'2024-11-05 13:10:25'),(15,2,15,'2024-11-05 13:11:25'),(16,2,16,'2024-11-05 13:12:25'),(17,2,17,'2024-11-05 13:13:25'),(18,2,18,'2024-11-05 13:14:25'),(19,3,19,'2024-11-05 13:15:25'),(20,3,20,'2024-11-05 13:16:25'),(21,3,21,'2024-11-05 13:17:25'),(22,3,22,'2024-11-05 13:18:25'),(23,3,23,'2024-11-05 13:19:25'),(24,3,24,'2024-11-05 13:20:25'),(25,3,25,'2024-11-05 13:21:25'),(26,3,26,'2024-11-05 13:22:25'),(27,3,27,'2024-11-05 13:23:25'),(28,4,28,'2024-11-05 13:24:25'),(29,4,29,'2024-11-05 13:25:25'),(30,4,30,'2024-11-05 13:26:25'),(31,4,31,'2024-11-05 13:27:25'),(32,4,32,'2024-11-05 13:28:25'),(33,4,33,'2024-11-05 13:29:25'),(34,4,34,'2024-11-05 13:30:25'),(35,4,35,'2024-11-05 13:31:25'),(36,4,36,'2024-11-05 13:32:25'),(37,4,37,'2024-11-05 13:33:25'),(38,5,38,'2024-11-05 13:34:25'),(39,5,39,'2024-11-05 13:35:25'),(40,5,40,'2024-11-05 13:36:25'),(41,5,41,'2024-11-05 13:37:25'),(42,5,42,'2024-11-05 13:38:25'),(43,5,43,'2024-11-05 13:39:25'),(44,5,44,'2024-11-05 13:40:25'),(45,5,45,'2024-11-05 13:41:25'),(46,5,46,'2024-11-05 13:42:25'),(47,5,47,'2024-11-05 13:43:25');
/*!40000 ALTER TABLE `LOT_VERIFICATION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MOVEMENT`
--

DROP TABLE IF EXISTS `MOVEMENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `MOVEMENT` (
  `code` varchar(5) NOT NULL,
  `description` varchar(128) NOT NULL,
  `movementType` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`code`),
  KEY `movementType` (`movementType`),
  CONSTRAINT `MOVEMENT_ibfk_1` FOREIGN KEY (`movementType`) REFERENCES `MOVEMENT_TYPE` (`code`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MOVEMENT`
--

LOCK TABLES `MOVEMENT` WRITE;
/*!40000 ALTER TABLE `MOVEMENT` DISABLE KEYS */;
INSERT INTO `MOVEMENT` VALUES ('MV001','Raw Material Entry: PMA4S','ENTRY'),('MV002','Raw Material Entry: BLA4S','ENTRY'),('MV003','Raw Material Entry: CPS4P','ENTRY'),('MV004','Raw Material Entry: CFS4P','ENTRY'),('MV005','Raw Material Entry: PE4SP','ENTRY'),('MV006','Raw Material Entry: MR8SP','ENTRY'),('MV007','Raw Material Entry: AIS4P','ENTRY'),('MV008','Raw Material Entry: PB4S4','ENTRY'),('MV009','Raw Material Entry: CCS4P','ENTRY'),('MV010','Raw Material Entry: PAUM5','ENTRY'),('MV011','Raw Material Entry: BLUM5','ENTRY'),('MV012','Raw Material Entry: CPU5S','ENTRY'),('MV013','Raw Material Entry: CFUM5','ENTRY'),('MV014','Raw Material Entry: PEUM5','ENTRY'),('MV015','Raw Material Entry: MRUM5','ENTRY'),('MV016','Raw Material Entry: AIUM5','ENTRY'),('MV017','Raw Material Entry: PBU5S','ENTRY'),('MV018','Raw Material Entry: CCUM5','ENTRY'),('MV019','Raw Material Entry: PFOL6','ENTRY'),('MV020','Raw Material Entry: PEF6L','ENTRY'),('MV021','Raw Material Entry: BAZF6','ENTRY'),('MV022','Raw Material Entry: CPZF6','ENTRY'),('MV023','Raw Material Entry: CFZ6F','ENTRY'),('MV024','Raw Material Entry: PSZF6','ENTRY'),('MV025','Raw Material Entry: MRZ6F','ENTRY'),('MV026','Raw Material Entry: AIZF6','ENTRY'),('MV027','Raw Material Entry: PBZF6','ENTRY'),('MV028','Raw Material Entry: CCZF6','ENTRY'),('MV029','Raw Material Entry: PFLP6','ENTRY'),('MV030','Raw Material Entry: PEF6P','ENTRY'),('MV031','Raw Material Entry: BFLP6','ENTRY'),('MV032','Raw Material Entry: CZF6P','ENTRY'),('MV033','Raw Material Entry: CFZ6F','ENTRY'),('MV034','Raw Material Entry: PSZ6F','ENTRY'),('MV035','Raw Material Entry: MRZ6F','ENTRY'),('MV036','Raw Material Entry: AIF6P','ENTRY'),('MV037','Raw Material Entry: PBZ6F','ENTRY'),('MV038','Raw Material Entry: CCZ6P','ENTRY'),('MV039','Raw Material Transfer: PMA4S','TRANS'),('MV040','Raw Material Transfer: BLA4S','TRANS'),('MV041','Raw Material Transfer: CPS4P','TRANS'),('MV042','Raw Material Transfer: CFS4P','TRANS'),('MV043','Raw Material Transfer: PE4SP','TRANS'),('MV044','Raw Material Transfer: MR8SP','TRANS'),('MV045','Raw Material Transfer: AIS4P','TRANS'),('MV046','Raw Material Transfer: PB4S4','TRANS'),('MV047','Raw Material Transfer: CCS4P','TRANS'),('MV048','Raw Material Transfer: PAUM5','TRANS'),('MV049','Raw Material Transfer: BLUM5','TRANS'),('MV050','Raw Material Transfer: CPU5S','TRANS'),('MV051','Raw Material Transfer: CFUM5','TRANS'),('MV052','Raw Material Transfer: PEUM5','TRANS'),('MV053','Raw Material Transfer: MRUM5','TRANS'),('MV054','Raw Material Transfer: AIUM5','TRANS'),('MV055','Raw Material Transfer: PBU5S','TRANS'),('MV056','Raw Material Transfer: CCUM5','TRANS'),('MV057','Raw Material Transfer: PFOL6','TRANS'),('MV058','Raw Material Transfer: PEF6L','TRANS'),('MV059','Raw Material Transfer: BAZF6','TRANS'),('MV060','Raw Material Transfer: CPZF6','TRANS'),('MV061','Raw Material Transfer: CFZ6F','TRANS'),('MV062','Raw Material Transfer: PSZF6','TRANS'),('MV063','Raw Material Transfer: MRZ6F','TRANS'),('MV064','Raw Material Transfer: AIZF6','TRANS'),('MV065','Raw Material Transfer: PBZF6','TRANS'),('MV066','Raw Material Transfer: CCZF6','TRANS'),('MV067','Raw Material Transfer: PFLP6','TRANS'),('MV068','Raw Material Transfer: PEF6P','TRANS'),('MV069','Raw Material Transfer: BFLP6','TRANS'),('MV070','Raw Material Transfer: CZF6P','TRANS'),('MV071','Raw Material Transfer: CFZ6F','TRANS'),('MV072','Raw Material Transfer: PSZ6F','TRANS'),('MV073','Raw Material Transfer: MRZ6F','TRANS'),('MV074','Raw Material Transfer: AIF6P','TRANS'),('MV075','Raw Material Transfer: PBZ6F','TRANS'),('MV076','Raw Material Transfer: CCZ6P','TRANS'),('MV077','Raw Material Outflow for Galaxy S24+ Assembly.','EXIT'),('MV078','Raw Material Outflow for Galaxy S24+ Assembly.','EXIT'),('MV079','Raw Material Outflow for Galaxy S24+ Assembly.','EXIT'),('MV080','Raw Material Outflow for Galaxy S24+ Assembly.','EXIT'),('MV081','Raw Material Outflow for Galaxy S24+ Assembly.','EXIT'),('MV082','Raw Material Outflow for Galaxy S24+ Assembly.','EXIT'),('MV083','Raw Material Outflow for Galaxy S24+ Assembly.','EXIT'),('MV084','Raw Material Outflow for Galaxy S24+ Assembly.','EXIT'),('MV085','Raw Material Outflow for Galaxy S24+ Assembly.','EXIT'),('MV086','Raw Material Outflow for Galaxy S24 Ultra Assembly.','EXIT'),('MV087','Raw Material Outflow for Galaxy S24 Ultra Assembly.','EXIT'),('MV088','Raw Material Outflow for Galaxy S24 Ultra Assembly.','EXIT'),('MV089','Raw Material Outflow for Galaxy S24 Ultra Assembly.','EXIT'),('MV090','Raw Material Outflow for Galaxy S24 Ultra Assembly.','EXIT'),('MV091','Raw Material Outflow for Galaxy S24 Ultra Assembly.','EXIT'),('MV092','Raw Material Outflow for Galaxy S24 Ultra Assembly.','EXIT'),('MV093','Raw Material Outflow for Galaxy S24 Ultra Assembly.','EXIT'),('MV094','Raw Material Outflow for Galaxy S24 Ultra Assembly.','EXIT'),('MV095','Raw Material Outflow for Galaxy Z Fold 6 Assembly.','EXIT'),('MV096','Raw Material Outflow for Galaxy Z Fold 6 Assembly.','EXIT'),('MV097','Raw Material Outflow for Galaxy Z Fold 6 Assembly.','EXIT'),('MV098','Raw Material Outflow for Galaxy Z Fold 6 Assembly.','EXIT'),('MV099','Raw Material Outflow for Galaxy Z Fold 6 Assembly.','EXIT'),('MV100','Raw Material Outflow for Galaxy Z Fold 6 Assembly.','EXIT'),('MV101','Raw Material Outflow for Galaxy Z Fold 6 Assembly.','EXIT'),('MV102','Raw Material Outflow for Galaxy Z Fold 6 Assembly.','EXIT'),('MV103','Raw Material Outflow for Galaxy Z Fold 6 Assembly.','EXIT'),('MV104','Raw Material Outflow for Galaxy Z Fold 6 Assembly.','EXIT'),('MV105','Raw Material Outflow for Galaxy Z Flip 6 Assembly.','EXIT'),('MV106','Raw Material Outflow for Galaxy Z Flip 6 Assembly.','EXIT'),('MV107','Raw Material Outflow for Galaxy Z Flip 6 Assembly.','EXIT'),('MV108','Raw Material Outflow for Galaxy Z Flip 6 Assembly.','EXIT'),('MV109','Raw Material Outflow for Galaxy Z Flip 6 Assembly.','EXIT'),('MV110','Raw Material Outflow for Galaxy Z Flip 6 Assembly.','EXIT'),('MV111','Raw Material Outflow for Galaxy Z Flip 6 Assembly.','EXIT'),('MV112','Raw Material Outflow for Galaxy Z Flip 6 Assembly.','EXIT'),('MV113','Raw Material Outflow for Galaxy Z Flip 6 Assembly.','EXIT'),('MV114','Raw Material Outflow for Galaxy Z Flip 6 Assembly.','EXIT'),('MV115','Finished Product Entry: GS24P','ENTRY'),('MV116','Finished Product Entry: GS24U','ENTRY'),('MV117','Finished Product Entry: GZFO6','ENTRY'),('MV118','Finished Product Entry: GZFL6','ENTRY'),('MV119','Finished Product Transfer: GS24P','TRANS'),('MV120','Finished Product Transfer: GS24U','TRANS'),('MV121','Finished Product Transfer: GZFO6','TRANS'),('MV122','Finished Product Transfer: GZFL6','TRANS');
/*!40000 ALTER TABLE `MOVEMENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MOVEMENT_FINISHED_PRODUCT`
--

DROP TABLE IF EXISTS `MOVEMENT_FINISHED_PRODUCT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `MOVEMENT_FINISHED_PRODUCT` (
  `num` int NOT NULL AUTO_INCREMENT,
  `movement` varchar(5) NOT NULL,
  `finishedProduct` varchar(5) NOT NULL,
  `date` datetime NOT NULL,
  `quantity` int NOT NULL,
  PRIMARY KEY (`num`,`movement`,`finishedProduct`),
  KEY `movement` (`movement`),
  KEY `finishedProduct` (`finishedProduct`),
  CONSTRAINT `MOVEMENT_FINISHED_PRODUCT_ibfk_1` FOREIGN KEY (`movement`) REFERENCES `MOVEMENT` (`code`) ON DELETE CASCADE,
  CONSTRAINT `MOVEMENT_FINISHED_PRODUCT_ibfk_2` FOREIGN KEY (`finishedProduct`) REFERENCES `FINISHED_PRODUCT` (`code`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MOVEMENT_FINISHED_PRODUCT`
--

LOCK TABLES `MOVEMENT_FINISHED_PRODUCT` WRITE;
/*!40000 ALTER TABLE `MOVEMENT_FINISHED_PRODUCT` DISABLE KEYS */;
INSERT INTO `MOVEMENT_FINISHED_PRODUCT` VALUES (1,'MV115','GS24P','2024-11-06 12:33:49',20),(2,'MV116','GS24U','2024-11-06 13:03:49',16),(3,'MV117','GZFO6','2024-11-06 13:33:49',12),(4,'MV118','GZFL6','2024-11-06 14:03:49',18),(5,'MV119','GS24P','2024-11-06 14:33:49',20),(6,'MV120','GS24U','2024-11-06 14:38:49',16),(7,'MV121','GZFO6','2024-11-06 14:42:32',12),(8,'MV122','GZFL6','2024-11-06 14:47:49',18);
/*!40000 ALTER TABLE `MOVEMENT_FINISHED_PRODUCT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MOVEMENT_RAW_MATERIAL`
--

DROP TABLE IF EXISTS `MOVEMENT_RAW_MATERIAL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `MOVEMENT_RAW_MATERIAL` (
  `num` int NOT NULL AUTO_INCREMENT,
  `movement` varchar(5) NOT NULL,
  `rawMaterial` varchar(5) NOT NULL,
  `date` datetime NOT NULL,
  `quantity` int NOT NULL,
  PRIMARY KEY (`num`,`movement`,`rawMaterial`),
  KEY `movement` (`movement`),
  KEY `rawMaterial` (`rawMaterial`),
  CONSTRAINT `MOVEMENT_RAW_MATERIAL_ibfk_1` FOREIGN KEY (`movement`) REFERENCES `MOVEMENT` (`code`) ON DELETE CASCADE,
  CONSTRAINT `MOVEMENT_RAW_MATERIAL_ibfk_2` FOREIGN KEY (`rawMaterial`) REFERENCES `RAW_MATERIAL` (`code`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=115 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MOVEMENT_RAW_MATERIAL`
--

LOCK TABLES `MOVEMENT_RAW_MATERIAL` WRITE;
/*!40000 ALTER TABLE `MOVEMENT_RAW_MATERIAL` DISABLE KEYS */;
INSERT INTO `MOVEMENT_RAW_MATERIAL` VALUES (1,'MV001','PMA4S','2024-11-05 08:00:00',80),(2,'MV002','BLA4S','2024-11-05 08:08:03',80),(3,'MV003','CPS4P','2024-11-05 08:16:06',80),(4,'MV004','CFS4P','2024-11-05 08:24:09',80),(5,'MV005','PE4SP','2024-11-05 08:32:12',80),(6,'MV006','MR8SP','2024-11-05 08:40:14',80),(7,'MV007','AIS4P','2024-11-05 08:48:17',80),(8,'MV008','PB4S4','2024-11-05 08:56:20',80),(9,'MV009','CCS4P','2024-11-05 09:04:23',80),(10,'MV010','PAUM5','2024-11-05 09:12:26',80),(11,'MV011','BLUM5','2024-11-05 09:20:29',80),(12,'MV012','CPU5S','2024-11-05 09:28:32',80),(13,'MV013','CFUM5','2024-11-05 09:36:35',80),(14,'MV014','PEUM5','2024-11-05 09:44:37',80),(15,'MV015','MRUM5','2024-11-05 09:52:40',80),(16,'MV016','AIUM5','2024-11-05 10:00:43',80),(17,'MV017','PBU5S','2024-11-05 10:08:46',80),(18,'MV018','CCUM5','2024-11-05 10:16:48',80),(19,'MV019','PFOL6','2024-11-05 10:24:51',80),(20,'MV020','PEF6L','2024-11-05 10:32:54',80),(21,'MV021','BAZF6','2024-11-05 10:40:57',80),(22,'MV022','CPZF6','2024-11-05 10:48:59',80),(23,'MV023','CFZ6F','2024-11-05 10:57:02',80),(24,'MV024','PSZF6','2024-11-05 11:05:05',80),(25,'MV025','MRZ6F','2024-11-05 11:13:08',80),(26,'MV026','AIZF6','2024-11-05 11:21:11',80),(27,'MV027','PBZF6','2024-11-05 11:29:14',80),(28,'MV028','CCZF6','2024-11-05 11:37:17',80),(29,'MV029','PFLP6','2024-11-05 11:45:20',80),(30,'MV030','PEF6P','2024-11-05 11:53:22',80),(31,'MV031','BFLP6','2024-11-05 12:01:25',80),(32,'MV032','CZF6P','2024-11-05 12:09:28',80),(33,'MV033','CAZ6F','2024-11-05 12:17:31',80),(34,'MV034','PSZ6F','2024-11-05 12:25:34',80),(35,'MV035','MAZ6F','2024-11-05 12:33:36',80),(36,'MV036','AIF6P','2024-11-05 12:41:39',80),(37,'MV037','PBZ6F','2024-11-05 12:49:42',80),(38,'MV038','CCZ6P','2024-11-05 12:57:45',80),(39,'MV039','PMA4S','2024-11-05 13:05:48',80),(40,'MV040','BLA4S','2024-11-05 13:13:51',80),(41,'MV041','CPS4P','2024-11-05 13:21:53',80),(42,'MV042','CFS4P','2024-11-05 13:29:56',80),(43,'MV043','PE4SP','2024-11-05 13:37:59',80),(44,'MV044','MR8SP','2024-11-05 13:46:02',80),(45,'MV045','AIS4P','2024-11-05 13:54:05',80),(46,'MV046','PB4S4','2024-11-05 14:02:08',80),(47,'MV047','CCS4P','2024-11-05 14:10:11',80),(48,'MV048','PAUM5','2024-11-05 14:18:14',80),(49,'MV049','BLUM5','2024-11-05 14:26:17',80),(50,'MV050','CPU5S','2024-11-05 14:34:20',80),(51,'MV051','CFUM5','2024-11-05 14:42:23',80),(52,'MV052','PEUM5','2024-11-05 14:50:26',80),(53,'MV053','MRUM5','2024-11-05 14:58:29',80),(54,'MV054','AIUM5','2024-11-05 15:06:32',80),(55,'MV055','PBU5S','2024-11-05 15:14:35',80),(56,'MV056','CCUM5','2024-11-05 15:22:38',80),(57,'MV057','PFOL6','2024-11-05 15:30:41',80),(58,'MV058','PEF6L','2024-11-05 15:38:44',80),(59,'MV059','BAZF6','2024-11-05 15:46:47',80),(60,'MV060','CPZF6','2024-11-05 15:54:50',80),(61,'MV061','CFZ6F','2024-11-05 16:02:53',80),(62,'MV062','PSZF6','2024-11-05 16:10:56',80),(63,'MV063','MRZ6F','2024-11-05 16:18:59',80),(64,'MV064','AIZF6','2024-11-05 16:27:02',80),(65,'MV065','PBZF6','2024-11-05 16:35:05',80),(66,'MV066','CCZF6','2024-11-05 16:43:08',80),(67,'MV067','PFLP6','2024-11-05 16:51:11',80),(68,'MV068','PEF6P','2024-11-05 16:59:14',80),(69,'MV069','BFLP6','2024-11-05 17:07:17',80),(70,'MV070','CZF6P','2024-11-05 17:15:20',80),(71,'MV071','CAZ6F','2024-11-05 17:23:23',80),(72,'MV072','PSZ6F','2024-11-05 17:31:26',80),(73,'MV073','MAZ6F','2024-11-05 17:39:29',80),(74,'MV074','AIF6P','2024-11-05 17:47:32',80),(75,'MV075','PBZ6F','2024-11-05 17:55:35',80),(76,'MV076','CCZ6P','2024-11-05 18:03:38',80),(77,'MV077','PMA4S','2024-11-06 08:55:44',20),(78,'MV078','BLA4S','2024-11-06 09:00:49',20),(79,'MV079','CPS4P','2024-11-06 09:05:53',20),(80,'MV080','CFS4P','2024-11-06 09:10:58',20),(81,'MV081','PE4SP','2024-11-06 09:16:01',20),(82,'MV082','MR8SP','2024-11-06 09:21:05',20),(83,'MV083','AIS4P','2024-11-06 09:26:11',20),(84,'MV084','PB4S4','2024-11-06 09:31:17',20),(85,'MV085','CCS4P','2024-11-06 09:36:22',20),(86,'MV086','PAUM5','2024-11-06 09:41:28',16),(87,'MV087','BLUM5','2024-11-06 09:46:34',16),(88,'MV088','CPU5S','2024-11-06 09:51:39',16),(89,'MV089','CFUM5','2024-11-06 09:56:45',16),(90,'MV090','PEUM5','2024-11-06 10:01:50',16),(91,'MV091','MRUM5','2024-11-06 10:06:55',16),(92,'MV092','AIUM5','2024-11-06 10:12:00',16),(93,'MV093','PBU5S','2024-11-06 10:17:05',16),(94,'MV094','CCUM5','2024-11-06 10:22:10',16),(95,'MV095','PFOL6','2024-11-06 10:27:14',12),(96,'MV096','PEF6L','2024-11-06 10:32:19',12),(97,'MV097','BAZF6','2024-11-06 10:37:24',12),(98,'MV098','CPZF6','2024-11-06 10:42:29',12),(99,'MV099','CFZ6F','2024-11-06 10:47:34',12),(100,'MV100','PSZF6','2024-11-06 10:52:39',12),(101,'MV101','MRZ6F','2024-11-06 10:57:44',12),(102,'MV102','AIZF6','2024-11-06 11:02:49',12),(103,'MV103','PBZF6','2024-11-06 11:07:54',12),(104,'MV104','CCZF6','2024-11-06 11:12:59',12),(105,'MV105','PFLP6','2024-11-06 11:18:04',18),(106,'MV106','PEF6P','2024-11-06 11:23:09',18),(107,'MV107','BFLP6','2024-11-06 11:28:14',18),(108,'MV108','CZF6P','2024-11-06 11:33:19',18),(109,'MV109','CAZ6F','2024-11-06 11:38:24',18),(110,'MV110','PSZ6F','2024-11-06 11:43:29',18),(111,'MV111','MAZ6F','2024-11-06 11:48:34',18),(112,'MV112','AIF6P','2024-11-06 11:53:39',18),(113,'MV113','PBZ6F','2024-11-06 11:58:44',18),(114,'MV114','CCZ6P','2024-11-06 12:03:49',18);
/*!40000 ALTER TABLE `MOVEMENT_RAW_MATERIAL` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MOVEMENT_TYPE`
--

DROP TABLE IF EXISTS `MOVEMENT_TYPE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `MOVEMENT_TYPE` (
  `code` varchar(5) NOT NULL,
  `description` varchar(16) NOT NULL,
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MOVEMENT_TYPE`
--

LOCK TABLES `MOVEMENT_TYPE` WRITE;
/*!40000 ALTER TABLE `MOVEMENT_TYPE` DISABLE KEYS */;
INSERT INTO `MOVEMENT_TYPE` VALUES ('AJUST','Adjustment'),('ENTRY','Entry'),('EXIT','Exit'),('TRANS','Transfer');
/*!40000 ALTER TABLE `MOVEMENT_TYPE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PRODUCTION_LINE`
--

DROP TABLE IF EXISTS `PRODUCTION_LINE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PRODUCTION_LINE` (
  `num` int NOT NULL AUTO_INCREMENT,
  `name` varchar(24) NOT NULL,
  PRIMARY KEY (`num`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PRODUCTION_LINE`
--

LOCK TABLES `PRODUCTION_LINE` WRITE;
/*!40000 ALTER TABLE `PRODUCTION_LINE` DISABLE KEYS */;
INSERT INTO `PRODUCTION_LINE` VALUES (1,'Complete Assembly'),(2,'Complete Assembly'),(3,'Complete Assembly');
/*!40000 ALTER TABLE `PRODUCTION_LINE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PRODUCTION_LINE_FINISHED_PRODUCT`
--

DROP TABLE IF EXISTS `PRODUCTION_LINE_FINISHED_PRODUCT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PRODUCTION_LINE_FINISHED_PRODUCT` (
  `num` int NOT NULL AUTO_INCREMENT,
  `productionLine` int NOT NULL,
  `finishedProduct` varchar(5) NOT NULL,
  `date` datetime NOT NULL,
  `quantity` int NOT NULL,
  PRIMARY KEY (`num`,`productionLine`,`finishedProduct`),
  KEY `productionLine` (`productionLine`),
  KEY `finishedProduct` (`finishedProduct`),
  CONSTRAINT `PRODUCTION_LINE_FINISHED_PRODUCT_ibfk_1` FOREIGN KEY (`productionLine`) REFERENCES `PRODUCTION_LINE` (`num`) ON DELETE CASCADE,
  CONSTRAINT `PRODUCTION_LINE_FINISHED_PRODUCT_ibfk_2` FOREIGN KEY (`finishedProduct`) REFERENCES `FINISHED_PRODUCT` (`code`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PRODUCTION_LINE_FINISHED_PRODUCT`
--

LOCK TABLES `PRODUCTION_LINE_FINISHED_PRODUCT` WRITE;
/*!40000 ALTER TABLE `PRODUCTION_LINE_FINISHED_PRODUCT` DISABLE KEYS */;
INSERT INTO `PRODUCTION_LINE_FINISHED_PRODUCT` VALUES (1,1,'GS24P','2024-11-06 12:28:49',20),(2,1,'GS24U','2024-11-06 12:58:49',16),(3,2,'GZFO6','2024-11-06 13:28:49',12),(4,3,'GZFL6','2024-11-06 13:58:49',18);
/*!40000 ALTER TABLE `PRODUCTION_LINE_FINISHED_PRODUCT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PURCHASE_RAW_MATERIAL`
--

DROP TABLE IF EXISTS `PURCHASE_RAW_MATERIAL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PURCHASE_RAW_MATERIAL` (
  `rawMaterial` varchar(5) NOT NULL,
  `purchaseRequest` int NOT NULL,
  `quantity` int NOT NULL,
  `cost` decimal(10,2) NOT NULL,
  PRIMARY KEY (`rawMaterial`,`purchaseRequest`),
  KEY `purchaseRequest` (`purchaseRequest`),
  CONSTRAINT `PURCHASE_RAW_MATERIAL_ibfk_1` FOREIGN KEY (`rawMaterial`) REFERENCES `RAW_MATERIAL` (`code`) ON DELETE CASCADE,
  CONSTRAINT `PURCHASE_RAW_MATERIAL_ibfk_2` FOREIGN KEY (`purchaseRequest`) REFERENCES `PURCHASE_REQUEST` (`num`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PURCHASE_RAW_MATERIAL`
--

LOCK TABLES `PURCHASE_RAW_MATERIAL` WRITE;
/*!40000 ALTER TABLE `PURCHASE_RAW_MATERIAL` DISABLE KEYS */;
INSERT INTO `PURCHASE_RAW_MATERIAL` VALUES ('AIF6P',3,80,72000.00),('AIS24',1,80,72000.00),('AIS4P',2,80,100800.00),('AIUM5',2,80,115200.00),('AIZF6',3,80,129600.00),('BALS2',1,80,21600.00),('BAZF6',3,80,36000.00),('BFLP6',3,80,28800.00),('BLA4S',2,80,28800.00),('BLUM5',2,80,36000.00),('CAZ6F',3,80,36000.00),('CCS24',1,80,86400.00),('CCS4P',2,80,93600.00),('CCUM5',2,80,129600.00),('CCZ6P',3,80,59200.00),('CCZF6',3,80,96000.00),('CFS24',1,80,28800.00),('CFS4P',2,80,36000.00),('CFUM5',2,80,43200.00),('CFZ6F',3,80,43200.00),('CPS24',1,80,43200.00),('CPS4P',2,80,50400.00),('CPU5S',2,80,86400.00),('CPZF6',3,80,57600.00),('CZF6P',3,80,57600.00),('MAZ6F',3,80,57600.00),('MR8SP',2,80,64800.00),('MRS24',1,80,57600.00),('MRUM5',2,80,86400.00),('MRZ6F',3,80,100800.00),('PAMS2',1,80,288000.00),('PAUM5',2,80,432000.00),('PB4S4',2,80,158400.00),('PBBS2',1,80,144000.00),('PBU5S',2,80,216000.00),('PBZ6F',3,80,144000.00),('PBZF6',3,80,216000.00),('PE4SP',2,80,302400.00),('PEF6L',3,80,216000.00),('PEF6P',3,80,144000.00),('PES24',1,80,288000.00),('PEUM5',2,80,360000.00),('PFLP6',3,80,432000.00),('PFOL6',3,80,504000.00),('PMA4S',2,80,360000.00),('PSZ6F',3,80,302400.00),('PSZF6',3,80,288000.00);
/*!40000 ALTER TABLE `PURCHASE_RAW_MATERIAL` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`cisco`@`localhost`*/ /*!50003 TRIGGER `purchaseRawMaterialCost` BEFORE INSERT ON `PURCHASE_RAW_MATERIAL` FOR EACH ROW BEGIN
    SET NEW.cost = NEW.quantity * (SELECT cost FROM RAW_MATERIAL WHERE code = NEW.rawMaterial);
    UPDATE PURCHASE_REQUEST SET 
        totalQuantityPerMaterial = totalQuantityPerMaterial + NEW.quantity,
        total = total + NEW.cost,
        VAT = total * 0.16,
        subtotal = total - VAT
    WHERE num = NEW.purchaseRequest;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `PURCHASE_REQUEST`
--

DROP TABLE IF EXISTS `PURCHASE_REQUEST`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PURCHASE_REQUEST` (
  `num` int NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL,
  `totalQuantityPerMaterial` int NOT NULL,
  `subtotal` decimal(10,2) NOT NULL,
  `VAT` decimal(10,2) NOT NULL,
  `total` decimal(10,2) NOT NULL,
  `purchaseRequestStatus` varchar(5) DEFAULT NULL,
  `employee` int DEFAULT NULL,
  PRIMARY KEY (`num`),
  KEY `purchaseRequestStatus` (`purchaseRequestStatus`),
  KEY `employee` (`employee`),
  CONSTRAINT `PURCHASE_REQUEST_ibfk_1` FOREIGN KEY (`purchaseRequestStatus`) REFERENCES `PURCHASE_REQUEST_STATUS` (`code`) ON DELETE CASCADE,
  CONSTRAINT `PURCHASE_REQUEST_ibfk_2` FOREIGN KEY (`employee`) REFERENCES `EMPLOYEE` (`num`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PURCHASE_REQUEST`
--

LOCK TABLES `PURCHASE_REQUEST` WRITE;
/*!40000 ALTER TABLE `PURCHASE_REQUEST` DISABLE KEYS */;
INSERT INTO `PURCHASE_REQUEST` VALUES (1,'2024-11-04 13:00:00',80,1029600.00,164736.00,1194336.00,'ACCEP',15),(2,'2024-11-04 14:15:22',80,2700000.00,432000.00,3132000.00,'ACCEP',15),(3,'2024-11-04 15:02:40',80,3020800.00,483328.00,3504128.00,'ACCEP',15);
/*!40000 ALTER TABLE `PURCHASE_REQUEST` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`cisco`@`localhost`*/ /*!50003 TRIGGER `createLot` AFTER UPDATE ON `PURCHASE_REQUEST` FOR EACH ROW BEGIN
    IF NEW.purchaseRequestStatus = "ACCEP" THEN
        INSERT INTO LOT(description, percentage, lotStatus, purchaseRequest)
        VALUES((SELECT CONCAT('Raw Material batch for ', (SELECT GROUP_CONCAT(rm.name SEPARATOR ', ')
            FROM PURCHASE_RAW_MATERIAL AS prm
            INNER JOIN RAW_MATERIAL AS rm ON prm.rawMaterial = rm.code
            WHERE purchaseRequest = NEW.num
            GROUP BY purchaseRequest))),0,"PENDI",NEW.num);
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `PURCHASE_REQUEST_STATUS`
--

DROP TABLE IF EXISTS `PURCHASE_REQUEST_STATUS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PURCHASE_REQUEST_STATUS` (
  `code` varchar(5) NOT NULL,
  `description` varchar(16) NOT NULL,
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PURCHASE_REQUEST_STATUS`
--

LOCK TABLES `PURCHASE_REQUEST_STATUS` WRITE;
/*!40000 ALTER TABLE `PURCHASE_REQUEST_STATUS` DISABLE KEYS */;
INSERT INTO `PURCHASE_REQUEST_STATUS` VALUES ('ACCEP','Accepted'),('CANCE','Canceled'),('INPRO','In Process');
/*!40000 ALTER TABLE `PURCHASE_REQUEST_STATUS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RAW_MATERIAL`
--

DROP TABLE IF EXISTS `RAW_MATERIAL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RAW_MATERIAL` (
  `code` varchar(5) NOT NULL,
  `name` varchar(64) NOT NULL,
  `description` varchar(256) NOT NULL,
  `cost` decimal(10,2) NOT NULL,
  `length` decimal(10,2) NOT NULL,
  `height` decimal(10,2) NOT NULL,
  `width` decimal(10,2) NOT NULL,
  `weight` decimal(10,2) NOT NULL,
  `volume` decimal(10,2) NOT NULL,
  `stock` int NOT NULL,
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RAW_MATERIAL`
--

LOCK TABLES `RAW_MATERIAL` WRITE;
/*!40000 ALTER TABLE `RAW_MATERIAL` DISABLE KEYS */;
INSERT INTO `RAW_MATERIAL` VALUES ('AIF6P','Internal Storage Z Flip 6','128 GB UFS 3.1 Storage',900.00,0.60,0.65,0.15,20.00,0.59,62),('AIS24','Internal Storage S24','128 GB UFS 3.1 Storage',900.00,0.60,0.65,0.15,20.00,0.59,0),('AIS4P','Internal Storage S24+','256 GB UFS 3.1 Storage',1260.00,0.65,0.65,0.15,30.00,0.63,60),('AIUM5','Internal Storage S24 Ultra','256 GB UFS 3.1 Storage',1440.00,0.70,0.70,0.15,30.00,0.73,64),('AIZF6','Internal Storage Z Fold 6','256 GB UFS 3.1 Storage',1620.00,0.70,0.70,0.15,30.00,0.73,68),('BALS2','Li-ion Battery S24','3900 mAh Battery',270.00,0.60,7.50,0.30,45.00,1.35,0),('BAZF6','Li-ion Battery Z Fold 6','4500 mAh Battery',450.00,0.70,8.00,0.40,60.00,2.24,68),('BFLP6','Li-ion Battery Z Flip 6','3500 mAh Battery',360.00,0.70,8.00,0.30,50.00,1.68,62),('BLA4S','Li-ion Battery S24+','4900 mAh Battery',360.00,0.70,8.00,0.35,55.00,1.96,60),('BLUM5','Li-ion Battery S24 Ultra','5000 mAh Battery',450.00,0.75,8.00,0.40,65.00,2.24,64),('CAZ6F','Front Camera Z Flip 6','10 MP Camera',450.00,0.50,3.50,0.20,8.00,0.35,62),('CCS24','Chassis S24','Aluminum Chassis with Gorilla Glass Victus 2',1080.00,7.50,16.00,0.80,100.00,9.60,0),('CCS4P','Chassis S24+','Aluminum Chassis with Gorilla Glass Victus 2',1170.00,8.00,16.50,0.85,120.00,11.00,60),('CCUM5','Chassis S24 Ultra','Aluminum Chassis with Gorilla Glass Victus 2',1620.00,8.50,17.00,0.90,150.00,13.00,64),('CCZ6P','Chassis Z Flip 6','Samsung Galaxy Z Flip 6 Outer Chassis',740.00,8.60,7.40,1.60,50.00,101.10,62),('CCZF6','Chassis Z Fold 6','Samsung Galaxy Z Fold 6 Outer Chassis',1200.00,16.20,7.60,1.60,75.00,198.72,68),('CFS24','Front Camera S24','12 MP Camera',360.00,0.50,3.50,0.20,8.00,0.35,0),('CFS4P','Front Camera S24+','12 MP Camera',450.00,0.50,3.50,0.25,10.00,0.44,60),('CFUM5','Front Camera S24 Ultra','12 MP Camera',540.00,0.55,3.50,0.30,12.00,0.58,64),('CFZ6F','Front Camera Z Fold 6','10 MP Camera',540.00,0.50,3.50,0.20,8.00,0.35,68),('CPS24','Main Camera S24','50 MP Wide-angle Camera',540.00,0.50,6.00,0.25,12.00,0.75,0),('CPS4P','Main Camera S24+','50 MP Wide-angle Camera',630.00,0.50,6.00,0.25,15.00,0.75,60),('CPU5S','Main Camera S24 Ultra','200 MP Wide-angle Camera',1080.00,0.70,6.50,0.30,20.00,1.37,64),('CPZF6','Main Camera Z Fold 6','50 MP Wide-angle Camera',720.00,0.50,6.00,0.25,15.00,0.75,68),('CZF6P','Main Camera Z Flip 6','50 MP Wide-angle Camera',720.00,0.50,6.00,0.25,12.00,0.75,62),('MAZ6F','RAM Memory Z Flip 6','8 GB LPDDR5 RAM',720.00,0.70,1.00,0.15,25.00,1.05,62),('MR8SP','RAM Memory 8GB S24+','8 GB LPDDR5 RAM',810.00,0.70,1.00,0.15,30.00,1.05,60),('MRS24','RAM Memory S24','8 GB LPDDR5 RAM',720.00,0.70,1.00,0.15,25.00,1.05,0),('MRUM5','RAM Memory S24 Ultra','12 GB LPDDR5 RAM',1080.00,0.75,1.00,0.20,35.00,1.40,64),('MRZ6F','RAM Memory Z Fold 6','12 GB LPDDR5 RAM',1260.00,0.70,1.00,0.20,40.00,1.40,68),('PAMS2','AMOLED Screen S24','Dynamic AMOLED 2X Screen 6.1 120 Hz HDR10+',3600.00,6.10,13.06,0.07,35.00,2.60,0),('PAUM5','AMOLED Screen S24 Ultra','Dynamic AMOLED 2X Screen 6.8 120 Hz HDR10+',5400.00,6.80,15.50,0.09,70.00,4.40,64),('PB4S4','Motherboard S24+','Motherboard with All Integrated Components',1980.00,7.50,11.50,0.30,130.00,26.00,60),('PBBS2','Motherboard S24','Motherboard with All Integrated Components',1800.00,7.00,10.00,0.30,120.00,21.00,0),('PBU5S','Motherboard S24 Ultra','Motherboard with All Integrated Components',2700.00,8.00,12.00,0.35,150.00,33.60,64),('PBZ6F','Motherboard Z Flip 6','Motherboard with All Integrated Components',1800.00,7.00,10.00,0.30,120.00,21.00,62),('PBZF6','Motherboard Z Fold 6','Motherboard with All Integrated Components',2700.00,8.00,12.00,0.35,150.00,33.60,68),('PE4SP','Processor Exynos S24+','Qualcomm Snapdragon 8 Gen 3',3780.00,0.70,0.70,0.25,12.00,0.12,60),('PEF6L','Exterior Screen Super AMOLED Z Fold 6','Dynamic AMOLED 2X Screen 6.2',2700.00,6.20,13.00,0.70,35.00,2.50,68),('PEF6P','Exterior Screen Super AMOLED Z Flip 6','Super AMOLED Screen 1.9',1800.00,1.90,6.00,0.70,15.00,0.80,62),('PES24','Processor Exynos S24','Qualcomm Snapdragon 8 Gen 3',3600.00,0.70,0.70,0.25,10.00,0.12,0),('PEUM5','Processor Exynos S24 Ultra','Qualcomm Snapdragon 8 Gen 3',4500.00,0.80,0.80,0.30,15.00,0.24,64),('PFLP6','Main Screen Flex AMOLED Z Flip 6','Dynamic AMOLED 2X Foldable Screen 6.7',5400.00,6.70,15.00,0.80,55.00,3.50,62),('PFOL6','Main Screen Flex AMOLED Z Fold 6','Dynamic AMOLED 2X Foldable Screen 7.6',6300.00,7.60,16.00,0.80,70.00,5.50,68),('PMA4S','AMOLED Screen S24+','Dynamic AMOLED 2X Screen 6.7 120 Hz HDR10+',4500.00,6.70,14.50,0.08,55.00,3.50,60),('PSZ6F','Processor Snapdragon Z Flip 6','Qualcomm Snapdragon 8 Gen 3',3780.00,0.70,0.70,0.25,10.00,0.12,62),('PSZF6','Processor Snapdragon Z Fold 6','Qualcomm Snapdragon 8 Gen 3',3600.00,0.70,0.70,0.25,10.00,0.12,68);
/*!40000 ALTER TABLE `RAW_MATERIAL` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`cisco`@`localhost`*/ /*!50003 TRIGGER `calculateRawMaterialVolume` BEFORE INSERT ON `RAW_MATERIAL` FOR EACH ROW BEGIN
    SET NEW.volume = NEW.length * NEW.height * NEW.width;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `RAW_MATERIAL_FINISHED_PRODUCT`
--

DROP TABLE IF EXISTS `RAW_MATERIAL_FINISHED_PRODUCT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RAW_MATERIAL_FINISHED_PRODUCT` (
  `num` int NOT NULL AUTO_INCREMENT,
  `rawMaterial` varchar(5) NOT NULL,
  `finishedProduct` varchar(5) NOT NULL,
  `quantity` int NOT NULL,
  `totalMaterialCost` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`num`,`rawMaterial`,`finishedProduct`),
  KEY `rawMaterial` (`rawMaterial`),
  KEY `finishedProduct` (`finishedProduct`),
  CONSTRAINT `RAW_MATERIAL_FINISHED_PRODUCT_ibfk_1` FOREIGN KEY (`rawMaterial`) REFERENCES `RAW_MATERIAL` (`code`) ON DELETE CASCADE,
  CONSTRAINT `RAW_MATERIAL_FINISHED_PRODUCT_ibfk_2` FOREIGN KEY (`finishedProduct`) REFERENCES `FINISHED_PRODUCT` (`code`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RAW_MATERIAL_FINISHED_PRODUCT`
--

LOCK TABLES `RAW_MATERIAL_FINISHED_PRODUCT` WRITE;
/*!40000 ALTER TABLE `RAW_MATERIAL_FINISHED_PRODUCT` DISABLE KEYS */;
INSERT INTO `RAW_MATERIAL_FINISHED_PRODUCT` VALUES (1,'PAMS2','GYS24',1,3600.00),(2,'BALS2','GYS24',1,270.00),(3,'CPS24','GYS24',1,540.00),(4,'CFS24','GYS24',1,360.00),(5,'PES24','GYS24',1,3600.00),(6,'MRS24','GYS24',1,720.00),(7,'AIS24','GYS24',1,900.00),(8,'PBBS2','GYS24',1,1800.00),(9,'CCS24','GYS24',1,1080.00),(10,'PMA4S','GS24P',1,4500.00),(11,'BLA4S','GS24P',1,360.00),(12,'CPS4P','GS24P',1,630.00),(13,'CFS4P','GS24P',1,450.00),(14,'PE4SP','GS24P',1,3780.00),(15,'MR8SP','GS24P',1,810.00),(16,'AIS4P','GS24P',1,1260.00),(17,'PB4S4','GS24P',1,1980.00),(18,'CCS4P','GS24P',1,1170.00),(19,'PAUM5','GS24U',1,5400.00),(20,'BLUM5','GS24U',1,450.00),(21,'CPU5S','GS24U',1,1080.00),(22,'CFUM5','GS24U',1,540.00),(23,'PEUM5','GS24U',1,4500.00),(24,'MRUM5','GS24U',1,1080.00),(25,'AIUM5','GS24U',1,1440.00),(26,'PBU5S','GS24U',1,2700.00),(27,'CCUM5','GS24U',1,1620.00),(28,'PFOL6','GZFO6',1,6300.00),(29,'PEF6L','GZFO6',1,2700.00),(30,'BAZF6','GZFO6',1,450.00),(31,'CPZF6','GZFO6',1,720.00),(32,'CFZ6F','GZFO6',1,540.00),(33,'PSZF6','GZFO6',1,3600.00),(34,'MRZ6F','GZFO6',1,1260.00),(35,'AIZF6','GZFO6',1,1620.00),(36,'PBZF6','GZFO6',1,2700.00),(37,'CCZF6','GZFO6',1,1200.00),(38,'PFLP6','GZFL6',1,5400.00),(39,'PEF6P','GZFL6',1,1800.00),(40,'BFLP6','GZFL6',1,360.00),(41,'CZF6P','GZFL6',1,720.00),(42,'CAZ6F','GZFL6',1,450.00),(43,'PSZ6F','GZFL6',1,3780.00),(44,'MAZ6F','GZFL6',1,720.00),(45,'AIF6P','GZFL6',1,900.00),(46,'PBZ6F','GZFL6',1,1800.00),(47,'CCZ6P','GZFL6',1,740.00);
/*!40000 ALTER TABLE `RAW_MATERIAL_FINISHED_PRODUCT` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`cisco`@`localhost`*/ /*!50003 TRIGGER `calculateTotalMaterialCost` BEFORE INSERT ON `RAW_MATERIAL_FINISHED_PRODUCT` FOR EACH ROW BEGIN
    DECLARE materialCost DECIMAL(10,2);
        SELECT cost INTO materialCost
        FROM RAW_MATERIAL
        WHERE code = NEW.rawMaterial;
    SET NEW.totalMaterialCost = NEW.quantity * materialCost;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`cisco`@`localhost`*/ /*!50003 TRIGGER `updateNetCostFinishedProduct` AFTER INSERT ON `RAW_MATERIAL_FINISHED_PRODUCT` FOR EACH ROW BEGIN

    DECLARE totalCost DECIMAL(10,2);
    SET totalCost = NEW.totalMaterialCost;
    UPDATE FINISHED_PRODUCT
    SET netCost = netCost + totalCost
    WHERE code = NEW.finishedProduct;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `RAW_MATERIAL_LOT`
--

DROP TABLE IF EXISTS `RAW_MATERIAL_LOT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RAW_MATERIAL_LOT` (
  `num` int NOT NULL AUTO_INCREMENT,
  `rawMaterial` varchar(5) NOT NULL,
  `lot` int NOT NULL,
  `quantity` int NOT NULL,
  PRIMARY KEY (`num`,`rawMaterial`,`lot`),
  KEY `rawMaterial` (`rawMaterial`),
  KEY `lot` (`lot`),
  CONSTRAINT `RAW_MATERIAL_LOT_ibfk_1` FOREIGN KEY (`rawMaterial`) REFERENCES `RAW_MATERIAL` (`code`) ON DELETE CASCADE,
  CONSTRAINT `RAW_MATERIAL_LOT_ibfk_2` FOREIGN KEY (`lot`) REFERENCES `LOT` (`num`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RAW_MATERIAL_LOT`
--

LOCK TABLES `RAW_MATERIAL_LOT` WRITE;
/*!40000 ALTER TABLE `RAW_MATERIAL_LOT` DISABLE KEYS */;
INSERT INTO `RAW_MATERIAL_LOT` VALUES (1,'AIS24',1,80),(2,'BALS2',1,80),(3,'CCS24',1,80),(4,'CFS24',1,80),(5,'CPS24',1,80),(6,'MRS24',1,80),(7,'PAMS2',1,80),(8,'PBBS2',1,80),(9,'PES24',1,80),(10,'AIS4P',1,80),(11,'BLA4S',1,80),(12,'CCS4P',1,80),(13,'CFS4P',1,80),(14,'CPS4P',1,80),(15,'MR8SP',1,80),(16,'PB4S4',1,80),(17,'PE4SP',1,80),(18,'PMA4S',1,80),(19,'AIUM5',1,80),(20,'BLUM5',1,80),(21,'CCUM5',1,80),(22,'CFUM5',1,80),(23,'CPU5S',1,80),(24,'MRUM5',2,80),(25,'PAUM5',2,80),(26,'PBU5S',2,80),(27,'PEUM5',2,80),(28,'AIZF6',2,80),(29,'BAZF6',2,80),(30,'CCZF6',2,80),(31,'CFZ6F',2,80),(32,'CPZF6',2,80),(33,'MRZ6F',2,80),(34,'PBZF6',2,80),(35,'PEF6L',2,80),(36,'PFOL6',2,80),(37,'PSZF6',2,80),(38,'AIF6P',2,80),(39,'BFLP6',2,80),(40,'CAZ6F',3,80),(41,'CCZ6P',3,80),(42,'CZF6P',3,80),(43,'MAZ6F',3,80),(44,'PBZ6F',3,80),(45,'PEF6P',3,80),(46,'PFLP6',3,80),(47,'PSZ6F',3,80);
/*!40000 ALTER TABLE `RAW_MATERIAL_LOT` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`cisco`@`localhost`*/ /*!50003 TRIGGER `insertVerificationToLot` AFTER INSERT ON `RAW_MATERIAL_LOT` FOR EACH ROW BEGIN
    INSERT INTO VERIFICATION(receivedQuantity,defectiveQuantity,acceptedQuantity,observations,rawMaterialLot,verificationStatus)
    VALUES(NEW.quantity,0,0,"-",NEW.num,"INPRO");
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `REQUISITION`
--

DROP TABLE IF EXISTS `REQUISITION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REQUISITION` (
  `num` int NOT NULL AUTO_INCREMENT,
  `description` varchar(256) DEFAULT NULL,
  `employee` int DEFAULT NULL,
  `productionLine` int DEFAULT NULL,
  `requisitionStatus` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`num`),
  KEY `employee` (`employee`),
  KEY `productionLine` (`productionLine`),
  KEY `requisitionStatus` (`requisitionStatus`),
  CONSTRAINT `REQUISITION_ibfk_1` FOREIGN KEY (`employee`) REFERENCES `EMPLOYEE` (`num`) ON DELETE CASCADE,
  CONSTRAINT `REQUISITION_ibfk_2` FOREIGN KEY (`productionLine`) REFERENCES `PRODUCTION_LINE` (`num`) ON DELETE CASCADE,
  CONSTRAINT `REQUISITION_ibfk_3` FOREIGN KEY (`requisitionStatus`) REFERENCES `REQUISITION_STATUS` (`code`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REQUISITION`
--

LOCK TABLES `REQUISITION` WRITE;
/*!40000 ALTER TABLE `REQUISITION` DISABLE KEYS */;
INSERT INTO `REQUISITION` VALUES (1,'Requisition for the product GYS24',15,1,'APPRO'),(2,'Requisition for the products GS24P',15,2,'APPRO'),(3,'Requisition for the products GZFO6',15,3,'APPRO');
/*!40000 ALTER TABLE `REQUISITION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REQUISITION_RAW_MATERIAL`
--

DROP TABLE IF EXISTS `REQUISITION_RAW_MATERIAL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REQUISITION_RAW_MATERIAL` (
  `num` int NOT NULL AUTO_INCREMENT,
  `requisition` int NOT NULL,
  `rawMaterial` varchar(5) NOT NULL,
  `date` datetime NOT NULL,
  `quantity` int NOT NULL,
  PRIMARY KEY (`num`,`requisition`,`rawMaterial`),
  KEY `requisition` (`requisition`),
  KEY `rawMaterial` (`rawMaterial`),
  CONSTRAINT `REQUISITION_RAW_MATERIAL_ibfk_1` FOREIGN KEY (`requisition`) REFERENCES `REQUISITION` (`num`) ON DELETE CASCADE,
  CONSTRAINT `REQUISITION_RAW_MATERIAL_ibfk_2` FOREIGN KEY (`rawMaterial`) REFERENCES `RAW_MATERIAL` (`code`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REQUISITION_RAW_MATERIAL`
--

LOCK TABLES `REQUISITION_RAW_MATERIAL` WRITE;
/*!40000 ALTER TABLE `REQUISITION_RAW_MATERIAL` DISABLE KEYS */;
INSERT INTO `REQUISITION_RAW_MATERIAL` VALUES (1,1,'AIS24','2024-11-06 08:30:29',10),(2,1,'BALS2','2024-11-06 08:05:04',10),(3,1,'CCS24','2024-11-06 08:40:38',10),(4,1,'CFS24','2024-11-06 08:15:12',10),(5,1,'CPS24','2024-11-06 08:10:09',10),(6,1,'MRS24','2024-11-06 08:25:23',10),(7,1,'PAMS2','2024-11-06 08:00:00',10),(8,1,'PBBS2','2024-11-06 08:35:34',10),(9,1,'PES24','2024-11-06 08:20:17',10),(10,1,'AIS4P','2024-11-06 09:16:11',20),(11,1,'BLA4S','2024-11-06 08:50:49',20),(12,1,'CCS4P','2024-11-06 09:26:22',20),(13,1,'CFS4P','2024-11-06 09:00:58',20),(14,1,'CPS4P','2024-11-06 08:55:53',20),(15,1,'MR8SP','2024-11-06 09:11:05',20),(16,1,'PB4S4','2024-11-06 09:21:17',20),(17,2,'PE4SP','2024-11-06 09:06:01',20),(18,2,'PMA4S','2024-11-06 08:45:44',20),(19,2,'AIUM5','2024-11-06 10:02:00',16),(20,2,'BLUM5','2024-11-06 09:36:34',16),(21,2,'CCUM5','2024-11-06 10:12:10',16),(22,2,'CFUM5','2024-11-06 09:46:45',16),(23,2,'CPU5S','2024-11-06 09:41:39',16),(24,2,'MRUM5','2024-11-06 09:56:55',16),(25,2,'PAUM5','2024-11-06 09:31:28',16),(26,2,'PBU5S','2024-11-06 10:07:05',16),(27,2,'PEUM5','2024-11-06 09:51:50',16),(28,2,'AIZF6','2024-11-06 10:52:51',12),(29,2,'BAZF6','2024-11-06 10:27:24',12),(30,2,'CCZF6','2024-11-06 11:02:00',12),(31,2,'CFZ6F','2024-11-06 10:37:35',12),(32,2,'CPZF6','2024-11-06 10:32:30',12),(33,2,'MRZ6F','2024-11-06 10:47:46',12),(34,2,'PBZF6','2024-11-06 10:57:56',12),(35,2,'PEF6L','2024-11-06 10:22:19',12),(36,3,'PFLP6','2024-11-06 11:07:06',18),(37,3,'PFOL6','2024-11-06 10:17:14',12),(38,3,'PSZF6','2024-11-06 10:42:41',12),(39,3,'AIF6P','2024-11-06 11:42:42',18),(40,3,'BFLP6','2024-11-06 11:17:16',18),(41,3,'CAZ6F','2024-11-06 11:27:27',18),(42,3,'CCZ6P','2024-11-06 11:52:53',18),(43,3,'CZF6P','2024-11-06 11:22:22',18),(44,3,'MAZ6F','2024-11-06 11:37:37',18),(45,3,'PBZ6F','2024-11-06 11:47:47',18),(46,3,'PEF6P','2024-11-06 11:12:11',18),(47,3,'PSZ6F','2024-11-06 11:32:32',18);
/*!40000 ALTER TABLE `REQUISITION_RAW_MATERIAL` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`cisco`@`localhost`*/ /*!50003 TRIGGER `updateRawMaterialStock` BEFORE INSERT ON `REQUISITION_RAW_MATERIAL` FOR EACH ROW BEGIN
    DECLARE currentStock INT;
    SELECT stock INTO currentStock
    FROM RAW_MATERIAL
    WHERE code = NEW.rawMaterial;
    IF currentStock >= NEW.quantity THEN
        UPDATE RAW_MATERIAL
        SET stock = stock - NEW.quantity
        WHERE code = NEW.rawMaterial;
    ELSE
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Not enough raw material available';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`cisco`@`localhost`*/ /*!50003 TRIGGER `validateStateRequisicion` BEFORE INSERT ON `REQUISITION_RAW_MATERIAL` FOR EACH ROW BEGIN
    DECLARE requisitionSts VARCHAR(5);
    SET requisitionSts = (SELECT requisitionStatus FROM REQUISITION WHERE num = NEW.requisition);
    IF requisitionSts = 'APROB' THEN

        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Cannot add raw material to a completed requisition';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `REQUISITION_STATUS`
--

DROP TABLE IF EXISTS `REQUISITION_STATUS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REQUISITION_STATUS` (
  `code` varchar(5) NOT NULL,
  `description` varchar(16) NOT NULL,
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REQUISITION_STATUS`
--

LOCK TABLES `REQUISITION_STATUS` WRITE;
/*!40000 ALTER TABLE `REQUISITION_STATUS` DISABLE KEYS */;
INSERT INTO `REQUISITION_STATUS` VALUES ('APPRO','Approved'),('CANCE','Canceled'),('PENDI','Pending');
/*!40000 ALTER TABLE `REQUISITION_STATUS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ROLE`
--

DROP TABLE IF EXISTS `ROLE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ROLE` (
  `code` varchar(5) NOT NULL,
  `description` varchar(64) NOT NULL,
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ROLE`
--

LOCK TABLES `ROLE` WRITE;
/*!40000 ALTER TABLE `ROLE` DISABLE KEYS */;
INSERT INTO `ROLE` VALUES ('PARRM','Purchase and requisition raw materials'),('RRVIN','Register, receive, and verify inventory'),('UMINV','Update and manage inventories'),('USCSC','User creation and system configuration');
/*!40000 ALTER TABLE `ROLE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `STORAGE`
--

DROP TABLE IF EXISTS `STORAGE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `STORAGE` (
  `num` int NOT NULL AUTO_INCREMENT,
  `quantity` int NOT NULL,
  `description` varchar(48) NOT NULL,
  `rawMaterial` varchar(5) DEFAULT NULL,
  `finishedProduct` varchar(5) DEFAULT NULL,
  `location` varchar(8) DEFAULT NULL,
  `area` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`num`),
  KEY `rawMaterial` (`rawMaterial`),
  KEY `finishedProduct` (`finishedProduct`),
  KEY `location` (`location`),
  KEY `area` (`area`),
  CONSTRAINT `STORAGE_ibfk_1` FOREIGN KEY (`rawMaterial`) REFERENCES `RAW_MATERIAL` (`code`) ON DELETE CASCADE,
  CONSTRAINT `STORAGE_ibfk_2` FOREIGN KEY (`finishedProduct`) REFERENCES `FINISHED_PRODUCT` (`code`) ON DELETE CASCADE,
  CONSTRAINT `STORAGE_ibfk_3` FOREIGN KEY (`location`) REFERENCES `LOCATION` (`code`) ON DELETE CASCADE,
  CONSTRAINT `STORAGE_ibfk_4` FOREIGN KEY (`area`) REFERENCES `AREA` (`code`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `STORAGE`
--

LOCK TABLES `STORAGE` WRITE;
/*!40000 ALTER TABLE `STORAGE` DISABLE KEYS */;
INSERT INTO `STORAGE` VALUES (1,60,'Storage of PMA4S inside the warehouse','PMA4S',NULL,'01A01A01','RMARE'),(2,60,'Storage of BLA4S inside the warehouse','BLA4S',NULL,'01A01B01','RMARE'),(3,60,'Storage of CPS4P inside the warehouse','CPS4P',NULL,'01A01C01','RMARE'),(4,60,'Storage of CFS4P inside the warehouse','CFS4P',NULL,'01A01A02','RMARE'),(5,60,'Storage of PE4SP inside the warehouse','PE4SP',NULL,'01A01B02','RMARE'),(6,60,'Storage of MR8SP inside the warehouse','MR8SP',NULL,'01A01C02','RMARE'),(7,60,'Storage of AIS4P inside the warehouse','AIS4P',NULL,'01A01A03','RMARE'),(8,60,'Storage of PB4S4 inside the warehouse','PB4S4',NULL,'01A01B03','RMARE'),(9,60,'Storage of CCS4P inside the warehouse','CCS4P',NULL,'01A01C03','RMARE'),(10,64,'Storage of PAUM5 inside the warehouse','PAUM5',NULL,'01A01A04','RMARE'),(11,64,'Storage of BLUM5 inside the warehouse','BLUM5',NULL,'01A01B04','RMARE'),(12,64,'Storage of CPU5S inside the warehouse','CPU5S',NULL,'01A01C04','RMARE'),(13,64,'Storage of CFUM5 inside the warehouse','CFUM5',NULL,'01A02A01','RMARE'),(14,64,'Storage of PEUM5 inside the warehouse','PEUM5',NULL,'01A02B01','RMARE'),(15,64,'Storage of MRUM5 inside the warehouse','MRUM5',NULL,'01A02C01','RMARE'),(16,64,'Storage of AIUM5 inside the warehouse','AIUM5',NULL,'01A02A02','RMARE'),(17,64,'Storage of PBU5S inside the warehouse','PBU5S',NULL,'01A02B02','RMARE'),(18,64,'Storage of CCUM5 inside the warehouse','CCUM5',NULL,'01A02C02','RMARE'),(19,68,'Storage of PFOL6 inside the warehouse','PFOL6',NULL,'01A02A03','RMARE'),(20,68,'Storage of PEF6L inside the warehouse','PEF6L',NULL,'01A02B03','RMARE'),(21,68,'Storage of BAZF6 inside the warehouse','BAZF6',NULL,'01A02C03','RMARE'),(22,68,'Storage of CPZF6 inside the warehouse','CPZF6',NULL,'01A02A04','RMARE'),(23,68,'Storage of CFZ6F inside the warehouse','CFZ6F',NULL,'01A02B04','RMARE'),(24,68,'Storage of PSZF6 inside the warehouse','PSZF6',NULL,'01A02C04','RMARE'),(25,68,'Storage of MRZ6F inside the warehouse','MRZ6F',NULL,'01A03A01','RMARE'),(26,68,'Storage of AIZF6 inside the warehouse','AIZF6',NULL,'01A03B01','RMARE'),(27,68,'Storage of PBZF6 inside the warehouse','PBZF6',NULL,'01A03C01','RMARE'),(28,68,'Storage of CCZF6 inside the warehouse','CCZF6',NULL,'01A03A02','RMARE'),(29,62,'Storage of PFLP6 inside the warehouse','PFLP6',NULL,'01A03B02','RMARE'),(30,62,'Storage of PEF6P inside the warehouse','PEF6P',NULL,'01A03C02','RMARE'),(31,62,'Storage of BFLP6 inside the warehouse','BFLP6',NULL,'01A03A03','RMARE'),(32,62,'Storage of CZF6P inside the warehouse','CZF6P',NULL,'01A03B03','RMARE'),(33,62,'Storage of CFZ6F inside the warehouse','CAZ6F',NULL,'01A03C03','RMARE'),(34,62,'Storage of PSZ6F inside the warehouse','PSZ6F',NULL,'01A03A04','RMARE'),(35,62,'Storage of MRZ6F inside the warehouse','MAZ6F',NULL,'01A03B04','RMARE'),(36,62,'Storage of AIF6P inside the warehouse','AIF6P',NULL,'01A03C04','RMARE'),(37,62,'Storage of PBZ6F inside the warehouse','PBZ6F',NULL,'01A04A01','RMARE'),(38,62,'Storage of CCZ6P inside the warehouse','CCZ6P',NULL,'01A04B01','RMARE'),(39,20,'Storage of GS24P inside the warehouse',NULL,'GS24P','02A01A01','FPARE'),(40,16,'Storage of GS24U inside the warehouse',NULL,'GS24U','02A01B01','FPARE'),(41,12,'Storage of GZFO6 inside the warehouse',NULL,'GZFO6','02A01C01','FPARE'),(42,18,'Storage of GZFL6 inside the warehouse',NULL,'GZFL6','02A01A02','FPARE');
/*!40000 ALTER TABLE `STORAGE` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`cisco`@`localhost`*/ /*!50003 TRIGGER `validateStockCapacity` BEFORE INSERT ON `STORAGE` FOR EACH ROW BEGIN
    DECLARE maxCapacity INT;
    DECLARE currentQuantity INT;
    SELECT capacity INTO maxCapacity
    FROM LOCATION
    WHERE code = NEW.location;
   SET currentQuantity = (SELECT SUM(quantity) 
                            FROM STORAGE
                            WHERE location = NEW.location);
    IF ((currentQuantity+NEW.quantity)>maxCapacity) THEN
        SIGNAL SQLSTATE "45000" SET MESSAGE_TEXT = "Quantity exceeds location capacity";
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`cisco`@`localhost`*/ /*!50003 TRIGGER `beforeInsertStorage` BEFORE INSERT ON `STORAGE` FOR EACH ROW BEGIN
    IF NEW.rawMaterial IS NOT NULL THEN
        SET NEW.description = CONCAT('Raw Material: ', (SELECT name FROM RAW_MATERIAL WHERE code = NEW.rawMaterial));
        SET NEW.area = 'RMARE';
    ELSE
        SET NEW.description = CONCAT('Finished Product: ', (SELECT name FROM FINISHED_PRODUCT WHERE code = NEW.finishedProduct));
        SET NEW.area = 'FPARE';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `USER`
--

DROP TABLE IF EXISTS `USER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER` (
  `num` int NOT NULL AUTO_INCREMENT,
  `username` varchar(12) NOT NULL,
  `password` varchar(40) DEFAULT NULL,
  `employee` int DEFAULT NULL,
  `role` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`num`),
  KEY `employee` (`employee`),
  KEY `role` (`role`),
  CONSTRAINT `USER_ibfk_1` FOREIGN KEY (`employee`) REFERENCES `EMPLOYEE` (`num`) ON DELETE CASCADE,
  CONSTRAINT `USER_ibfk_2` FOREIGN KEY (`role`) REFERENCES `ROLE` (`code`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER`
--

LOCK TABLES `USER` WRITE;
/*!40000 ALTER TABLE `USER` DISABLE KEYS */;
INSERT INTO `USER` VALUES (1,'Gbarrios','f4d3288259f7bfdc335481f1f4d80b63247762d3',1,'USCSC'),(2,'Bgonzalez','a32d5de0a12f88999b90e1575aded4426bfb4814',2,'USCSC'),(3,'Acuevas','861a9388c2c5d57133f2649c7a52597c331bf055',3,'USCSC'),(4,'Ysalazar','c78e55b98ba18ba20f1b4fd87b3313c5ee07299f',4,'USCSC'),(5,'Aperez','eaa158a7537d934f9edd14f829f5af5209757705',5,'UMINV'),(6,'Ogonzalez','70559b9a6f18c7d551c58c51681e68571e654b04',6,'UMINV'),(7,'Agonzalez','5d25a1cda5a9efbdc1f666f8d3efc65d6d2214ab',7,'UMINV'),(8,'Hgonzalez','caba3e923f62630daa36bb80b2f153a9b186a774',8,'UMINV'),(9,'Eruiz','5953ee22e80b97cf45f7422f6560185bcba99052',9,'UMINV'),(10,'Cmartinez','f4408d3bbf66b33ad43b002195f37ebce05f1f5f',10,'RRVIN'),(11,'Esalazar','75552d6c1be70ee7b6fd50bbb6462d490c41e2a8',11,'RRVIN'),(12,'Csoto','e1a8eae734210cfbe20c49d31df53e13cd71e65d',12,'RRVIN'),(13,'Kgarfias','ff84ec2a8931d20b686a99187532cc9727a60350',13,'RRVIN'),(14,'Cquintana','3085dfcb2ab71fc8aeadd50d5262b2847c646346',14,'RRVIN'),(15,'Gherrera','8c452ce0b8c27a8b02a0c9dc0d1b4f6f49b6d215',15,'PARRM');
/*!40000 ALTER TABLE `USER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `VERIFICATION`
--

DROP TABLE IF EXISTS `VERIFICATION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `VERIFICATION` (
  `num` int NOT NULL AUTO_INCREMENT,
  `receivedQuantity` int NOT NULL,
  `defectiveQuantity` int NOT NULL,
  `acceptedQuantity` int NOT NULL,
  `observations` varchar(128) DEFAULT NULL,
  `rawMaterialLot` int DEFAULT NULL,
  `verificationStatus` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`num`),
  KEY `verificationStatus` (`verificationStatus`),
  CONSTRAINT `VERIFICATION_ibfk_1` FOREIGN KEY (`verificationStatus`) REFERENCES `VERIFICATION_STATUS` (`code`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `VERIFICATION`
--

LOCK TABLES `VERIFICATION` WRITE;
/*!40000 ALTER TABLE `VERIFICATION` DISABLE KEYS */;
INSERT INTO `VERIFICATION` VALUES (1,80,0,80,'Validation successful with no loss',1,'FINIS'),(2,80,0,80,'Validation successful with no loss',2,'FINIS'),(3,80,0,80,'Validation successful with no loss',3,'FINIS'),(4,80,0,80,'Validation successful with no loss',4,'FINIS'),(5,80,0,80,'Validation successful with no loss',5,'FINIS'),(6,80,0,80,'Validation successful with no loss',6,'FINIS'),(7,80,0,80,'Validation successful with no loss',7,'FINIS'),(8,80,0,80,'Validation successful with no loss',8,'FINIS'),(9,80,0,80,'Validation successful with no loss',9,'FINIS'),(10,80,0,80,'Validation successful with no loss',10,'FINIS'),(11,80,0,80,'Validation successful with no loss',11,'FINIS'),(12,80,0,80,'Validation successful with no loss',12,'FINIS'),(13,80,0,80,'Validation successful with no loss',13,'FINIS'),(14,80,0,80,'Validation successful with no loss',14,'FINIS'),(15,80,0,80,'Validation successful with no loss',15,'FINIS'),(16,80,0,80,'Validation successful with no loss',16,'FINIS'),(17,80,0,80,'Validation successful with no loss',17,'FINIS'),(18,80,0,80,'Validation successful with no loss',18,'FINIS'),(19,80,0,80,'Validation successful with no loss',19,'FINIS'),(20,80,0,80,'Validation successful with no loss',20,'FINIS'),(21,80,0,80,'Validation successful with no loss',21,'FINIS'),(22,80,0,80,'Validation successful with no loss',22,'FINIS'),(23,80,0,80,'Validation successful with no loss',23,'FINIS'),(24,80,0,80,'Validation successful with no loss',24,'FINIS'),(25,80,0,80,'Validation successful with no loss',25,'FINIS'),(26,80,0,80,'Validation successful with no loss',26,'FINIS'),(27,80,0,80,'Validation successful with no loss',27,'FINIS'),(28,80,0,80,'Validation successful with no loss',28,'FINIS'),(29,80,0,80,'Validation successful with no loss',29,'FINIS'),(30,80,0,80,'Validation successful with no loss',30,'FINIS'),(31,80,0,80,'Validation successful with no loss',31,'FINIS'),(32,80,0,80,'Validation successful with no loss',32,'FINIS'),(33,80,0,80,'Validation successful with no loss',33,'FINIS'),(34,80,0,80,'Validation successful with no loss',34,'FINIS'),(35,80,0,80,'Validation successful with no loss',35,'FINIS'),(36,80,0,80,'Validation successful with no loss',36,'FINIS'),(37,80,0,80,'Validation successful with no loss',37,'FINIS'),(38,80,0,80,'Validation successful with no loss',38,'FINIS'),(39,80,0,80,'Validation successful with no loss',39,'FINIS'),(40,80,0,80,'Validation successful with no loss',40,'FINIS'),(41,80,0,80,'Validation successful with no loss',41,'FINIS'),(42,80,0,80,'Validation successful with no loss',42,'FINIS'),(43,80,0,80,'Validation successful with no loss',43,'FINIS'),(44,80,0,80,'Validation successful with no loss',44,'FINIS'),(45,80,0,80,'Validation successful with no loss',45,'FINIS'),(46,80,0,80,'Validation successful with no loss',46,'FINIS'),(47,80,0,80,'Validation successful with no loss',47,'FINIS');
/*!40000 ALTER TABLE `VERIFICATION` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`cisco`@`localhost`*/ /*!50003 TRIGGER `increseRawMaterialStock` BEFORE UPDATE ON `VERIFICATION` FOR EACH ROW BEGIN
    DECLARE rawMaterial1 VARCHAR(5);
    SET rawMaterial1 = (SELECT rawMaterial FROM RAW_MATERIAL_LOT WHERE num = NEW.rawMaterialLot);
    IF NEW.verificationStatus = 'FINIS' THEN
        UPDATE RAW_MATERIAL SET stock = stock + NEW.acceptedQuantity WHERE code = rawMaterial1;
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`cisco`@`localhost`*/ /*!50003 TRIGGER `updateLotPercentage` AFTER UPDATE ON `VERIFICATION` FOR EACH ROW BEGIN
    
        DECLARE lote INT;
        DECLARE totalVerifications INT;
        DECLARE completedVerifications INT;
        DECLARE percentage1 FLOAT;

    IF NEW.verificationStatus = 'FINIS'
    THEN

        SET lote = (SELECT lot FROM RAW_MATERIAL_LOT WHERE num = NEW.rawMaterialLot);
        SET totalVerifications = (SELECT COUNT(*) FROM RAW_MATERIAL_LOT WHERE lot = lote);
        SET completedVerifications = (SELECT COUNT(*)
                                        FROM VERIFICATION AS v
                                        INNER JOIN RAW_MATERIAL_LOT AS rm ON rm.num = v.rawMaterialLot
                                        WHERE lot = lote AND verificationStatus = "FINIS");
        SET percentage1 = (completedVerifications/totalVerifications)*100;
        UPDATE LOT SET percentage = percentage1 WHERE num = lote;
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `VERIFICATION_STATUS`
--

DROP TABLE IF EXISTS `VERIFICATION_STATUS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `VERIFICATION_STATUS` (
  `code` varchar(5) NOT NULL,
  `description` varchar(16) NOT NULL,
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `VERIFICATION_STATUS`
--

LOCK TABLES `VERIFICATION_STATUS` WRITE;
/*!40000 ALTER TABLE `VERIFICATION_STATUS` DISABLE KEYS */;
INSERT INTO `VERIFICATION_STATUS` VALUES ('FINIS','Finished'),('INPRO','In progress');
/*!40000 ALTER TABLE `VERIFICATION_STATUS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `vw_ActivityXProduct`
--

DROP TABLE IF EXISTS `vw_ActivityXProduct`;
/*!50001 DROP VIEW IF EXISTS `vw_ActivityXProduct`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_ActivityXProduct` AS SELECT 
 1 AS `date`,
 1 AS `type`,
 1 AS `movement`,
 1 AS `item`,
 1 AS `quantity`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_ActivityXRaw`
--

DROP TABLE IF EXISTS `vw_ActivityXRaw`;
/*!50001 DROP VIEW IF EXISTS `vw_ActivityXRaw`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_ActivityXRaw` AS SELECT 
 1 AS `date`,
 1 AS `type`,
 1 AS `movement`,
 1 AS `item`,
 1 AS `quantity`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_Area`
--

DROP TABLE IF EXISTS `vw_Area`;
/*!50001 DROP VIEW IF EXISTS `vw_Area`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_Area` AS SELECT 
 1 AS `code`,
 1 AS `description`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_EmployeeXUser`
--

DROP TABLE IF EXISTS `vw_EmployeeXUser`;
/*!50001 DROP VIEW IF EXISTS `vw_EmployeeXUser`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_EmployeeXUser` AS SELECT 
 1 AS `num`,
 1 AS `name`,
 1 AS `username`,
 1 AS `password`,
 1 AS `phone`,
 1 AS `email`,
 1 AS `taxId`,
 1 AS `description`,
 1 AS `status`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_JobPosition`
--

DROP TABLE IF EXISTS `vw_JobPosition`;
/*!50001 DROP VIEW IF EXISTS `vw_JobPosition`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_JobPosition` AS SELECT 
 1 AS `code`,
 1 AS `description`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_Location`
--

DROP TABLE IF EXISTS `vw_Location`;
/*!50001 DROP VIEW IF EXISTS `vw_Location`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_Location` AS SELECT 
 1 AS `code`,
 1 AS `container`,
 1 AS `aisle`,
 1 AS `side`,
 1 AS `bay`,
 1 AS `level`,
 1 AS `position`,
 1 AS `capacity`,
 1 AS `length`,
 1 AS `height`,
 1 AS `width`,
 1 AS `volume`,
 1 AS `area`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_Product`
--

DROP TABLE IF EXISTS `vw_Product`;
/*!50001 DROP VIEW IF EXISTS `vw_Product`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_Product` AS SELECT 
 1 AS `code`,
 1 AS `name`,
 1 AS `description`,
 1 AS `netCost`,
 1 AS `length`,
 1 AS `height`,
 1 AS `width`,
 1 AS `volume`,
 1 AS `weight`,
 1 AS `stock`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_PurchaseXRaw`
--

DROP TABLE IF EXISTS `vw_PurchaseXRaw`;
/*!50001 DROP VIEW IF EXISTS `vw_PurchaseXRaw`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_PurchaseXRaw` AS SELECT 
 1 AS `num`,
 1 AS `date`,
 1 AS `quantity`,
 1 AS `subtotal`,
 1 AS `VAT`,
 1 AS `total`,
 1 AS `description`,
 1 AS `username`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_RawMaterial`
--

DROP TABLE IF EXISTS `vw_RawMaterial`;
/*!50001 DROP VIEW IF EXISTS `vw_RawMaterial`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_RawMaterial` AS SELECT 
 1 AS `code`,
 1 AS `name`,
 1 AS `description`,
 1 AS `cost`,
 1 AS `length`,
 1 AS `height`,
 1 AS `width`,
 1 AS `volume`,
 1 AS `weight`,
 1 AS `stock`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_Requisition`
--

DROP TABLE IF EXISTS `vw_Requisition`;
/*!50001 DROP VIEW IF EXISTS `vw_Requisition`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_Requisition` AS SELECT 
 1 AS `num`,
 1 AS `description`,
 1 AS `username`,
 1 AS `productionLine`,
 1 AS `status`,
 1 AS `quantity`,
 1 AS `date`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_Storage`
--

DROP TABLE IF EXISTS `vw_Storage`;
/*!50001 DROP VIEW IF EXISTS `vw_Storage`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_Storage` AS SELECT 
 1 AS `quantity`,
 1 AS `description`,
 1 AS `item`,
 1 AS `location`,
 1 AS `area`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping routines for database 'HoneyTrackv2'
--
/*!50003 DROP PROCEDURE IF EXISTS `insertEmployee` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`cisco`@`localhost` PROCEDURE `insertEmployee`(
    IN firstName VARCHAR(16),
    IN lastName VARCHAR(24),
    IN middleName VARCHAR(24),
    IN phone VARCHAR(10),
    IN email VARCHAR(32),
    IN taxId VARCHAR(13),
    IN jobPosition VARCHAR(5),
    IN username1 VARCHAR(12),
    IN password VARCHAR(16),
    OUT msg VARCHAR(50)
)
BEGIN
    DECLARE numEmp INT;
    DECLARE role VARCHAR(5);
    DECLARE usernameDub TINYINT(1);
    SET usernameDub = (SELECT COUNT(*) FROM USER WHERE username = username1);
    IF(usernameDub = 0)
    THEN
        INSERT INTO EMPLOYEE (firstName, lastName, middleName, phone, email, taxId, jobPosition, employeeStatus)
        VALUES (firstName, lastName, middleName, phone, email, taxId, jobPosition, 'ACTIV');
        SET numEmp = (SELECT MAX(num) FROM EMPLOYEE);
        CASE 
            WHEN jobPosition = 'ADMIN' THEN SET role = 'USCSC';
            WHEN jobPosition = 'INANA' THEN SET role = 'UMINV';
            WHEN jobPosition = 'RAWMM' THEN SET role = 'RRVIN';
            WHEN jobPosition = 'RECEP' THEN SET role = 'PARRM';
        END CASE;
        INSERT INTO USER (username, password, employee, role)
        VALUES (username1, SHA1(password), numEmp, role);
        SET msg = 'Employee created successfully';
    ELSE
        SET msg = 'Duplicated username';
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insertLocation` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`cisco`@`localhost` PROCEDURE `insertLocation`(
    IN container VARCHAR(12),
    IN aisle VARCHAR(2),
    IN side VARCHAR(1),
    IN bay VARCHAR(2),
    IN level VARCHAR(1),
    IN position VARCHAR(2),
    IN length DECIMAL(10, 2),
    IN height DECIMAL(10, 2),
    IN width DECIMAL(10, 2),
    IN area VARCHAR(5),
    OUT msg VARCHAR(50)
)
BEGIN
    DECLARE code1 VARCHAR(8);
    DECLARE codeDub TINYINT(1);

    SET code1 = CONCAT(aisle, side, bay, level, position);
    SET codeDub = (SELECT COUNT(*) FROM LOCATION WHERE code = code1);

    IF codeDub = 0 THEN
        INSERT INTO LOCATION (code, containerName, aisle, side, bay, level, position, capacity, length, height, width, area)
        VALUES (code1, container, aisle, side, bay, level, position, 0, length, height, width, area);
        SET msg = "Location created successfully";
    ELSE
        SET msg = "Duplicated location";
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insertOrderRM` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`cisco`@`localhost` PROCEDURE `insertOrderRM`(
    IN rawMaterial VARCHAR(5),
    IN quantity INT,
    IN employee VARCHAR(16),
    OUT msg VARCHAR(50)
)
BEGIN
    DECLARE currentPurchase INT;
    DECLARE numEmployee INT;
    DECLARE rawExist TINYINT(1);
    SET rawExist = (SELECT COUNT(*) FROM RAW_MATERIAL WHERE code = rawMaterial);
    IF rawExist > 0
    THEN

        SET numEmployee = (SELECT e.num FROM EMPLOYEE AS e INNER JOIN USER AS u ON u.employee = e.num WHERE username = employee);
        INSERT INTO PURCHASE_REQUEST(date,totalQuantityPerMaterial,subtotal,VAT,total,purchaseRequestStatus,employee)
        VALUES(CURRENT_TIMESTAMP(),0,0,0,0,'INPRO',numEMployee);
        SET currentPurchase = (SELECT MAX(num) FROM PURCHASE_REQUEST);
        INSERT INTO PURCHASE_RAW_MATERIAL(rawMaterial,purchaseRequest,quantity,cost)
        VALUES(rawMaterial,currentPurchase,quantity,0);
        SET msg = "Purchase created successfully";
    ELSE
        SET msg = "Wrong raw material code";
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insertProduct` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`cisco`@`localhost` PROCEDURE `insertProduct`(
    IN code1 VARCHAR(5),
    IN name VARCHAR(32),
    IN description VARCHAR(256),
    IN length DECIMAL(10, 2),
    IN height DECIMAL(10, 2),
    IN width DECIMAL(10, 2),
    IN weight DECIMAL(10, 2),
    OUT msg VARCHAR(50)
)
BEGIN
    DECLARE codeDub TINYINT(1);
    SET codeDub = (SELECT COUNT(*) FROM FINISHED_PRODUCT WHERE code = code1);
    IF codeDub = 0 THEN
        INSERT INTO FINISHED_PRODUCT (code, name, description, netCost,
                                    length, height, width, weight, volume, stock)
        VALUES (code1, name, description, 0, length, height, width, weight, 0, 0);
        SET msg = "Product created successfully";
    ELSE
        SET msg = "Duplicated code";
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insertRawMaterial` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`cisco`@`localhost` PROCEDURE `insertRawMaterial`(
    IN code1 VARCHAR(5),
    IN name VARCHAR(64),
    IN description VARCHAR(256),
    IN cost DECIMAL(10, 2),
    IN length DECIMAL(10, 2),
    IN height DECIMAL(10, 2),
    IN width DECIMAL(10, 2),
    IN weight DECIMAL(10, 2),
    OUT msg VARCHAR(50)
)
BEGIN
    DECLARE codeDub TINYINT(1);
    SET codeDub = (SELECT COUNT(*) FROM RAW_MATERIAL WHERE code = code1);
    IF codeDub = 0 THEN
        INSERT INTO RAW_MATERIAL (code, name, description, cost, length, height, width, weight, stock)
        VALUES (code1, name, description, cost, length, height, width, weight, 0);
        SET msg = "Raw Material created successfully";
    ELSE
        SET msg = "Duplicated code";
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `validateUser` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`cisco`@`localhost` PROCEDURE `validateUser`(
    IN username1 VARCHAR(12),
    IN password1 VARCHAR(16),
    OUT userRole VARCHAR(5),
    OUT msg VARCHAR(50)
)
BEGIN
    DECLARE status VARCHAR(5);
    SET userRole = (SELECT role 
                    FROM USER
                    WHERE username = username1
                    AND password = SHA1(password1));
    IF userRole IS NOT NULL THEN
        SET status = (SELECT e.employeeStatus
                FROM EMPLOYEE AS e
                INNER JOIN USER AS u
                ON u.employee = e.num
                WHERE u.username = username1);
        IF status = 'ACTIV'
            THEN SET msg = 'Login Successfully';
        ELSEIF status = 'INACT'
            THEN SET msg = 'Inactive user';
        ELSEIF status = 'TERMI'
            THEN SET msg = 'Terminated user';
        ELSE
            SET msg = 'Invalid status';
        END IF;
    ELSE
        SET msg = 'Unvalid credentials';
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `vw_ActivityXProduct`
--

/*!50001 DROP VIEW IF EXISTS `vw_ActivityXProduct`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`cisco`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_ActivityXProduct` AS select `mf`.`date` AS `date`,`mt`.`description` AS `type`,`m`.`description` AS `movement`,`fp`.`name` AS `item`,`mf`.`quantity` AS `quantity` from (((`MOVEMENT` `m` join `MOVEMENT_FINISHED_PRODUCT` `mf` on((`mf`.`movement` = `m`.`code`))) join `MOVEMENT_TYPE` `mt` on((`m`.`movementType` = `mt`.`code`))) join `FINISHED_PRODUCT` `fp` on((`mf`.`finishedProduct` = `fp`.`code`))) order by `mf`.`date` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_ActivityXRaw`
--

/*!50001 DROP VIEW IF EXISTS `vw_ActivityXRaw`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`cisco`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_ActivityXRaw` AS select `mr`.`date` AS `date`,`mt`.`description` AS `type`,`m`.`description` AS `movement`,`rm`.`name` AS `item`,`mr`.`quantity` AS `quantity` from (((`MOVEMENT` `m` join `MOVEMENT_RAW_MATERIAL` `mr` on((`mr`.`movement` = `m`.`code`))) join `MOVEMENT_TYPE` `mt` on((`m`.`movementType` = `mt`.`code`))) join `RAW_MATERIAL` `rm` on((`mr`.`rawMaterial` = `rm`.`code`))) order by `mr`.`date` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_Area`
--

/*!50001 DROP VIEW IF EXISTS `vw_Area`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`cisco`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_Area` AS select `AREA`.`code` AS `code`,`AREA`.`description` AS `description` from `AREA` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_EmployeeXUser`
--

/*!50001 DROP VIEW IF EXISTS `vw_EmployeeXUser`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`cisco`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_EmployeeXUser` AS select `e`.`num` AS `num`,concat(`e`.`firstName`,' ',`e`.`lastName`,' ',`e`.`middleName`) AS `name`,`u`.`username` AS `username`,`u`.`password` AS `password`,`e`.`phone` AS `phone`,`e`.`email` AS `email`,`e`.`taxId` AS `taxId`,`j`.`description` AS `description`,`e`.`employeeStatus` AS `status` from ((`EMPLOYEE` `e` join `USER` `u` on((`e`.`num` = `u`.`employee`))) join `JOB_POSITION` `j` on((`j`.`code` = `e`.`jobPosition`))) order by `e`.`num` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_JobPosition`
--

/*!50001 DROP VIEW IF EXISTS `vw_JobPosition`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`cisco`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_JobPosition` AS select `JOB_POSITION`.`code` AS `code`,`JOB_POSITION`.`description` AS `description` from `JOB_POSITION` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_Location`
--

/*!50001 DROP VIEW IF EXISTS `vw_Location`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`cisco`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_Location` AS select `u`.`code` AS `code`,`u`.`containerName` AS `container`,`u`.`aisle` AS `aisle`,`u`.`side` AS `side`,`u`.`bay` AS `bay`,`u`.`level` AS `level`,`u`.`position` AS `position`,`u`.`capacity` AS `capacity`,concat(`u`.`length`,' cm') AS `length`,concat(`u`.`height`,' cm') AS `height`,concat(`u`.`width`,' cm') AS `width`,concat(`u`.`volume`,' cm³') AS `volume`,`a`.`description` AS `area` from (`LOCATION` `u` join `AREA` `a` on((`u`.`area` = `a`.`code`))) order by `u`.`code` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_Product`
--

/*!50001 DROP VIEW IF EXISTS `vw_Product`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`cisco`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_Product` AS select `FINISHED_PRODUCT`.`code` AS `code`,`FINISHED_PRODUCT`.`name` AS `name`,`FINISHED_PRODUCT`.`description` AS `description`,concat('$',`FINISHED_PRODUCT`.`netCost`) AS `netCost`,concat(`FINISHED_PRODUCT`.`length`,' cm') AS `length`,concat(`FINISHED_PRODUCT`.`height`,' cm') AS `height`,concat(`FINISHED_PRODUCT`.`width`,' cm') AS `width`,concat(`FINISHED_PRODUCT`.`volume`,' cm³') AS `volume`,concat(`FINISHED_PRODUCT`.`weight`,' gr') AS `weight`,`FINISHED_PRODUCT`.`stock` AS `stock` from `FINISHED_PRODUCT` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_PurchaseXRaw`
--

/*!50001 DROP VIEW IF EXISTS `vw_PurchaseXRaw`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`cisco`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_PurchaseXRaw` AS select `pr`.`num` AS `num`,`pr`.`date` AS `date`,`pr`.`totalQuantityPerMaterial` AS `quantity`,concat('$',`pr`.`subtotal`) AS `subtotal`,concat('$',`pr`.`VAT`) AS `VAT`,concat('$',`pr`.`total`) AS `total`,`prs`.`description` AS `description`,`u`.`username` AS `username` from (((`PURCHASE_REQUEST` `pr` join `PURCHASE_REQUEST_STATUS` `prs` on((`pr`.`purchaseRequestStatus` = `prs`.`code`))) join `EMPLOYEE` `e` on((`pr`.`employee` = `e`.`num`))) join `USER` `u` on((`u`.`employee` = `e`.`num`))) order by `prs`.`description` desc,`pr`.`date` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_RawMaterial`
--

/*!50001 DROP VIEW IF EXISTS `vw_RawMaterial`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`cisco`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_RawMaterial` AS select `RAW_MATERIAL`.`code` AS `code`,`RAW_MATERIAL`.`name` AS `name`,`RAW_MATERIAL`.`description` AS `description`,concat('$',`RAW_MATERIAL`.`cost`) AS `cost`,concat(`RAW_MATERIAL`.`length`,' cm') AS `length`,concat(`RAW_MATERIAL`.`height`,' cm') AS `height`,concat(`RAW_MATERIAL`.`width`,' cm') AS `width`,concat(`RAW_MATERIAL`.`volume`,' cm³') AS `volume`,concat(`RAW_MATERIAL`.`weight`,' gr') AS `weight`,`RAW_MATERIAL`.`stock` AS `stock` from `RAW_MATERIAL` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_Requisition`
--

/*!50001 DROP VIEW IF EXISTS `vw_Requisition`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`cisco`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_Requisition` AS select `r`.`num` AS `num`,`r`.`description` AS `description`,`u`.`username` AS `username`,`r`.`productionLine` AS `productionLine`,`rs`.`description` AS `status`,(select sum(`REQUISITION_RAW_MATERIAL`.`quantity`) from `REQUISITION_RAW_MATERIAL` where (`REQUISITION_RAW_MATERIAL`.`requisition` = `r`.`num`)) AS `quantity`,(select min(`REQUISITION_RAW_MATERIAL`.`date`) from `REQUISITION_RAW_MATERIAL` where (`REQUISITION_RAW_MATERIAL`.`requisition` = `r`.`num`)) AS `date` from (((`REQUISITION` `r` join `REQUISITION_STATUS` `rs` on((`r`.`requisitionStatus` = `rs`.`code`))) join `EMPLOYEE` `e` on((`r`.`employee` = `e`.`num`))) join `USER` `u` on((`u`.`employee` = `e`.`num`))) order by `rs`.`description` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_Storage`
--

/*!50001 DROP VIEW IF EXISTS `vw_Storage`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`cisco`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_Storage` AS select `s`.`quantity` AS `quantity`,`s`.`description` AS `description`,if((`s`.`rawMaterial` is not null),`s`.`rawMaterial`,`s`.`finishedProduct`) AS `item`,`s`.`location` AS `location`,`a`.`description` AS `area` from (`STORAGE` `s` join `AREA` `a` on((`s`.`area` = `a`.`code`))) order by `s`.`location` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-12-02 20:07:31
