-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: localhost    Database: qltv
-- ------------------------------------------------------
-- Server version	8.0.32

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
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin` (
  `username` char(30) NOT NULL,
  `password` varchar(45) NOT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES ('admin','12345');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_dausach`
--

DROP TABLE IF EXISTS `tb_dausach`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_dausach` (
  `MaDauSach` varchar(15) NOT NULL,
  `TenSach` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `Soluong` int NOT NULL,
  `TheLoai` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `TacGia` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `NXB` varchar(45) NOT NULL,
  `NamXB` int NOT NULL,
  PRIMARY KEY (`MaDauSach`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_dausach`
--

LOCK TABLES `tb_dausach` WRITE;
/*!40000 ALTER TABLE `tb_dausach` DISABLE KEYS */;
INSERT INTO `tb_dausach` VALUES ('DS001','Toán 10',99,'SGK','Kim Đồng','Giáo dục',2012);
/*!40000 ALTER TABLE `tb_dausach` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_nguoimuon`
--

DROP TABLE IF EXISTS `tb_nguoimuon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_nguoimuon` (
  `MaNguoiMuon` varchar(10) NOT NULL,
  `TenNguoiMuon` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `DiaChi` varchar(45) NOT NULL,
  `Gmail` varchar(45) NOT NULL,
  `SDT` varchar(45) NOT NULL,
  PRIMARY KEY (`MaNguoiMuon`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_nguoimuon`
--

LOCK TABLES `tb_nguoimuon` WRITE;
/*!40000 ALTER TABLE `tb_nguoimuon` DISABLE KEYS */;
INSERT INTO `tb_nguoimuon` VALUES ('MN001','Trần Trọng Tuấn','Ninh Bình','trantuan@gmail.com','0349587256');
/*!40000 ALTER TABLE `tb_nguoimuon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_phieumuon`
--

DROP TABLE IF EXISTS `tb_phieumuon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_phieumuon` (
  `MaPhieuMuon` varchar(15) NOT NULL,
  `NgayMuon` date NOT NULL,
  `HanTra` date NOT NULL,
  `MaSach` varchar(15) NOT NULL,
  `MaNguoiMuon` varchar(15) NOT NULL,
  `NgayTra` date DEFAULT NULL,
  PRIMARY KEY (`MaPhieuMuon`),
  KEY `MaSach_idx` (`MaSach`),
  KEY `MaNguoiMuon_idx` (`MaNguoiMuon`),
  CONSTRAINT `MaNguoiMuon` FOREIGN KEY (`MaNguoiMuon`) REFERENCES `tb_nguoimuon` (`MaNguoiMuon`),
  CONSTRAINT `MaSach` FOREIGN KEY (`MaSach`) REFERENCES `tb_sach` (`MaSach`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_phieumuon`
--

LOCK TABLES `tb_phieumuon` WRITE;
/*!40000 ALTER TABLE `tb_phieumuon` DISABLE KEYS */;
INSERT INTO `tb_phieumuon` VALUES ('P001','2024-08-12','2024-09-12','S001','MN001','2024-09-10');
/*!40000 ALTER TABLE `tb_phieumuon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_sach`
--

DROP TABLE IF EXISTS `tb_sach`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_sach` (
  `MaSach` varchar(15) NOT NULL,
  `TenSach` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `TrangThai` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `MaDauSach` varchar(15) NOT NULL,
  PRIMARY KEY (`MaSach`),
  KEY `MaDauSach_idx` (`MaDauSach`),
  CONSTRAINT `MaDauSach` FOREIGN KEY (`MaDauSach`) REFERENCES `tb_dausach` (`MaDauSach`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_sach`
--

LOCK TABLES `tb_sach` WRITE;
/*!40000 ALTER TABLE `tb_sach` DISABLE KEYS */;
INSERT INTO `tb_sach` VALUES ('S001','Toán 10','Còn','DS001');
/*!40000 ALTER TABLE `tb_sach` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;


