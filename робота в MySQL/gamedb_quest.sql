-- MySQL dump 10.13  Distrib 8.0.43, for Win64 (x86_64)
--
-- Host: localhost    Database: gamedb
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
-- Table structure for table `quest`
--

DROP TABLE IF EXISTS `quest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `quest` (
  `quest_id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `description` text,
  `reward` varchar(100) DEFAULT NULL,
  `difficulty` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`quest_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quest`
--

LOCK TABLES `quest` WRITE;
/*!40000 ALTER TABLE `quest` DISABLE KEYS */;
INSERT INTO `quest` VALUES (1,'The Lost Sword','Find and return the lost sword of the king','100 gold','Medium\r'),(2,'Hunt the Beasts','Defeat 10 forest beasts and collect their claws','150 gold','Hard\r'),(3,'Crystal Caverns','Explore the crystal caves and bring 3 shards','200 gold','Hard\r'),(4,'Training Day','Complete training tasks in the arena','50 gold','Easy\r'),(5,'The Fallen Knight','Defeat the corrupted knight boss','300 gold','Very Hard\r'),(6,'Guard the Gates','Protect the city from enemies','120 gold','Medium\r'),(7,'Deliver the Message','Take the letter to the king','80 gold','Easy\r'),(8,'The Forgotten Temple','Find the hidden relic inside the temple','250 gold','Hard\r'),(9,'Defend the Village','Save villagers from bandits','180 gold','Medium\r'),(10,'The Final Trial','Complete the final hero challenge','500 gold','Very Hard\r');
/*!40000 ALTER TABLE `quest` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-10-15 21:36:54
