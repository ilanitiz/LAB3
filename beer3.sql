-- MySQL dump 10.13  Distrib 5.7.12, for Win64 (x86_64)
--
-- Host: localhost    Database: beer
-- ------------------------------------------------------
-- Server version	5.7.12-log

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
-- Current Database: `beer`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `beer` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `beer`;

--
-- Table structure for table `beer`
--

DROP TABLE IF EXISTS `beer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `beer` (
  `beerID` int(11) NOT NULL AUTO_INCREMENT,
  `beerName` varchar(25) DEFAULT NULL,
  `beerStyle` varchar(25) DEFAULT NULL,
  `beerType` varchar(25) DEFAULT NULL,
  `breweryID` int(11) DEFAULT NULL,
  PRIMARY KEY (`beerID`),
  KEY `breweryID` (`breweryID`),
  CONSTRAINT `beer_ibfk_1` FOREIGN KEY (`breweryID`) REFERENCES `brewery` (`breweryID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `beer`
--

LOCK TABLES `beer` WRITE;
/*!40000 ALTER TABLE `beer` DISABLE KEYS */;
INSERT INTO `beer` VALUES (1,'LEFFE BLONDE','ALE','BLONDE',1),(2,'SAMUEL ADAMS BOSTON LAGER','LAGER','AMBER',2),(3,'WELLINGTON IRON DUKE','MALT','DARK',3);
/*!40000 ALTER TABLE `beer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `brewery`
--

DROP TABLE IF EXISTS `brewery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `brewery` (
  `breweryID` int(11) NOT NULL AUTO_INCREMENT,
  `breweryName` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`breweryID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `brewery`
--

LOCK TABLES `brewery` WRITE;
/*!40000 ALTER TABLE `brewery` DISABLE KEYS */;
INSERT INTO `brewery` VALUES (1,'SweetWater'),(2,'AleSmith'),(3,'Sierra Nevada');
/*!40000 ALTER TABLE `brewery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `funding`
--

DROP TABLE IF EXISTS `funding`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `funding` (
  `breweryID` int(11) DEFAULT NULL,
  `futureID` int(11) DEFAULT NULL,
  `fundingMetadata` blob,
  UNIQUE KEY `pkFunding` (`breweryID`,`futureID`),
  KEY `futureID` (`futureID`),
  CONSTRAINT `funding_ibfk_1` FOREIGN KEY (`breweryID`) REFERENCES `brewery` (`breweryID`),
  CONSTRAINT `funding_ibfk_2` FOREIGN KEY (`futureID`) REFERENCES `future` (`futureID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `funding`
--

LOCK TABLES `funding` WRITE;
/*!40000 ALTER TABLE `funding` DISABLE KEYS */;
INSERT INTO `funding` VALUES (1,2,'101101010010011'),(1,3,'111010100101101'),(2,3,'101110101011010'),(2,4,'111001010101110'),(3,4,'101110111010001');
/*!40000 ALTER TABLE `funding` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `future`
--

DROP TABLE IF EXISTS `future`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `future` (
  `futureID` int(11) NOT NULL AUTO_INCREMENT,
  `futureName` varchar(55) DEFAULT NULL,
  `futureDescription` varchar(255) DEFAULT NULL,
  `futureExpireDate` date DEFAULT NULL,
  PRIMARY KEY (`futureID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `future`
--

LOCK TABLES `future` WRITE;
/*!40000 ALTER TABLE `future` DISABLE KEYS */;
INSERT INTO `future` VALUES (1,'SABMILLER 10152015 Alpha Pale Ale','Ale, bitter-five, sweet-two, ABV:5.2%, Australia','2015-10-15'),(2,'SABMILLER 12112014 Aguila Cero','Non Alcoholic, bitter-two, sweet-two, ABV:0.4%, Colombia','2014-12-11'),(3,'AB-INBEV 03012015 Stella Artois','Euro Pale Lager, ABV:5.00%, Belgium','2015-03-01'),(4,'SABMILLER 05082016 Budweiser','Wheat, bitter-one, sweet-four, ABV:5.4% ,USA','2016-05-08'),(5,'AB-INBEV 06262015 Becks','German Pilsener, ABV:5.00%, Germany','2015-06-26');
/*!40000 ALTER TABLE `future` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-07-08 15:34:48
