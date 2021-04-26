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
-- Table structure for table `pull_request_comments`
--

DROP TABLE IF EXISTS `pull_request_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pull_request_comments` (
  `pull_request_id` int NOT NULL,
  `user_id` int NOT NULL,
  `comment_id` mediumtext NOT NULL,
  `position` int DEFAULT NULL,
  `body` varchar(256) DEFAULT NULL,
  `commit_id` int NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  KEY `pull_request_comments_ibfk_1` (`pull_request_id`),
  KEY `pull_request_comments_ibfk_2` (`user_id`),
  KEY `pull_request_comments_ibfk_3` (`commit_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pull_request_comments`
--

LOCK TABLES `pull_request_comments` WRITE;
/*!40000 ALTER TABLE `pull_request_comments` DISABLE KEYS */;
INSERT INTO `pull_request_comments` VALUES (7741057,1456229,'31276196',6,'does it make sense just to pass the class annotation into `JsonParserClassData`?',263741644,'2015-05-28 15:48:35'),(7741057,1456229,'31276448',7,'don\'t overload `SimpleParseUUT`.  this is not basic functionality.',263741644,'2015-05-28 15:51:06'),(7473063,1456229,'31274634',17,'@kangzhang: i\'m not familiar with travis, but shouldn\'t it notify someone if things break?',255104942,'2015-05-28 15:32:35'),(7473063,1196199,'31277817',17,'yeah, I had it on but felt the notification was too aggressive. \r\n\r\ni can re-enable this, will update. ',255104942,'2015-05-28 16:06:32'),(7473063,1456229,'31280705',17,'does the notification only get sent on failures or for all runs?',255104942,'2015-05-28 16:39:15'),(7473063,1196199,'31284562',17,'it\'s listed here: http://docs.travis-ci.com/user/notifications/\r\n\r\nnotifications:\r\n  email:\r\n    recipients:\r\n      - one@example.com\r\n      - other@example.com\r\n    on_success: [always|never|change] # default: change\r\n    on_failure: [always|never|change',255104942,'2015-05-28 17:31:44'),(7917631,1456229,'32066431',33,'ugh, i miss phabricator.',268663040,'2015-06-09 16:28:41'),(7917631,13404,'32067096',9,'IntelliJ did it, I can revert',268663040,'2015-06-09 16:35:19'),(7917631,13404,'32067124',4,'Either IntelliJ or Gradle did this...',268663040,'2015-06-09 16:35:30'),(7917631,1456229,'32064644',4,'any reason for this change?',268663040,'2015-06-09 16:11:16'),(7917631,1456229,'32064667',9,'any reason for this change?',268663040,'2015-06-09 16:11:24'),(7917631,1456229,'32064720',17,'mildly concerned that `generateSerializers` is a very generic name, but probably not a big deal.',268663040,'2015-06-09 16:11:49'),(7917631,1456229,'32066502',4,'?',268663040,'2015-06-09 16:29:22'),(10819957,589838,'46197964',4,'Can you recommend a good place to eat dinner? @mdeguzm ',352923666,'2015-11-30 18:23:44'),(10819987,10628330,'46198253',5,'Did it ever catch on fire?\r\n@mmaslana ',352923825,'2015-11-30 18:25:57'),(10819989,10628550,'46198382',3,'Hey Ryan, commenting here...\r\n@RyanJones0814 ',352923838,'2015-11-30 18:26:56'),(10819994,10628287,'46198328',3,'Can you add more details on what were you testing?',352923867,'2015-11-30 18:26:38'),(10819997,10694314,'46198461',2,'Whats your favorite deep dish?',352923902,'2015-11-30 18:27:25'),(10820004,10628728,'46198458',1,'@spradhan123 - When is your hometown changing? :)',352923936,'2015-11-30 18:27:24'),(10820007,10628767,'46198534',4,'Only saw some stuff, do you have other stuff checked in? @kklaibo ',352923944,'2015-11-30 18:27:53'),(10819994,10694318,'46198558',3,'haha!! github :tada: ',352923867,'2015-11-30 18:28:03'),(10820014,10628761,'46198451',5,'is it close to northwest suburbs? @dzahnen ',352924004,'2015-11-30 18:27:21'),(10820053,10628279,'46199087',1,'How about schools there ?',352924319,'2015-11-30 18:31:53'),(10349309,1456229,'46205282',4,'NL pls.',343451767,'2015-11-30 19:20:03'),(10819994,10694318,'46199327',2,'line 2',352923867,'2015-11-30 18:33:49'),(17030254,4898196,'79325166',25,'Other possible extensions:\r\n* New tag name same as original \r\n* New tag name already exists\r\n',511996943,'2016-09-19 00:38:55'),(17030254,4898196,'79325164',25,'Other possible extensions:\r\n* New tag name same as original \r\n* New tag name already exists\r\n',511996943,'2016-09-19 00:38:55'),(17030254,4898196,'79325163',43,'Try to make the NFRs more precise and verifiable. ',511996943,'2016-09-19 00:38:55'),(17030254,4898196,'79325165',43,'Try to make the NFRs more precise and verifiable. ',511996943,'2016-09-19 00:38:55'),(17028538,4898196,'79325210',6,'- A more precise phrasing is `Returns true if …` (instead of `Checks if …`)\r\n\r\n- If written as recommended @return … line can be omitted for this method as it says the same thing as the first sentence. \r\n\r\n',511963604,'2016-09-19 00:40:22'),(17028538,4898196,'79325386',22,'updateIfMutate method is a bit odd (parameters don’t match the method)\r\nParameters should be data to be saved; passing Command is a bad example',511963604,'2016-09-19 00:44:52'),(17028538,4898196,'79325450',13,'- For the execute() method:\r\nThe behavior of the code has been changed. Ensure the header comment and the tests have been updated.\r\n\r\n- Did you run LogicTest.java after the changes?\r\n',511963604,'2016-09-19 00:46:22'),(17447939,4898196,'81682413',11,'It is better to give the method header comments in the parent class rather than the child class. The child class can inherit the comment from the parent.\r\n',521212255,'2016-10-04 00:39:04'),(17447939,4898196,'81682605',1,'It’s better to add the `StorageStub` class in the `test\\java\\seedu\\addressbook\\storage` folder because it is used for testing only.\r\n',521212255,'2016-10-04 00:41:16'),(17447939,4898196,'81682650',14,'If you don\'t expect this method to be called, you can throw a `java.lang.UnsupportedOperationException` inside it. E.g. `throw new UnsupportedOperationException(“Method not implemented”);`\r\n',521212255,'2016-10-04 00:41:42'),(34024460,1456229,'163760903',109,'style nit: space between `)` and `{`',897931101,'2018-01-25 04:43:28'),(34024460,1456229,'163760631',53,'This should probably be removed.',897931101,'2018-01-25 04:40:44'),(34024460,1456229,'163760944',140,'style nit: `}` on following line.',897931101,'2018-01-25 04:43:53'),(34128821,1196199,'164476790',17,'there is an option generateSerializer in JsonType to turn on and off the serializer. we should probably respect it here. ',899861654,'2018-01-29 14:04:18'),(34128821,1196199,'164480963',32,'nit: not your fault, we probably didn\'t annotate this library properly. wondering if you could add @nullable on this method. ',899861654,'2018-01-29 14:17:09'),(34128821,1196199,'164480289',34,'could you help to add some comments here about when/why getParsableTypeParserClass will be null?',899861654,'2018-01-29 14:15:07'),(34128821,319880,'164502330',17,'Just to be clear: the current implementation works by inlining `serializeCodeFormatter` at generated call sites, the same as `valueExtractFormatter`. So to respect `generateSerializer` would mean adding some code to generate a serialization method here th',899861654,'2018-01-29 15:25:16'),(34128821,319880,'164503354',34,'Yes. Would a comment on `getParsableTypeParserClass()` be preferable?',899861654,'2018-01-29 15:28:45'),(34128821,1196199,'164545369',17,'ah.. good call. \r\n\r\nNot generating the serializer is probably a minor issue, I\'m wondering how would we support read-only interface. It\'s going to be strange to ask them for serializeCodeFormatter(if they never expect the interface to be serialized). \r\n\r\n',899861654,'2018-01-29 17:53:54'),(34128821,1196199,'164545403',34,'(Y)',899861654,'2018-01-29 17:54:03'),(34128821,319880,'164561595',17,'That idea sounds perfect. I\'ll make the change,',899861654,'2018-01-29 18:57:51'),(34128821,319880,'164587076',17,'I just realized that we can do the same thing for `valueExtractFormatter`. I don\'t see a reason why not.',899861654,'2018-01-29 20:36:02'),(34128821,1196199,'164886659',17,'(Y)',902387759,'2018-01-30 19:39:23');
/*!40000 ALTER TABLE `pull_request_comments` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-04-26 17:00:30
