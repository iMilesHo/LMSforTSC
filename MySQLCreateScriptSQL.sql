-- MySQL dump 10.13  Distrib 8.0.17, for macos10.14 (x86_64)
--
-- Host: localhost    Database: LMSforTSC1
-- ------------------------------------------------------
-- Server version	8.0.17

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
-- Current Database: `LMSforTSC1`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `LMSforTSC1` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `LMSforTSC1`;

--
-- Table structure for table `CollectionList`
--

DROP TABLE IF EXISTS `CollectionList`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CollectionList` (
  `paperId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  PRIMARY KEY (`paperId`,`userId`),
  KEY `userId` (`userId`),
  CONSTRAINT `collectionlist_ibfk_1` FOREIGN KEY (`paperId`) REFERENCES `papers` (`paperId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `collectionlist_ibfk_2` FOREIGN KEY (`userId`) REFERENCES `users` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;


--
-- Table structure for table `Comments`
--

DROP TABLE IF EXISTS `Comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Comments` (
  `commentId` int(11) NOT NULL AUTO_INCREMENT,
  `momentId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `commentswords` varchar(1024) DEFAULT NULL,
  PRIMARY KEY (`commentId`),
  KEY `Comments_userid_fk` (`userId`),
  CONSTRAINT `Comments_moment_fk` FOREIGN KEY (`commentId`) REFERENCES `moments` (`momentId`),
  CONSTRAINT `Comments_userid_fk` FOREIGN KEY (`userId`) REFERENCES `users` (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;



--
-- Table structure for table `Friendslist`
--

DROP TABLE IF EXISTS `Friendslist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Friendslist` (
  `friendId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `momentsSide` int(11) DEFAULT '1',
  PRIMARY KEY (`friendId`,`userId`),
  KEY `userId` (`userId`),
  CONSTRAINT `friendslist_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`userId`),
  CONSTRAINT `friendslist_ibfk_2` FOREIGN KEY (`friendId`) REFERENCES `users` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;


--
-- Table structure for table `LikeList`
--

DROP TABLE IF EXISTS `LikeList`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `LikeList` (
  `momentId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `comment` varchar(100) DEFAULT NULL,
  `havecomment` varchar(10) DEFAULT '0',
  PRIMARY KEY (`momentId`,`userId`),
  UNIQUE KEY `LikeList_pk` (`momentId`,`userId`),
  KEY `LikeList_userid_fk` (`userId`),
  CONSTRAINT `LikeList_moment_fk` FOREIGN KEY (`momentId`) REFERENCES `moments` (`momentId`),
  CONSTRAINT `LikeList_userid_fk` FOREIGN KEY (`userId`) REFERENCES `users` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;


--
-- Table structure for table `Messages`
--

DROP TABLE IF EXISTS `Messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Messages` (
  `messageId` int(11) NOT NULL AUTO_INCREMENT,
  `fromUserId` int(11) NOT NULL,
  `toUserId` int(11) DEFAULT NULL,
  `messageWords` varchar(1024) DEFAULT NULL,
  `pictureUrl` varchar(100) DEFAULT NULL,
  `havaPicture` int(11) DEFAULT '0',
  `momentTime` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`messageId`),
  KEY `Message_fuser_fk` (`toUserId`),
  KEY `Messages_fuser_fk` (`fromUserId`),
  CONSTRAINT `Message_Tuser_fk` FOREIGN KEY (`toUserId`) REFERENCES `users` (`userId`),
  CONSTRAINT `Messages_fuser_fk` FOREIGN KEY (`fromUserId`) REFERENCES `users` (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;


--
-- Table structure for table `Moments`
--

DROP TABLE IF EXISTS `Moments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Moments` (
  `momentId` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `momentTime` datetime DEFAULT CURRENT_TIMESTAMP,
  `momentWord` varchar(1024) NOT NULL,
  `pictureUrl` varchar(1024) DEFAULT NULL,
  `havePicture` int(11) DEFAULT '0',
  `momentAddr` varchar(50) DEFAULT NULL,
  `likeNum` int(11) DEFAULT '0',
  PRIMARY KEY (`momentId`),
  KEY `Moments_user_fk` (`userId`),
  CONSTRAINT `Moments_user_fk` FOREIGN KEY (`userId`) REFERENCES `users` (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;


--
-- Table structure for table `Papers`
--

DROP TABLE IF EXISTS `Papers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Papers` (
  `paperId` int(11) NOT NULL,
  `titel` varchar(255) NOT NULL,
  `authors` varchar(255) DEFAULT NULL,
  `journal` varchar(255) DEFAULT NULL,
  `volume` varchar(20) DEFAULT NULL,
  `pages` varchar(20) DEFAULT NULL,
  `year` varchar(20) DEFAULT NULL,
  `publisher` varchar(100) DEFAULT NULL,
  `keywords` varchar(1024) DEFAULT NULL,
  `abstract` varchar(1024) DEFAULT NULL,
  `data` varchar(20) DEFAULT NULL,
  `model` varchar(20) DEFAULT NULL,
  `task` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`paperId`),
  UNIQUE KEY `Papers_paperId_uindex` (`paperId`),
  UNIQUE KEY `Papers_titel_uindex` (`titel`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;


--
-- Table structure for table `Question_review`
--

DROP TABLE IF EXISTS `Question_review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Question_review` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL DEFAULT 'question',
  `mail` varchar(100) DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL,
  `question` varchar(1024) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;


--
-- Table structure for table `Users`
--

DROP TABLE IF EXISTS `Users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Users` (
  `userId` int(11) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL DEFAULT '123456',
  `birthday` date DEFAULT '1999-01-01',
  `headUrl` varchar(1024) DEFAULT '5.jpg',
  `field` varchar(1024) NOT NULL,
  `degree` varchar(1024) DEFAULT NULL,
  `school` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`userId`),
  UNIQUE KEY `Users_userId_uindex` (`userId`),
  UNIQUE KEY `Users_username_uindex` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-04-30 18:21:11
