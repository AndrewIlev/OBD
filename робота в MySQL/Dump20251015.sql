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
-- Table structure for table `achievement`
--

DROP TABLE IF EXISTS `achievement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `achievement` (
  `achievement_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `description` text,
  `condition_text` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`achievement_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `achievement`
--

LOCK TABLES `achievement` WRITE;
/*!40000 ALTER TABLE `achievement` DISABLE KEYS */;
/*!40000 ALTER TABLE `achievement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `guild`
--

DROP TABLE IF EXISTS `guild`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `guild` (
  `guild_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `rating` int DEFAULT '0',
  `created_at` date DEFAULT NULL,
  PRIMARY KEY (`guild_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `guild`
--

LOCK TABLES `guild` WRITE;
/*!40000 ALTER TABLE `guild` DISABLE KEYS */;
INSERT INTO `guild` VALUES (1,'DragonSlayers',1200,'2022-06-14'),(2,'ShadowHunters',950,'2023-01-28'),(3,'MysticOrder',870,'2023-09-02'),(4,'SkyLegion',650,'2024-03-10'),(5,'IronFist',300,'2023-05-21'),(6,'CrimsonWolves',500,'2022-12-03'),(7,'ArcaneBrotherhood',760,'2023-09-15'),(8,'StormGuard',890,'2024-12-18'),(9,'NightRaiders',400,'2024-02-08'),(10,'PhoenixRise',1050,'2023-07-19');
/*!40000 ALTER TABLE `guild` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventory`
--

DROP TABLE IF EXISTS `inventory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inventory` (
  `player_id` int NOT NULL,
  `item_id` int NOT NULL,
  `quantity` int DEFAULT '1',
  PRIMARY KEY (`player_id`,`item_id`),
  KEY `item_id` (`item_id`),
  CONSTRAINT `inventory_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `player` (`player_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `inventory_ibfk_2` FOREIGN KEY (`item_id`) REFERENCES `item` (`item_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `inventory_chk_1` CHECK ((`quantity` > 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventory`
--

LOCK TABLES `inventory` WRITE;
/*!40000 ALTER TABLE `inventory` DISABLE KEYS */;
/*!40000 ALTER TABLE `inventory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item`
--

DROP TABLE IF EXISTS `item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `item` (
  `item_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `item_type` varchar(30) DEFAULT NULL,
  `rarity` varchar(30) DEFAULT NULL,
  `price` int DEFAULT '0',
  PRIMARY KEY (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item`
--

LOCK TABLES `item` WRITE;
/*!40000 ALTER TABLE `item` DISABLE KEYS */;
/*!40000 ALTER TABLE `item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mathgame`
--

DROP TABLE IF EXISTS `mathgame`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mathgame` (
  `match_id` int NOT NULL AUTO_INCREMENT,
  `match_date` date DEFAULT NULL,
  `match_type` varchar(30) DEFAULT NULL,
  `result` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`match_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mathgame`
--

LOCK TABLES `mathgame` WRITE;
/*!40000 ALTER TABLE `mathgame` DISABLE KEYS */;
/*!40000 ALTER TABLE `mathgame` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `player`
--

DROP TABLE IF EXISTS `player`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `player` (
  `player_id` int NOT NULL AUTO_INCREMENT,
  `login` varchar(50) NOT NULL,
  `nickname` varchar(50) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `level` int DEFAULT '1',
  `xp` int DEFAULT '0',
  `guild_id` int DEFAULT NULL,
  PRIMARY KEY (`player_id`),
  KEY `guild_id` (`guild_id`),
  CONSTRAINT `player_ibfk_1` FOREIGN KEY (`guild_id`) REFERENCES `guild` (`guild_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `player`
--

LOCK TABLES `player` WRITE;
/*!40000 ALTER TABLE `player` DISABLE KEYS */;
INSERT INTO `player` VALUES (1,'legend123','LegendaryHero','legend@mail.com',25,12400,101),(2,'shdw99','ShadowWolf','shadow99@gmail.com',19,8800,102),(3,'arcane77','MysticMage','mage77@gmail.com',30,15500,103),(4,'skyboy22','SkyRider','sky22@yahoo.com',14,6000,104),(5,'ironjoe','IronBreaker','iron.joe@mail.com',9,3100,105),(6,'drako88','FlameDrake','drako88@mail.com',27,13200,101),(7,'nina04','NightElf','nina04@gmail.com',11,5200,102),(8,'crystalx','CrystalLight','crystalx@gmail.com',22,10100,103),(9,'windrush','StormRider','windrush@mail.com',17,7900,104),(10,'brutus01','HeavyTank','brutus01@mail.com',13,4700,105);
/*!40000 ALTER TABLE `player` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `playerachievement`
--

DROP TABLE IF EXISTS `playerachievement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `playerachievement` (
  `player_id` int NOT NULL,
  `achievement_id` int NOT NULL,
  PRIMARY KEY (`player_id`,`achievement_id`),
  KEY `achievement_id` (`achievement_id`),
  CONSTRAINT `playerachievement_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `player` (`player_id`) ON DELETE CASCADE,
  CONSTRAINT `playerachievement_ibfk_2` FOREIGN KEY (`achievement_id`) REFERENCES `achievement` (`achievement_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `playerachievement`
--

LOCK TABLES `playerachievement` WRITE;
/*!40000 ALTER TABLE `playerachievement` DISABLE KEYS */;
/*!40000 ALTER TABLE `playerachievement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `playermathgame`
--

DROP TABLE IF EXISTS `playermathgame`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `playermathgame` (
  `player_id` int NOT NULL,
  `match_id` int NOT NULL,
  PRIMARY KEY (`player_id`,`match_id`),
  KEY `match_id` (`match_id`),
  CONSTRAINT `playermathgame_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `player` (`player_id`) ON DELETE CASCADE,
  CONSTRAINT `playermathgame_ibfk_2` FOREIGN KEY (`match_id`) REFERENCES `mathgame` (`match_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `playermathgame`
--

LOCK TABLES `playermathgame` WRITE;
/*!40000 ALTER TABLE `playermathgame` DISABLE KEYS */;
INSERT INTO `playermathgame` VALUES (1,1),(9,1),(1,2),(10,2),(2,3),(3,4),(3,5),(4,6),(5,7),(6,8),(7,9),(8,10);
/*!40000 ALTER TABLE `playermathgame` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `playerquest`
--

DROP TABLE IF EXISTS `playerquest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `playerquest` (
  `player_id` int NOT NULL,
  `quest_id` int NOT NULL,
  PRIMARY KEY (`player_id`,`quest_id`),
  KEY `quest_id` (`quest_id`),
  CONSTRAINT `playerquest_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `player` (`player_id`) ON DELETE CASCADE,
  CONSTRAINT `playerquest_ibfk_2` FOREIGN KEY (`quest_id`) REFERENCES `quest` (`quest_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `playerquest`
--

LOCK TABLES `playerquest` WRITE;
/*!40000 ALTER TABLE `playerquest` DISABLE KEYS */;
/*!40000 ALTER TABLE `playerquest` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `playerskill`
--

DROP TABLE IF EXISTS `playerskill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `playerskill` (
  `player_id` int NOT NULL,
  `skill_id` int NOT NULL,
  PRIMARY KEY (`player_id`,`skill_id`),
  KEY `skill_id` (`skill_id`),
  CONSTRAINT `playerskill_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `player` (`player_id`) ON DELETE CASCADE,
  CONSTRAINT `playerskill_ibfk_2` FOREIGN KEY (`skill_id`) REFERENCES `skill` (`skill_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `playerskill`
--

LOCK TABLES `playerskill` WRITE;
/*!40000 ALTER TABLE `playerskill` DISABLE KEYS */;
/*!40000 ALTER TABLE `playerskill` ENABLE KEYS */;
UNLOCK TABLES;

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

--
-- Table structure for table `skill`
--

DROP TABLE IF EXISTS `skill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `skill` (
  `skill_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `level` int DEFAULT '1',
  `effect` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`skill_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `skill`
--

LOCK TABLES `skill` WRITE;
/*!40000 ALTER TABLE `skill` DISABLE KEYS */;
/*!40000 ALTER TABLE `skill` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-10-15 22:43:23
