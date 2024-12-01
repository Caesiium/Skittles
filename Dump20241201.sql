-- MySQL dump 10.13  Distrib 8.0.40, for Win64 (x86_64)
--
-- Host: localhost    Database: ssh_groceries_database
-- ------------------------------------------------------
-- Server version	8.0.40

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
-- Table structure for table `groceries`
--

DROP TABLE IF EXISTS `groceries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `groceries` (
  `supermarket_name` varchar(100) DEFAULT NULL,
  `grocery_name` varchar(100) DEFAULT NULL,
  `grocery_id` int DEFAULT NULL,
  `grocery_type` varchar(100) DEFAULT NULL,
  `price` varchar(100) DEFAULT NULL,
  `offer` varchar(100) DEFAULT NULL,
  KEY `supermarket_name` (`supermarket_name`),
  CONSTRAINT `groceries_ibfk_1` FOREIGN KEY (`supermarket_name`) REFERENCES `supermarkets` (`supermarket_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `groceries`
--

LOCK TABLES `groceries` WRITE;
/*!40000 ALTER TABLE `groceries` DISABLE KEYS */;
INSERT INTO `groceries` VALUES ('Sainsbury\'s','Crisps',1,'Snacks','£1.25','No offer'),('Morrisons','Crisps',2,'Snacks','£1.15','No offer'),('Aldi','Crisps',3,'Snacks','£0.80','BOGOF'),('Asda','Crisps',4,'Snacks','£1.20','No offer'),('Co-op','Crisps',5,'Snacks','£1.00','15% off'),('Farmfoods','Crisps',6,'Snacks','£1.00','No offer'),('Marks & Spencer','Crisps',7,'Snacks','£1.50','No offer'),('Tesco','Crisps',8,'Snacks','£1.40','No offer'),('Waitrose','Crisps',9,'Snacks','£1.75','BOGOF'),('Sainsbury\'s','Bread',10,'Bakery','£1.00','No offer'),('Morrisons','Bread',11,'Bakery','£0.90','No offer'),('Aldi','Bread',12,'Bakery','£0.75','No offer'),('Asda','Bread',13,'Bakery','£1.10','No offer'),('Co-op','Bread',14,'Bakery','£1.00','10% off'),('Farmfoods','Bread',15,'Bakery','£1.25','No offer'),('Marks & Spencer','Bread',16,'Bakery','£1.50','No offer'),('Tesco','Bread',17,'Bakery','£1.50','No offer'),('Waitrose','Bread',18,'Bakery','£1.35','20% off'),('Sainsbury\'s','Cookies',19,'Bakery','£1.00','No offer'),('Morrisons','Cookies',20,'Bakery','£1.10','No offer'),('Aldi','Cookies',21,'Bakery','£0.75','10% off'),('Asda','Cookies',22,'Bakery','£1.25','No offer'),('Co-op','Cookies',23,'Bakery','£1.15','No offer'),('Farmfoods','Cookies',24,'Bakery','£1.05','No offer'),('Marks & Spencer','Cookies',25,'Bakery','£1.75','No offer'),('Tesco','Cookies',26,'Bakery','£1.50','BOGOF'),('Waitrose','Cookies',27,'Bakery','£1.50','No offer');
/*!40000 ALTER TABLE `groceries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shared_orders`
--

DROP TABLE IF EXISTS `shared_orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shared_orders` (
  `order_id` int DEFAULT NULL,
  `supermarket_name` varchar(100) DEFAULT NULL,
  `items_in_order` varchar(10000) DEFAULT NULL,
  `people_in_order` varchar(100) DEFAULT NULL,
  `price_of_their_item` double DEFAULT NULL,
  `total_delivery_fee` double DEFAULT NULL,
  `order_name` varchar(100) DEFAULT NULL,
  `order_total_cost` double DEFAULT NULL,
  `current` tinyint(1) DEFAULT NULL,
  KEY `supermarket_name` (`supermarket_name`),
  CONSTRAINT `shared_orders_ibfk_1` FOREIGN KEY (`supermarket_name`) REFERENCES `supermarkets` (`supermarket_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shared_orders`
--

LOCK TABLES `shared_orders` WRITE;
/*!40000 ALTER TABLE `shared_orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `shared_orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `supermarkets`
--

DROP TABLE IF EXISTS `supermarkets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `supermarkets` (
  `supermarket_name` varchar(100) NOT NULL,
  `open` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`supermarket_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supermarkets`
--

LOCK TABLES `supermarkets` WRITE;
/*!40000 ALTER TABLE `supermarkets` DISABLE KEYS */;
INSERT INTO `supermarkets` VALUES ('Aldi',1),('Asda',1),('Co-op',0),('Farmfoods',0),('Marks & Spencer',1),('Morrisons',1),('Sainsbury\'s',1),('Tesco',1),('Waitrose',1);
/*!40000 ALTER TABLE `supermarkets` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-12-01 17:31:41
