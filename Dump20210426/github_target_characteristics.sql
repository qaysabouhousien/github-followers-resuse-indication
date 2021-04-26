-- MySQL dump 10.13  Distrib 8.0.23, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: github
-- ------------------------------------------------------
-- Server version	8.0.23

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
-- Table structure for table `target_characteristics`
--

DROP TABLE IF EXISTS `target_characteristics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `target_characteristics` (
  `project_id` int NOT NULL,
  `age` int DEFAULT NULL,
  `forked_form_direct` int DEFAULT NULL,
  `forked_form_indirect` int DEFAULT NULL,
  `topics` int DEFAULT NULL,
  `watchers` int DEFAULT NULL,
  `commits` int DEFAULT NULL,
  `commit_comments` int DEFAULT NULL,
  `pull_requests_as_head` int DEFAULT NULL,
  `pull_requests_as_base` int DEFAULT NULL,
  `pull_request_comments_as_head` int DEFAULT NULL,
  `pull_request_comments_as_base` int DEFAULT NULL,
  `pull_request_closed` int DEFAULT NULL,
  `pull_request_merged` int DEFAULT NULL,
  `pull_request_synchronize` int DEFAULT NULL,
  `pull_request_closure_time_min` float DEFAULT NULL,
  `pull_request_closure_time_max` float DEFAULT NULL,
  `pull_request_closure_time_avg` float DEFAULT NULL,
  `issues` int DEFAULT NULL,
  `issue_comments` int DEFAULT NULL,
  `issue_closed` int DEFAULT NULL,
  `issue_subscribed` int DEFAULT NULL,
  `issue_unsubscribed` int DEFAULT NULL,
  `issue_mentioned` int DEFAULT NULL,
  `issue_milestoned` int DEFAULT NULL,
  `issue_demilestoned` int DEFAULT NULL,
  `issue_merged` int DEFAULT NULL,
  `issue_referenced` int DEFAULT NULL,
  `issue_closure_time_min` float DEFAULT NULL,
  `issue_closure_time_max` float DEFAULT NULL,
  `issue_closure_time_avg` float DEFAULT NULL,
  PRIMARY KEY (`project_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `target_characteristics`
--

LOCK TABLES `target_characteristics` WRITE;
/*!40000 ALTER TABLE `target_characteristics` DISABLE KEYS */;
/*!40000 ALTER TABLE `target_characteristics` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-04-26 17:00:31
