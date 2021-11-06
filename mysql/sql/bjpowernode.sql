-- MySQL dump 10.13  Distrib 8.0.18, for macos10.14 (x86_64)
--
-- Host: localhost    Database: bjpowernode
-- ------------------------------------------------------
-- Server version	8.0.18

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
-- Table structure for table `C`
--

DROP TABLE IF EXISTS `C`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `C` (
  `CNO` varchar(200) DEFAULT NULL,
  `CNAME` varchar(200) DEFAULT NULL,
  `CTEACHER` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `C`
--

LOCK TABLES `C` WRITE;
/*!40000 ALTER TABLE `C` DISABLE KEYS */;
INSERT INTO `C` VALUES ('1','语文','张'),('2','政治','王'),('3','英语','李'),('4','数学','赵'),('5','物理','黎明');
/*!40000 ALTER TABLE `C` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DEPT`
--

DROP TABLE IF EXISTS `DEPT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `DEPT` (
  `DEPTNO` int(2) NOT NULL,
  `DNAME` varchar(14) DEFAULT NULL,
  `LOC` varchar(13) DEFAULT NULL,
  PRIMARY KEY (`DEPTNO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DEPT`
--

LOCK TABLES `DEPT` WRITE;
/*!40000 ALTER TABLE `DEPT` DISABLE KEYS */;
INSERT INTO `DEPT` VALUES (10,'ACCOUNTING','NEW YORK'),(20,'RESEARCH','DALLAS'),(30,'SALES','CHICAGO'),(40,'OPERATIONS','BOSTON');
/*!40000 ALTER TABLE `DEPT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `EMP`
--

DROP TABLE IF EXISTS `EMP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `EMP` (
  `EMPNO` int(4) NOT NULL,
  `ENAME` varchar(10) DEFAULT NULL,
  `JOB` varchar(9) DEFAULT NULL,
  `MGR` int(4) DEFAULT NULL,
  `HIREDATE` date DEFAULT NULL,
  `SAL` double(7,2) DEFAULT NULL,
  `COMM` double(7,2) DEFAULT NULL,
  `DEPTNO` int(2) DEFAULT NULL,
  PRIMARY KEY (`EMPNO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EMP`
--

LOCK TABLES `EMP` WRITE;
/*!40000 ALTER TABLE `EMP` DISABLE KEYS */;
INSERT INTO `EMP` VALUES (7369,'SMITH','CLERK',7902,'1980-12-17',800.00,NULL,20),(7499,'ALLEN','SALESMAN',7698,'1981-02-20',1600.00,300.00,30),(7521,'WARD','SALESMAN',7698,'1981-02-22',1250.00,500.00,30),(7566,'JONES','MANAGER',7839,'1981-04-02',2975.00,NULL,20),(7654,'MARTIN','SALESMAN',7698,'1981-09-28',1250.00,1400.00,30),(7698,'BLAKE','MANAGER',7839,'1981-05-01',2850.00,NULL,30),(7782,'CLARK','MANAGER',7839,'1981-06-09',2450.00,NULL,10),(7788,'SCOTT','ANALYST',7566,'1987-04-19',3000.00,NULL,20),(7839,'KING','PRESIDENT',NULL,'1981-11-17',5000.00,NULL,10),(7844,'TURNER','SALESMAN',7698,'1981-09-08',1500.00,0.00,30),(7876,'ADAMS','CLERK',7788,'1987-05-23',1100.00,NULL,20),(7900,'JAMES','CLERK',7698,'1981-12-03',950.00,NULL,30),(7902,'FORD','ANALYST',7566,'1981-12-03',3000.00,NULL,20),(7934,'MILLER','CLERK',7782,'1982-01-23',1300.00,NULL,10);
/*!40000 ALTER TABLE `EMP` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `S`
--

DROP TABLE IF EXISTS `S`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `S` (
  `SNO` varchar(200) DEFAULT NULL,
  `SNAME` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `S`
--

LOCK TABLES `S` WRITE;
/*!40000 ALTER TABLE `S` DISABLE KEYS */;
INSERT INTO `S` VALUES ('1','学生1'),('2','学生2'),('3','学生3'),('4','学生4');
/*!40000 ALTER TABLE `S` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SALGRADE`
--

DROP TABLE IF EXISTS `SALGRADE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `SALGRADE` (
  `GRADE` int(11) DEFAULT NULL,
  `LOSAL` int(11) DEFAULT NULL,
  `HISAL` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SALGRADE`
--

LOCK TABLES `SALGRADE` WRITE;
/*!40000 ALTER TABLE `SALGRADE` DISABLE KEYS */;
INSERT INTO `SALGRADE` VALUES (1,700,1200),(2,1201,1400),(3,1401,2000),(4,2001,3000),(5,3001,9997);
/*!40000 ALTER TABLE `SALGRADE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SC`
--

DROP TABLE IF EXISTS `SC`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `SC` (
  `SNO` varchar(200) DEFAULT NULL,
  `CNO` varchar(200) DEFAULT NULL,
  `SCGRADE` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SC`
--

LOCK TABLES `SC` WRITE;
/*!40000 ALTER TABLE `SC` DISABLE KEYS */;
INSERT INTO `SC` VALUES ('1','1','40'),('1','2','30'),('1','3','20'),('1','4','80'),('1','5','60'),('2','1','60'),('2','2','60'),('2','3','60'),('2','4','60'),('2','5','40'),('3','1','60'),('3','3','80');
/*!40000 ALTER TABLE `SC` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_class`
--

DROP TABLE IF EXISTS `t_class`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_class` (
  `cid` int(11) NOT NULL,
  `cname` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_class`
--

LOCK TABLES `t_class` WRITE;
/*!40000 ALTER TABLE `t_class` DISABLE KEYS */;
INSERT INTO `t_class` VALUES (1,'网络1501班'),(2,'网络1502班'),(3,'网络1503班');
/*!40000 ALTER TABLE `t_class` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_emp`
--

DROP TABLE IF EXISTS `t_emp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_emp` (
  `EMPNO` int(4) NOT NULL,
  `ENAME` varchar(10) DEFAULT NULL,
  `JOB` varchar(9) DEFAULT NULL,
  `MGR` int(4) DEFAULT NULL,
  `HIREDATE` date DEFAULT NULL,
  `SAL` double(7,2) DEFAULT NULL,
  `COMM` double(7,2) DEFAULT NULL,
  `DEPTNO` int(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_emp`
--

LOCK TABLES `t_emp` WRITE;
/*!40000 ALTER TABLE `t_emp` DISABLE KEYS */;
INSERT INTO `t_emp` VALUES (7369,'SMITH','CLERK',7902,'1980-12-17',800.00,NULL,20),(7521,'WARD','SALESMAN',7698,'1981-02-22',1250.00,500.00,30),(7566,'JONES','MANAGER',7839,'1981-04-02',2975.00,NULL,20),(7654,'MARTIN','SALESMAN',7698,'1981-09-28',1250.00,1400.00,30),(7698,'BLAKE','MANAGER',7839,'1981-05-01',2850.00,NULL,30),(7782,'CLARK','MANAGER',7839,'1981-06-09',2450.00,NULL,10),(7788,'SCOTT','ANALYST',7566,'1987-04-19',3000.00,NULL,20),(7839,'KING','PRESIDENT',NULL,'1981-11-17',5000.00,NULL,10),(7844,'TURNER','SALESMAN',7698,'1981-09-08',1500.00,0.00,30),(7876,'ADAMS','CLERK',7788,'1987-05-23',1100.00,NULL,20),(7900,'JAMES','CLERK',7698,'1981-12-03',950.00,NULL,30),(7902,'FORD','ANALYST',7566,'1981-12-03',3000.00,NULL,20),(7934,'MILLER','CLERK',7782,'1982-01-23',1300.00,NULL,10);
/*!40000 ALTER TABLE `t_emp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_student`
--

DROP TABLE IF EXISTS `t_student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_student` (
  `sid` int(11) NOT NULL,
  `sname` varchar(255) DEFAULT NULL,
  `classno` int(11) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  PRIMARY KEY (`sid`),
  KEY `classno` (`classno`),
  CONSTRAINT `t_student_ibfk_1` FOREIGN KEY (`classno`) REFERENCES `t_class` (`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_student`
--

LOCK TABLES `t_student` WRITE;
/*!40000 ALTER TABLE `t_student` DISABLE KEYS */;
INSERT INTO `t_student` VALUES (1001,'陈伟东',2,18),(1002,'亢晓梅',3,16),(1003,'李阳',NULL,17),(1004,'冯小康',NULL,17);
/*!40000 ALTER TABLE `t_student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_user`
--

DROP TABLE IF EXISTS `t_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_user`
--

LOCK TABLES `t_user` WRITE;
/*!40000 ALTER TABLE `t_user` DISABLE KEYS */;
INSERT INTO `t_user` VALUES (1,'陈伟东',NULL),(5,'zs',NULL),(6,'ls',NULL),(7,'ww',NULL),(8,'zl',NULL);
/*!40000 ALTER TABLE `t_user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-11-06 19:19:22
