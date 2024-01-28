-- MySQL dump 10.13  Distrib 8.3.0, for Win64 (x86_64)
--
-- Host: 192.168.50.166    Database: wms
-- ------------------------------------------------------
-- Server version	11.2.2-MariaDB-1:11.2.2+maria~ubu2204

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
-- Table structure for table `account`
--

DROP TABLE IF EXISTS `account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `account` (
  `id` uuid NOT NULL,
  `employee_number` varchar(20) NOT NULL COMMENT 'user_id와 동일',
  `password` varchar(100) NOT NULL,
  `email` varchar(60) DEFAULT NULL,
  `group_authority_id` uuid NOT NULL,
  `personal_authority_id` uuid NOT NULL,
  `name` varchar(45) NOT NULL,
  `gender` varchar(45) DEFAULT NULL,
  `birth` date DEFAULT NULL,
  `telephone` varchar(25) DEFAULT NULL,
  `address` varchar(200) DEFAULT NULL,
  `department_id` uuid DEFAULT NULL,
  `position_id` uuid DEFAULT NULL,
  `activation` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  UNIQUE KEY `employee_number` (`employee_number`),
  UNIQUE KEY `email` (`email`),
  KEY `FK_authority_TO_account_1` (`group_authority_id`),
  KEY `FK_authority_TO_account_2` (`personal_authority_id`),
  KEY `FK_department_TO_account_1` (`department_id`),
  KEY `FK_position_TO_account_1` (`position_id`),
  CONSTRAINT `FK_authority_TO_account_1` FOREIGN KEY (`group_authority_id`) REFERENCES `authority` (`id`),
  CONSTRAINT `FK_authority_TO_account_2` FOREIGN KEY (`personal_authority_id`) REFERENCES `authority` (`id`),
  CONSTRAINT `FK_department_TO_account_1` FOREIGN KEY (`department_id`) REFERENCES `department` (`id`),
  CONSTRAINT `FK_position_TO_account_1` FOREIGN KEY (`position_id`) REFERENCES `position` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account`
--

