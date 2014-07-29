-- MySQL dump 10.13  Distrib 5.1.73, for Win32 (ia32)
--
-- Host: localhost    Database: gpc
-- ------------------------------------------------------
-- Server version	5.5.23

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
-- Table structure for table `activities`
--

DROP TABLE IF EXISTS `activities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `activities` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `trackable_id` int(11) DEFAULT NULL,
  `trackable_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `owner_id` int(11) DEFAULT NULL,
  `owner_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `key` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `parameters` text COLLATE utf8_unicode_ci,
  `recipient_id` int(11) DEFAULT NULL,
  `recipient_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_activities_on_trackable_id_and_trackable_type` (`trackable_id`,`trackable_type`),
  KEY `index_activities_on_owner_id_and_owner_type` (`owner_id`,`owner_type`),
  KEY `index_activities_on_recipient_id_and_recipient_type` (`recipient_id`,`recipient_type`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activities`
--

LOCK TABLES `activities` WRITE;
/*!40000 ALTER TABLE `activities` DISABLE KEYS */;
INSERT INTO `activities` VALUES (1,1,'Announcement',1,'User','announcement.create','--- {}\n',NULL,NULL,'2014-05-17 19:34:25','2014-05-17 19:34:25'),(2,1,'Document',1,'User','document.create','--- {}\n',NULL,NULL,'2014-05-19 07:29:34','2014-05-19 07:29:34'),(3,2,'Document',1,'User','document.create','--- {}\n',NULL,NULL,'2014-06-08 06:01:36','2014-06-08 06:01:36'),(4,2,'Announcement',1,'User','announcement.create','--- {}\n',NULL,NULL,'2014-06-08 06:11:57','2014-06-08 06:11:57');
/*!40000 ALTER TABLE `activities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `announcements`
--

DROP TABLE IF EXISTS `announcements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `announcements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `message` text COLLATE utf8_unicode_ci,
  `user_id` int(11) DEFAULT NULL,
  `batch_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_announcements_on_user_id` (`user_id`),
  KEY `index_announcements_on_batch_id` (`batch_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `announcements`
--

LOCK TABLES `announcements` WRITE;
/*!40000 ALTER TABLE `announcements` DISABLE KEYS */;
INSERT INTO `announcements` VALUES (1,'Some new announcement',1,1,'2014-05-17 19:34:25','2014-05-17 19:34:25'),(2,'Please find the fest brochure',1,1,'2014-06-08 06:11:57','2014-06-08 06:11:57');
/*!40000 ALTER TABLE `announcements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assets`
--

DROP TABLE IF EXISTS `assets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `assetable_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `afile_file_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `afile_content_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `afile_file_size` int(11) DEFAULT NULL,
  `afile_updated_at` datetime DEFAULT NULL,
  `assetable_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_assets_on_assetable_id` (`assetable_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assets`
--

LOCK TABLES `assets` WRITE;
/*!40000 ALTER TABLE `assets` DISABLE KEYS */;
INSERT INTO `assets` VALUES (1,1,'2014-05-19 07:29:34','2014-05-19 07:29:34','12b92cc07575c4b56be47508b3c7d5cd.gif','image/gif',4276,'2014-05-19 07:29:33','Document'),(2,2,'2014-06-08 06:01:36','2014-06-08 06:01:36','AdServer-Product-Backlog.xlsx','application/vnd.openxmlformats-officedocument.spreadsheetml.sheet',28853,'2014-06-08 06:01:29','Document'),(3,2,'2014-06-08 06:11:57','2014-06-08 06:11:57','3.JPG','image/jpeg',36608,'2014-06-08 06:11:51','Announcement');
/*!40000 ALTER TABLE `assets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `batches`
--

DROP TABLE IF EXISTS `batches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `batches` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `date_start` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `date_end` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `department_id` int(11) DEFAULT NULL,
  `active` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_batches_on_department_id` (`department_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `batches`
--

LOCK TABLES `batches` WRITE;
/*!40000 ALTER TABLE `batches` DISABLE KEYS */;
INSERT INTO `batches` VALUES (1,'2010-2013','10-08-2010','10-07-2014',1,1,'2014-05-15 12:16:30','2014-05-15 12:16:30');
/*!40000 ALTER TABLE `batches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chat_tokens`
--

DROP TABLE IF EXISTS `chat_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chat_tokens` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `owner_id` int(11) DEFAULT NULL,
  `recipient_id` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chat_tokens`
--

LOCK TABLES `chat_tokens` WRITE;
/*!40000 ALTER TABLE `chat_tokens` DISABLE KEYS */;
INSERT INTO `chat_tokens` VALUES (1,'d44c486018f34b403aa62a99f5ee90c2',1,2,NULL,'2014-05-15 13:49:57','2014-05-15 13:49:57'),(2,'409a4c5955743ee1565d186f71647382',2,1,NULL,'2014-05-16 07:08:33','2014-05-16 07:08:33');
/*!40000 ALTER TABLE `chat_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chats`
--

DROP TABLE IF EXISTS `chats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chats` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` text COLLATE utf8_unicode_ci,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `token_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=153 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chats`
--

LOCK TABLES `chats` WRITE;
/*!40000 ALTER TABLE `chats` DISABLE KEYS */;
INSERT INTO `chats` VALUES (1,'sdfsdfsdfsdfsdsdfsdf','2014-05-15 13:49:57','2014-05-15 13:49:57','1'),(2,'sdfdsf','2014-05-15 13:51:01','2014-05-15 13:51:01','1'),(3,'wsfdsf','2014-05-15 13:52:20','2014-05-15 13:52:20','1'),(4,'sdfsdf','2014-05-15 13:52:50','2014-05-15 13:52:50','1'),(5,'sdfgsgf','2014-05-15 13:53:19','2014-05-15 13:53:19','1'),(6,'sdfdsfdsf','2014-05-15 13:54:47','2014-05-15 13:54:47','1'),(7,'sdfsdf','2014-05-15 13:57:39','2014-05-15 13:57:39','1'),(8,'Hello Ramjee','2014-05-16 06:53:30','2014-05-16 06:53:30','1'),(9,'hiiii :)','2014-05-16 07:08:33','2014-05-16 07:08:33','2'),(10,'hi','2014-05-16 07:09:02','2014-05-16 07:09:02','1'),(11,'hey','2014-05-16 07:09:38','2014-05-16 07:09:38','1'),(12,':)','2014-05-16 07:09:50','2014-05-16 07:09:50','2'),(13,'hey','2014-05-16 07:49:28','2014-05-16 07:49:28','1'),(14,'Hi man','2014-05-16 07:49:44','2014-05-16 07:49:44','2'),(15,'Hello','2014-05-16 07:53:50','2014-05-16 07:53:50','2'),(16,'Hi ramjee :)','2014-05-16 07:54:04','2014-05-16 07:54:04','1'),(17,'hello','2014-05-16 08:00:36','2014-05-16 08:00:36','1'),(18,'hi','2014-05-16 08:01:27','2014-05-16 08:01:27','2'),(19,'sdf<br><br>','2014-05-16 08:01:43','2014-05-16 08:01:43','2'),(20,'sdfdsfs<br>sdf<br>s<br><br><br><br><br>','2014-05-16 08:01:48','2014-05-16 08:01:48','2'),(21,'shih<br><br><br><br><br>','2014-05-16 08:04:56','2014-05-16 08:04:56','2'),(22,'sadfd','2014-05-16 08:06:18','2014-05-16 08:06:18','1'),(23,'hey man :)<br><br><br><br>','2014-05-16 08:06:35','2014-05-16 08:06:35','2'),(24,'heeejk\\<br><br><br><br><br>','2014-05-16 08:12:48','2014-05-16 08:12:48','2'),(25,'sdfdsf','2014-05-16 08:12:59','2014-05-16 08:12:59','1'),(26,'wkjhkj<br><br><br><br>','2014-05-16 08:18:22','2014-05-16 08:18:22','2'),(27,'sdkf<br><br><br><br><br><br><br>','2014-05-16 08:29:42','2014-05-16 08:29:42','2'),(28,'askldasd','2014-05-16 08:35:06','2014-05-16 08:35:06','1'),(29,'sdkjhkdsfds<br><br><br><br><br><br>','2014-05-16 08:35:19','2014-05-16 08:35:19','2'),(30,'ddsfsdf<br>sdf<br><br><br><br>','2014-05-16 09:11:51','2014-05-16 09:11:51','2'),(31,'asdlkfjlds<br>dsf<br>dsf<br><br><br><br><br>','2014-05-16 09:16:22','2014-05-16 09:16:22','2'),(32,'sdsf<br>sdf<br>sdf<br><br><br><br>','2014-05-16 09:19:00','2014-05-16 09:19:00','2'),(33,'asdsd<br><br><br><br>','2014-05-16 09:19:14','2014-05-16 09:19:14','2'),(34,'sdfdfs<br><br><br><br><br>','2014-05-16 09:20:56','2014-05-16 09:20:56','2'),(35,'','2014-05-16 09:21:00','2014-05-16 09:21:00','2'),(36,'jhkh<br>hjhk<br>hjyuiyu<br>','2014-05-16 09:21:11','2014-05-16 09:21:11','2'),(37,'sdfdsf<br>sdf<br>dsf<br><br><br><br>','2014-05-16 09:22:22','2014-05-16 09:22:22','2'),(38,'sdfsdfdsf','2014-05-16 09:29:39','2014-05-16 09:29:39','1'),(39,'sdfdsf<br>dsfds<br>f<br><br><br><br>','2014-05-16 09:36:20','2014-05-16 09:36:20','2'),(40,'asdf<br>asd<br><br><br><br>','2014-05-16 09:40:49','2014-05-16 09:40:49','2'),(41,'&lt;br&gt;<br><br>','2014-05-16 09:41:03','2014-05-16 09:41:03','2'),(42,'ssdfsdfsd&lt;br&gt;','2014-05-16 09:41:35','2014-05-16 09:41:35','1'),(43,'dsfdasf<br><br>dasf<br><br>&lt;br&gt;<br><br><br>','2014-05-16 09:43:52','2014-05-16 09:43:52','2'),(44,'sdadsf<br><br><br>&lt;br&gt;<br><br><br>','2014-05-16 09:45:25','2014-05-16 09:45:25','2'),(45,'sdfdsf<br><br>&lt;br&gt;<br><br><br>','2014-05-16 09:53:00','2014-05-16 09:53:00','2'),(46,'dsfkj&lt;br&gt;','2014-05-16 09:53:14','2014-05-16 09:53:14','1'),(47,'ksjdhf<br>sdf<br>dsf<br><br>&lt;br&gt;<br>','2014-05-16 11:49:47','2014-05-16 11:49:47','2'),(48,'sdgfdsfsdf&lt;br&gt;','2014-05-16 11:50:06','2014-05-16 11:50:06','1'),(49,'dfdsfd<br><br><br>','2014-05-16 11:50:16','2014-05-16 11:50:16','2'),(50,'dsfdsfdfdf','2014-05-16 11:50:27','2014-05-16 11:50:27','1'),(51,'sdfjhsdf','2014-05-16 11:51:35','2014-05-16 11:51:35','1'),(52,'sdfsdf','2014-05-16 11:53:37','2014-05-16 11:53:37','1'),(53,'sdlfisddgf','2014-05-16 12:04:52','2014-05-16 12:04:52','1'),(54,'sdfgdf<br><br>sdf<br><br><br><br>','2014-05-16 12:07:50','2014-05-16 12:07:50','2'),(55,'sdfjhddf','2014-05-16 12:08:00','2014-05-16 12:08:00','1'),(56,'sdfdsfsdf','2014-05-16 12:08:32','2014-05-16 12:08:32','1'),(57,'sdfhksdsdf','2014-05-16 12:10:28','2014-05-16 12:10:28','1'),(58,'sdfdsdf','2014-05-16 12:11:59','2014-05-16 12:11:59','1'),(59,'sdfdsfdf','2014-05-16 12:12:39','2014-05-16 12:12:39','1'),(60,'asdsad','2014-05-16 12:19:49','2014-05-16 12:19:49','1'),(61,'hiee<br><br><br><br>','2014-05-16 15:24:52','2014-05-16 15:24:52','2'),(62,'hi ramjee','2014-05-16 15:25:03','2014-05-16 15:25:03','1'),(63,'hellooo','2014-05-16 15:27:40','2014-05-16 15:27:40','1'),(64,'hiasd','2014-05-16 15:27:48','2014-05-16 15:27:48','1'),(65,'asfdsadasdasd','2014-05-16 15:28:24','2014-05-16 15:28:24','1'),(66,'hekllk<br>jdfj<br><br><br>','2014-05-16 15:29:13','2014-05-16 15:29:13','2'),(67,'asdasd','2014-05-16 15:30:52','2014-05-16 15:30:52','1'),(68,'sdsa<br><br>sd<br><br><br><br>','2014-05-16 15:30:59','2014-05-16 15:30:59','2'),(69,'sdfasd','2014-05-16 15:35:09','2014-05-16 15:35:09','1'),(70,'asdsdsdsad','2014-05-16 15:35:13','2014-05-16 15:35:13','1'),(71,'Helloman','2014-05-16 15:36:38','2014-05-16 15:36:38','1'),(72,'asdsd<br>asd<br><br><br>sd<br><br><br>','2014-05-16 15:36:45','2014-05-16 15:36:45','2'),(73,'asdsad','2014-05-16 15:38:41','2014-05-16 15:38:41','1'),(74,'asd','2014-05-16 15:39:27','2014-05-16 15:39:27','1'),(75,'Hey man','2014-05-16 15:39:38','2014-05-16 15:39:38','2'),(76,'asdsad','2014-05-16 15:39:57','2014-05-16 15:39:57','1'),(77,'asdsadsad','2014-05-16 15:40:23','2014-05-16 15:40:23','1'),(78,'hekk','2014-05-16 15:42:40','2014-05-16 15:42:40','1'),(79,'Helo','2014-05-16 15:43:29','2014-05-16 15:43:29','1'),(80,'asdsdasddasd','2014-05-16 15:44:43','2014-05-16 15:44:43','1'),(81,'asdsdasd','2014-05-16 15:50:38','2014-05-16 15:50:38','1'),(82,'hello','2014-05-16 15:50:44','2014-05-16 15:50:44','2'),(83,'asdfsdaf<br>as<br>d<br>sad<br><br><br>','2014-05-16 15:50:51','2014-05-16 15:50:51','2'),(84,'asdhsdls;kjkssadasd','2014-05-16 15:51:00','2014-05-16 15:51:00','1'),(85,'awdsdsd','2014-05-17 10:33:00','2014-05-17 10:33:00','1'),(86,'asdsad<br><br>asd<br>sad<br><br><br>asd<br><br><br>','2014-05-17 10:33:10','2014-05-17 10:33:10','2'),(87,'asdd<br><br>asd<br><br>asd<br><br><br>','2014-05-17 10:33:20','2014-05-17 10:33:20','2'),(88,'hey','2014-05-17 10:40:49','2014-05-17 10:40:49','1'),(89,'asdfds<br><br>dsf<br>sdf<br>sdaf<br>sdf<br>sd<br>fsdf<br><br>','2014-05-17 10:40:57','2014-05-17 10:40:57','2'),(90,'adfdsf<br><br>asdf<br>ds<br>fsda<br>fsda<br>f<br>sdaf<br>sda<br>f<br>','2014-05-17 10:41:03','2014-05-17 10:41:03','2'),(91,'jhh;jh','2014-05-17 14:33:19','2014-05-17 14:33:19','1'),(92,'jhgjk<br><br><br>jhgj<br><br><br>jhgjh<br><br>ghfhf<br><br>','2014-05-17 14:33:29','2014-05-17 14:33:29','2'),(93,'gdfgdg<br>fdgfdgfd<br><br><br><br>fhgfh<br><br>','2014-05-17 14:35:24','2014-05-17 14:35:24','2'),(94,'sdfsdf<br><br><br><br><br>adfaf<br><br><br><br><br>adsfdsf<br><br><br><br><br>adsf<br><br><br><br><br>adffaa<br><br><br><br><br><br><br>','2014-05-17 14:37:17','2014-05-17 14:37:17','2'),(95,'sdfds<br>dsf<br>ads<br>f<br>adf<br>sad<br>fads<br>fdsa<br>fds<br>f<br>','2014-05-17 14:40:40','2014-05-17 14:40:40','2'),(96,'adfdf<br><br><br>adsf<br><br><br>adsf<br><br><br>','2014-05-17 14:40:46','2014-05-17 14:40:46','2'),(97,'asdasd<br>asd<br>asd<br>asd<br>asd<br>asd<br>as<br>d<br><br><br><br><br><br>asdsad<br><br><br><br><br><br>asd<br><br><br><br><br>','2014-05-17 14:41:58','2014-05-17 14:41:58','2'),(98,'sdfdf<br><br><br><br><br><br><br>sdf<br><br><br><br><br>dsafd<br><br><br><br><br>sds<br><br><br><br>asd<br><br><br><br><br><br>afd<br><br><br>','2014-05-17 14:43:02','2014-05-17 14:43:02','2'),(99,'asddsadsad','2014-05-17 14:43:20','2014-05-17 14:43:20','2'),(100,'sddsdsd','2014-05-17 14:43:35','2014-05-17 14:43:35','2'),(101,'asdsd<br><br><br><br>asd<br><br><br><br><br>sad<br><br><br><br><br>sda<br><br><br><br><br><br>sad<br><br><br><br><br>','2014-05-17 14:44:54','2014-05-17 14:44:54','2'),(102,'asd<br><br><br><br><br>asd<br><br><br><br><br><br>asd<br><br><br>sd<br>a<br>sd<br><br><br><br>asd<br><br><br><br><br>sd<br>sad<br>d<br><br><br><br>d<br><br><br><br>','2014-05-17 14:45:18','2014-05-17 14:45:18','2'),(103,'sdfdsf<br><br>d<br>f<br><br>ds<br>f<br>df<br><br><br><br><br><br>sd<br><br><br><br>sd<br>s<br><br><br><br><br>sd<br><br><br><br><br>','2014-05-17 14:46:26','2014-05-17 14:46:26','2'),(104,'asd<br><br><br><br><br><br><br><br>asd<br><br><br><br><br><br><br><br>sad<br><br><br><br><br><br><br>','2014-05-17 14:47:26','2014-05-17 14:47:26','2'),(105,'Hi Arun','2014-06-08 05:31:18','2014-06-08 05:31:18','2'),(106,'Heeeyyyy','2014-06-08 05:31:31','2014-06-08 05:31:31','1'),(107,'<h3 class=\"r\" style=\"font-size: medium; font-weight: normal; margin: 0px; padding: 0px; overflow: hidden; text-overflow: ellipsis; white-space: nowrap; color: rgb(34, 34, 34); font-family: arial, sans-serif;\"><a href=\"https://www.google.co.in/url?sa=t&amp;rct=j&amp;q=&amp;esrc=s&amp;source=web&amp;cd=1&amp;ved=0CCEQFjAA&amp;url=http%3A%2F%2Ffaye.jcoglan.com%2Fruby.html&amp;ei=Q_STU8iqMIiQuASi84HwAQ&amp;usg=AFQjCNH_q9CFp3F7laxfbpnlZ0NC65M-dA&amp;sig2=nJfTeSq6R1najb60ZaQXRw&amp;bvm=bv.68445247,d.c2E&amp;cad=rja\" data-href=\"http://faye.jcoglan.com/ruby.html\" style=\"color: rgb(102, 0, 153); cursor: pointer; text-decoration: none;\">Setting up -&nbsp;<span style=\"font-weight: bold;\">Faye</span>: Simple pub/sub messaging for the web</a></h3>','2014-06-08 11:47:49','2014-06-08 11:47:49','1'),(108,'hiiii<br><br>','2014-06-08 11:53:33','2014-06-08 11:53:33','2'),(109,'','2014-06-08 12:12:52','2014-06-08 12:12:52','1'),(110,'djhfkddfddfd','2014-06-08 12:12:59','2014-06-08 12:12:59','1'),(111,'ksjhdf;s<br><br><br><br>df<br><br><br><br>','2014-06-08 12:15:54','2014-06-08 12:15:54','2'),(112,'hhhhh<br><br><br>asdas<br><br><br>da<br>sdasdsa<br>','2014-06-08 12:20:41','2014-06-08 12:20:41','2'),(113,'dsfdsg<br>sdfsdf<br><br><br>dsfdsfsdf<br>','2014-06-08 12:22:19','2014-06-08 12:22:19','2'),(114,'fyjfy<br>sfgdgfdx<br><br><br><br><br>ddgrf<br>','2014-06-08 12:23:28','2014-06-08 12:23:28','2'),(115,'asadasd<br>asdasd<br>as<br><br><br><br><br>asdasdasd<br>','2014-06-08 12:25:31','2014-06-08 12:25:31','2'),(116,'rgter<br>\\\\\\<br><br>dfg<br><br><br>','2014-06-08 12:26:27','2014-06-08 12:26:27','2'),(117,'sdafdsf<br><br><br>dsf<br><br><br><br>','2014-06-08 12:29:43','2014-06-08 12:29:43','2'),(118,'sdjfhkldsfdf','2014-06-08 12:29:50','2014-06-08 12:29:50','1'),(119,'sdsdf','2014-06-08 12:30:34','2014-06-08 12:30:34','1'),(120,'<span style=\"font-family: Consolas, \'Liberation Mono\', Menlo, Courier, monospace; font-size: 12px; line-height: 20.399999618530273px; white-space: normal; background-color: rgb(248, 248, 248);\">it\'s raining :cat:s and :dog:s!</span>','2014-06-09 12:50:15','2014-06-09 12:50:15','1'),(121,':smile:','2014-06-09 12:51:10','2014-06-09 12:51:10','1'),(122,':cat:','2014-06-09 12:52:13','2014-06-09 12:52:13','1'),(123,':cat:','2014-06-09 15:46:26','2014-06-09 15:46:26','1'),(124,':dog:','2014-06-09 15:47:31','2014-06-09 15:47:31','1'),(125,':cat:','2014-06-09 15:48:06','2014-06-09 15:48:06','1'),(126,':cat:','2014-06-09 15:49:21','2014-06-09 15:49:21','1'),(127,':dog:','2014-06-09 15:50:03','2014-06-09 15:50:03','1'),(128,'arun is a :dog:','2014-06-09 15:52:54','2014-06-09 15:52:54','1'),(129,':cat:','2014-06-09 16:21:33','2014-06-09 16:21:33','1'),(130,':wink:','2014-06-09 16:22:52','2014-06-09 16:22:52','1'),(131,':arun:','2014-06-09 16:23:13','2014-06-09 16:23:13','1'),(132,':wink:','2014-06-09 16:27:25','2014-06-09 16:27:25','1'),(133,':wink:','2014-06-09 16:30:10','2014-06-09 16:30:10','1'),(134,':wink:','2014-06-09 16:31:18','2014-06-09 16:31:18','1'),(135,':cat:','2014-06-09 16:32:46','2014-06-09 16:32:46','2'),(136,'Hello :cat:','2014-06-09 16:36:29','2014-06-09 16:36:29','2'),(137,':dog:','2014-06-09 16:37:01','2014-06-09 16:37:01','1'),(138,':cat: hello','2014-06-09 16:38:34','2014-06-09 16:38:34','2'),(139,':wink: hello','2014-06-09 16:39:04','2014-06-09 16:39:04','2'),(140,':wink: hellossss','2014-06-09 16:39:30','2014-06-09 16:39:30','2'),(141,':wink:','2014-06-09 16:44:26','2014-06-09 16:44:26','2'),(142,':wink:','2014-06-09 16:46:27','2014-06-09 16:46:27','2'),(143,':wink:<br><br>','2014-06-09 16:48:57','2014-06-09 16:48:57','2'),(144,':dog:','2014-06-09 16:50:40','2014-06-09 16:50:40','2'),(145,'hekli :wink:','2014-06-09 16:57:22','2014-06-09 16:57:22','2'),(146,'hkjhads :wink:','2014-06-09 16:57:59','2014-06-09 16:57:59','2'),(147,'hello :wink:','2014-06-09 16:58:52','2014-06-09 16:58:52','2'),(148,'hello :wink:','2014-06-09 17:01:11','2014-06-09 17:01:11','2'),(149,':wink:','2014-06-09 17:46:41','2014-06-09 17:46:41','2'),(150,':wink:','2014-06-09 18:08:20','2014-06-09 18:08:20','2'),(151,':wink:','2014-06-09 18:10:47','2014-06-09 18:10:47','2'),(152,':wink:<br><br>','2014-06-09 18:11:33','2014-06-09 18:11:33','2');
/*!40000 ALTER TABLE `chats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `departments`
--

DROP TABLE IF EXISTS `departments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `departments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `institute_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_departments_on_institute_id` (`institute_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departments`
--

LOCK TABLES `departments` WRITE;
/*!40000 ALTER TABLE `departments` DISABLE KEYS */;
INSERT INTO `departments` VALUES (1,'BCA',1,'2014-05-15 12:14:35','2014-05-15 12:14:35');
/*!40000 ALTER TABLE `departments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `documents`
--

DROP TABLE IF EXISTS `documents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `documents` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `batch_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `docfile_file_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `docfile_content_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `docfile_file_size` int(11) DEFAULT NULL,
  `docfile_updated_at` datetime DEFAULT NULL,
  `labelable_id` int(11) DEFAULT NULL,
  `labelable_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_documents_on_batch_id` (`batch_id`),
  KEY `index_documents_on_user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `documents`
--

LOCK TABLES `documents` WRITE;
/*!40000 ALTER TABLE `documents` DISABLE KEYS */;
INSERT INTO `documents` VALUES (1,'Sample Document','This is a sample document',1,1,'2014-05-19 07:29:34','2014-05-19 07:29:34',NULL,NULL,NULL,NULL,NULL,NULL),(2,'New Document','New document when kisna is here',1,1,'2014-06-08 06:01:36','2014-06-08 06:01:36',NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `documents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `feedbacks`
--

DROP TABLE IF EXISTS `feedbacks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `feedbacks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `field_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `answer` text COLLATE utf8_unicode_ci,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_feedbacks_on_field_id` (`field_id`),
  KEY `index_feedbacks_on_user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feedbacks`
--

LOCK TABLES `feedbacks` WRITE;
/*!40000 ALTER TABLE `feedbacks` DISABLE KEYS */;
INSERT INTO `feedbacks` VALUES (1,1,1,'Average','2014-07-07 12:25:40','2014-07-07 12:25:40'),(2,2,1,'Good','2014-07-07 12:28:36','2014-07-07 12:28:36'),(3,3,1,'Basics,Android Layout','2014-07-07 12:28:37','2014-07-07 12:28:37'),(4,2,2,'Poor','2014-07-07 12:31:24','2014-07-07 12:31:24'),(5,3,2,'Basics,Android Architecture','2014-07-07 12:31:24','2014-07-07 12:31:24'),(6,4,1,'Arun','2014-07-21 19:20:28','2014-07-21 19:20:28');
/*!40000 ALTER TABLE `feedbacks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fields`
--

DROP TABLE IF EXISTS `fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fields` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `form_id` int(11) DEFAULT NULL,
  `category` int(11) DEFAULT NULL,
  `options` text COLLATE utf8_unicode_ci,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_fields_on_form_id` (`form_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fields`
--

LOCK TABLES `fields` WRITE;
/*!40000 ALTER TABLE `fields` DISABLE KEYS */;
INSERT INTO `fields` VALUES (1,'How would you rate the knowledge of the Lecturer?',1,2,'Excellent,Good,Average,Poor,Very Poor','2014-07-07 12:25:07','2014-07-07 12:25:07'),(2,'How would you rate the knowledge of the Lecturer?',2,2,'Excellent,Good,Average,Poor','2014-07-07 12:27:15','2014-07-07 12:27:15'),(3,'Check the Chapters learnt',2,3,'Basics,Android Layout, Android Architecture','2014-07-07 12:28:10','2014-07-07 12:28:10'),(4,'What is your name?',3,1,'Arun, Kisna, Tiju','2014-07-21 19:19:57','2014-07-21 19:19:57');
/*!40000 ALTER TABLE `fields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `forms`
--

DROP TABLE IF EXISTS `forms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `forms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `published` tinyint(1) DEFAULT '0',
  `batch_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_forms_on_user_id` (`user_id`),
  KEY `index_forms_on_published` (`published`),
  KEY `index_forms_on_batch_id` (`batch_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `forms`
--

LOCK TABLES `forms` WRITE;
/*!40000 ALTER TABLE `forms` DISABLE KEYS */;
INSERT INTO `forms` VALUES (1,'Java Workshop',1,'2014-07-07 12:24:01','2014-07-07 12:25:17',1,1),(2,'Android Workshop Feedback',1,'2014-07-07 12:26:41','2014-07-07 12:28:15',1,1),(3,'Newshunt',1,'2014-07-21 19:19:23','2014-07-21 19:20:06',1,1);
/*!40000 ALTER TABLE `forms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `institutes`
--

DROP TABLE IF EXISTS `institutes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `institutes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `city` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `contact_number` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `contact_person` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `contact_email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8_unicode_ci,
  `year_estd` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `institutes`
--

LOCK TABLES `institutes` WRITE;
/*!40000 ALTER TABLE `institutes` DISABLE KEYS */;
INSERT INTO `institutes` VALUES (1,'CMRIT','Bangalore','08023434234','Gomathi','gomathi.t@cmrit.ac.in','ITPL road, Bangalore.',1989,'2014-05-15 11:27:28','2014-05-15 11:27:28'),(2,'RNSIT','Bangalore','9738080923','Arun Kolhapur','arunko350@gmail.com','#24, 20 H cross, Ejipura',1989,'2014-07-21 18:55:45','2014-07-21 18:55:45');
/*!40000 ALTER TABLE `institutes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `labels`
--

DROP TABLE IF EXISTS `labels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `labels` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `parentlabel_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `labels`
--

LOCK TABLES `labels` WRITE;
/*!40000 ALTER TABLE `labels` DISABLE KEYS */;
INSERT INTO `labels` VALUES (1,'MIS',NULL,'2014-05-19 07:40:01','2014-05-19 07:40:01'),(2,'C++',NULL,'2014-06-04 13:44:16','2014-06-04 13:44:16'),(3,'Java',NULL,'2014-06-08 05:34:03','2014-06-08 05:34:03'),(4,'CSS',NULL,'2014-06-08 05:34:35','2014-06-08 05:34:35');
/*!40000 ALTER TABLE `labels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'admin','2014-05-15 11:23:21','2014-05-15 11:23:21'),(2,'student','2014-05-15 11:23:51','2014-05-15 11:23:51');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schema_migrations`
--

DROP TABLE IF EXISTS `schema_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schema_migrations` (
  `version` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  UNIQUE KEY `unique_schema_migrations` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schema_migrations`
--

LOCK TABLES `schema_migrations` WRITE;
/*!40000 ALTER TABLE `schema_migrations` DISABLE KEYS */;
INSERT INTO `schema_migrations` VALUES ('20140224185448'),('20140224185648'),('20140224185726'),('20140224192831'),('20140225184152'),('20140227171214'),('20140305180945'),('20140305182719'),('20140305182907'),('20140306144135'),('20140307195945'),('20140309070155'),('20140310171416'),('20140314154714'),('20140315194049'),('20140322064432'),('20140323163314'),('20140323171851'),('20140323183529'),('20140325191618'),('20140401184022'),('20140401192158'),('20140413103905'),('20140413104703'),('20140413111555'),('20140413111620'),('20140413113707'),('20140413114326'),('20140519065238'),('20140519072645'),('20140519080110'),('20140519080436'),('20140706060642'),('20140706061400'),('20140706072122'),('20140706093540');
/*!40000 ALTER TABLE `schema_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `encrypted_password` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `reset_password_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `reset_password_sent_at` datetime DEFAULT NULL,
  `remember_created_at` datetime DEFAULT NULL,
  `sign_in_count` int(11) NOT NULL DEFAULT '0',
  `current_sign_in_at` datetime DEFAULT NULL,
  `last_sign_in_at` datetime DEFAULT NULL,
  `current_sign_in_ip` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_sign_in_ip` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `role_id` int(11) DEFAULT NULL,
  `firstname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lastname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `contact_number` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `avatar_file_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `avatar_content_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `avatar_file_size` int(11) DEFAULT NULL,
  `avatar_updated_at` datetime DEFAULT NULL,
  `batch_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_users_on_email` (`email`),
  UNIQUE KEY `index_users_on_reset_password_token` (`reset_password_token`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'arunko350@gmail.com','$2a$10$hK699dbGa7a7rS.lg.JUV.pPNFlSR2jhUK3ozNUhyYdLWQiQU7.si',NULL,NULL,NULL,14,'2014-07-21 17:02:45','2014-07-20 16:51:02','127.0.0.1','127.0.0.1','2014-05-15 09:51:46','2014-07-21 17:02:45',1,'Arun','Kolhapur','9738080932',NULL,NULL,NULL,NULL,1),(2,'ramjee.kumar@verse.in','$2a$10$AI.IPHcsizLGCP2rlKGU5OW34bXCiwxQSoSTBdWJVCBFMHJi128eK',NULL,NULL,NULL,5,'2014-07-07 12:31:05','2014-06-08 05:31:06','127.0.0.1','127.0.0.1','2014-05-15 11:07:35','2014-07-07 12:31:05',2,'Ramjee','Kumar Gupta','9879088765','custom15.png','image/png',77435,'2014-05-15 11:16:56',1),(3,'diwakardas@verse.in','$2a$10$dwqtzBITfzQ28CPM5uJPAuHQyEWxp3b96zFqr1KAWv6ZBb.hbsFYy',NULL,NULL,NULL,1,'2014-07-24 04:14:59','2014-07-24 04:14:59','127.0.0.1','127.0.0.1','2014-07-24 04:14:59','2014-07-24 04:14:59',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-07-24  9:56:21
