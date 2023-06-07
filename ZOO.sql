-- MySQL dump 10.13  Distrib 8.0.31, for Linux (x86_64)
--
-- Host: localhost    Database: DNA
-- ------------------------------------------------------
-- Server version	8.0.31-0ubuntu0.20.04.1

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
-- Table structure for table `ANIMAL`
--

DROP TABLE IF EXISTS `ANIMAL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ANIMAL` (
  `AnimalID` char(10) NOT NULL,
  `ZooName` varchar(50) NOT NULL DEFAULT 'Default',
  `SpeciesName` varchar(25) NOT NULL DEFAULT 'Default',
  `Height` int DEFAULT NULL,
  `Weight` int DEFAULT NULL,
  `Age` int DEFAULT NULL,
  PRIMARY KEY (`AnimalID`,`ZooName`),
  KEY `ZooName` (`ZooName`),
  KEY `SpeciesName` (`SpeciesName`),
  CONSTRAINT `ANIMAL_ibfk_1` FOREIGN KEY (`ZooName`) REFERENCES `ZOO` (`ZooName`) ON DELETE SET DEFAULT ON UPDATE CASCADE,
  CONSTRAINT `ANIMAL_ibfk_2` FOREIGN KEY (`SpeciesName`) REFERENCES `SPECIES` (`SpeciesName`) ON DELETE SET DEFAULT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ANIMAL`
--

LOCK TABLES `ANIMAL` WRITE;
/*!40000 ALTER TABLE `ANIMAL` DISABLE KEYS */;
INSERT INTO `ANIMAL` VALUES ('1254875213','Rajiv Gandhi Zoological Park','Lion',1,130,10),('1266235656','Indira Gandhi Zoological Park','American Aligator',270,105,42),('1278532554','Mysore Zoo','Monkey',45,8,15),('1545122565','Alipore Zoo','Tiger',106,210,10),('1545124554','Indira Gandhi Zoological Park','Monkey',40,7,12),('1546565565','Nehru Zoological Park','Hippo',150,3000,50),('1546566565','Mysore Zoo','Reindeer',150,180,18),('1556236565','Alipore Zoo','Emu',175,32,25),('1575232523','Indira Gandhi Zoological Park','Tiger',95,170,8),('1575326532','Indira Gandhi Zoological Park','Tiger',110,160,9),('1579885562','Nehru Zoological Park','Monkey',50,8,9),('1595655665','Rajiv Gandhi Zoological Park','Monkey',35,10,14),('1889532685','Mysore Zoo','Tiger',90,150,7),('2154651454','Nehru Zoological Park','Tiger',105,300,9),('2454652356','Indira Gandhi Zoological Park','Monkey',30,6,11),('2457652126','National Zoological Park','Tiger',80,175,8),('2457652127','National Zoological Park','Lion',100,130,16),('2465656566','Alipore Zoo','Emu',170,37,29),('2465656566','Indira Gandhi Zoological Park','Hippo',140,2000,45),('2468542154','Indira Gandhi Zoological Park','Monkey',20,5,10),('2488756238','Mysore Zoo','Lion',96,140,10),('2522655656','Indira Gandhi Zoological Park','Hippo',130,1500,40),('2545626552','Indira Gandhi Zoological Park','American Aligator',310,170,47),('2565323235','Indira Gandhi Zoological Park','Reindeer',85,97,10),('2656100545','National Zoological Park','Lion',100,130,16),('3554547445','Nehru Zoological Park','Monkey',25,9,13),('4541235655','Indira Gandhi Zoological Park','Tiger',86,180,6),('4543213522','Indira Gandhi Zoological Park','Reindeer',105,123,13),('5579503565','Indira Gandhi Zoological Park','Lion',90,132,14),('5656256556','Indira Gandhi Zoological Park','Green Tree Python',200,2,20),('5753256535','National Zoological Park','Monkey',34,6,16),('5781312654','Rajiv Gandhi Zoological Park','Red panda',62,6,112),('7512656564','National Zoological Park','Red panda',57,5,11),('7852323232','National Zoological Park','Red panda',56,4,9),('7952153345','Alipore Zoo','Lion',111,80,9),('7988332356','Nehru Zoological Park','Lion',105,100,8),('8332938178','National Zoological Park','Lion',55,100,5),('8332938179','Alipore Zoo','Tiger',85,100,9),('8332938179','National Zoological Park','Lion',110,150,8),('8887512889','Indira Gandhi Zoological Park','Lion',100,130,11),('9854565345','Mysore Zoo','Lion',48,200,15);
/*!40000 ALTER TABLE `ANIMAL` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ANIMAL_COLOUR`
--

DROP TABLE IF EXISTS `ANIMAL_COLOUR`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ANIMAL_COLOUR` (
  `AnimalID` char(10) NOT NULL DEFAULT 'Default',
  `ZooName` varchar(50) NOT NULL DEFAULT 'Default',
  `Colour` varchar(25) NOT NULL,
  PRIMARY KEY (`AnimalID`,`ZooName`,`Colour`),
  KEY `ZooName` (`ZooName`),
  CONSTRAINT `ANIMAL_COLOUR_ibfk_1` FOREIGN KEY (`AnimalID`) REFERENCES `ANIMAL` (`AnimalID`) ON DELETE SET DEFAULT ON UPDATE CASCADE,
  CONSTRAINT `ANIMAL_COLOUR_ibfk_2` FOREIGN KEY (`ZooName`) REFERENCES `ZOO` (`ZooName`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ANIMAL_COLOUR`
--

LOCK TABLES `ANIMAL_COLOUR` WRITE;
/*!40000 ALTER TABLE `ANIMAL_COLOUR` DISABLE KEYS */;
INSERT INTO `ANIMAL_COLOUR` VALUES ('1545122565','Alipore Zoo','Black'),('1545122565','Alipore Zoo','Orange'),('1556236565','Alipore Zoo','Grey'),('2465656566','Alipore Zoo','Brown'),('7952153345','Alipore Zoo','Brown'),('8332938179','Alipore Zoo','Black'),('8332938179','Alipore Zoo','Golden'),('1266235656','Indira Gandhi Zoological Park','Blackish grey'),('1545124554','Indira Gandhi Zoological Park','Black'),('1545124554','Indira Gandhi Zoological Park','Reddish brown'),('1575232523','Indira Gandhi Zoological Park','Black'),('1575232523','Indira Gandhi Zoological Park','White'),('1575326532','Indira Gandhi Zoological Park','Cinnamon'),('1575326532','Indira Gandhi Zoological Park','Golden'),('2454652356','Indira Gandhi Zoological Park','Black'),('2454652356','Indira Gandhi Zoological Park','Buff gold'),('2465656566','Indira Gandhi Zoological Park','Brown'),('2468542154','Indira Gandhi Zoological Park','Gray'),('2468542154','Indira Gandhi Zoological Park','White'),('2522655656','Indira Gandhi Zoological Park','Gray'),('2545626552','Indira Gandhi Zoological Park','Olive'),('2565323235','Indira Gandhi Zoological Park','Black'),('4541235655','Indira Gandhi Zoological Park','Black'),('4541235655','Indira Gandhi Zoological Park','Orange'),('4543213522','Indira Gandhi Zoological Park','Black'),('4543213522','Indira Gandhi Zoological Park','Cream'),('5579503565','Indira Gandhi Zoological Park','Black'),('5579503565','Indira Gandhi Zoological Park','Tawny yellow'),('5656256556','Indira Gandhi Zoological Park','Green'),('5656256556','Indira Gandhi Zoological Park','Yellow'),('8887512889','Indira Gandhi Zoological Park','Silvery gray'),('1278532554','Mysore Zoo','Dull brown'),('1546566565','Mysore Zoo','Brown'),('1889532685','Mysore Zoo','Black'),('1889532685','Mysore Zoo','White'),('2488756238','Mysore Zoo','Yellow gold'),('9854565345','Mysore Zoo','Orangy brown'),('2457652126','National Zoological Park','Black'),('2457652126','National Zoological Park','Orange'),('2457652127','National Zoological Park','Black'),('2457652127','National Zoological Park','Brown'),('2656100545','National Zoological Park','Brown'),('5753256535','National Zoological Park','Gray'),('7512656564','National Zoological Park','Orange brown'),('7852323232','National Zoological Park','Red'),('8332938178','National Zoological Park','Buff yellow'),('8332938179','National Zoological Park','Brown'),('1546565565','Nehru Zoological Park','Greyish'),('1546565565','Nehru Zoological Park','Muddy brown'),('1579885562','Nehru Zoological Park','Cream'),('1579885562','Nehru Zoological Park','Golden'),('2154651454','Nehru Zoological Park','Black'),('2154651454','Nehru Zoological Park','Orange'),('3554547445','Nehru Zoological Park','Black'),('3554547445','Nehru Zoological Park','Brown'),('7988332356','Nehru Zoological Park','White'),('1254875213','Rajiv Gandhi Zoological Park','Black'),('1254875213','Rajiv Gandhi Zoological Park','Golden blonde'),('1595655665','Rajiv Gandhi Zoological Park','Black'),('1595655665','Rajiv Gandhi Zoological Park','Buff gold'),('5781312654','Rajiv Gandhi Zoological Park','Black'),('5781312654','Rajiv Gandhi Zoological Park','Red');
/*!40000 ALTER TABLE `ANIMAL_COLOUR` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CUSTOMER`
--

DROP TABLE IF EXISTS `CUSTOMER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CUSTOMER` (
  `CustomerID` char(5) NOT NULL,
  `FName` varchar(10) NOT NULL,
  `LName` varchar(10) NOT NULL,
  `Age` int DEFAULT NULL,
  `Gender` char(1) DEFAULT NULL,
  `PhoneNum` char(10) DEFAULT NULL,
  PRIMARY KEY (`CustomerID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CUSTOMER`
--

LOCK TABLES `CUSTOMER` WRITE;
/*!40000 ALTER TABLE `CUSTOMER` DISABLE KEYS */;
INSERT INTO `CUSTOMER` VALUES ('13258','John','Wick',30,'M','1598746378'),('23435','Draco','Malfoy',23,'M','8956565357'),('25687','Kavita','Garg',20,'F','5698712354'),('35556','Moaning','Myrtle',29,'F','7956256562'),('36985','Harry','Potter',18,'M','7899525656'),('42356','Hermoine','Granger',20,'F','5962652454'),('56987','Shreya','Gupta',10,'F',NULL),('63677','Rita','Skeeter',36,'F','8965326232'),('79812','Rowena','Ravenclaw',50,'F','8553235625'),('86522','Tom','Riddle',25,'M','7882235323'),('87862','Ronald','Weasley',21,'M','4558852124');
/*!40000 ALTER TABLE `CUSTOMER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CUSTOMER_ZOO`
--

DROP TABLE IF EXISTS `CUSTOMER_ZOO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CUSTOMER_ZOO` (
  `CustomerID` char(5) NOT NULL DEFAULT 'def',
  `ZooVisited` varchar(50) NOT NULL DEFAULT 'Default',
  PRIMARY KEY (`CustomerID`,`ZooVisited`),
  KEY `ZooVisited` (`ZooVisited`),
  CONSTRAINT `CUSTOMER_ZOO_ibfk_1` FOREIGN KEY (`ZooVisited`) REFERENCES `ZOO` (`ZooName`) ON DELETE SET DEFAULT ON UPDATE CASCADE,
  CONSTRAINT `CUSTOMER_ZOO_ibfk_2` FOREIGN KEY (`CustomerID`) REFERENCES `CUSTOMER` (`CustomerID`) ON DELETE SET DEFAULT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CUSTOMER_ZOO`
--

LOCK TABLES `CUSTOMER_ZOO` WRITE;
/*!40000 ALTER TABLE `CUSTOMER_ZOO` DISABLE KEYS */;
INSERT INTO `CUSTOMER_ZOO` VALUES ('13258','Alipore Zoo'),('35556','Alipore Zoo'),('42356','Alipore Zoo'),('87862','Alipore Zoo'),('13258','Indira Gandhi Zoological Park'),('23435','Indira Gandhi Zoological Park'),('35556','Indira Gandhi Zoological Park'),('36985','Indira Gandhi Zoological Park'),('42356','Indira Gandhi Zoological Park'),('56987','Indira Gandhi Zoological Park'),('63677','Indira Gandhi Zoological Park'),('79812','Indira Gandhi Zoological Park'),('86522','Indira Gandhi Zoological Park'),('87862','Indira Gandhi Zoological Park'),('23435','Mysore Zoo'),('42356','Mysore Zoo'),('63677','Mysore Zoo'),('79812','Mysore Zoo'),('86522','Mysore Zoo'),('13258','National Zoological Park'),('25687','National Zoological Park'),('36985','National Zoological Park'),('56987','National Zoological Park'),('87862','National Zoological Park'),('13258','Nehru Zoological Park'),('25687','Nehru Zoological Park'),('35556','Nehru Zoological Park'),('63677','Nehru Zoological Park'),('79812','Nehru Zoological Park'),('13258','Rajiv Gandhi Zoological Park'),('23435','Rajiv Gandhi Zoological Park'),('25687','Rajiv Gandhi Zoological Park'),('35556','Rajiv Gandhi Zoological Park'),('36985','Rajiv Gandhi Zoological Park'),('42356','Rajiv Gandhi Zoological Park'),('56987','Rajiv Gandhi Zoological Park'),('86522','Rajiv Gandhi Zoological Park'),('87862','Rajiv Gandhi Zoological Park');
/*!40000 ALTER TABLE `CUSTOMER_ZOO` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `EMPLOYEE`
--

DROP TABLE IF EXISTS `EMPLOYEE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `EMPLOYEE` (
  `EID` char(9) NOT NULL,
  `ZooName` varchar(50) NOT NULL DEFAULT 'Default',
  `FName` varchar(10) NOT NULL,
  `LName` varchar(10) NOT NULL,
  `Age` int DEFAULT NULL,
  `Gender` char(1) DEFAULT NULL,
  `Salary` int NOT NULL,
  PRIMARY KEY (`EID`,`ZooName`),
  KEY `ZooName` (`ZooName`),
  CONSTRAINT `EMPLOYEE_ibfk_1` FOREIGN KEY (`ZooName`) REFERENCES `ZOO` (`ZooName`) ON DELETE SET DEFAULT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EMPLOYEE`
--

LOCK TABLES `EMPLOYEE` WRITE;
/*!40000 ALTER TABLE `EMPLOYEE` DISABLE KEYS */;
INSERT INTO `EMPLOYEE` VALUES ('102358756','National Zoological Park','Fleur','Delacour',25,'F',27000),('123456789','Alipore Zoo','Marvolo','Gaunt',25,'M',50000),('158239644','Nehru Zoological Park','Vernon','Dursley',40,'M',10000),('158956231','Indira Gandhi Zoological Park','Gregory','Goyle',21,'M',15000),('158956231','National Zoological Park','Dhruvi','Singh',22,'F',65000),('187955255','Nehru Zoological Park','Severus','Snape',35,'M',50000),('196853241','Alipore Zoo','Alastator','Moody',45,'M',45000),('196853241','Nehru Zoological Park','Godric','Gryffindor',23,'M',32000),('214659787','Indira Gandhi Zoological Park','Albus','Dumbledore',60,'M',100000),('234098567','Nehru Zoological Park','JK','Rowling',34,'M',50000),('235476884','Mysore Zoo','Glideroy','Lockhart',38,'M',28000),('265742467','Nehru Zoological Park','Minerva','MCGonagall',40,'F',32000),('265742467','Rajiv Gandhi Zoological Park','Augusta','Longbottom',55,'F',60000),('267198307','Indira Gandhi Zoological Park','Narcissa','Malfoy',38,'F',26000),('325698041','Mysore Zoo','Cedric','Diggory',28,'M',50000),('345684555','Rajiv Gandhi Zoological Park','Ishaan','Pandey',28,'M',68000),('369875241','Indira Gandhi Zoological Park','Bird','Hedwig',20,'M',90000),('435324478','National Zoological Park','Dolores','Umbridge',36,'F',50000),('456778896','Alipore Zoo','Argus','Filch',30,'M',20000),('457531835','Alipore Zoo','Peter','Pettigrew',38,'M',30000),('469852174','Rajiv Gandhi Zoological Park','Dudley','Dursley',20,'M',10000),('495238656','Indira Gandhi Zoological Park','Vincent','Crabbe',24,'M',15000),('495238656','Rajiv Gandhi Zoological Park','Petunia','Dursley',35,'F',10000),('523147659','Indira Gandhi Zoological Park','Seamus','Finnigin',48,'M',50000),('557895448','Indira Gandhi Zoological Park','Victor','Krum',37,'M',30000),('557895448','Mysore Zoo','Sirius','Black',39,'M',40000),('557895456','Mysore Zoo','Inaya','Jain',27,'F',80000),('562018394','National Zoological Park','Remus','Lupin',36,'M',40000),('562018394','Rajiv Gandhi Zoological Park','Charlie','weasley',38,'M',50000),('568724312','Indira Gandhi Zoological Park','Bellatrix','Lestrange',35,'F',10000),('578965554','Rajiv Gandhi Zoological Park','Cho','Chang',19,'F',5000),('658942371','Rajiv Gandhi Zoological Park','Mundungus','Fletcher',29,'M',30000),('674215839','Indira Gandhi Zoological Park','Quirinus','Quirrell',34,'M',35000),('683204756','Mysore Zoo','Lily','Potter',38,'F',90000),('754259386','Mysore Zoo','Lucius','Malfoy',40,'M',25000),('758954256','National Zoological Park','Luna','Lovegood',20,'F',26500),('789235454','Alipore Zoo','Helga','Hufflepuff',36,'F',45000),('798235875','Nehru Zoological Park','Barty','Crouch',40,'M',20000),('878235698','Alipore Zoo','Rubeus','Hagrid',40,'M',20000),('953674552','National Zoological Park','Cornelius','Fudge',39,'M',55000),('956742138','Rajiv Gandhi Zoological Park','James','Potter',39,'M',55000),('978652312','Indira Gandhi Zoological Park','Igor','Karkaroff',38,'M',20000),('985267643','Alipore Zoo','Neville','Longbottom',21,'M',29000),('985267643','National Zoological Park','Garrick','Ollivander',36,'M',70000);
/*!40000 ALTER TABLE `EMPLOYEE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SPECIES`
--

DROP TABLE IF EXISTS `SPECIES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `SPECIES` (
  `SpeciesName` varchar(25) NOT NULL,
  `ZooName` varchar(50) NOT NULL DEFAULT 'xyz',
  `EID_of_emp_who_takes_care` char(9) NOT NULL DEFAULT 'default',
  PRIMARY KEY (`SpeciesName`,`ZooName`),
  KEY `ZooName` (`ZooName`),
  KEY `EID` (`EID_of_emp_who_takes_care`),
  CONSTRAINT `EID` FOREIGN KEY (`EID_of_emp_who_takes_care`) REFERENCES `EMPLOYEE` (`EID`) ON DELETE SET DEFAULT ON UPDATE CASCADE,
  CONSTRAINT `SPECIES_ibfk_1` FOREIGN KEY (`ZooName`) REFERENCES `ZOO` (`ZooName`) ON DELETE SET DEFAULT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SPECIES`
--

LOCK TABLES `SPECIES` WRITE;
/*!40000 ALTER TABLE `SPECIES` DISABLE KEYS */;
INSERT INTO `SPECIES` VALUES ('Monkey','National Zoological Park','102358756'),('Monkey','Nehru Zoological Park','158239644'),('Hippo','Indira Gandhi Zoological Park','158956231'),('Lion','National Zoological Park','158956231'),('Lion','Nehru Zoological Park','187955255'),('Hippo','Nehru Zoological Park','196853241'),('Tiger','Alipore Zoo','196853241'),('Lion','Indira Gandhi Zoological Park','214659787'),('Reindeer','Mysore Zoo','235476884'),('Monkey','Mysore Zoo','325698041'),('Lion','Rajiv Gandhi Zoological Park','345684555'),('Tiger','Indira Gandhi Zoological Park','369875241'),('Monkey','Alipore Zoo','456778896'),('Monkey','Rajiv Gandhi Zoological Park','469852174'),('Monkey','Indira Gandhi Zoological Park','495238656'),('Green Tree Python','Indira Gandhi Zoological Park','557895448'),('Tiger','Mysore Zoo','557895448'),('Lion','Mysore Zoo','557895456'),('Reindeer','Indira Gandhi Zoological Park','568724312'),('Tiger','Rajiv Gandhi Zoological Park','578965554'),('Red Panda','Rajiv Gandhi Zoological Park','658942371'),('Tiger','National Zoological Park','758954256'),('Emu','Alipore Zoo','789235454'),('Tiger','Nehru Zoological Park','798235875'),('Lion','Alipore Zoo','878235698'),('Red Panda','National Zoological Park','953674552'),('American Aligator','Indira Gandhi Zoological Park','978652312');
/*!40000 ALTER TABLE `SPECIES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SPECIES_FOOD`
--

DROP TABLE IF EXISTS `SPECIES_FOOD`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `SPECIES_FOOD` (
  `SpeciesName` varchar(25) NOT NULL DEFAULT 'Default',
  `Food` varchar(10) NOT NULL,
  PRIMARY KEY (`SpeciesName`,`Food`),
  CONSTRAINT `SPECIES_FOOD_ibfk_1` FOREIGN KEY (`SpeciesName`) REFERENCES `SPECIES` (`SpeciesName`) ON DELETE SET DEFAULT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SPECIES_FOOD`
--

LOCK TABLES `SPECIES_FOOD` WRITE;
/*!40000 ALTER TABLE `SPECIES_FOOD` DISABLE KEYS */;
INSERT INTO `SPECIES_FOOD` VALUES ('American Aligator','Birds'),('American Aligator','Fish'),('American Aligator','Frogs'),('American Aligator','Snails'),('Emu','Berries'),('Emu','Fruits'),('Emu','Grubs'),('Emu','Insects'),('Emu','Leaves'),('Green Tree Python','Mammals'),('Green Tree Python','Reptiles'),('Hippo','Fruits'),('Hippo','Grass'),('Lion','Birds'),('Lion','Buffalos'),('Lion','Hares'),('Lion','Wild Dogs'),('Monkey','Fruits'),('Monkey','Insects'),('Monkey','Leaves'),('Monkey','Seeds'),('Monkey','Vegetables'),('Red Panda','Bamboo'),('Red Panda','Fruits'),('Red Panda','Insects'),('Red Panda','Leaves'),('Reindeer','Ferns'),('Reindeer','Herbs'),('Reindeer','Leaves'),('Reindeer','Moss'),('Tiger','Buffalos'),('Tiger','Deer'),('Tiger','Goats'),('Tiger','Moose'),('Tiger','Pigs');
/*!40000 ALTER TABLE `SPECIES_FOOD` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TICKET`
--

DROP TABLE IF EXISTS `TICKET`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `TICKET` (
  `ZooName` varchar(50) NOT NULL DEFAULT 'Default',
  `TicketNum` char(5) NOT NULL,
  `CustomerID` char(5) NOT NULL DEFAULT 'def',
  PRIMARY KEY (`TicketNum`,`ZooName`),
  KEY `CustomerID` (`CustomerID`),
  KEY `ZooName` (`ZooName`),
  CONSTRAINT `TICKET_ibfk_1` FOREIGN KEY (`CustomerID`) REFERENCES `CUSTOMER` (`CustomerID`) ON DELETE SET DEFAULT ON UPDATE CASCADE,
  CONSTRAINT `TICKET_ibfk_2` FOREIGN KEY (`ZooName`) REFERENCES `ZOO` (`ZooName`) ON DELETE SET DEFAULT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TICKET`
--

LOCK TABLES `TICKET` WRITE;
/*!40000 ALTER TABLE `TICKET` DISABLE KEYS */;
INSERT INTO `TICKET` VALUES ('National Zoological Park','54554','13258'),('Alipore Zoo','78411','13258'),('Nehru Zoological Park','84545','13258'),('Rajiv Gandhi Zoological Park','98484','13258'),('Mysore Zoo','45444','23435'),('Indira Gandhi Zoological Park','55455','23435'),('Rajiv Gandhi Zoological Park','75554','23435'),('National Zoological Park','21626','25687'),('Rajiv Gandhi Zoological Park','24888','25687'),('Nehru Zoological Park','25454','25687'),('Rajiv Gandhi Zoological Park','54554','35556'),('Nehru Zoological Park','75545','35556'),('Indira Gandhi Zoological Park','98245','35556'),('Alipore Zoo','98754','35556'),('Indira Gandhi Zoological Park','11578','36985'),('National Zoological Park','25548','36985'),('Rajiv Gandhi Zoological Park','48458','36985'),('Indira Gandhi Zoological Park','78121','36985'),('Mysore Zoo','15656','42356'),('Indira Gandhi Zoological Park','15762','42356'),('Alipore Zoo','84656','42356'),('Rajiv Gandhi Zoological Park','95454','42356'),('Rajiv Gandhi Zoological Park','44547','56987'),('National Zoological Park','45546','56987'),('Indira Gandhi Zoological Park','56445','56987'),('Nehru Zoological Park','45465','63677'),('Mysore Zoo','45587','63677'),('Indira Gandhi Zoological Park','84511','63677'),('Mysore Zoo','54215','79812'),('Nehru Zoological Park','65421','79812'),('Indira Gandhi Zoological Park','95454','79812'),('Rajiv Gandhi Zoological Park','10154','86522'),('Mysore Zoo','45454','86522'),('Indira Gandhi Zoological Park','85515','86522'),('Rajiv Gandhi Zoological Park','12587','87862'),('National Zoological Park','45654','87862'),('Indira Gandhi Zoological Park','57845','87862'),('Alipore Zoo','75451','87862');
/*!40000 ALTER TABLE `TICKET` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TICKET_COUNTER`
--

DROP TABLE IF EXISTS `TICKET_COUNTER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `TICKET_COUNTER` (
  `ZooName` varchar(50) NOT NULL DEFAULT 'Default',
  `TC_mgrID` char(9) NOT NULL DEFAULT 'Default',
  `Price_for_children` int NOT NULL,
  `Price_for_adults` int NOT NULL,
  PRIMARY KEY (`ZooName`),
  KEY `TC_mgrID` (`TC_mgrID`),
  CONSTRAINT `TICKET_COUNTER_ibfk_1` FOREIGN KEY (`ZooName`) REFERENCES `ZOO` (`ZooName`) ON DELETE SET DEFAULT ON UPDATE CASCADE,
  CONSTRAINT `TICKET_COUNTER_ibfk_2` FOREIGN KEY (`TC_mgrID`) REFERENCES `EMPLOYEE` (`EID`) ON DELETE SET DEFAULT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TICKET_COUNTER`
--

LOCK TABLES `TICKET_COUNTER` WRITE;
/*!40000 ALTER TABLE `TICKET_COUNTER` DISABLE KEYS */;
INSERT INTO `TICKET_COUNTER` VALUES ('Alipore Zoo','457531835',10,25),('Indira Gandhi Zoological Park','267198307',5,10),('Mysore Zoo','754259386',20,50),('National Zoological Park','562018394',20,40),('Nehru Zoological Park','265742467',10,20),('Rajiv Gandhi Zoological Park','265742467',15,25);
/*!40000 ALTER TABLE `TICKET_COUNTER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ZOO`
--

DROP TABLE IF EXISTS `ZOO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ZOO` (
  `ZooName` varchar(50) NOT NULL,
  `Location` varchar(20) NOT NULL,
  `MgrID` char(9) NOT NULL DEFAULT '123567890',
  PRIMARY KEY (`ZooName`),
  KEY `Zoo_mgr` (`MgrID`),
  CONSTRAINT `Zoo_mgr` FOREIGN KEY (`MgrID`) REFERENCES `EMPLOYEE` (`EID`) ON DELETE SET DEFAULT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ZOO`
--

LOCK TABLES `ZOO` WRITE;
/*!40000 ALTER TABLE `ZOO` DISABLE KEYS */;
INSERT INTO `ZOO` VALUES ('Alipore Zoo','Kolkata','123456789'),('Indira Gandhi Zoological Park','Visakhapatnam','523147659'),('Mysore Zoo','Mysore','683204756'),('National Zoological Park','Delhi','435324478'),('Nehru Zoological Park','Hyderabad','234098567'),('Rajiv Gandhi Zoological Park','Pune','956742138');
/*!40000 ALTER TABLE `ZOO` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-11-27 18:02:05
