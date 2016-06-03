CREATE DATABASE  IF NOT EXISTS `library` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `library`;
-- MySQL dump 10.13  Distrib 5.6.17, for Win64 (x86_64)
--
-- Host: localhost    Database: library
-- ------------------------------------------------------
-- Server version	5.6.21-log

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
-- Table structure for table `activity`
--

DROP TABLE IF EXISTS `activity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `activity` (
  `activityId` int(11) NOT NULL AUTO_INCREMENT,
  `activityName` varchar(45) DEFAULT NULL,
  `activityPlace` varchar(45) DEFAULT NULL,
  `activityDetail` varchar(45) DEFAULT NULL,
  `activityApllicationEnd` varchar(45) DEFAULT NULL COMMENT '活动申请截止时间',
  `activityStartTime` datetime DEFAULT NULL,
  `activityEndTime` datetime DEFAULT NULL,
  `activityJoinerAmount` int(15) DEFAULT NULL COMMENT '活动参与人数',
  PRIMARY KEY (`activityId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='青年志愿者服务活动';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activity`
--

LOCK TABLES `activity` WRITE;
/*!40000 ALTER TABLE `activity` DISABLE KEYS */;
/*!40000 ALTER TABLE `activity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `activitybill`
--

DROP TABLE IF EXISTS `activitybill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `activitybill` (
  `activitybillId` int(11) NOT NULL AUTO_INCREMENT,
  `activityId` int(11) DEFAULT NULL,
  `activitybillName` varchar(45) DEFAULT NULL,
  `activitybillApplier` varchar(45) DEFAULT NULL COMMENT '申请班级',
  `activitybillTime` datetime DEFAULT NULL,
  `activitybillApplicatedState` tinyint(1) DEFAULT '0',
  `activitybillVerifiedState` tinyint(1) DEFAULT '0',
  `activitybillUsedSate` tinyint(1) DEFAULT '0',
  `activitybillState` varchar(45) DEFAULT NULL COMMENT '以上三种状态记录',
  PRIMARY KEY (`activitybillId`),
  KEY `activityApply_idx` (`activityId`),
  CONSTRAINT `activityApply` FOREIGN KEY (`activityId`) REFERENCES `activity` (`activityId`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='青年志愿者服务活动申请订单';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activitybill`
--

