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
-- Table structure for table `commit_comments`
--

DROP TABLE IF EXISTS `commit_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `commit_comments` (
  `id` int NOT NULL,
  `commit_id` int NOT NULL,
  `user_id` int NOT NULL,
  `body` varchar(256) DEFAULT NULL,
  `line` int DEFAULT NULL,
  `position` int DEFAULT NULL,
  `comment_id` int NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `commit_comments_ibfk_1` (`commit_id`),
  KEY `commit_comments_ibfk_2` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `commit_comments`
--

LOCK TABLES `commit_comments` WRITE;
/*!40000 ALTER TABLE `commit_comments` DISABLE KEYS */;
INSERT INTO `commit_comments` VALUES (431368,25849459,211534,'Jens Hi,\r\n\r\nI\'m on suse so a quick edit of the sudoers file to add NOPASSWD allows the\r\nsudo to run without prompting for password.\r\n\r\nI\'ve had it working (each cleartool command is prepended with sudo)\r\ntoday on my local dev stream will try with a remote ',NULL,NULL,2455284,'2013-01-17 17:16:54'),(562342,64361123,2505894,'thanks!',NULL,NULL,4304198,'2013-10-10 18:21:16'),(688349,74056225,682159,'Instead of seperator char \'¤\', I think it is better - more readable if just escaping properly on nix so I suggest the fmt parm to be \r\n\' %Xn\\\\t%Nd\\\\n\' on Windows and \' %Xn\\\\\\\\t%Nd\\\\\\\\n\' on linux\r\n\r\nBe aware the github apperantly also escapes for me, so we ',224,402,4806537,'2013-12-09 04:48:26'),(906701,94153309,359030,'This is a great fix. I\'m gonna release this. Very low risk, great rewards.',NULL,NULL,5583157,'2014-03-06 05:00:36'),(1625771,154918323,2015868,'这个多行注释和下面的一样，没用的话就删了吧',16,16,7509996,'2014-08-25 07:35:43'),(1625772,154918323,2015868,'CONTACT_PORT常量记得定义到constant里面',34,34,7510013,'2014-08-25 07:36:42'),(1625773,154918323,2015868,'AppName最好指定一个有意义的应用名，并统一定义到constant里面',81,81,7510028,'2014-08-25 07:38:08'),(1625774,154918323,2015868,'没用的空行就删掉吧',49,49,7510043,'2014-08-25 07:39:20'),(1625775,154918323,2015868,'CONTACT_PORT常量定义到constant里面',41,41,7510058,'2014-08-25 07:40:36'),(1625776,154918323,2015868,'删掉没用的空行',76,76,7510061,'2014-08-25 07:40:54'),(1625777,154918323,2015868,'删掉没用的注释',52,52,7510094,'2014-08-25 07:43:58'),(1921752,181834371,19587,'This doesn\'t always work as you expect.  Say you have a schema foo.tg and create two new standard impl graphs, then the schema of both is indeed identical as you expect.  However, if you do the same with the generic impl, each graph has its own separate sc',138,25,8449679,'2014-11-05 16:57:37'),(2239628,218222890,1456229,'This is what I needed to do to get it to work:\r\n```\r\ndiff --git a/build.gradle b/build.gradle\r\nindex a1a414e..c0ee7b7 100644\r\n--- a/build.gradle\r\n+++ b/build.gradle\r\n@@ -42,6 +42,7 @@ task processorSourcesJar(type: Jar) {\r\n \r\n task runtimeJavadoc(type: Jav',NULL,NULL,9794528,'2015-02-18 04:48:46'),(2242145,218222890,2880732,'That _should_ be identical to this patch. The only difference is you\'re using a Closure and returning the classpath value. You could also remove the brackets in my patch and it should also be the same.\r\n\r\nI\'ll give that a shot when I have a moment.',NULL,NULL,9807603,'2015-02-18 17:09:15'),(2416139,239583670,7638954,'Nie wiedziałem gdzie to napisać więc pisze tutaj. Chciałem zwrócić uwagę na chaos w architekturze projektu. Powinien być wyraźny rozdział między modelem (baza danych, encje), widokiem (session / managed / named beany, klasy związane z widokiem - nie zawier',NULL,NULL,10572683,'2015-04-04 07:16:53'),(2416194,239583670,1818281,'Witam, \r\ntego typu dyskusje, komentarze proszę jako issues. \r\n\r\nAktualny podział / architektura to: \r\nuser.xhtml -> UserHandler -> UserController -> UserBean -> OpwUser \r\nczyli \r\nmaska UI -> handler głownie dla EL -> prawdziwa logika -> wszelkie dodatki do',NULL,NULL,10572755,'2015-04-04 07:37:44'),(2416209,239583670,1818281,'Jeżeli masz czas i ochotę to możemy omówić architekturę na Skype. Znajdziesz mnie pod nickiem psw-gurupl jako Herr Adam ',NULL,NULL,10572786,'2015-04-04 07:49:56'),(2421812,241305557,7638954,'Jakiś logger by się przydał.',53,16,10589470,'2015-04-06 14:36:38'),(2421987,241305557,1818281,'Zdecydowanie :) \r\nhttps://trello.com/c/9LQ9Atld/11-opw-t-2-sfl4j-jako-logger',NULL,NULL,10590371,'2015-04-06 15:29:47'),(2424902,241572564,7638954,'Słaba nazwa dla metody. Nawet jeśli to getter.',69,18,10605897,'2015-04-07 11:12:53'),(2429191,241572564,7638954,'Stała powinna być publiczna.',69,18,10628080,'2015-04-08 11:33:24'),(2430832,242244036,1818281,'I accept but: \r\n1. keep in mind that package `.entity`  is generated, next time I regenerate entity classes your custom constructors within `OpwOkregowaKomisja.java` and `OpwKandydat.java` will be gone\r\n2. REST services are currently in mock state. It is b',NULL,NULL,10634905,'2015-04-08 17:30:04'),(2430890,241572564,1818281,'Stała jest zdefiniowana w `OpwConfig.java` a w kontrolerze jest tylko atrybut. ',64,18,10635270,'2015-04-08 17:56:39'),(2433492,242340388,7638954,'Soooo... fixed! xD',19,31,10650232,'2015-04-09 11:42:27'),(2433590,242340388,1818281,'Hahaha soooo true',NULL,NULL,10650703,'2015-04-09 12:09:42'),(2437007,242846695,7638954,'Nadal mi sie to nie podoba. :P\r\nObczaj: http://en.wikibooks.org/wiki/Java_Persistence/JPQL#Aggregation_functions \r\n`SELECT COUNT(o) FROM OpwObwodowaKomisja o WHERE o.pkwId = :pkwId`',67,25,10670252,'2015-04-10 12:12:11'),(2437601,243235509,7638954,'SELECT o FROM OpwKandydat o WHERE o.firstname = :firstname AND o.lastname = :lastname',50,4,10673410,'2015-04-10 15:22:29'),(2437604,243235509,7638954,'Czepianie się ale: http://stackoverflow.com/questions/925423/is-it-better-practice-to-use-string-format-over-string-concatenation-in-java',69,26,10673438,'2015-04-10 15:24:02'),(2437611,243235509,7638954,'Co jeżeli kandydat ma więcej niż jedno imie?',63,24,10673461,'2015-04-10 15:25:49'),(2437622,243235509,7638954,'To powinno wylądować w encji :P \r\nhttp://stackoverflow.com/questions/21477034/what-does-transient-annotation-mean-for-methods',60,13,10673558,'2015-04-10 15:31:56'),(2437626,243235509,6297731,'\n  \n    \n  \n  \n    W dniu 2015-04-10 o 22:25, pwl89 pisze:\n    \n    \n      Co jeżeli kandydat ma więcej niż jedno imie?\n      —\n        Reply to this email directly or view\n          it on GitHub.\n      \n        \n          \n          \n        \n        \n   ',63,24,10673572,'2015-04-10 15:32:32'),(2437713,243281176,7638954,'A może by tak burze rozpętywać tutaj: https://github.com/adamkowalewski/OtwartaPlatformaWyborcza/issues ;)',2,1,10674045,'2015-04-10 16:01:37'),(2437937,243235509,1818281,'Aktualnie jest to tylko mock. ',69,26,10674873,'2015-04-10 17:06:51'),(2439040,243474913,7638954,'Jest do tego szablon pliku CSV?',35,35,10677644,'2015-04-11 06:38:39'),(2441929,243474913,7638954,'Taką kompletną listę z pliku CSV pobieramy? Nie ma tam samych ID komicji?',39,39,10683681,'2015-04-12 13:49:26'),(2442050,243474913,1818281,'Masz 2 przykłady w szablonie CSV. ',39,39,10683960,'2015-04-12 14:55:58'),(2442058,243474913,7638954,'`;komisje obwodowe [lista PKW ID kody oddzielone , ]`\r\n`146513-578,146513-579,146513-580`\r\n\r\nTak jak mówię. Jest lista kodów (String), nie kompletnych komisji obowodowych (OpwObwodowaKomisja)',39,39,10683973,'2015-04-12 14:59:47'),(2442063,243474913,1818281,'Tak, jest to lista pkwId, czyli kodów TERYT gminy z licznikiem obwodu. ',39,39,10683979,'2015-04-12 15:02:52'),(2849753,283571939,1456229,'I like where this is going.\r\n\r\nOne thought that occurred to me is that it might be interesting to make the generated methods instance methods.  Then your JsonHelper interface could require that the parser classes have the generated methods, and you could d',NULL,NULL,12432144,'2015-07-29 17:04:58'),(2866422,292618959,1428213,'Ok, splitting',NULL,NULL,12509694,'2015-08-04 02:39:59'),(2866428,292618959,1456229,'1) One diff per improvement/fix.\r\n2) Unit tests?',NULL,NULL,12509636,'2015-08-04 02:33:38'),(3104843,293254584,10206191,'this should be public static class ...',13,13,13963332,'2015-10-23 16:51:36'),(3176369,344903423,6983491,'There doesn\'t seems to be your changes to the test spec in this it\'s just all random stuff',NULL,NULL,14340809,'2015-11-11 19:09:34'),(3178342,344903423,9527009,'I was under the impression from the review meeting we were to use the large document, and highlight any changes, all the yellow highlighted stuff is what I changed, a long with a few comments\n\nwhich say where i deleted tests\n\n\n- Michael\n\n\n_________________',NULL,NULL,14352171,'2015-11-12 07:51:48'),(3254992,352916581,10628733,'leaving test commend @kjackow ',2,2,14692393,'2015-11-30 18:27:20'),(3254997,352916753,10628734,'Wind blows especially winter time',NULL,NULL,14692460,'2015-11-30 18:29:38'),(3255001,352916830,10628753,'This is pretty cool',5,5,14692507,'2015-11-30 18:31:22'),(3255348,352916753,10628734,'@ihollik Wind blows especially winter time',NULL,NULL,14692483,'2015-11-30 18:30:32'),(4838997,733425539,35326185,'#38 issue',NULL,NULL,23004431,'2017-07-10 03:41:33');
/*!40000 ALTER TABLE `commit_comments` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-04-26 17:00:32
