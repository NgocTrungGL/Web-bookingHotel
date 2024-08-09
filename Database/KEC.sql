-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: web_booking
-- ------------------------------------------------------
-- Server version	8.0.36

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
-- Table structure for table `dich_vu`
--

DROP TABLE IF EXISTS `dich_vu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dich_vu` (
  `id_dich_vu` int NOT NULL AUTO_INCREMENT,
  `ten_dich_vu` varchar(100) DEFAULT NULL,
  `gia_dich_vu` float DEFAULT NULL,
  `mo_ta` text,
  `ma_KS` int DEFAULT NULL,
  PRIMARY KEY (`id_dich_vu`),
  KEY `ma_KS` (`ma_KS`),
  CONSTRAINT `dich_vu_ibfk_1` FOREIGN KEY (`ma_KS`) REFERENCES `khach_san` (`ma_KS`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dich_vu`
--

LOCK TABLES `dich_vu` WRITE;
/*!40000 ALTER TABLE `dich_vu` DISABLE KEYS */;
/*!40000 ALTER TABLE `dich_vu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `giao_dich`
--

DROP TABLE IF EXISTS `giao_dich`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `giao_dich` (
  `ma_GD` int NOT NULL AUTO_INCREMENT,
  `ngay_dat` date DEFAULT NULL,
  `ngay_gio_nhan` datetime DEFAULT NULL,
  `ngay_gio_tra` datetime DEFAULT NULL,
  `tien` float DEFAULT NULL,
  `status` enum('-1','0','1') DEFAULT NULL,
  `ma_Phong` int DEFAULT NULL,
  `CCCD` varchar(12) DEFAULT NULL,
  PRIMARY KEY (`ma_GD`),
  KEY `ma_Phong` (`ma_Phong`),
  KEY `CCCD` (`CCCD`),
  CONSTRAINT `giao_dich_ibfk_1` FOREIGN KEY (`ma_Phong`) REFERENCES `phong` (`ma_Phong`),
  CONSTRAINT `giao_dich_ibfk_2` FOREIGN KEY (`CCCD`) REFERENCES `khach_hang` (`CCCD`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `giao_dich`
--

LOCK TABLES `giao_dich` WRITE;
/*!40000 ALTER TABLE `giao_dich` DISABLE KEYS */;
/*!40000 ALTER TABLE `giao_dich` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hoa_don`
--

DROP TABLE IF EXISTS `hoa_don`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hoa_don` (
  `ma_HD` int NOT NULL AUTO_INCREMENT,
  `CCCD` varchar(20) DEFAULT NULL,
  `ma_Phong` int DEFAULT NULL,
  `ma_KS` int DEFAULT NULL,
  `ma_GD` int DEFAULT NULL,
  `thoi_diem_in` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ma_HD`),
  KEY `CCCD` (`CCCD`),
  KEY `ma_Phong` (`ma_Phong`),
  KEY `ma_KS` (`ma_KS`),
  KEY `ma_GD` (`ma_GD`),
  CONSTRAINT `hoa_don_ibfk_1` FOREIGN KEY (`CCCD`) REFERENCES `khach_hang` (`CCCD`),
  CONSTRAINT `hoa_don_ibfk_2` FOREIGN KEY (`ma_Phong`) REFERENCES `phong` (`ma_Phong`),
  CONSTRAINT `hoa_don_ibfk_3` FOREIGN KEY (`ma_KS`) REFERENCES `khach_san` (`ma_KS`),
  CONSTRAINT `hoa_don_ibfk_4` FOREIGN KEY (`ma_GD`) REFERENCES `giao_dich` (`ma_GD`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hoa_don`
--

LOCK TABLES `hoa_don` WRITE;
/*!40000 ALTER TABLE `hoa_don` DISABLE KEYS */;
/*!40000 ALTER TABLE `hoa_don` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `khach_hang`
--

DROP TABLE IF EXISTS `khach_hang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `khach_hang` (
  `CCCD` varchar(12) NOT NULL,
  `password` varchar(30) NOT NULL,
  `ten` varchar(50) DEFAULT NULL,
  `ngay_sinh` date DEFAULT NULL,
  `sdt` varchar(10) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `loai_ng_dung` enum('Nguoi_su_dung','Chu_khach_san') DEFAULT NULL,
  PRIMARY KEY (`CCCD`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `khach_hang`
--

LOCK TABLES `khach_hang` WRITE;
/*!40000 ALTER TABLE `khach_hang` DISABLE KEYS */;
/*!40000 ALTER TABLE `khach_hang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `khach_san`
--

DROP TABLE IF EXISTS `khach_san`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `khach_san` (
  `ma_KS` int NOT NULL AUTO_INCREMENT,
  `ten_khach_san` varchar(100) DEFAULT NULL,
  `dia_diem` varchar(150) DEFAULT NULL,
  `sdt` varchar(15) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `mo_ta` text,
  `rating` decimal(3,2) DEFAULT NULL,
  PRIMARY KEY (`ma_KS`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `khach_san`
--

LOCK TABLES `khach_san` WRITE;
/*!40000 ALTER TABLE `khach_san` DISABLE KEYS */;
/*!40000 ALTER TABLE `khach_san` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phong`
--

DROP TABLE IF EXISTS `phong`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `phong` (
  `ma_Phong` int NOT NULL AUTO_INCREMENT,
  `loai_phong` varchar(30) DEFAULT NULL,
  `tinh_trang` enum('-1','0','1') DEFAULT NULL,
  `ma_KS` int DEFAULT NULL,
  PRIMARY KEY (`ma_Phong`),
  KEY `ma_KS` (`ma_KS`),
  CONSTRAINT `phong_ibfk_1` FOREIGN KEY (`ma_KS`) REFERENCES `khach_san` (`ma_KS`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phong`
--

LOCK TABLES `phong` WRITE;
/*!40000 ALTER TABLE `phong` DISABLE KEYS */;
/*!40000 ALTER TABLE `phong` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reviews`
--

DROP TABLE IF EXISTS `reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reviews` (
  `id_review` int NOT NULL AUTO_INCREMENT,
  `rating` float DEFAULT NULL,
  `comment` text,
  `ngay_danh_gia` date DEFAULT NULL,
  `khach_san_id` int DEFAULT NULL,
  `CCCD` varchar(12) DEFAULT NULL,
  PRIMARY KEY (`id_review`),
  KEY `khach_san_id` (`khach_san_id`),
  KEY `CCCD` (`CCCD`),
  CONSTRAINT `reviews_ibfk_1` FOREIGN KEY (`khach_san_id`) REFERENCES `khach_san` (`ma_KS`),
  CONSTRAINT `reviews_ibfk_2` FOREIGN KEY (`CCCD`) REFERENCES `khach_hang` (`CCCD`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviews`
--

LOCK TABLES `reviews` WRITE;
/*!40000 ALTER TABLE `reviews` DISABLE KEYS */;
/*!40000 ALTER TABLE `reviews` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-07-25 22:37:28
