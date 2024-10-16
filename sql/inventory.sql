CREATE DATABASE  IF NOT EXISTS `inventory` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */;
USE `inventory`;
-- MySQL dump 10.13  Distrib 8.0.11, for Win64 (x86_64)
--
-- Host: localhost    Database: inventory
-- ------------------------------------------------------
-- Server version	8.0.11

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `accounts`
--

DROP TABLE IF EXISTS `accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `accounts` (
  `acccountID` int(11) NOT NULL,
  `accountName` varchar(45) NOT NULL,
  `accountDetails` varchar(100) DEFAULT NULL,
  `Customers_customerID` int(11) NOT NULL,
  `User_username` varchar(45) DEFAULT NULL,
  `payMethod` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`acccountID`),
  UNIQUE KEY `accountName_UNIQUE` (`accountName`),
  KEY `fk_Accounts_Customers1_idx` (`Customers_customerID`),
  KEY `fk_Accounts_User2_idx` (`User_username`),
  CONSTRAINT `fk_Accounts_Customers1` FOREIGN KEY (`Customers_customerID`) REFERENCES `customers` (`customerid`),
  CONSTRAINT `fk_Accounts_User2` FOREIGN KEY (`User_username`) REFERENCES `user` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts`
--

LOCK TABLES `accounts` WRITE;
/*!40000 ALTER TABLE `accounts` DISABLE KEYS */;
INSERT INTO `accounts` VALUES (1,'Account 1','NONE',1,'admin','Cash'),(2,'Account 2','NONE',1,'admin','Cheque'),(3,'Account 3','NONE',2,'admin','ATM'),(4,'Account 4','NONE',3,'admin','Credit'),(5,'Account 5','NONE',4,'admin','Cash'),(6,'Account 6','NONE',5,'admin','Cash'),(7,'Account 7','NONE',6,'admin','Cheque'),(8,'Account 8','NONE',7,'admin','ATM'),(9,'Account Change','None',8,'admin','Cash'),(10,'Account 10','NONE',9,'admin','Cash'),(11,'New Account','NONE',1,'admin','ATM');
/*!40000 ALTER TABLE `accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `customers` (
  `customerID` int(11) NOT NULL,
  `firstName` varchar(45) NOT NULL,
  `lastName` varchar(45) NOT NULL,
  `address` varchar(100) NOT NULL,
  `phone` varchar(11) NOT NULL,
  `email` varchar(45) DEFAULT NULL,
  `photo` varchar(100) DEFAULT NULL,
  `gender` enum('Male','Female') NOT NULL,
  `memberSince` date DEFAULT NULL,
  PRIMARY KEY (`customerID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES (1,'Dr. Professor','Karim','ali','0188999999','dr.karim@gmail.com','file:/D:/Project_Final/IntellijIDEA/Images/customers/man3.jpg','Male','2024-08-11');
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `financialtronpurchase`
--

DROP TABLE IF EXISTS `financialtronpurchase`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `financialtronpurchase` (
  `trID` int(11) NOT NULL,
  `trDate` date DEFAULT NULL,
  `Accounts_acccountID` int(11) NOT NULL,
  `TrTypeCode_trTypeCode` int(11) NOT NULL,
  `Purchases_purchaseID` int(11) NOT NULL,
  `User_username` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`trID`),
  KEY `fk_financialTrOnPurchase_Accounts1_idx` (`Accounts_acccountID`),
  KEY `fk_financialTrOnPurchase_TrTypeCode1_idx` (`TrTypeCode_trTypeCode`),
  KEY `fk_financialTrOnPurchase_Purchases1_idx` (`Purchases_purchaseID`),
  KEY `fk_User_idx` (`User_username`),
  CONSTRAINT `fk_User` FOREIGN KEY (`User_username`) REFERENCES `user` (`username`),
  CONSTRAINT `fk_financialTrOnPurchase_Purchases1` FOREIGN KEY (`Purchases_purchaseID`) REFERENCES `purchases` (`purchaseid`),
  CONSTRAINT `fk_financialTrOnPurchase_TrTypeCode1` FOREIGN KEY (`TrTypeCode_trTypeCode`) REFERENCES `trtypecode` (`trtypecode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `financialtronpurchase`
--

LOCK TABLES `financialtronpurchase` WRITE;
/*!40000 ALTER TABLE `financialtronpurchase` DISABLE KEYS */;
INSERT INTO `financialtronpurchase` VALUES (1,'2024-07-05',1,1,1,'admin');
/*!40000 ALTER TABLE `financialtronpurchase` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `financialtronrental`
--

DROP TABLE IF EXISTS `financialtronrental`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `financialtronrental` (
  `trID` int(11) NOT NULL,
  `trDate` date NOT NULL,
  `Accounts_acccountID` int(11) NOT NULL,
  `Rentals_rentalID` int(11) DEFAULT NULL,
  `TrTypeCode_trTypeCode` int(11) NOT NULL,
  `User_username` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`trID`),
  KEY `fk_FinancialTrOnRental_Accounts1_idx` (`Accounts_acccountID`),
  KEY `fk_FinancialTrOnRental_TrTypeCode1_idx` (`TrTypeCode_trTypeCode`),
  KEY `fk_Username_idx` (`User_username`),
  KEY `fk_Rental_idx` (`Rentals_rentalID`),
  CONSTRAINT `fk_FinancialTrOnRental_TrTypeCode1` FOREIGN KEY (`TrTypeCode_trTypeCode`) REFERENCES `trtypecode` (`trtypecode`),
  CONSTRAINT `fk_Rental` FOREIGN KEY (`Rentals_rentalID`) REFERENCES `rentals` (`rentalid`),
  CONSTRAINT `fk_Username` FOREIGN KEY (`User_username`) REFERENCES `user` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `financialtronrental`
--

LOCK TABLES `financialtronrental` WRITE;
/*!40000 ALTER TABLE `financialtronrental` DISABLE KEYS */;
INSERT INTO `financialtronrental` VALUES (1,'2024-07-07',1,1,1,'admin'),(2,'2024-07-07',2,2,2,'admin');
UNLOCK TABLES;

