CREATE DATABASE  IF NOT EXISTS `CREDIT` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `CREDIT`;
-- MySQL dump 10.13  Distrib 5.5.40, for debian-linux-gnu (i686)
--
-- Host: 127.0.0.1    Database: CREDIT
-- ------------------------------------------------------
-- Server version	5.5.40-0ubuntu0.14.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `CLIENT`
--

DROP TABLE IF EXISTS `CLIENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CLIENT` (
  `ID` int(11) NOT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `DATE` date DEFAULT NULL,
  `USER_ID` int(11) DEFAULT NULL,
  `INCOME` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT`
--

LOCK TABLES `CLIENT` WRITE;
/*!40000 ALTER TABLE `CLIENT` DISABLE KEYS */;
INSERT INTO `CLIENT` VALUES (1,'Jennifer Aniston','2015-01-08',1,'10000'),(2,'Courtney Cox','2015-01-08',1,'5000'),(3,'Client by Sally','2015-01-08',2,'2500'),(4,'Gabriel Logan','2015-01-17',1,'15000');
/*!40000 ALTER TABLE `CLIENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `LINK`
--

DROP TABLE IF EXISTS `LINK`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `LINK` (
  `ID` int(11) NOT NULL,
  `CLIENT_ID` int(11) DEFAULT NULL,
  `LOAN_ID` int(11) DEFAULT NULL,
  `USER_ID` int(11) DEFAULT NULL,
  `PERCENT` varchar(45) DEFAULT NULL,
  `MONEY` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `LINK`
--

LOCK TABLES `LINK` WRITE;
/*!40000 ALTER TABLE `LINK` DISABLE KEYS */;
INSERT INTO `LINK` VALUES (1,1,1,1,'65',NULL),(2,1,2,1,'85',NULL),(3,2,2,1,'95',NULL),(4,1,3,1,'100',NULL),(5,1,3,1,'100',NULL);
/*!40000 ALTER TABLE `LINK` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `LOAN`
--

DROP TABLE IF EXISTS `LOAN`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `LOAN` (
  `ID` int(11) NOT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `DATE` date DEFAULT NULL,
  `USER_ID` varchar(255) DEFAULT NULL,
  `MONEY` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `LOAN`
--

LOCK TABLES `LOAN` WRITE;
/*!40000 ALTER TABLE `LOAN` DISABLE KEYS */;
INSERT INTO `LOAN` VALUES (1,'Loan for home','2015-01-08','1',1000),(2,'Loan for business','2015-01-08','1',25000),(3,'Loan for study','2015-01-17','1',15000);
/*!40000 ALTER TABLE `LOAN` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `STAT`
--

DROP TABLE IF EXISTS `STAT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `STAT` (
  `ID` int(11) NOT NULL,
  `DATE` date DEFAULT NULL,
  `DESCRIPTION` varchar(4096) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `STAT`
--

LOCK TABLES `STAT` WRITE;
/*!40000 ALTER TABLE `STAT` DISABLE KEYS */;
INSERT INTO `STAT` VALUES (1,'2015-01-08','User Alena Puchenko create a new client with id: 1'),(2,'2015-01-08','User Alena Puchenko create a new client with id: 2'),(3,'2015-01-08','User Alena Puchenko create a new loan with id: 1'),(4,'2015-01-08','User Alena Puchenko create a new loan with id: 2'),(5,'2015-01-08','User Alena Puchenko create a new link with id: 1'),(6,'2015-01-08','User Alena Puchenko create a new link with id: 2'),(7,'2015-01-08','User Alena Puchenko create a new link with id: 3'),(8,'2015-01-08','User Alena Puchenko create a new user with id: 2'),(9,'2015-01-08','User Sally Shapiro create a new client with id: 3'),(10,'2015-01-17','User Alena Puchenko create a new client with id: 4'),(11,'2015-01-17','User Alena Puchenko create a new loan with id: 3');
/*!40000 ALTER TABLE `STAT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER`
--

DROP TABLE IF EXISTS `USER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `USER` (
  `ID` int(11) NOT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `LOGIN` varchar(255) DEFAULT NULL,
  `PASSWORD` varchar(255) DEFAULT NULL,
  `REGISTRATION_DATE` date DEFAULT NULL,
  `ADMIN` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER`
--

LOCK TABLES `USER` WRITE;
/*!40000 ALTER TABLE `USER` DISABLE KEYS */;
INSERT INTO `USER` VALUES (1,'Alena Puchenko','alena','pass','2015-01-08','admin'),(2,'Sally Shapiro','sally','pass','2015-01-08','user');
/*!40000 ALTER TABLE `USER` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-01-17  2:01:20