LOCK TABLES `account` WRITE;
/*!40000 ALTER TABLE `account` DISABLE KEYS */;
INSERT INTO `account` VALUES ('83a25f06-ae95-11ee-935d-0242ac110006','548573','1718c24b10aeb8099e3fc44960ab6949ab76a267352459f203ea1036bec382c2','hseary0@eepurl.com','feef06b3-ae93-11ee-935d-0242ac110006','fdd4b251-aea2-11ee-935d-0242ac110006','Seary','Male','2023-04-12','670-731-8460','PO Box 57989','ee6f85bd-aea3-11ee-935d-0242ac110006','10416613-aea4-11ee-935d-0242ac110006',1),('83a991fe-ae95-11ee-935d-0242ac110006','878052','1718c24b10aeb8099e3fc44960ab6949ab76a267352459f203ea1036bec382c2','lfawcus1@squarespace.com','feef06b3-ae93-11ee-935d-0242ac110006','fdd4b251-aea2-11ee-935d-0242ac110006','Fawcus','Female','2023-08-15','254-479-9505','Room 1476','ee6f85bd-aea3-11ee-935d-0242ac110006','10416613-aea4-11ee-935d-0242ac110006',1),('83bdda69-ae95-11ee-935d-0242ac110006','944542','1718c24b10aeb8099e3fc44960ab6949ab76a267352459f203ea1036bec382c2','rsummergill2@shop-pro.jp','feef06b3-ae93-11ee-935d-0242ac110006','fdd4b251-aea2-11ee-935d-0242ac110006','Summergill','Polygender','2023-07-02','291-154-0106','Room 1947','ee6f85bd-aea3-11ee-935d-0242ac110006','10416613-aea4-11ee-935d-0242ac110006',1),('83d0041a-ae95-11ee-935d-0242ac110006','288558','1718c24b10aeb8099e3fc44960ab6949ab76a267352459f203ea1036bec382c2','sgirardey3@51.la','feef06b3-ae93-11ee-935d-0242ac110006','fdd4b251-aea2-11ee-935d-0242ac110006','Girardey','Male','2023-05-27','229-515-9561','Room 827','ee6f85bd-aea3-11ee-935d-0242ac110006','10416613-aea4-11ee-935d-0242ac110006',1),('83db5495-ae95-11ee-935d-0242ac110006','809160','1718c24b10aeb8099e3fc44960ab6949ab76a267352459f203ea1036bec382c2','dsmart4@diigo.com','feef06b3-ae93-11ee-935d-0242ac110006','fdd4b251-aea2-11ee-935d-0242ac110006','Smart','Female','2023-10-06','988-619-1207','Apt 965','ee6f85bd-aea3-11ee-935d-0242ac110006','10416613-aea4-11ee-935d-0242ac110006',1),('83eab03b-ae95-11ee-935d-0242ac110006','580128','1718c24b10aeb8099e3fc44960ab6949ab76a267352459f203ea1036bec382c2','clawrenson5@fastcompany.com','feef06b3-ae93-11ee-935d-0242ac110006','fdd4b251-aea2-11ee-935d-0242ac110006','Lawrenson','Genderqueer','2023-11-12','470-420-2741','Apt 77','ee6f85bd-aea3-11ee-935d-0242ac110006','10416613-aea4-11ee-935d-0242ac110006',1),('83f11782-ae95-11ee-935d-0242ac110006','273163','1718c24b10aeb8099e3fc44960ab6949ab76a267352459f203ea1036bec382c2','tshepcutt6@baidu.com','feef06b3-ae93-11ee-935d-0242ac110006','fdd4b251-aea2-11ee-935d-0242ac110006','Shepcutt','Male','2023-10-25','443-549-4306','Apt 1512','ee6f85bd-aea3-11ee-935d-0242ac110006','10416613-aea4-11ee-935d-0242ac110006',1),('83fc5b4a-ae95-11ee-935d-0242ac110006','225431','1718c24b10aeb8099e3fc44960ab6949ab76a267352459f203ea1036bec382c2','rbendel7@tripadvisor.com','feef06b3-ae93-11ee-935d-0242ac110006','fdd4b251-aea2-11ee-935d-0242ac110006','Bendel','Female','2023-08-20','256-350-2855','Apt 836','ee6f85bd-aea3-11ee-935d-0242ac110006','10416613-aea4-11ee-935d-0242ac110006',1),('840185ff-ae95-11ee-935d-0242ac110006','907663','1718c24b10aeb8099e3fc44960ab6949ab76a267352459f203ea1036bec382c2','mgiacometti8@sitemeter.com','feef06b3-ae93-11ee-935d-0242ac110006','fdd4b251-aea2-11ee-935d-0242ac110006','Giacometti','Female','2023-06-20','151-967-7624','10th Floor','ee6f85bd-aea3-11ee-935d-0242ac110006','10416613-aea4-11ee-935d-0242ac110006',1),('840b85c0-ae95-11ee-935d-0242ac110006','462027','1718c24b10aeb8099e3fc44960ab6949ab76a267352459f203ea1036bec382c2','kkumaar9@timesonline.co.uk','feef06b3-ae93-11ee-935d-0242ac110006','fdd4b251-aea2-11ee-935d-0242ac110006','Kumaar','Male','2023-01-03','441-801-7304','Apt 1102','ee6f85bd-aea3-11ee-935d-0242ac110006','10416613-aea4-11ee-935d-0242ac110006',1),('e91d8fc1-aeb2-11ee-935d-0242ac110006','987145','1718c24b10aeb8099e3fc44960ab6949ab76a267352459f203ea1036bec382c2','rgethins0@addthis.com','feef06b3-ae93-11ee-935d-0242ac110006','fdd4b251-aea2-11ee-935d-0242ac110006','Rene','Male','2023-08-03','865-274-0848','PO Box 67026','ee6f85bd-aea3-11ee-935d-0242ac110006','10416613-aea4-11ee-935d-0242ac110006',1),('e92277c4-aeb2-11ee-935d-0242ac110006','949649','1718c24b10aeb8099e3fc44960ab6949ab76a267352459f203ea1036bec382c2','scrole1@amazon.de','feef06b3-ae93-11ee-935d-0242ac110006','fdd4b251-aea2-11ee-935d-0242ac110006','Sarge','Polygender','2023-07-21','771-366-4151','PO Box 5454','ee6f85bd-aea3-11ee-935d-0242ac110006','10416613-aea4-11ee-935d-0242ac110006',1),('e9294a5d-aeb2-11ee-935d-0242ac110006','786811','1718c24b10aeb8099e3fc44960ab6949ab76a267352459f203ea1036bec382c2','vscrancher2@nydailynews.com','feef06b3-ae93-11ee-935d-0242ac110006','fdd4b251-aea2-11ee-935d-0242ac110006','Valentijn','Genderfluid','2023-03-01','953-539-8745','Room 1277','ee6f85bd-aea3-11ee-935d-0242ac110006','10416613-aea4-11ee-935d-0242ac110006',1),('e9344647-aeb2-11ee-935d-0242ac110006','885108','1718c24b10aeb8099e3fc44960ab6949ab76a267352459f203ea1036bec382c2','ghurrell3@php.net','feef06b3-ae93-11ee-935d-0242ac110006','fdd4b251-aea2-11ee-935d-0242ac110006','Garrott','Male','2023-06-15','628-919-0087','PO Box 81724','ee6f85bd-aea3-11ee-935d-0242ac110006','10416613-aea4-11ee-935d-0242ac110006',1),('e9390eef-aeb2-11ee-935d-0242ac110006','265112','1718c24b10aeb8099e3fc44960ab6949ab76a267352459f203ea1036bec382c2','stindle4@typepad.com','feef06b3-ae93-11ee-935d-0242ac110006','fdd4b251-aea2-11ee-935d-0242ac110006','Shermie','Female','2023-11-22','620-956-0397','10th Floor','ee6f85bd-aea3-11ee-935d-0242ac110006','10416613-aea4-11ee-935d-0242ac110006',1),('e948d635-aeb2-11ee-935d-0242ac110006','870231','1718c24b10aeb8099e3fc44960ab6949ab76a267352459f203ea1036bec382c2','djowitt5@examiner.com','feef06b3-ae93-11ee-935d-0242ac110006','fdd4b251-aea2-11ee-935d-0242ac110006','Domingo','Female','2023-05-25','309-663-7907','PO Box 25274','ee6f85bd-aea3-11ee-935d-0242ac110006','10416613-aea4-11ee-935d-0242ac110006',1),('e953f305-aeb2-11ee-935d-0242ac110006','955822','1718c24b10aeb8099e3fc44960ab6949ab76a267352459f203ea1036bec382c2','wmacilwrick6@reverbnation.com','feef06b3-ae93-11ee-935d-0242ac110006','fdd4b251-aea2-11ee-935d-0242ac110006','Woodrow','Female','2023-07-08','705-944-9087','Room 396','ee6f85bd-aea3-11ee-935d-0242ac110006','10416613-aea4-11ee-935d-0242ac110006',1),('e95c78c9-aeb2-11ee-935d-0242ac110006','368418','1718c24b10aeb8099e3fc44960ab6949ab76a267352459f203ea1036bec382c2','holdford7@bandcamp.com','feef06b3-ae93-11ee-935d-0242ac110006','fdd4b251-aea2-11ee-935d-0242ac110006','Hartley','Male','2023-04-26','976-828-4796','PO Box 94198','ee6f85bd-aea3-11ee-935d-0242ac110006','10416613-aea4-11ee-935d-0242ac110006',1),('e9603857-aeb2-11ee-935d-0242ac110006','374626','1718c24b10aeb8099e3fc44960ab6949ab76a267352459f203ea1036bec382c2','nflieger8@vkontakte.ru','feef06b3-ae93-11ee-935d-0242ac110006','fdd4b251-aea2-11ee-935d-0242ac110006','Nappie','Female','2023-03-10','540-596-5561','Room 363','ee6f85bd-aea3-11ee-935d-0242ac110006','10416613-aea4-11ee-935d-0242ac110006',1),('e9683728-aeb2-11ee-935d-0242ac110006','567875','1718c24b10aeb8099e3fc44960ab6949ab76a267352459f203ea1036bec382c2','gicke9@pen.io','feef06b3-ae93-11ee-935d-0242ac110006','fdd4b251-aea2-11ee-935d-0242ac110006','Gage','Male','2023-07-21','824-694-9986','PO Box 83065','ee6f85bd-aea3-11ee-935d-0242ac110006','10416613-aea4-11ee-935d-0242ac110006',1),('e96dc62d-aeb2-11ee-935d-0242ac110006','715501','1718c24b10aeb8099e3fc44960ab6949ab76a267352459f203ea1036bec382c2','pallawya@cisco.com','feef06b3-ae93-11ee-935d-0242ac110006','fdd4b251-aea2-11ee-935d-0242ac110006','Putnam','Male','2023-01-22','759-239-8643','PO Box 20104','ee6f85bd-aea3-11ee-935d-0242ac110006','10416613-aea4-11ee-935d-0242ac110006',1),('e97598b7-aeb2-11ee-935d-0242ac110006','873879','1718c24b10aeb8099e3fc44960ab6949ab76a267352459f203ea1036bec382c2','mivanitsab@delicious.com','feef06b3-ae93-11ee-935d-0242ac110006','fdd4b251-aea2-11ee-935d-0242ac110006','Maxy','Female','2023-02-16','791-420-4134','Apt 318','ee6f85bd-aea3-11ee-935d-0242ac110006','10416613-aea4-11ee-935d-0242ac110006',1),('e979898e-aeb2-11ee-935d-0242ac110006','422895','1718c24b10aeb8099e3fc44960ab6949ab76a267352459f203ea1036bec382c2','tfransinellic@foxnews.com','feef06b3-ae93-11ee-935d-0242ac110006','fdd4b251-aea2-11ee-935d-0242ac110006','Tobiah','Male','2023-11-01','367-113-7633','Apt 1377','ee6f85bd-aea3-11ee-935d-0242ac110006','10416613-aea4-11ee-935d-0242ac110006',1),('e983eab3-aeb2-11ee-935d-0242ac110006','892837','1718c24b10aeb8099e3fc44960ab6949ab76a267352459f203ea1036bec382c2','mdaudd@google.nl','feef06b3-ae93-11ee-935d-0242ac110006','fdd4b251-aea2-11ee-935d-0242ac110006','Mattie','Female','2023-08-08','481-233-1706','Suite 61','ee6f85bd-aea3-11ee-935d-0242ac110006','10416613-aea4-11ee-935d-0242ac110006',1),('e9882095-aeb2-11ee-935d-0242ac110006','595501','1718c24b10aeb8099e3fc44960ab6949ab76a267352459f203ea1036bec382c2','sponsforde@latimes.com','feef06b3-ae93-11ee-935d-0242ac110006','fdd4b251-aea2-11ee-935d-0242ac110006','Sydney','Male','2023-03-11','599-724-6575','PO Box 17921','ee6f85bd-aea3-11ee-935d-0242ac110006','10416613-aea4-11ee-935d-0242ac110006',1),('e9929470-aeb2-11ee-935d-0242ac110006','898996','1718c24b10aeb8099e3fc44960ab6949ab76a267352459f203ea1036bec382c2','gconnoldf@epa.gov','feef06b3-ae93-11ee-935d-0242ac110006','fdd4b251-aea2-11ee-935d-0242ac110006','Garik','Genderqueer','2023-05-22','955-979-3981','18th Floor','ee6f85bd-aea3-11ee-935d-0242ac110006','10416613-aea4-11ee-935d-0242ac110006',1),('e997229f-aeb2-11ee-935d-0242ac110006','908479','1718c24b10aeb8099e3fc44960ab6949ab76a267352459f203ea1036bec382c2','jmargettsg@odnoklassniki.ru','feef06b3-ae93-11ee-935d-0242ac110006','fdd4b251-aea2-11ee-935d-0242ac110006','Jereme','Male','2023-09-25','378-125-7837','2nd Floor','ee6f85bd-aea3-11ee-935d-0242ac110006','10416613-aea4-11ee-935d-0242ac110006',1),('e9a1c271-aeb2-11ee-935d-0242ac110006','845407','1718c24b10aeb8099e3fc44960ab6949ab76a267352459f203ea1036bec382c2','fpaunsfordh@sina.com.cn','feef06b3-ae93-11ee-935d-0242ac110006','fdd4b251-aea2-11ee-935d-0242ac110006','Ferdy','Genderqueer','2023-08-29','845-469-0609','4th Floor','ee6f85bd-aea3-11ee-935d-0242ac110006','10416613-aea4-11ee-935d-0242ac110006',1),('e9a699b8-aeb2-11ee-935d-0242ac110006','501601','1718c24b10aeb8099e3fc44960ab6949ab76a267352459f203ea1036bec382c2','lgaythorpei@discuz.net','feef06b3-ae93-11ee-935d-0242ac110006','fdd4b251-aea2-11ee-935d-0242ac110006','Leroi','Female','2023-12-16','310-124-0236','Apt 665','ee6f85bd-aea3-11ee-935d-0242ac110006','10416613-aea4-11ee-935d-0242ac110006',1),('e9b3a19b-aeb2-11ee-935d-0242ac110006','571785','1718c24b10aeb8099e3fc44960ab6949ab76a267352459f203ea1036bec382c2','tbaigriej@hud.gov','feef06b3-ae93-11ee-935d-0242ac110006','fdd4b251-aea2-11ee-935d-0242ac110006','Terri','Male','2023-09-05','456-268-4112','Apt 1665','ee6f85bd-aea3-11ee-935d-0242ac110006','10416613-aea4-11ee-935d-0242ac110006',1),('e9bc0b21-aeb2-11ee-935d-0242ac110006','354123','1718c24b10aeb8099e3fc44960ab6949ab76a267352459f203ea1036bec382c2','hcutillk@goodreads.com','feef06b3-ae93-11ee-935d-0242ac110006','fdd4b251-aea2-11ee-935d-0242ac110006','Hewe','Genderqueer','2023-07-20','944-471-1067','PO Box 78163','ee6f85bd-aea3-11ee-935d-0242ac110006','10416613-aea4-11ee-935d-0242ac110006',1),('e9c2d587-aeb2-11ee-935d-0242ac110006','655258','1718c24b10aeb8099e3fc44960ab6949ab76a267352459f203ea1036bec382c2','bsoaresl@harvard.edu','feef06b3-ae93-11ee-935d-0242ac110006','fdd4b251-aea2-11ee-935d-0242ac110006','Boote','Male','2023-04-05','703-428-8468','Apt 308','ee6f85bd-aea3-11ee-935d-0242ac110006','10416613-aea4-11ee-935d-0242ac110006',1),('e9c7ff8b-aeb2-11ee-935d-0242ac110006','413923','1718c24b10aeb8099e3fc44960ab6949ab76a267352459f203ea1036bec382c2','blisciardellim@hexun.com','feef06b3-ae93-11ee-935d-0242ac110006','fdd4b251-aea2-11ee-935d-0242ac110006','Binky','Male','2023-11-02','168-800-3252','Room 53','ee6f85bd-aea3-11ee-935d-0242ac110006','10416613-aea4-11ee-935d-0242ac110006',1),('e9d27ce8-aeb2-11ee-935d-0242ac110006','703843','1fc4b650bf9fdd3b317abd3bfccb0802a9210c17a627ff093079c99a9480b11a','sstarmern@bizjournals.com','feef06b3-ae93-11ee-935d-0242ac110006','fdd4b251-aea2-11ee-935d-0242ac110006','Stacy','Female','2023-01-30','272-343-0976','Suite 85','ee6f85bd-aea3-11ee-935d-0242ac110006','10416613-aea4-11ee-935d-0242ac110006',1),('e9da8ce0-aeb2-11ee-935d-0242ac110006','477447','1718c24b10aeb8099e3fc44960ab6949ab76a267352459f203ea1036bec382c2','jveroo@technorati.com','feef06b3-ae93-11ee-935d-0242ac110006','fdd4b251-aea2-11ee-935d-0242ac110006','Jo','Female','2023-08-09','795-771-2612','PO Box 52433','ee6f85bd-aea3-11ee-935d-0242ac110006','10416613-aea4-11ee-935d-0242ac110006',1),('e9e461ad-aeb2-11ee-935d-0242ac110006','875707','36db74f642c4cd90632fe4b33ad5061a073f2555c641867b9ef4d176aed4bc9c','bsidgwickp@nifty.com','feef06b3-ae93-11ee-935d-0242ac110006','fdd4b251-aea2-11ee-935d-0242ac110006','Bjorn','Male','2023-02-21','635-439-5165','Suite 14','ee6f85bd-aea3-11ee-935d-0242ac110006','10416613-aea4-11ee-935d-0242ac110006',1),('e9f5e867-aeb2-11ee-935d-0242ac110006','346195','1ff2fc46ca266ff7dd0f89463e158378d01edc518181f258f9e13aef40c1fc3b','sundyq@dell.com','feef06b3-ae93-11ee-935d-0242ac110006','fdd4b251-aea2-11ee-935d-0242ac110006','Shalom','Female','2023-10-12','497-726-7732','Apt 55','ee6f85bd-aea3-11ee-935d-0242ac110006','10416613-aea4-11ee-935d-0242ac110006',1),('e9fe0e99-aeb2-11ee-935d-0242ac110006','503853','1718c24b10aeb8099e3fc44960ab6949ab76a267352459f203ea1036bec382c2','dbrancar@japanpost.jp','feef06b3-ae93-11ee-935d-0242ac110006','fdd4b251-aea2-11ee-935d-0242ac110006','Dur','Female','2023-02-05','107-509-2690','PO Box 7656','ee6f85bd-aea3-11ee-935d-0242ac110006','10416613-aea4-11ee-935d-0242ac110006',1),('ea028d2e-aeb2-11ee-935d-0242ac110006','480683','1718c24b10aeb8099e3fc44960ab6949ab76a267352459f203ea1036bec382c2','thammerbergs@cargocollective.com','feef06b3-ae93-11ee-935d-0242ac110006','fdd4b251-aea2-11ee-935d-0242ac110006','Thedrick','Male','2023-04-14','749-495-9614','Suite 42','ee6f85bd-aea3-11ee-935d-0242ac110006','10416613-aea4-11ee-935d-0242ac110006',1),('ea129f3b-aeb2-11ee-935d-0242ac110006','691855','1718c24b10aeb8099e3fc44960ab6949ab76a267352459f203ea1036bec382c2','dgoatmant@usnews.com','feef06b3-ae93-11ee-935d-0242ac110006','1bf513ce-b0fe-11ee-935d-0242ac110006','Del','Male','2023-10-18','261-689-9623','Room 1854','ee6f85bd-aea3-11ee-935d-0242ac110006','10416613-aea4-11ee-935d-0242ac110006',0),('15b68e54-b0f0-11ee-935d-0242ac110006','admin','1718c24b10aeb8099e3fc44960ab6949ab76a267352459f203ea1036bec382c2','eee@ggg.com','feef06b3-ae93-11ee-935d-0242ac110006','7d931b8b-ccf3-4981-abc8-96ab6f6e85fd','테스트','남','2000-01-01','01022222222','주소 입력 수정 수정','ee6f85bd-aea3-11ee-935d-0242ac110006','10416614-aea4-11ee-935d-0242ac110006',1),('4012f422-ba87-11ee-935d-0242ac110006','1457','086e26fe4d9be5da8fd81d3f828ef5124636dc09e892874e083c64a0e5b13aff','1457@qwe.com','7d931b8b-ccf3-4981-abc8-96ab6f6e85fd','0dcc45f9-16b3-4e2e-9ac3-971cb687d8cc','KanaJin','남','1995-01-03','010-2222-2222','','ee6f85bd-aea3-11ee-935d-0242ac110006','10416612-aea4-11ee-935d-0242ac110006',1),('c3470285-bb49-11ee-935d-0242ac110006','1','c36562c53838cb8ed23e9de694b67c8f42ebd246ce5073a43a8eac6535122504','zzz@zz.zzz','feef06b3-ae93-11ee-935d-0242ac110006','188de3ba-14b3-4c20-a5f6-a5fd36fb110f','kkk','m','2024-01-04','01012345678','님뒤','ee6f85bd-aea3-11ee-935d-0242ac110006','10416612-aea4-11ee-935d-0242ac110006',1),('af1e087b-bb67-11ee-935d-0242ac110006','55555','1ba9f3385d57852434f864343fc0c5ec74acfbda7c71931c69d39776d1aa0f93','55555@qwe.com','1bf513ce-b0fe-11ee-935d-0242ac110006','f5759347-bc95-4b6d-af2a-979b2bade5e8','평사원A','남','2004-06-16','010-5555-5555','파주시','ee6f85bb-aea3-11ee-935d-0242ac110006','10416613-aea4-11ee-935d-0242ac110006',1),('f1957c17-bd47-11ee-935d-0242ac110006','1122','cf413307ad9800e25eeba1ac997752d736b96c3573051f2985b184be9ed86f59','1122@qwe.com','7d931b8b-ccf3-4981-abc8-96ab6f6e85fd','a11525e7-01c9-42c2-801f-798d817fee3a','사무관리자B','남','1999-01-01','010-2222-2221','없음','ee6f85bd-aea3-11ee-935d-0242ac110006','10416613-aea4-11ee-935d-0242ac110006',1);
/*!40000 ALTER TABLE `account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `authority`
--

DROP TABLE IF EXISTS `authority`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `authority` (
  `id` uuid NOT NULL,
  `name` varchar(50) NOT NULL,
  `account` int(11) NOT NULL DEFAULT 0 COMMENT 'RU권한이 있으면 패스워드 초기화 페이지도 접근 가능',
  `authority` int(11) NOT NULL DEFAULT 0,
  `product_category` int(11) NOT NULL DEFAULT 0,
  `product` int(11) NOT NULL DEFAULT 0,
  `prices` int(11) NOT NULL DEFAULT 0,
  `vendor` int(11) NOT NULL DEFAULT 0,
  `warehouse` int(11) NOT NULL DEFAULT 0,
  `stock` int(11) NOT NULL DEFAULT 0,
  `plan_in` int(11) NOT NULL DEFAULT 0,
  `product_in` int(11) NOT NULL DEFAULT 0,
  `product_out` int(11) NOT NULL DEFAULT 0,
  `board` int(11) NOT NULL DEFAULT 0,
  `activation` tinyint(1) NOT NULL DEFAULT 1,
  `is_group_authority` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authority`
--

LOCK TABLES `authority` WRITE;
/*!40000 ALTER TABLE `authority` DISABLE KEYS */;
INSERT INTO `authority` VALUES ('feef06b3-ae93-11ee-935d-0242ac110006','group',2,0,0,0,6,0,0,0,0,0,1,1,1,1),('fdd4b251-aea2-11ee-935d-0242ac110006','personal',0,0,0,0,0,0,0,0,0,0,0,0,1,0),('1bf513ce-b0fe-11ee-935d-0242ac110006','일반현장관리자',0,0,0,0,0,0,0,15,0,15,0,15,1,1),('a11525e7-01c9-42c2-801f-798d817fee3a','관리자',15,15,15,15,15,15,15,15,15,15,15,15,1,0),('7d931b8b-ccf3-4981-abc8-96ab6f6e85fd','대표',15,15,15,15,15,15,15,15,15,15,15,15,1,0),('0dcc45f9-16b3-4e2e-9ac3-971cb687d8cc','IT 관리자',15,15,15,15,15,15,15,15,15,15,15,15,1,0),('f5759347-bc95-4b6d-af2a-979b2bade5e8','없음',0,0,0,0,0,0,0,15,0,15,0,15,1,0),('188de3ba-14b3-4c20-a5f6-a5fd36fb110f','사원',15,15,15,15,15,15,15,15,15,15,15,15,1,0);
/*!40000 ALTER TABLE `authority` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `board`
--

DROP TABLE IF EXISTS `board`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `board` (
  `id` uuid NOT NULL,
  `title` varchar(45) NOT NULL,
  `author_id` uuid NOT NULL,
  `content` text NOT NULL,
  `views` int(11) NOT NULL,
  `announcement` tinyint(1) NOT NULL DEFAULT 0,
  `date` datetime NOT NULL,
  `comment_allow` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `FK_account_TO_board_1` (`author_id`),
  CONSTRAINT `FK_account_TO_board_1` FOREIGN KEY (`author_id`) REFERENCES `account` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `board`
--

LOCK TABLES `board` WRITE;
/*!40000 ALTER TABLE `board` DISABLE KEYS */;
/*!40000 ALTER TABLE `board` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comment` (
  `id` uuid NOT NULL,
  `author_id` uuid NOT NULL,
  `board_number` uuid NOT NULL,
  `content` varchar(200) NOT NULL,
  `date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_account_TO_comment_1` (`author_id`),
  KEY `FK_board_TO_comment_1` (`board_number`),
  CONSTRAINT `FK_account_TO_comment_1` FOREIGN KEY (`author_id`) REFERENCES `account` (`id`),
  CONSTRAINT `FK_board_TO_comment_1` FOREIGN KEY (`board_number`) REFERENCES `board` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `department` (
  `id` uuid NOT NULL,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department`
--

LOCK TABLES `department` WRITE;
/*!40000 ALTER TABLE `department` DISABLE KEYS */;
INSERT INTO `department` VALUES ('ee6f85bb-aea3-11ee-935d-0242ac110006','현장'),('ee6f85bd-aea3-11ee-935d-0242ac110006','사무실');
/*!40000 ALTER TABLE `department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plan_In`
--

DROP TABLE IF EXISTS `plan_In`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `plan_In` (
  `group_number` uuid NOT NULL,
  `product_id` uuid NOT NULL,
  `quantity` int(11) NOT NULL,
  `date` date NOT NULL,
  `manager_id` uuid NOT NULL,
  `warehouse_id` uuid NOT NULL,
  `qr_hash` uuid DEFAULT NULL,
  `url` uuid NOT NULL,
  `clear` tinyint(1) DEFAULT 0,
  `other` varchar(2000) DEFAULT NULL,
  `activation` tinyint(1) NOT NULL DEFAULT 1,
  `view_group_number` int(11) NOT NULL,
  PRIMARY KEY (`group_number`,`product_id`),
  KEY `FK_product_TO_plan_In_1` (`product_id`),
  KEY `FK_account_TO_plan_In_1` (`manager_id`),
  KEY `FK_warehouse_TO_plan_In_1` (`warehouse_id`),
  CONSTRAINT `FK_account_TO_plan_In_1` FOREIGN KEY (`manager_id`) REFERENCES `account` (`id`),
  CONSTRAINT `FK_product_TO_plan_In_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`),
  CONSTRAINT `FK_warehouse_TO_plan_In_1` FOREIGN KEY (`warehouse_id`) REFERENCES `warehouse` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plan_In`
--

LOCK TABLES `plan_In` WRITE;
/*!40000 ALTER TABLE `plan_In` DISABLE KEYS */;
INSERT INTO `plan_In` VALUES ('485b014c-b05e-11ee-935d-0242ac110006','c3640de1-aeb9-11ee-935d-0242ac110006',120,'2024-01-11','15b68e54-b0f0-11ee-935d-0242ac110006','5d201e83-b102-11ee-935d-0242ac110006','485b014c-b05e-11ee-935d-0242ac110006','9916fabe-b6cb-11ee-935d-0242ac110006',0,NULL,1,1),('485b014c-b05e-11ee-935d-0242ac110006','bf255eab-af88-11ee-935d-0242ac110006',111,'2024-01-17','15b68e54-b0f0-11ee-935d-0242ac110006','5d201e83-b102-11ee-935d-0242ac110006','485b014c-b05e-11ee-935d-0242ac110006','485b014c-b05e-11ee-935d-0242ac110007',0,NULL,1,1),('36929db1-c6c1-4463-8255-24fea722ddbc','74f2dd1a-b5ae-11ee-935d-0242ac110006',33,'2024-01-09','15b68e54-b0f0-11ee-935d-0242ac110006','5d201e83-b102-11ee-935d-0242ac110006','36929db1-c6c1-4463-8255-24fea722ddbc','36929db1-c6c1-4463-8255-24fea722ddbc',0,NULL,1,5),('40dd51f7-bdd9-430d-9a6c-5f06f6de6d80','c3640de1-aeb9-11ee-935d-0242ac110006',111,'2024-01-16','15b68e54-b0f0-11ee-935d-0242ac110006','5d201e83-b102-11ee-935d-0242ac110006','40dd51f7-bdd9-430d-9a6c-5f06f6de6d80','9842781f-b6cc-11ee-935d-0242ac110006',0,NULL,1,8),('40dd51f7-bdd9-430d-9a6c-5f06f6de6d80','74f2dd1a-b5ae-11ee-935d-0242ac110006',111,'2024-01-03','15b68e54-b0f0-11ee-935d-0242ac110006','5d201e83-b102-11ee-935d-0242ac110006','40dd51f7-bdd9-430d-9a6c-5f06f6de6d80','98331a42-b6cc-11ee-935d-0242ac110006',1,NULL,0,8),('32972eb9-f48f-4aac-a1b7-6038abd53da2','bf9d039f-ba87-11ee-935d-0242ac110006',200,'2024-01-24','4012f422-ba87-11ee-935d-0242ac110006','5d201e83-b102-11ee-935d-0242ac110006','32972eb9-f48f-4aac-a1b7-6038abd53da2','671763b1-ba88-11ee-935d-0242ac110006',1,NULL,0,9),('15ca38d7-a287-4021-8ce7-682a70699e09','74f2dd1a-b5ae-11ee-935d-0242ac110006',111,'2024-01-02','15b68e54-b0f0-11ee-935d-0242ac110006','5d201e83-b102-11ee-935d-0242ac110006','15ca38d7-a287-4021-8ce7-682a70699e09','15ca38d7-a287-4021-8ce7-682a70699e09',0,NULL,1,7),('e88d7de6-4cdd-4415-8644-6bf8a93272cf','49787028-b11b-11ee-935d-0242ac110006',111,'2024-01-10','15b68e54-b0f0-11ee-935d-0242ac110006','5d201e83-b102-11ee-935d-0242ac110006','e88d7de6-4cdd-4415-8644-6bf8a93272cf','54b5fa1d-ba98-11ee-935d-0242ac110006',0,NULL,1,4),('e88d7de6-4cdd-4415-8644-6bf8a93272cf','01481d42-b419-11ee-935d-0242ac110006',52,'2024-01-04','15b68e54-b0f0-11ee-935d-0242ac110006','5d201e83-b102-11ee-935d-0242ac110006','e88d7de6-4cdd-4415-8644-6bf8a93272cf','54bc694d-ba98-11ee-935d-0242ac110006',0,NULL,1,4),('f17df05c-a597-4d00-bb32-855c31c561a7','bf9d039f-ba87-11ee-935d-0242ac110006',200,'2024-01-24','4012f422-ba87-11ee-935d-0242ac110006','5d201e83-b102-11ee-935d-0242ac110006','f17df05c-a597-4d00-bb32-855c31c561a7','c20aa0ea-ba97-11ee-935d-0242ac110006',1,NULL,0,11),('988950ca-5ac7-4705-ad11-87278b77ab3e','74f2dd1a-b5ae-11ee-935d-0242ac110006',111,'2024-01-17','15b68e54-b0f0-11ee-935d-0242ac110006','5d201e83-b102-11ee-935d-0242ac110006','988950ca-5ac7-4705-ad11-87278b77ab3e','988950ca-5ac7-4705-ad11-87278b77ab3e',0,NULL,1,6),('825b5e37-c818-4030-a853-93887256d434','c3640de1-aeb9-11ee-935d-0242ac110006',10,'2024-01-28','c3470285-bb49-11ee-935d-0242ac110006','5d201e83-b102-11ee-935d-0242ac110006','825b5e37-c818-4030-a853-93887256d434','cd510136-bd05-11ee-935d-0242ac110006',0,NULL,1,13),('825b5e37-c818-4030-a853-93887256d434','bf9d039f-ba87-11ee-935d-0242ac110006',10,'2024-01-28','c3470285-bb49-11ee-935d-0242ac110006','5d201e83-b102-11ee-935d-0242ac110006','825b5e37-c818-4030-a853-93887256d434','cd60d494-bd05-11ee-935d-0242ac110006',0,NULL,1,13),('58edd921-0af3-4d2a-b8dd-93ac24f1b9a8','74f2dd1a-b5ae-11ee-935d-0242ac110006',20,'2024-01-24','15b68e54-b0f0-11ee-935d-0242ac110006','5d201e83-b102-11ee-935d-0242ac110006','58edd921-0af3-4d2a-b8dd-93ac24f1b9a8','501d8638-ba96-11ee-935d-0242ac110006',1,NULL,0,10),('58edd921-0af3-4d2a-b8dd-93ac24f1b9a8','bf9d039f-ba87-11ee-935d-0242ac110006',20,'2024-01-24','15b68e54-b0f0-11ee-935d-0242ac110006','5d201e83-b102-11ee-935d-0242ac110006','58edd921-0af3-4d2a-b8dd-93ac24f1b9a8','502f7ba4-ba96-11ee-935d-0242ac110006',1,NULL,0,10),('841c3f94-7ce7-4741-aebb-9cb8cdb76c20','c3640de1-aeb9-11ee-935d-0242ac110006',555,'0021-12-31','15b68e54-b0f0-11ee-935d-0242ac110006','5d201e83-b102-11ee-935d-0242ac110006','841c3f94-7ce7-4741-aebb-9cb8cdb76c20','a3d382a8-b6cb-11ee-935d-0242ac110006',0,NULL,1,2),('841c3f94-7ce7-4741-aebb-9cb8cdb76c20','49787028-b11b-11ee-935d-0242ac110006',5,'2024-01-11','15b68e54-b0f0-11ee-935d-0242ac110006','5d201e83-b102-11ee-935d-0242ac110006','841c3f94-7ce7-4741-aebb-9cb8cdb76c20','841c3f94-7ce7-4741-aebb-9cb8cdb76c20',0,NULL,1,2),('f23afe8c-6e01-4266-b547-b1f1599a852a','49787028-b11b-11ee-935d-0242ac110006',55,'2024-01-11','15b68e54-b0f0-11ee-935d-0242ac110006','5d201e83-b102-11ee-935d-0242ac110006','f23afe8c-6e01-4266-b547-b1f1599a852a','a7db2797-b6cb-11ee-935d-0242ac110006',0,NULL,1,3),('f23afe8c-6e01-4266-b547-b1f1599a852a','01481d42-b419-11ee-935d-0242ac110006',1,'2024-01-03','15b68e54-b0f0-11ee-935d-0242ac110006','5d201e83-b102-11ee-935d-0242ac110006','f23afe8c-6e01-4266-b547-b1f1599a852a','f23afe8c-6e01-4266-b547-b1f1599a852a',0,NULL,1,3),('fdabd67f-74f4-4f77-b9d3-b709485d0297','98750f73-bb4c-11ee-935d-0242ac110006',10,'2024-01-26','c3470285-bb49-11ee-935d-0242ac110006','5d201e83-b102-11ee-935d-0242ac110006','fdabd67f-74f4-4f77-b9d3-b709485d0297','e5f6c40a-bb50-11ee-935d-0242ac110006',0,NULL,0,12);
/*!40000 ALTER TABLE `plan_In` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plan_in_test`
--

DROP TABLE IF EXISTS `plan_in_test`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `plan_in_test` (
  `group_number` uuid NOT NULL,
  `product_id` uuid NOT NULL,
  `quantity` int(11) NOT NULL,
  `date` date NOT NULL,
  `manager_id` uuid NOT NULL,
  `warehouse_id` uuid NOT NULL,
  `qr_hash` varchar(255) DEFAULT NULL,
  `url` uuid NOT NULL,
  `clear` tinyint(1) DEFAULT 0,
  `other` varchar(2000) DEFAULT NULL,
  `activation` tinyint(1) NOT NULL DEFAULT 1,
  `view_group_number` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plan_in_test`
--

LOCK TABLES `plan_in_test` WRITE;
/*!40000 ALTER TABLE `plan_in_test` DISABLE KEYS */;
INSERT INTO `plan_in_test` VALUES ('485b014c-b05e-11ee-935d-0242ac110006','c3640de1-aeb9-11ee-935d-0242ac110006',120,'2024-01-11','83a25f06-ae95-11ee-935d-0242ac110006','30fddbe8-ae96-11ee-935d-0242ac110006',NULL,'485b02c0-b05e-11ee-935d-0242ac110006',0,'비고',1,1),('485b014c-b05e-11ee-935d-0242ac110006','bf255eab-af88-11ee-935d-0242ac110006',120,'2024-01-11','83a25f06-ae95-11ee-935d-0242ac110006','30fddbe8-ae96-11ee-935d-0242ac110006',NULL,'485b02c0-b05e-11ee-935d-0242ac110007',0,'비고',1,1);
/*!40000 ALTER TABLE `plan_in_test` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `position`
--

DROP TABLE IF EXISTS `position`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `position` (
  `id` uuid NOT NULL,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `position`
--

LOCK TABLES `position` WRITE;
/*!40000 ALTER TABLE `position` DISABLE KEYS */;
INSERT INTO `position` VALUES ('10416612-aea4-11ee-935d-0242ac110006','관리자'),('10416613-aea4-11ee-935d-0242ac110006','사원'),('10416614-aea4-11ee-935d-0242ac110006','대표');
/*!40000 ALTER TABLE `position` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prices`
--

DROP TABLE IF EXISTS `prices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prices` (
  `id` uuid NOT NULL,
  `price` int(11) NOT NULL,
  `registration_date` datetime NOT NULL,
  `manager_id` uuid NOT NULL,
  `product_id` uuid NOT NULL,
  `activation` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `FK_account_TO_prices_1` (`manager_id`),
  KEY `FK_product_TO_prices_1` (`product_id`),
  CONSTRAINT `FK_account_TO_prices_1` FOREIGN KEY (`manager_id`) REFERENCES `account` (`id`),
  CONSTRAINT `FK_product_TO_prices_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prices`
--

LOCK TABLES `prices` WRITE;
/*!40000 ALTER TABLE `prices` DISABLE KEYS */;
INSERT INTO `prices` VALUES ('13af0f62-b055-11ee-935d-0242ac110006',10000,'2024-01-11 00:00:00','83bdda69-ae95-11ee-935d-0242ac110006','c3640de1-aeb9-11ee-935d-0242ac110006',1),('913d21c5-b0ed-11ee-935d-0242ac110006',15000,'2024-01-12 00:00:00','83bdda69-ae95-11ee-935d-0242ac110006','8afe3c6b-af95-11ee-935d-0242ac110006',0),('9b48e255-b0ed-11ee-935d-0242ac110006',16000,'2024-01-12 00:00:00','83bdda69-ae95-11ee-935d-0242ac110006','8afe3c6b-af95-11ee-935d-0242ac110006',0),('1e3755e5-b125-11ee-935d-0242ac110006',20000,'2024-01-12 00:00:00','83bdda69-ae95-11ee-935d-0242ac110006','49787028-b11b-11ee-935d-0242ac110006',0),('569c3b19-b125-11ee-935d-0242ac110006',25000,'2024-01-12 00:00:00','83bdda69-ae95-11ee-935d-0242ac110006','49787028-b11b-11ee-935d-0242ac110006',1),('2c24ffb0-b12c-11ee-935d-0242ac110006',1200,'2024-01-12 00:00:00','83bdda69-ae95-11ee-935d-0242ac110006','bf255eab-af88-11ee-935d-0242ac110006',1),('f298375e-b419-11ee-935d-0242ac110006',5000,'2024-01-18 00:00:00','15b68e54-b0f0-11ee-935d-0242ac110006','01481d42-b419-11ee-935d-0242ac110006',1),('959f0a7b-b5e0-11ee-935d-0242ac110006',9000,'2024-01-18 00:00:00','15b68e54-b0f0-11ee-935d-0242ac110006','c3640de1-aeb9-11ee-935d-0242ac110006',1),('c32012bd-b669-11ee-935d-0242ac110006',1200,'2024-01-19 00:00:00','15b68e54-b0f0-11ee-935d-0242ac110006','c3640de1-aeb9-11ee-935d-0242ac110006',1),('59353dc0-b679-11ee-935d-0242ac110006',120000,'2024-01-25 00:00:00','4012f422-ba87-11ee-935d-0242ac110006','74f2dd1a-b5ae-11ee-935d-0242ac110006',1),('cf4be5d9-ba87-11ee-935d-0242ac110006',3000,'2024-01-27 00:00:00','4012f422-ba87-11ee-935d-0242ac110006','bf9d039f-ba87-11ee-935d-0242ac110006',1),('a47b031f-bb4c-11ee-935d-0242ac110006',1000000,'2024-01-25 00:00:00','15b68e54-b0f0-11ee-935d-0242ac110006','98750f73-bb4c-11ee-935d-0242ac110006',0),('78c2f8a1-bcf9-11ee-935d-0242ac110006',3000,'2024-01-27 00:00:00','4012f422-ba87-11ee-935d-0242ac110006','bf9d039f-ba87-11ee-935d-0242ac110006',0),('fae8affc-bcfb-11ee-935d-0242ac110006',5000,'2024-01-27 00:00:00','4012f422-ba87-11ee-935d-0242ac110006','01481d42-b419-11ee-935d-0242ac110006',0);
/*!40000 ALTER TABLE `prices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `id` uuid NOT NULL,
  `name` varchar(100) NOT NULL,
  `company_name` varchar(100) DEFAULT NULL,
  `kan_code` varchar(20) NOT NULL,
  `vendor_id` uuid NOT NULL,
  `registration_date` date NOT NULL,
  `manager_id` uuid NOT NULL,
  `activation` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `FK_product_category_TO_product_1` (`kan_code`),
  KEY `FK_vendor_TO_product_1` (`vendor_id`),
  KEY `FK_account_TO_product_1` (`manager_id`),
  CONSTRAINT `FK_account_TO_product_1` FOREIGN KEY (`manager_id`) REFERENCES `account` (`id`),
  CONSTRAINT `FK_product_category_TO_product_1` FOREIGN KEY (`kan_code`) REFERENCES `product_category` (`kan_code`),
  CONSTRAINT `FK_vendor_TO_product_1` FOREIGN KEY (`vendor_id`) REFERENCES `vendor` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES ('c3640de1-aeb9-11ee-935d-0242ac110006','마시는 홍초(석류)','청정원','01010102','52f16bb8-aeb9-11ee-935d-0242ac110006','2024-01-09','83a25f06-ae95-11ee-935d-0242ac110006',1),('bf255eab-af88-11ee-935d-0242ac110006','맛술 생강&매실 830ml','청정원','01010106','52f16bb8-aeb9-11ee-935d-0242ac110006','2024-01-12','83bdda69-ae95-11ee-935d-0242ac110006',1),('8afe3c6b-af95-11ee-935d-0242ac110006','테스트123','회사명','01010102','52f16bb8-aeb9-11ee-935d-0242ac110006','2024-01-11','83bdda69-ae95-11ee-935d-0242ac110006',0),('49787028-b11b-11ee-935d-0242ac110006','백설 하얀설탕','CJ 제일제당','01010105','52f16bb8-aeb9-11ee-935d-0242ac110006','2024-01-12','83bdda69-ae95-11ee-935d-0242ac110006',1),('9820c566-b386-11ee-935d-0242ac110006','234','234','01010108','52f16bb8-aeb9-11ee-935d-0242ac110006','2024-01-15','83bdda69-ae95-11ee-935d-0242ac110006',0),('01481d42-b419-11ee-935d-0242ac110006','칼집 콘 프랑크','청정원','01030101','ff3cd54f-b100-11ee-935d-0242ac110006','2024-01-16','83bdda69-ae95-11ee-935d-0242ac110006',1),('74f2dd1a-b5ae-11ee-935d-0242ac110006','동원 살코기참치 36개 1박스','동원','01060201','52f16bb8-aeb9-11ee-935d-0242ac110006','2024-01-18','15b68e54-b0f0-11ee-935d-0242ac110006',1),('bf9d039f-ba87-11ee-935d-0242ac110006','오뚜기 케찹','오뚜기','01010201','52f16bb8-aeb9-11ee-935d-0242ac110006','2024-01-27','4012f422-ba87-11ee-935d-0242ac110006',1),('293522dd-bb4a-11ee-935d-0242ac110006','감자','kkk','01010102','52f16bb8-aeb9-11ee-935d-0242ac110006','2024-01-25','15b68e54-b0f0-11ee-935d-0242ac110006',0),('98750f73-bb4c-11ee-935d-0242ac110006','대홍동왕감자','김정은','01070101','52f16bb8-aeb9-11ee-935d-0242ac110006','2024-01-25','c3470285-bb49-11ee-935d-0242ac110006',0),('84a9832c-bcf8-11ee-935d-0242ac110006','테스트 제품명','테스트 회사명','01010401','52f16bb8-aeb9-11ee-935d-0242ac110006','2024-01-27','4012f422-ba87-11ee-935d-0242ac110006',0),('aa9b4d46-bcf8-11ee-935d-0242ac110006','1111','미지정','01010102','ff3cd54f-b100-11ee-935d-0242ac110006','2024-01-27','4012f422-ba87-11ee-935d-0242ac110006',0);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_category`
--

DROP TABLE IF EXISTS `product_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_category` (
  `kan_code` varchar(20) NOT NULL,
  `cls_nm_1` varchar(50) NOT NULL,
  `cls_nm_2` varchar(50) NOT NULL,
  `cls_nm_3` varchar(50) NOT NULL,
  `cls_Nm_4` varchar(50) NOT NULL,
  `activation` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`kan_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_category`
--

LOCK TABLES `product_category` WRITE;
/*!40000 ALTER TABLE `product_category` DISABLE KEYS */;
INSERT INTO `product_category` VALUES ('01010102','가공식품','조미료','종합조미료','식초',1),('01010103','가공식품','조미료','종합조미료','천일염',1),('01010104','가공식품','조미료','종합조미료','가공염',1),('01010105','가공식품','조미료','종합조미료','설탕',1),('01010106','가공식품','조미료','종합조미료','요리주',1),('01010107','가공식품','조미료','종합조미료','물엿',1),('01010108','가공식품','조미료','종합조미료','육수',1),('01010109','가공식품','조미료','종합조미료','요리용양념장',1),('01010110','가공식품','조미료','종합조미료','시럽류',1),('01010199','가공식품','조미료','종합조미료','기타조미료',1),('01010201','가공식품','조미료','드레싱/소스','케첩',1),('01010202','가공식품','조미료','드레싱/소스','마요네즈',1),('01010203','가공식품','조미료','드레싱/소스','드레싱',1),('01010204','가공식품','조미료','드레싱/소스','소스',1),('01010301','가공식품','조미료','장류','간장',1),('01010302','가공식품','조미료','장류','된장',1),('01010303','가공식품','조미료','장류','고추장',1),('01010304','가공식품','조미료','장류','초고추장',1),('01010305','가공식품','조미료','장류','춘장(짜장)',1),('01010306','가공식품','조미료','장류','청국장',1),('01010307','가공식품','조미료','장류','쌈장',1),('01010308','가공식품','조미료','장류','메주',1),('01010309','가공식품','조미료','장류','양념장',1),('01010310','가공식품','조미료','장류','낫토',1),('01010399','가공식품','조미료','장류','기타장류',1),('01010401','가공식품','조미료','향신료','고추가루',1),('01010402','가공식품','조미료','향신료','후추',1),('01010403','가공식품','조미료','향신료','겨자',1),('01010404','가공식품','조미료','향신료','계피',1),('01010405','가공식품','조미료','향신료','와사비',1),('01010406','가공식품','조미료','향신료','마늘분말',1),('01010407','가공식품','조미료','향신료','생강분말',1),('01010408','가공식품','조미료','향신료','허브가루',1),('01010409','가공식품','조미료','향신료','녹차가루',1),('01010410','가공식품','조미료','향신료','깨',1),('01010499','가공식품','조미료','향신료','기타향신료',1),('01010501','가공식품','조미료','유지류','참기름',1),('01010502','가공식품','조미료','유지류','콩기름(대두유)',1),('01010503','가공식품','조미료','유지류','옥수수기름(옥배유)',1),('01010504','가공식품','조미료','유지류','유채씨유(카놀라유)',1),('01010505','가공식품','조미료','유지류','현미유',1),('01010506','가공식품','조미료','유지류','고추씨기름',1),('01010507','가공식품','조미료','유지류','혼합식용유',1),('01010508','가공식품','조미료','유지류','마가린',1),('01010509','가공식품','조미료','유지류','들기름',1),('01010510','가공식품','조미료','유지류','해바라기유',1),('01010511','가공식품','조미료','유지류','포도씨유',1),('01010512','가공식품','조미료','유지류','올리브유',1),('01010513','가공식품','조미료','유지류','코코넛오일',1),('01010599','가공식품','조미료','유지류','기타식용유지',1),('01020101','가공식품','유제품','우유','일반우유',1),('01020102','가공식품','유제품','우유','기능성우유',1),('01020103','가공식품','유제품','우유','연유',1),('01020199','가공식품','유제품','우유','기타우유',1),('01020201','가공식품','유제품','요구르트','액상요구르트',1),('01020299','가공식품','유제품','요구르트','기타요구르트',1),('01020301','가공식품','유제품','유가공품','크림',1),('01020302','가공식품','유제품','유가공품','버터',1),('01020303','가공식품','유제품','유가공품','치즈류',1),('01020399','가공식품','유제품','유가공품','기타유가공품',1),('01030101','가공식품','축산가공식품','햄/소시지(통조림/병제외)','소시지',1),('01030102','가공식품','축산가공식품','햄/소시지(통조림/병제외)','햄',1),('01030201','가공식품','축산가공식품','조미육가공','베이컨',1),('01030218','가공식품','축산가공식품','조미육가공','닭가공품',1),('01030219','가공식품','축산가공식품','조미육가공','오리가공품',1),('01039999','가공식품','축산가공식품','기타축산가공식품','기타육가공',1),('01040101','가공식품','수산가공식품','건포류','오징어',1),('01040102','가공식품','수산가공식품','건포류','쥐포',1),('01040103','가공식품','수산가공식품','건포류','멸치',1),('01040104','가공식품','수산가공식품','건포류','건새우',1),('01040105','가공식품','수산가공식품','건포류','한치',1),('01040106','가공식품','수산가공식품','건포류','문어',1),('01040107','가공식품','수산가공식품','건포류','과메기',1),('01040108','가공식품','수산가공식품','건포류','노가리',1),('01040109','가공식품','수산가공식품','건포류','진미채',1),('01040110','가공식품','수산가공식품','건포류','황태',1),('01040199','가공식품','수산가공식품','건포류','기타건포류',1),('01040201','가공식품','수산가공식품','해조류','김',1),('01040202','가공식품','수산가공식품','해조류','미역',1),('01040203','가공식품','수산가공식품','해조류','한천',1),('01040204','가공식품','수산가공식품','해조류','다시마',1),('01040205','가공식품','수산가공식품','해조류','매생이',1),('01040206','가공식품','수산가공식품','해조류','해초샐러드',1),('01040299','가공식품','수산가공식품','해조류','기타해조류',1),('01049999','가공식품','수산가공식품','기타수산가공식품','기타수산가공식품',1),('01050101','가공식품','대용식재료','면류','중면/소면/세면',1),('01050102','가공식품','대용식재료','면류','당면',1),('01050103','가공식품','대용식재료','면류','냉면',1),('01050104','가공식품','대용식재료','면류','칼국수면',1),('01060101','가공식품','통조림/병','농산물통조림/병','과일류',1),('01060102','가공식품','통조림/병','농산물통조림/병','잼류/스프레드류',1),('01060103','가공식품','통조림/병','농산물통조림/병','야채류(옥수수/콩 등)',1),('01060104','가공식품','통조림/병','농산물통조림/병','농산물반찬통조림',1),('01060199','가공식품','통조림/병','농산물통조림/병','기타농산물통조림/병',1),('01060201','가공식품','통조림/병','수산물통조림/병','참치',1),('01060202','가공식품','통조림/병','수산물통조림/병','골뱅이',1),('01060203','가공식품','통조림/병','수산물통조림/병','꽁치/고등어',1),('01060204','가공식품','통조림/병','수산물통조림/병','연어',1),('01060205','가공식품','통조림/병','수산물통조림/병','장조림',1),('01060299','가공식품','통조림/병','수산물통조림/병','기타수산물통조림',1),('01060301','가공식품','통조림/병','축산물통조림/병','축산물통조림',1),('01060302','가공식품','통조림/병','축산물통조림/병','햄통조림',1),('01060303','가공식품','통조림/병','축산물통조림/병','축산물반찬통조림',1),('01069999','가공식품','통조림/병','기타통조림류','기타통조림류',1),('01070101','가공식품','농산가공식품','건식품','건과일/야채',1),('01070102','가공식품','농산가공식품','건식품','땅콩/견과류가공품',1),('01070103','가공식품','농산가공식품','건식품','한약재류',1),('01070199','가공식품','농산가공식품','건식품','기타건식품',1),('01079999','가공식품','농산가공식품','기타농산가공식품','기타농산가공식품',1),('01080101','가공식품','냉동식품','냉동가공식품','냉동과일류',1),('01080102','가공식품','냉동식품','냉동가공식품','냉동돈까스',1),('01080103','가공식품','냉동식품','냉동가공식품','생선까스',1);
/*!40000 ALTER TABLE `product_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_in`
--

DROP TABLE IF EXISTS `product_in`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_in` (
  `id` uuid NOT NULL,
  `group_number` uuid DEFAULT NULL,
  `product_id` uuid NOT NULL,
  `in_date` datetime NOT NULL,
  `quantity` int(11) NOT NULL,
  `warehouse_id` uuid NOT NULL,
  `manager_id` uuid NOT NULL,
  `note` varchar(2000) DEFAULT NULL,
  `activation` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `FK_warehouse_TO_product_in_1` (`warehouse_id`),
  KEY `FK_account_TO_product_in_1` (`manager_id`),
  CONSTRAINT `FK_account_TO_product_in_1` FOREIGN KEY (`manager_id`) REFERENCES `account` (`id`),
  CONSTRAINT `FK_warehouse_TO_product_in_1` FOREIGN KEY (`warehouse_id`) REFERENCES `warehouse` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_in`
--

LOCK TABLES `product_in` WRITE;
/*!40000 ALTER TABLE `product_in` DISABLE KEYS */;
INSERT INTO `product_in` VALUES ('f3f619be-b098-11ee-935d-0242ac110006','485b014c-b05e-11ee-935d-0242ac110006','c3640de1-aeb9-11ee-935d-0242ac110006','2024-01-12 00:49:06',120,'30fddbe8-ae96-11ee-935d-0242ac110006','83a25f06-ae95-11ee-935d-0242ac110006','a',1),('fc8a6e8c-b607-11ee-935d-0242ac110006','485b014c-b05e-11ee-935d-0242ac110006','c3640de1-aeb9-11ee-935d-0242ac110006','2024-01-18 22:46:31',130,'30fddbe8-ae96-11ee-935d-0242ac110006','83a25f06-ae95-11ee-935d-0242ac110006','a',1),('5027fcdf-b608-11ee-935d-0242ac110006','485b014c-b05e-11ee-935d-0242ac110006','c3640de1-aeb9-11ee-935d-0242ac110006','2024-01-18 22:48:51',140,'30fddbe8-ae96-11ee-935d-0242ac110006','83a25f06-ae95-11ee-935d-0242ac110006','a',1),('71cc8669-b666-11ee-935d-0242ac110006','485b014c-b05e-11ee-935d-0242ac110006','c3640de1-aeb9-11ee-935d-0242ac110006','2024-01-19 10:02:40',120,'30fddbe8-ae96-11ee-935d-0242ac110006','83a25f06-ae95-11ee-935d-0242ac110006','a',1),('3e4ac534-b667-11ee-935d-0242ac110006','485b014c-b05e-11ee-935d-0242ac110006','c3640de1-aeb9-11ee-935d-0242ac110006','2024-01-19 10:08:23',120,'30fddbe8-ae96-11ee-935d-0242ac110006','83a25f06-ae95-11ee-935d-0242ac110006','a',1),('5d16b06a-b6b3-11ee-935d-0242ac110006','485b014c-b05e-11ee-935d-0242ac110006','bf255eab-af88-11ee-935d-0242ac110006','2024-01-19 19:13:17',112,'5d201e83-b102-11ee-935d-0242ac110006','15b68e54-b0f0-11ee-935d-0242ac110006','a',1),('dcaa738e-b75f-11ee-935d-0242ac110006','485b014c-b05e-11ee-935d-0242ac110006','c3640de1-aeb9-11ee-935d-0242ac110006','2024-01-20 15:48:04',120,'5d201e83-b102-11ee-935d-0242ac110006','15b68e54-b0f0-11ee-935d-0242ac110006','a',1),('7743824d-b8c3-11ee-935d-0242ac110006',NULL,'c3640de1-aeb9-11ee-935d-0242ac110006','2024-01-22 00:00:00',20,'5d201e83-b102-11ee-935d-0242ac110006','15b68e54-b0f0-11ee-935d-0242ac110006','',0),('9e7d0cf9-b8c3-11ee-935d-0242ac110006',NULL,'c3640de1-aeb9-11ee-935d-0242ac110006','2024-01-22 00:00:00',60,'5d201e83-b102-11ee-935d-0242ac110006','15b68e54-b0f0-11ee-935d-0242ac110006','테스트용',1),('f842955e-b8d6-11ee-935d-0242ac110006',NULL,'c3640de1-aeb9-11ee-935d-0242ac110006','2024-01-22 00:00:00',98,'5d201e83-b102-11ee-935d-0242ac110006','15b68e54-b0f0-11ee-935d-0242ac110006','정상',0),('45440411-b8f5-11ee-935d-0242ac110006',NULL,'74f2dd1a-b5ae-11ee-935d-0242ac110006','2024-01-22 00:00:00',200,'a6b32379-b6a0-11ee-935d-0242ac110006','15b68e54-b0f0-11ee-935d-0242ac110006','',1),('41570a66-ba64-11ee-935d-0242ac110006',NULL,'74f2dd1a-b5ae-11ee-935d-0242ac110006','2024-01-24 00:00:00',1,'5d201e83-b102-11ee-935d-0242ac110006','15b68e54-b0f0-11ee-935d-0242ac110006','',1),('b8f9b3fb-ba64-11ee-935d-0242ac110006',NULL,'74f2dd1a-b5ae-11ee-935d-0242ac110006','2024-01-24 00:00:00',1,'5d201e83-b102-11ee-935d-0242ac110006','15b68e54-b0f0-11ee-935d-0242ac110006','',0),('c323dc31-ba64-11ee-935d-0242ac110006',NULL,'74f2dd1a-b5ae-11ee-935d-0242ac110006','2024-01-24 00:00:00',1,'5d201e83-b102-11ee-935d-0242ac110006','15b68e54-b0f0-11ee-935d-0242ac110006','',1),('e43f2ca2-ba64-11ee-935d-0242ac110006',NULL,'74f2dd1a-b5ae-11ee-935d-0242ac110006','2024-01-24 00:00:00',2,'5d201e83-b102-11ee-935d-0242ac110006','15b68e54-b0f0-11ee-935d-0242ac110006','',1),('ea193c0a-ba64-11ee-935d-0242ac110006',NULL,'74f2dd1a-b5ae-11ee-935d-0242ac110006','2024-01-24 00:00:00',3,'5d201e83-b102-11ee-935d-0242ac110006','15b68e54-b0f0-11ee-935d-0242ac110006','',1),('f030ccee-ba64-11ee-935d-0242ac110006',NULL,'74f2dd1a-b5ae-11ee-935d-0242ac110006','2024-01-24 00:00:00',4,'5d201e83-b102-11ee-935d-0242ac110006','15b68e54-b0f0-11ee-935d-0242ac110006','',1),('854ff897-ba88-11ee-935d-0242ac110006','32972eb9-f48f-4aac-a1b7-6038abd53da2','bf9d039f-ba87-11ee-935d-0242ac110006','2024-01-24 16:16:40',50,'5d201e83-b102-11ee-935d-0242ac110006','4012f422-ba87-11ee-935d-0242ac110006','a',1),('e91bb30b-ba97-11ee-935d-0242ac110006','f17df05c-a597-4d00-bb32-855c31c561a7','bf9d039f-ba87-11ee-935d-0242ac110006','2024-01-24 18:06:50',200,'5d201e83-b102-11ee-935d-0242ac110006','4012f422-ba87-11ee-935d-0242ac110006','a',1),('a1cea71d-bb16-11ee-935d-0242ac110006',NULL,'bf9d039f-ba87-11ee-935d-0242ac110006','2024-01-25 00:00:00',20,'a6b32379-b6a0-11ee-935d-0242ac110006','4012f422-ba87-11ee-935d-0242ac110006','',0),('4778bd1f-bb19-11ee-935d-0242ac110006',NULL,'bf9d039f-ba87-11ee-935d-0242ac110006','2024-01-25 00:00:00',20,'a6b32379-b6a0-11ee-935d-0242ac110006','4012f422-ba87-11ee-935d-0242ac110006','',0),('fbe9f50f-bb1b-11ee-935d-0242ac110006','58edd921-0af3-4d2a-b8dd-93ac24f1b9a8','74f2dd1a-b5ae-11ee-935d-0242ac110006','2024-01-25 09:52:15',1,'5d201e83-b102-11ee-935d-0242ac110006','15b68e54-b0f0-11ee-935d-0242ac110006','a',1),('15b447a5-bb1c-11ee-935d-0242ac110006','58edd921-0af3-4d2a-b8dd-93ac24f1b9a8','bf9d039f-ba87-11ee-935d-0242ac110006','2024-01-25 09:52:59',2,'5d201e83-b102-11ee-935d-0242ac110006','15b68e54-b0f0-11ee-935d-0242ac110006','a',0),('ab4d1ecc-bb50-11ee-935d-0242ac110006',NULL,'98750f73-bb4c-11ee-935d-0242ac110006','2024-01-25 00:00:00',10,'996f2533-bb4e-11ee-935d-0242ac110006','c3470285-bb49-11ee-935d-0242ac110006','11',0),('0fd1a412-bb58-11ee-935d-0242ac110006','40dd51f7-bdd9-430d-9a6c-5f06f6de6d80','74f2dd1a-b5ae-11ee-935d-0242ac110006','2024-01-25 17:02:19',111,'5d201e83-b102-11ee-935d-0242ac110006','15b68e54-b0f0-11ee-935d-0242ac110006','a',1),('895cfed5-bb62-11ee-935d-0242ac110006',NULL,'bf9d039f-ba87-11ee-935d-0242ac110006','2024-01-25 00:00:00',300,'a6b32379-b6a0-11ee-935d-0242ac110006','15b68e54-b0f0-11ee-935d-0242ac110006','케찹 보충',1),('eadfcad8-bcf9-11ee-935d-0242ac110006',NULL,'bf9d039f-ba87-11ee-935d-0242ac110006','2024-01-27 00:00:00',300,'a6b32379-b6a0-11ee-935d-0242ac110006','4012f422-ba87-11ee-935d-0242ac110006','',0),('5afad747-bcfc-11ee-935d-0242ac110006',NULL,'49787028-b11b-11ee-935d-0242ac110006','2024-01-27 00:00:00',200,'a6b32379-b6a0-11ee-935d-0242ac110006','4012f422-ba87-11ee-935d-0242ac110006','',1),('6bb04f29-bcfc-11ee-935d-0242ac110006',NULL,'01481d42-b419-11ee-935d-0242ac110006','2024-01-27 00:00:00',400,'996f2533-bb4e-11ee-935d-0242ac110006','4012f422-ba87-11ee-935d-0242ac110006','',1),('e4532398-bdb1-11ee-935d-0242ac110006',NULL,'bf9d039f-ba87-11ee-935d-0242ac110006','2024-01-28 00:00:00',300,'5d201e83-b102-11ee-935d-0242ac110006','4012f422-ba87-11ee-935d-0242ac110006','',1);
/*!40000 ALTER TABLE `product_in` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_out`
--

DROP TABLE IF EXISTS `product_out`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_out` (
  `id` uuid NOT NULL,
  `product_id` uuid NOT NULL,
  `quantity` int(11) NOT NULL,
  `expected_delivery_date` date DEFAULT NULL,
  `delivery_date` datetime DEFAULT NULL,
  `warehouse_id` uuid NOT NULL,
  `manager_id` uuid NOT NULL,
  `note` varchar(2000) DEFAULT NULL,
  `activation` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `FK_product_TO_product_out_1` (`product_id`),
  KEY `FK_warehouse_TO_product_out_1` (`warehouse_id`),
  KEY `FK_account_TO_product_out_1` (`manager_id`),
  CONSTRAINT `FK_account_TO_product_out_1` FOREIGN KEY (`manager_id`) REFERENCES `account` (`id`),
  CONSTRAINT `FK_product_TO_product_out_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`),
  CONSTRAINT `FK_warehouse_TO_product_out_1` FOREIGN KEY (`warehouse_id`) REFERENCES `warehouse` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_out`
--

LOCK TABLES `product_out` WRITE;
/*!40000 ALTER TABLE `product_out` DISABLE KEYS */;
INSERT INTO `product_out` VALUES ('b919fcf5-b7ac-11ee-935d-0242ac110006','49787028-b11b-11ee-935d-0242ac110006',202,'2024-01-23','2024-01-20 16:59:13','846f1f68-aeb3-11ee-935d-0242ac110006','15b68e54-b0f0-11ee-935d-0242ac110006','바로 출고 ㄱㄱ',1),('2a58d019-b7ae-11ee-935d-0242ac110006','01481d42-b419-11ee-935d-0242ac110006',505,'2024-02-24','2024-01-22 09:10:33','a6b32379-b6a0-11ee-935d-0242ac110006','15b68e54-b0f0-11ee-935d-0242ac110006','출고 테스트',1),('8dbac0db-b8d8-11ee-935d-0242ac110006','bf255eab-af88-11ee-935d-0242ac110006',550,'2024-02-26','2024-01-22 08:02:13','846f1f68-aeb3-11ee-935d-0242ac110006','15b68e54-b0f0-11ee-935d-0242ac110006','테스트3',1),('0ba29929-b906-11ee-935d-0242ac110006','74f2dd1a-b5ae-11ee-935d-0242ac110006',25,'2024-02-02','2024-01-28 03:17:00','a6b32379-b6a0-11ee-935d-0242ac110006','15b68e54-b0f0-11ee-935d-0242ac110006','출고 눌러 보기! \n출고 누른 후 현재시간으로 출고날짜 등록,\nread에서 출고버튼 사라짐\n출고된 양의 따라 warehouse테이블의 current_capacity, stock테이블의 quantity도 같이 감소',1),('d0ef8369-ba96-11ee-935d-0242ac110006','bf9d039f-ba87-11ee-935d-0242ac110006',50,'2024-01-24','2024-01-24 09:00:25','5d201e83-b102-11ee-935d-0242ac110006','4012f422-ba87-11ee-935d-0242ac110006','케찹 출고',1),('a2974914-bb68-11ee-935d-0242ac110006','49787028-b11b-11ee-935d-0242ac110006',600,'2024-01-30',NULL,'83d7cc69-aeb3-11ee-935d-0242ac110006','4012f422-ba87-11ee-935d-0242ac110006','화요일 600개 출고예정',1),('40161f51-bdaa-11ee-935d-0242ac110006','bf9d039f-ba87-11ee-935d-0242ac110006',156,'2024-01-31','2024-01-28 07:00:55','5d201e83-b102-11ee-935d-0242ac110006','15b68e54-b0f0-11ee-935d-0242ac110006','테스트',1);
/*!40000 ALTER TABLE `product_out` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reset_password`
--

DROP TABLE IF EXISTS `reset_password`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reset_password` (
  `id` uuid NOT NULL,
  `account_id` uuid NOT NULL,
  `note` varchar(200) DEFAULT NULL,
  `date` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_account_TO_reset_password_1` (`account_id`),
  CONSTRAINT `FK_account_TO_reset_password_1` FOREIGN KEY (`account_id`) REFERENCES `account` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reset_password`
--

LOCK TABLES `reset_password` WRITE;
/*!40000 ALTER TABLE `reset_password` DISABLE KEYS */;
INSERT INTO `reset_password` VALUES ('c714b031-b59c-11ee-935d-0242ac110006','83eab03b-ae95-11ee-935d-0242ac110006','1234','2024-01-18'),('c71ebbf9-b59c-11ee-935d-0242ac110006','83f11782-ae95-11ee-935d-0242ac110006','1234','2024-01-18'),('c72b5db5-b59c-11ee-935d-0242ac110006','83fc5b4a-ae95-11ee-935d-0242ac110006','비밀번호를 까먹었습니다.','2024-01-18'),('c766d955-bd8d-11ee-935d-0242ac110006','e948d635-aeb2-11ee-935d-0242ac110006','1','2024-01-23'),('c76b78bb-bd8d-11ee-935d-0242ac110006','e953f305-aeb2-11ee-935d-0242ac110006','2','2024-01-16'),('c77ca501-bd8d-11ee-935d-0242ac110006','e95c78c9-aeb2-11ee-935d-0242ac110006','3','2024-01-08'),('c78452c8-bd8d-11ee-935d-0242ac110006','e9603857-aeb2-11ee-935d-0242ac110006','4','2024-01-22'),('c7892818-bd8d-11ee-935d-0242ac110006','e9683728-aeb2-11ee-935d-0242ac110006','5','2024-01-02'),('c791fae1-bd8d-11ee-935d-0242ac110006','e96dc62d-aeb2-11ee-935d-0242ac110006','6','2024-01-29'),('c7978cd5-bd8d-11ee-935d-0242ac110006','e97598b7-aeb2-11ee-935d-0242ac110006','7','2024-01-28'),('c7a588d1-bd8d-11ee-935d-0242ac110006','e979898e-aeb2-11ee-935d-0242ac110006','8','2024-01-02'),('c7aa3858-bd8d-11ee-935d-0242ac110006','e983eab3-aeb2-11ee-935d-0242ac110006','9','2024-01-27'),('c7b22449-bd8d-11ee-935d-0242ac110006','e9882095-aeb2-11ee-935d-0242ac110006','10','2024-01-07'),('c7b6ed8b-bd8d-11ee-935d-0242ac110006','e9929470-aeb2-11ee-935d-0242ac110006','11','2024-01-27'),('c7c168ab-bd8d-11ee-935d-0242ac110006','e997229f-aeb2-11ee-935d-0242ac110006','12','2024-01-14'),('c7c63b3b-bd8d-11ee-935d-0242ac110006','e9a1c271-aeb2-11ee-935d-0242ac110006','13','2024-01-06'),('c7cf17ae-bd8d-11ee-935d-0242ac110006','e9a699b8-aeb2-11ee-935d-0242ac110006','14','2024-01-26'),('c7d304dc-bd8d-11ee-935d-0242ac110006','e9b3a19b-aeb2-11ee-935d-0242ac110006','15','2024-01-08'),('c7dcacfc-bd8d-11ee-935d-0242ac110006','e9bc0b21-aeb2-11ee-935d-0242ac110006','16','2024-01-14'),('c7e0efe9-bd8d-11ee-935d-0242ac110006','e9c2d587-aeb2-11ee-935d-0242ac110006','17','2024-01-21'),('c7e8ce80-bd8d-11ee-935d-0242ac110006','e9c7ff8b-aeb2-11ee-935d-0242ac110006','18','2024-01-14');
/*!40000 ALTER TABLE `reset_password` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stock`
--

DROP TABLE IF EXISTS `stock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stock` (
  `id` uuid NOT NULL,
  `warehouse_id` uuid NOT NULL,
  `product_id` uuid NOT NULL,
  `quantity` int(11) NOT NULL,
  `activation` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `FK_warehouse_TO_stock_1` (`warehouse_id`),
  KEY `FK_product_TO_stock_1` (`product_id`),
  CONSTRAINT `FK_product_TO_stock_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`),
  CONSTRAINT `FK_warehouse_TO_stock_1` FOREIGN KEY (`warehouse_id`) REFERENCES `warehouse` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stock`
--

LOCK TABLES `stock` WRITE;
/*!40000 ALTER TABLE `stock` DISABLE KEYS */;
INSERT INTO `stock` VALUES ('7998ba4c-b7a6-11ee-935d-0242ac110006','83d7cc69-aeb3-11ee-935d-0242ac110006','74f2dd1a-b5ae-11ee-935d-0242ac110006',126,1),('400d2560-b7a8-11ee-935d-0242ac110006','ed5d0efb-aea3-11ee-935d-0242ac110006','74f2dd1a-b5ae-11ee-935d-0242ac110006',10,1),('4e66ccd4-b7a8-11ee-935d-0242ac110006','83dd7c4e-aeb3-11ee-935d-0242ac110006','74f2dd1a-b5ae-11ee-935d-0242ac110006',1500,1),('5590d916-b7a8-11ee-935d-0242ac110006','84473372-aeb3-11ee-935d-0242ac110006','bf255eab-af88-11ee-935d-0242ac110006',337,1),('7296f9bd-b7a8-11ee-935d-0242ac110006','83d7cc69-aeb3-11ee-935d-0242ac110006','01481d42-b419-11ee-935d-0242ac110006',137,1),('7cb78d2d-b7a9-11ee-935d-0242ac110006','83d7cc69-aeb3-11ee-935d-0242ac110006','49787028-b11b-11ee-935d-0242ac110006',606,1),('9dd88606-b7a9-11ee-935d-0242ac110006','846f1f68-aeb3-11ee-935d-0242ac110006','49787028-b11b-11ee-935d-0242ac110006',575,1),('b8b34243-b7a9-11ee-935d-0242ac110006','846f1f68-aeb3-11ee-935d-0242ac110006','bf255eab-af88-11ee-935d-0242ac110006',5,1),('ff6c0224-b7a9-11ee-935d-0242ac110006','83d7cc69-aeb3-11ee-935d-0242ac110006','49787028-b11b-11ee-935d-0242ac110006',222,0),('c421be09-b7ab-11ee-935d-0242ac110006','83d7cc69-aeb3-11ee-935d-0242ac110006','01481d42-b419-11ee-935d-0242ac110006',409,0),('352f624d-b8c0-11ee-935d-0242ac110006','5d201e83-b102-11ee-935d-0242ac110006','49787028-b11b-11ee-935d-0242ac110006',557,1),('773e0c10-b8c3-11ee-935d-0242ac110006','5d201e83-b102-11ee-935d-0242ac110006','c3640de1-aeb9-11ee-935d-0242ac110006',600,1),('4532cb6a-b8f5-11ee-935d-0242ac110006','a6b32379-b6a0-11ee-935d-0242ac110006','74f2dd1a-b5ae-11ee-935d-0242ac110006',175,1),('415166f5-ba64-11ee-935d-0242ac110006','5d201e83-b102-11ee-935d-0242ac110006','74f2dd1a-b5ae-11ee-935d-0242ac110006',123,1),('858d5a63-ba88-11ee-935d-0242ac110006','5d201e83-b102-11ee-935d-0242ac110006','bf9d039f-ba87-11ee-935d-0242ac110006',344,1),('a1c03152-bb16-11ee-935d-0242ac110006','a6b32379-b6a0-11ee-935d-0242ac110006','bf9d039f-ba87-11ee-935d-0242ac110006',300,1),('5ae902b5-bcfc-11ee-935d-0242ac110006','a6b32379-b6a0-11ee-935d-0242ac110006','49787028-b11b-11ee-935d-0242ac110006',200,1),('6ba4cb84-bcfc-11ee-935d-0242ac110006','996f2533-bb4e-11ee-935d-0242ac110006','01481d42-b419-11ee-935d-0242ac110006',500,1),('cde584f4-bd8f-11ee-935d-0242ac110006','a6b32379-b6a0-11ee-935d-0242ac110006','c3640de1-aeb9-11ee-935d-0242ac110006',1000,0);
/*!40000 ALTER TABLE `stock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vendor`
--

DROP TABLE IF EXISTS `vendor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vendor` (
  `id` uuid NOT NULL,
  `name` varchar(100) NOT NULL,
  `president_name` varchar(60) DEFAULT NULL,
  `address` varchar(200) DEFAULT NULL,
  `registration_number` varchar(30) DEFAULT NULL,
  `email` varchar(60) DEFAULT NULL,
  `president_telephone` varchar(25) DEFAULT NULL,
  `vendor_manager` varchar(45) DEFAULT NULL,
  `vendor_manager_telephone` varchar(25) DEFAULT NULL,
  `main_product` varchar(100) DEFAULT NULL,
  `manager_id` uuid NOT NULL,
  `activation` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  UNIQUE KEY `registration_number` (`registration_number`),
  KEY `FK_account_TO_vendor_1` (`manager_id`),
  CONSTRAINT `FK_account_TO_vendor_1` FOREIGN KEY (`manager_id`) REFERENCES `account` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vendor`
--

LOCK TABLES `vendor` WRITE;
/*!40000 ALTER TABLE `vendor` DISABLE KEYS */;
INSERT INTO `vendor` VALUES ('52f16bb8-aeb9-11ee-935d-0242ac110006','넘버원물산','넘버원','경기도 남양주시 호평동','3613300211','qweqwe@qw.e','0211112222','김이최','01011112222','마시는 홍초','83a25f06-ae95-11ee-935d-0242ac110006',1),('9898c39e-b07b-11ee-935d-0242ac110006','Gabvine','Lee','Suite 100','615-799-1518','bowthwaite0@thetimes.co.uk','587-312-7250','Brnaba','273-119-4664','Bread - Pita, Mini','e9390eef-aeb2-11ee-935d-0242ac110006',1),('98a86b09-b07b-11ee-935d-0242ac110006','Ooba','Darla','Apt 7','116-360-4398','olenard1@google.pl','802-962-3627','Odey','532-687-7005','Beef - Ground Lean Fresh','e9344647-aeb2-11ee-935d-0242ac110006',1),('98aca2b1-b07b-11ee-935d-0242ac110006','Tazz','Peyter','Room 1502','232-767-9493','gpestridge2@seattletimes.com','889-358-2427','Gray','575-934-8432','Wine - Alicanca Vinho Verde','e9294a5d-aeb2-11ee-935d-0242ac110006',1),('98bf5774-b07b-11ee-935d-0242ac110006','Plajo','Tiebout','19th Floor','132-811-4610','acottis3@scientificamerican.com','563-856-2478','Alfy','658-672-4793','Pasta - Bauletti, Chicken White','e92277c4-aeb2-11ee-935d-0242ac110006',1),('98c434df-b07b-11ee-935d-0242ac110006','Photobug','Lillian','3rd Floor','421-699-0076','ikilfether4@desdev.cn','862-313-2213','Ives','216-437-9781','Wine - White, Mosel Gold','e91d8fc1-aeb2-11ee-935d-0242ac110006',1),('98d2246d-b07b-11ee-935d-0242ac110006','Tazzy','Dorena','PO Box 40782','424-537-4744','hferryman5@biblegateway.com','917-314-4070','Hinze','786-263-0627','Pickles - Gherkins','840b85c0-ae95-11ee-935d-0242ac110006',1),('98d76481-b07b-11ee-935d-0242ac110006','Photobug','Bernice','PO Box 88062','988-271-9376','abaleine6@skype.com','999-768-2955','Adan','693-576-3389','Pork - Ground','840185ff-ae95-11ee-935d-0242ac110006',1),('98e05c5a-b07b-11ee-935d-0242ac110006','Npath','Luce','Room 113','762-503-7125','apanichelli7@reference.com','940-940-1593','Archaimbaud','634-422-3310','Sauce Bbq Smokey','83fc5b4a-ae95-11ee-935d-0242ac110006',1),('98e3d83b-b07b-11ee-935d-0242ac110006','Quatz','Milzie','Room 1930','720-314-2958','dstapleton8@weather.com','665-342-1664','Dall','440-755-1169','Oil - Sesame','83f11782-ae95-11ee-935d-0242ac110006',1),('98eff57f-b07b-11ee-935d-0242ac110006','Gigabox','Florie','Apt 1215','524-297-1484','htaylour9@earthlink.net','918-838-9083','Harry','179-948-3253','Chinese Foods - Pepper Beef','83eab03b-ae95-11ee-935d-0242ac110006',1),('98f4f109-b07b-11ee-935d-0242ac110006','Gabtype','Bekki','PO Box 84116','413-799-0500','ogavea@nih.gov','866-669-2387','Odie','782-916-3156','Brandy Cherry - Mcguinness','83db5495-ae95-11ee-935d-0242ac110006',1),('98fdc7c3-b07b-11ee-935d-0242ac110006','Myworks','Shep','Suite 41','605-204-5516','cnelthorpeb@google.cn','587-835-5204','Cece','783-236-6240','Champagne - Brights, Dry','83d0041a-ae95-11ee-935d-0242ac110006',1),('9902a128-b07b-11ee-935d-0242ac110006','Edgeclub','Erl','PO Box 51255','140-861-5380','ghugkc@umich.edu','989-337-1416','Gherardo','798-620-4803','Dish Towel','83bdda69-ae95-11ee-935d-0242ac110006',1),('990a531e-b07b-11ee-935d-0242ac110006','Divape','Hank','PO Box 35046','635-909-1332','eambrogiod@aol.com','893-142-3729','Evan','137-401-0834','Chips - Potato Jalapeno','83a991fe-ae95-11ee-935d-0242ac110006',1),('990ed5c6-b07b-11ee-935d-0242ac110006','Twiyo','Shirl','Room 940','863-787-2442','eyitzowitze@ucoz.com','858-315-9490','Erasmus','922-194-2347','Cheese - Shred Cheddar / Mozza','83a25f06-ae95-11ee-935d-0242ac110006',1),('991c5523-b07b-11ee-935d-0242ac110006','Voolia','Wald','Apt 194','946-655-2600','nwestoverf@free.fr','546-540-8321','Nick','447-135-8352','Hold Up Tool Storage Rack','e948d635-aeb2-11ee-935d-0242ac110006',1),('991f7b40-b07b-11ee-935d-0242ac110006','Agimba','Adelaida','Room 685','819-284-6899','cgaleag@ovh.net','975-485-6198','Chalmers','111-426-5650','Ostrich - Fan Fillet','e953f305-aeb2-11ee-935d-0242ac110006',1),('9929752b-b07b-11ee-935d-0242ac110006','Devbug','Lem','5th Floor','102-576-2775','gquarringtonh@dmoz.org','194-851-4424','Gael','684-871-8885','Sprouts - Brussel','e95c78c9-aeb2-11ee-935d-0242ac110006',1),('992ec869-b07b-11ee-935d-0242ac110006','Yodoo','Alameda','Apt 1753','828-959-5822','gspowagei@marriott.com','799-680-1004','Garrott','989-992-7287','Pickerel - Fillets','e9603857-aeb2-11ee-935d-0242ac110006',1),('99381058-b07b-11ee-935d-0242ac110006','Tavu','Bard','Suite 43','571-973-4594','frosenzveigj@admin.ch','488-353-6977','Frederico','961-878-9231','Crab Meat Claw Pasteurise','e9683728-aeb2-11ee-935d-0242ac110006',1),('993bfadf-b07b-11ee-935d-0242ac110006','Kimia','Dasi','Suite 84','456-188-7823','vledingtonk@dailymail.co.uk','406-907-3855','Von','449-622-9341','Muffin Mix - Banana Nut','e96dc62d-aeb2-11ee-935d-0242ac110006',1),('9946168d-b07b-11ee-935d-0242ac110006','Zoomlounge','Hollie','Room 185','430-959-1208','mkemelll@soup.io','975-789-2291','Mohandis','862-439-6422','Ham - Cooked Italian','e97598b7-aeb2-11ee-935d-0242ac110006',1),('994b1861-b07b-11ee-935d-0242ac110006','Katz','Barnabe','Suite 17','983-959-1639','ksimem@flickr.com','712-346-4294','Kennie','545-866-0260','Raisin - Golden','e979898e-aeb2-11ee-935d-0242ac110006',1),('995c54fa-b07b-11ee-935d-0242ac110006','Yombu','Benni','Room 1628','952-195-2379','wsemirazo@si.edu','951-749-3785','Wainwright','821-501-7873','Soup - Campbells Beef Noodle','e9882095-aeb2-11ee-935d-0242ac110006',1),('99664fc4-b07b-11ee-935d-0242ac110006','Wordtune','Jaimie','Apt 1256','324-703-1627','imusselwhitep@furl.net','428-579-1662','Isacco','710-886-2816','Sauerkraut','e9929470-aeb2-11ee-935d-0242ac110006',1),('996b6468-b07b-11ee-935d-0242ac110006','Dynava','Ali','Apt 920','707-621-0517','grayeq@qq.com','193-727-4816','Garvey','538-188-8129','Cheese - Fontina','e997229f-aeb2-11ee-935d-0242ac110006',1),('997b9a74-b07b-11ee-935d-0242ac110006','Ainyx','Georgi','Apt 383','860-715-3788','bmcmanusr@dagondesign.com','500-184-1085','Byrle','500-132-7463','Beef Cheek Fresh','e9a1c271-aeb2-11ee-935d-0242ac110006',1),('997ff099-b07b-11ee-935d-0242ac110006','Lazzy','Spence','5th Floor','749-385-9496','fleppos@amazon.de','408-427-4152','Forrest','783-409-7238','Squash - Pepper','e9a699b8-aeb2-11ee-935d-0242ac110006',1),('9989b5a7-b07b-11ee-935d-0242ac110006','Realfire','Dennet','PO Box 66411','136-863-5317','kpalisert@wikipedia.org','353-378-5857','Kevin','619-226-1502','Sugar - Icing','e9b3a19b-aeb2-11ee-935d-0242ac110006',1),('998f4379-b07b-11ee-935d-0242ac110006','Fatz','Codie','18th Floor','549-503-3695','cgoodbournu@shop-pro.jp','379-729-2149','Chuck','950-354-0593','Pastry - Cherry Danish - Mini','e9bc0b21-aeb2-11ee-935d-0242ac110006',1),('9998a53d-b07b-11ee-935d-0242ac110006','Zoomdog','Caitlin','Apt 1985','477-652-5767','dfraynv@paypal.com','955-925-9732','De witt','336-205-9427','Wine - Casablanca Valley','e9c2d587-aeb2-11ee-935d-0242ac110006',1),('99a009ab-b07b-11ee-935d-0242ac110006','Shuffledrive','Doroteya','Suite 60','979-537-5255','hbrunaw@rakuten.co.jp','876-436-2213','Hugh','302-763-0460','Tomatoes - Hot House','e9c7ff8b-aeb2-11ee-935d-0242ac110006',1),('99ae7f0c-b07b-11ee-935d-0242ac110006','Riffwire','Herrick','PO Box 8572','232-108-2659','acallanx@technorati.com','416-557-3481','Alphard','324-354-0610','Sorrel - Fresh','e9d27ce8-aeb2-11ee-935d-0242ac110006',1),('99b309b5-b07b-11ee-935d-0242ac110006','Minyx','Bert','Room 797','778-744-9931','hfrancy@cornell.edu','640-287-9872','Hodge','265-703-3592','Wine - Charddonnay Errazuriz','e9da8ce0-aeb2-11ee-935d-0242ac110006',1),('99bc1d73-b07b-11ee-935d-0242ac110006','Topdrive','Vilma','PO Box 79309','653-895-7004','bzecchiz@people.com.cn','485-437-2728','Byrom','819-445-5399','Hold Up Tool Storage Rack','e9e461ad-aeb2-11ee-935d-0242ac110006',1),('99c0b719-b07b-11ee-935d-0242ac110006','Edgeify','Fran','Room 897','238-491-4142','etune10@1und1.de','310-890-4730','Earle','800-936-2795','Wine - Merlot Vina Carmen','e9f5e867-aeb2-11ee-935d-0242ac110006',1),('99d09d4c-b07b-11ee-935d-0242ac110006','Wordpedia','Dona','Apt 1996','686-713-8998','cdeek11@samsung.com','393-130-4710','Cobbie','788-826-3111','Dill Weed - Dry','e9fe0e99-aeb2-11ee-935d-0242ac110006',1),('99d47e4d-b07b-11ee-935d-0242ac110006','Gevee','Johny','PO Box 36911','332-556-7476','jgriswood12@sitemeter.com','979-657-8304','Jerome','980-159-5855','Iced Tea - Lemon, 340ml','ea028d2e-aeb2-11ee-935d-0242ac110006',1),('99de4607-b07b-11ee-935d-0242ac110006','Avamba','Adelind','4th Floor','164-654-7919','wgryglewski13@miibeian.gov.cn','313-608-3944','Ware','163-513-0194','Muffin Batt - Choc Chk','ea129f3b-aeb2-11ee-935d-0242ac110006',1),('ff3cd54f-b100-11ee-935d-0242ac110006','no.1','박성수','박성수','156-189-19856','psss226@naver.com','156-189-19856','박성수','156-189-19856','박성수','15b68e54-b0f0-11ee-935d-0242ac110006',1);
/*!40000 ALTER TABLE `vendor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `warehouse`
--

DROP TABLE IF EXISTS `warehouse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `warehouse` (
  `id` uuid NOT NULL,
  `name` varchar(60) NOT NULL,
  `capacity` int(11) DEFAULT NULL,
  `current_capacity` int(11) DEFAULT 0,
  `manager_id` uuid NOT NULL,
  `address` varchar(200) DEFAULT NULL,
  `activation` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `FK_account_TO_warehouse_1` (`manager_id`),
  CONSTRAINT `FK_account_TO_warehouse_1` FOREIGN KEY (`manager_id`) REFERENCES `account` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `warehouse`
--

LOCK TABLES `warehouse` WRITE;
/*!40000 ALTER TABLE `warehouse` DISABLE KEYS */;
INSERT INTO `warehouse` VALUES ('30fddbe8-ae96-11ee-935d-0242ac110006','Gayle',1000,0,'83a25f06-ae95-11ee-935d-0242ac110006','Room 1430',1),('310b2cfc-ae96-11ee-935d-0242ac110006','Gibb',1000,0,'83a991fe-ae95-11ee-935d-0242ac110006','PO Box 58064',1),('31100567-ae96-11ee-935d-0242ac110006','Shanda',1000,0,'83bdda69-ae95-11ee-935d-0242ac110006','Suite 15',1),('31235b70-ae96-11ee-935d-0242ac110006','Jacqueline',1000,0,'83db5495-ae95-11ee-935d-0242ac110006','Room 258',1),('312fc123-ae96-11ee-935d-0242ac110006','Leda',1000,0,'83eab03b-ae95-11ee-935d-0242ac110006','Apt 1088',1),('313756c9-ae96-11ee-935d-0242ac110006','Kirsten',1000,0,'83f11782-ae95-11ee-935d-0242ac110006','Room 669',1),('3141a3b9-ae96-11ee-935d-0242ac110006','Gleda',1000,0,'83fc5b4a-ae95-11ee-935d-0242ac110006','Suite 57',1),('31468a2b-ae96-11ee-935d-0242ac110006','Ira',1000,0,'840185ff-ae95-11ee-935d-0242ac110006','Suite 3',1),('314ece09-ae96-11ee-935d-0242ac110006','Tadeas',1000,0,'840b85c0-ae95-11ee-935d-0242ac110006','Apt 1516',1),('ecffd0b9-aea3-11ee-935d-0242ac110006','Gayle',1000,0,'83a25f06-ae95-11ee-935d-0242ac110006','Room 1430',1),('ed04aa91-aea3-11ee-935d-0242ac110006','Gibb',1000,0,'83a991fe-ae95-11ee-935d-0242ac110006','PO Box 58064',1),('ed1505cf-aea3-11ee-935d-0242ac110006','Shanda',1000,0,'83bdda69-ae95-11ee-935d-0242ac110006','Suite 15',1),('ed35a8bb-aea3-11ee-935d-0242ac110006','Jacqueline',1000,0,'83db5495-ae95-11ee-935d-0242ac110006','Room 258',1),('ed3df606-aea3-11ee-935d-0242ac110006','Leda',1000,0,'83eab03b-ae95-11ee-935d-0242ac110006','Apt 1088',1),('ed421777-aea3-11ee-935d-0242ac110006','Kirsten',1000,0,'83f11782-ae95-11ee-935d-0242ac110006','Room 669',1),('ed4dda47-aea3-11ee-935d-0242ac110006','Gleda',1000,0,'83fc5b4a-ae95-11ee-935d-0242ac110006','Suite 57',1),('ed52161d-aea3-11ee-935d-0242ac110006','Ira',1000,0,'840185ff-ae95-11ee-935d-0242ac110006','Suite 3',1),('ed5d0efb-aea3-11ee-935d-0242ac110006','Tadeas',1000,10,'840b85c0-ae95-11ee-935d-0242ac110006','Apt 1516',1),('8383840a-aeb3-11ee-935d-0242ac110006','Maskrey',1500,0,'ea129f3b-aeb2-11ee-935d-0242ac110006','Room 98',1),('8388c31b-aeb3-11ee-935d-0242ac110006','Idell',1500,0,'ea028d2e-aeb2-11ee-935d-0242ac110006','Apt 1947',1),('83a5ebd9-aeb3-11ee-935d-0242ac110006','Deeble',1500,0,'e9fe0e99-aeb2-11ee-935d-0242ac110006','Suite 51',1),('83aa58bb-aeb3-11ee-935d-0242ac110006','Sidery',1500,0,'e9f5e867-aeb2-11ee-935d-0242ac110006','15th Floor',1),('83bc8cec-aeb3-11ee-935d-0242ac110006','Marvel',1500,0,'e9e461ad-aeb2-11ee-935d-0242ac110006','PO Box 17810',1),('83c6d008-aeb3-11ee-935d-0242ac110006','Connichie',1500,0,'e9da8ce0-aeb2-11ee-935d-0242ac110006','PO Box 23696',1),('83cc80b5-aeb3-11ee-935d-0242ac110006','Liquorish',1500,0,'e9d27ce8-aeb2-11ee-935d-0242ac110006','Room 1705',1),('83d7cc69-aeb3-11ee-935d-0242ac110006','Venton',1500,869,'e9c7ff8b-aeb2-11ee-935d-0242ac110006','Apt 1752',1),('83dd7c4e-aeb3-11ee-935d-0242ac110006','Munden',1500,1500,'e9c2d587-aeb2-11ee-935d-0242ac110006','PO Box 1327',1),('83e5ae10-aeb3-11ee-935d-0242ac110006','Towriss',1500,0,'e9bc0b21-aeb2-11ee-935d-0242ac110006','3rd Floor',1),('83e9a6cf-aeb3-11ee-935d-0242ac110006','Hauxwell',1500,0,'e9b3a19b-aeb2-11ee-935d-0242ac110006','Suite 15',1),('83f44800-aeb3-11ee-935d-0242ac110006','Elderton',1500,0,'e9a699b8-aeb2-11ee-935d-0242ac110006','Suite 2',1),('83f8ed56-aeb3-11ee-935d-0242ac110006','Stile',1500,0,'e9a1c271-aeb2-11ee-935d-0242ac110006','Room 1481',1),('8401ccf9-aeb3-11ee-935d-0242ac110006','Grave',1500,0,'e997229f-aeb2-11ee-935d-0242ac110006','6th Floor',1),('8410cbe3-aeb3-11ee-935d-0242ac110006','Mazzeo',1500,0,'e9882095-aeb2-11ee-935d-0242ac110006','4th Floor',1),('841604ea-aeb3-11ee-935d-0242ac110006','Scolding',1500,0,'e983eab3-aeb2-11ee-935d-0242ac110006','Room 480',1),('842a84e9-aeb3-11ee-935d-0242ac110006','Simonsson',1500,0,'e979898e-aeb2-11ee-935d-0242ac110006','PO Box 25524',1),('842eabea-aeb3-11ee-935d-0242ac110006','Rosenvasser',1500,0,'e97598b7-aeb2-11ee-935d-0242ac110006','PO Box 66312',1),('8435cc5c-aeb3-11ee-935d-0242ac110006','Bruggen',1500,0,'e96dc62d-aeb2-11ee-935d-0242ac110006','Suite 43',1),('843a665f-aeb3-11ee-935d-0242ac110006','Arrol',1500,0,'e9683728-aeb2-11ee-935d-0242ac110006','Apt 253',0),('8441e31b-aeb3-11ee-935d-0242ac110006','Walthew',1500,0,'e9603857-aeb2-11ee-935d-0242ac110006','PO Box 28053',1),('84473372-aeb3-11ee-935d-0242ac110006','Seeds',1500,337,'e95c78c9-aeb2-11ee-935d-0242ac110006','2nd Floor',1),('845722d5-aeb3-11ee-935d-0242ac110006','Creser',1500,0,'e953f305-aeb2-11ee-935d-0242ac110006','Suite 80',1),('845be537-aeb3-11ee-935d-0242ac110006','Maffulli',1500,0,'e948d635-aeb2-11ee-935d-0242ac110006','6th Floor',1),('84665d7d-aeb3-11ee-935d-0242ac110006','Costellow',1500,0,'e9390eef-aeb2-11ee-935d-0242ac110006','PO Box 58811',1),('846f1f68-aeb3-11ee-935d-0242ac110006','Woolf',1500,1332,'e9344647-aeb2-11ee-935d-0242ac110006','Room 144',1),('848bec5f-aeb3-11ee-935d-0242ac110006','Corker',1500,0,'840b85c0-ae95-11ee-935d-0242ac110006','Apt 1489',1),('84a02b74-aeb3-11ee-935d-0242ac110006','Siddon',1500,0,'83fc5b4a-ae95-11ee-935d-0242ac110006','PO Box 89900',1),('84a74263-aeb3-11ee-935d-0242ac110006','Beney',1500,0,'83f11782-ae95-11ee-935d-0242ac110006','17th Floor',1),('84ba5265-aeb3-11ee-935d-0242ac110006','Gritland',1500,0,'83d0041a-ae95-11ee-935d-0242ac110006','Apt 1531',1),('84c43209-aeb3-11ee-935d-0242ac110006','Sprigg',1500,0,'83bdda69-ae95-11ee-935d-0242ac110006','5th Floor',1),('84c87207-aeb3-11ee-935d-0242ac110006','Drynan',1500,0,'83a991fe-ae95-11ee-935d-0242ac110006','Suite 31',1),('5d201e83-b102-11ee-935d-0242ac110006','신세계',3000,345,'e9882095-aeb2-11ee-935d-0242ac110006','의정부',1),('a6b32379-b6a0-11ee-935d-0242ac110006','의정부2',2500,-1530,'15b68e54-b0f0-11ee-935d-0242ac110006','의정부동',1),('996f2533-bb4e-11ee-935d-0242ac110006','평양',5000,100,'15b68e54-b0f0-11ee-935d-0242ac110006','평양',1);
/*!40000 ALTER TABLE `warehouse` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-01-28 19:45:37
