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
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-01-28 19:46:30