LOCK TABLES `activitybill` WRITE;
/*!40000 ALTER TABLE `activitybill` DISABLE KEYS */;
/*!40000 ALTER TABLE `activitybill` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `manager`
--

DROP TABLE IF EXISTS `manager`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `manager` (
  `managerId` int(11) NOT NULL AUTO_INCREMENT,
  `managerName` varchar(45) DEFAULT NULL,
  `managerPassword` varchar(45) DEFAULT NULL,
  `managerRole` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`managerId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `manager`
--

LOCK TABLES `manager` WRITE;
/*!40000 ALTER TABLE `manager` DISABLE KEYS */;
/*!40000 ALTER TABLE `manager` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `place`
--

DROP TABLE IF EXISTS `place`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `place` (
  `placeId` int(11) NOT NULL AUTO_INCREMENT,
  `placeName` varchar(45) DEFAULT NULL,
  `placeSate` tinyint(1) DEFAULT '0' COMMENT '场地是否被使用',
  PRIMARY KEY (`placeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='租用场地';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `place`
--

LOCK TABLES `place` WRITE;
/*!40000 ALTER TABLE `place` DISABLE KEYS */;
/*!40000 ALTER TABLE `place` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `placebill`
--

DROP TABLE IF EXISTS `placebill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `placebill` (
  `placebillId` int(11) NOT NULL AUTO_INCREMENT,
  `placeId` int(11) DEFAULT NULL,
  `placebillTime` datetime DEFAULT NULL COMMENT '订单申请时间',
  `placebillStartTime` datetime DEFAULT NULL,
  `placebillEndTime` varchar(45) DEFAULT NULL,
  `placebillUser` varchar(45) DEFAULT NULL,
  `placebillApplier` varchar(45) DEFAULT NULL,
  `placebillApplication` varchar(256) DEFAULT NULL,
  `placebillApplicatedState` tinyint(1) DEFAULT '0',
  `placebillVerifiedState` tinyint(1) DEFAULT '0',
  `placebillUserState` tinyint(1) DEFAULT '0',
  `placebillState` varchar(45) DEFAULT NULL COMMENT '以上三种状态选取',
  PRIMARY KEY (`placebillId`),
  KEY `placerent_idx` (`placeId`),
  CONSTRAINT `placerent` FOREIGN KEY (`placeId`) REFERENCES `place` (`placeId`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='场地租用单';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `placebill`
--

LOCK TABLES `placebill` WRITE;
/*!40000 ALTER TABLE `placebill` DISABLE KEYS */;
/*!40000 ALTER TABLE `placebill` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `readingroom`
--

DROP TABLE IF EXISTS `readingroom`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `readingroom` (
  `readingroomId` int(11) NOT NULL AUTO_INCREMENT,
  `readingroomFloor` int(10) DEFAULT NULL,
  `readingroomClass` varchar(45) DEFAULT NULL,
  `readingroomName` varchar(45) DEFAULT NULL,
  `readingroomStartTime` datetime DEFAULT NULL,
  `readingroomEndTime` datetime DEFAULT NULL,
  PRIMARY KEY (`readingroomId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='阅览室';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `readingroom`
--

LOCK TABLES `readingroom` WRITE;
/*!40000 ALTER TABLE `readingroom` DISABLE KEYS */;
/*!40000 ALTER TABLE `readingroom` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role` (
  `roleId` int(11) NOT NULL AUTO_INCREMENT,
  `roleName` varchar(45) DEFAULT NULL,
  `roleSelect` tinyint(1) DEFAULT NULL,
  `roleAdd` tinyint(1) DEFAULT NULL,
  `roleDelete` tinyint(1) DEFAULT NULL,
  `roleEdit` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`roleId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seatbooking`
--

DROP TABLE IF EXISTS `seatbooking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `seatbooking` (
  `seatbookingID` int(11) NOT NULL AUTO_INCREMENT,
  `seatbookingUserID` int(11) DEFAULT NULL,
  `seatbookingTime` datetime DEFAULT NULL,
  `seatbookingStartTime` datetime DEFAULT NULL,
  `seatbookingEndTime` datetime DEFAULT NULL,
  `seatbookingUserName` varchar(45) DEFAULT NULL,
  `seatbookingState` tinyint(1) DEFAULT '0',
  `seatbookingLeaveState` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`seatbookingID`),
  KEY `studentId_idx` (`seatbookingUserID`),
  CONSTRAINT `studentId` FOREIGN KEY (`seatbookingUserID`) REFERENCES `student` (`studentId`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='自习室预订单';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seatbooking`
--

LOCK TABLES `seatbooking` WRITE;
/*!40000 ALTER TABLE `seatbooking` DISABLE KEYS */;
/*!40000 ALTER TABLE `seatbooking` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student` (
  `studentId` int(11) NOT NULL AUTO_INCREMENT,
  `studentName` varchar(45) DEFAULT NULL,
  `studentPassword` varchar(45) DEFAULT NULL,
  `studentDept` varchar(20) DEFAULT NULL,
  `studentState` tinyint(1) DEFAULT '0' COMMENT '同学是否进入图书馆',
  PRIMARY KEY (`studentId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='学生';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `studyhall`
--

DROP TABLE IF EXISTS `studyhall`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `studyhall` (
  `studyhallId` int(11) NOT NULL AUTO_INCREMENT,
  `studyhallName` varchar(45) DEFAULT NULL,
  `studyhallFloor` int(11) DEFAULT NULL,
  `studyhallSeatAmount` int(11) DEFAULT NULL,
  `studyhallSeatRest` int(11) DEFAULT NULL,
  `studyhallStartTime` datetime DEFAULT NULL,
  `studyhallEndTime` datetime DEFAULT NULL,
  PRIMARY KEY (`studyhallId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='自习室';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `studyhall`
--

LOCK TABLES `studyhall` WRITE;
/*!40000 ALTER TABLE `studyhall` DISABLE KEYS */;
/*!40000 ALTER TABLE `studyhall` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `studyseat`
--

DROP TABLE IF EXISTS `studyseat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `studyseat` (
  `studyseatId` int(11) NOT NULL AUTO_INCREMENT,
  `studyhallId` int(11) DEFAULT NULL,
  `studyseatBookingSate` tinyint(1) DEFAULT '0',
  `studyseatUsedState` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`studyseatId`),
  KEY `studyhallseat_idx` (`studyhallId`),
  CONSTRAINT `studyhallseat` FOREIGN KEY (`studyhallId`) REFERENCES `studyhall` (`studyhallId`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='自习室座位';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `studyseat`
--

LOCK TABLES `studyseat` WRITE;
/*!40000 ALTER TABLE `studyseat` DISABLE KEYS */;
/*!40000 ALTER TABLE `studyseat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teacher`
--

DROP TABLE IF EXISTS `teacher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `teacher` (
  `teacherId` int(11) NOT NULL AUTO_INCREMENT,
  `teacherName` varchar(45) DEFAULT NULL,
  `teacherPassword` varchar(45) DEFAULT NULL,
  `teacherDept` varchar(45) DEFAULT NULL,
  `teacherState` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`teacherId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='教师';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teacher`
--

LOCK TABLES `teacher` WRITE;
/*!40000 ALTER TABLE `teacher` DISABLE KEYS */;
/*!40000 ALTER TABLE `teacher` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'library'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-10-27 10:38:19