--
-- Table structure for table `item`
--

DROP TABLE IF EXISTS `item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `item` (
  `itemID` int(11) NOT NULL,
  `itemName` varchar(45) NOT NULL,
  `stock` int(11) NOT NULL,
  `rentalOrSale` set('Rental','Sale') NOT NULL,
  `salePrice` double DEFAULT NULL,
  `rentRate` double DEFAULT NULL,
  `photo` varchar(160) DEFAULT NULL,
  `ItemType_itemTypeId` int(11) NOT NULL,
  PRIMARY KEY (`itemID`),
  KEY `fk_Item_ItemType1_idx` (`ItemType_itemTypeId`),
  CONSTRAINT `fk_Item_ItemType1` FOREIGN KEY (`ItemType_itemTypeId`) REFERENCES `itemtype` (`itemtypeid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item`
--

LOCK TABLES `item` WRITE;
/*!40000 ALTER TABLE `item` DISABLE KEYS */;
INSERT INTO `item` VALUES (1,'Mobile',47,'Sale',2000,0,'file:/D:/Project_Final/IntellijIDEA/Images/items/mobile.jpg',1);
UNLOCK TABLES;

--
-- Table structure for table `itemtype`
--

DROP TABLE IF EXISTS `itemtype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `itemtype` (
  `itemTypeId` int(11) NOT NULL,
  `typeName` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`itemTypeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `itemtype`
--

LOCK TABLES `itemtype` WRITE;
/*!40000 ALTER TABLE `itemtype` DISABLE KEYS */;
INSERT INTO `itemtype` VALUES (1,'Electronics'),(2,'Home Appliances');
UNLOCK TABLES;

--
-- Table structure for table `purchases`
--

DROP TABLE IF EXISTS `purchases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `purchases` (
  `purchaseID` int(11) NOT NULL,
  `purchaseDate` varchar(45) NOT NULL,
  `purchaseQuantity` int(11) NOT NULL,
  `amountDue` double DEFAULT NULL,
  `User_username` varchar(45) NOT NULL,
  `Item_itemID` int(11) NOT NULL,
  `Customers_customerID` int(11) NOT NULL,
  `payAmount` double DEFAULT NULL,
  PRIMARY KEY (`purchaseID`),
  KEY `fk_Purchases_User1_idx` (`User_username`),
  KEY `fk_Purchases_Item1_idx` (`Item_itemID`),
  KEY `fk_Purchases_Customers1_idx` (`Customers_customerID`),
  CONSTRAINT `fk_Purchases_User1` FOREIGN KEY (`User_username`) REFERENCES `user` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `purchases`
--

LOCK TABLES `purchases` WRITE;
/*!40000 ALTER TABLE `purchases` DISABLE KEYS */;
INSERT INTO `purchases` VALUES (1,'2024-7-5',2,0,'admin',1,1,1000);
UNLOCK TABLES;

--
-- Table structure for table `rentals`
--

DROP TABLE IF EXISTS `rentals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `rentals` (
  `rentalID` int(11) NOT NULL,
  `rentalDate` date NOT NULL,
  `returnDate` date DEFAULT NULL,
  `paid` double DEFAULT NULL,
  `amountDue` double DEFAULT NULL,
  `User_username` varchar(45) NOT NULL,
  `Item_itemID` int(11) NOT NULL,
  `Customers_customerID` int(11) NOT NULL,
  PRIMARY KEY (`rentalID`),
  KEY `fk_Rentals_User_idx` (`User_username`),
  KEY `fk_Rentals_Item1_idx` (`Item_itemID`),
  KEY `fk_Rentals_Customers1_idx` (`Customers_customerID`),
  CONSTRAINT `fk_Rentals_User` FOREIGN KEY (`User_username`) REFERENCES `user` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rentals`
--

LOCK TABLES `rentals` WRITE;
/*!40000 ALTER TABLE `rentals` DISABLE KEYS */;
INSERT INTO `rentals` VALUES (1,'2024-07-03','2024-07-12',1000,0,'admin',3,1);
UNLOCK TABLES;

--
-- Table structure for table `trtypecode`
--

DROP TABLE IF EXISTS `trtypecode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `trtypecode` (
  `trTypeCode` int(11) NOT NULL,
  `typeDescription` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`trTypeCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trtypecode`
--

LOCK TABLES `trtypecode` WRITE;
/*!40000 ALTER TABLE `trtypecode` DISABLE KEYS */;
INSERT INTO `trtypecode` VALUES (1,'Cash'),(2,'ATM'),(3,'Credit'),(4,'Others');
/*!40000 ALTER TABLE `trtypecode` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `user` (
  `username` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `accessLevel` enum('Admin','Employee') NOT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('admin','admin','admin@email.com','Admin'),('employee','employee','employee@email.com','Employee'),('test','test','text@xmail.com','Employee');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usercredents`
--

DROP TABLE IF EXISTS `usercredents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `usercredents` (
  `username` varchar(40) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usercredents`
--

LOCK TABLES `usercredents` WRITE;
/*!40000 ALTER TABLE `usercredents` DISABLE KEYS */;
INSERT INTO `usercredents` VALUES ('admin','admin');
/*!40000 ALTER TABLE `usercredents` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-07-10 23:53:22
