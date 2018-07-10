-- --------------------------------------------------------
-- 호스트:                          127.0.0.1
-- 서버 버전:                        5.5.32 - MySQL Community Server (GPL)
-- 서버 OS:                        Win32
-- HeidiSQL 버전:                  8.0.0.4396
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- mysqlcrud_2 의 데이터베이스 구조 덤핑
CREATE DATABASE IF NOT EXISTS `mysqlcrud_2` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `mysqlcrud_2`;


-- 테이블 mysqlcrud_2의 구조를 덤프합니다. employee
CREATE TABLE IF NOT EXISTS `employee` (
  `employee_no` int(10) NOT NULL AUTO_INCREMENT,
  `employee_name` varchar(50) NOT NULL,
  `employee_age` int(10) NOT NULL,
  PRIMARY KEY (`employee_no`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=euckr;

-- Dumping data for table mysqlcrud_2.employee: ~9 rows (대략적)
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` (`employee_no`, `employee_name`, `employee_age`) VALUES
	(1, '송원민', 25),
	(2, '탁재은', 23),
	(3, '최윤석', 25),
	(4, '구해성', 20),
	(5, '이광재', 31),
	(6, '김준영', 25),
	(7, '현희문', 26),
	(8, '김진우', 25),
	(9, '송유빈', 22);
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;


-- 테이블 mysqlcrud_2의 구조를 덤프합니다. employee_addr
CREATE TABLE IF NOT EXISTS `employee_addr` (
  `employee_addr_no` int(10) NOT NULL AUTO_INCREMENT,
  `employee_no` int(10) NOT NULL,
  `employee_addr_content` varchar(50) NOT NULL,
  PRIMARY KEY (`employee_addr_no`),
  KEY `FK_employee` (`employee_no`),
  CONSTRAINT `FK_employee` FOREIGN KEY (`employee_no`) REFERENCES `employee` (`employee_no`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=euckr;

-- Dumping data for table mysqlcrud_2.employee_addr: ~9 rows (대략적)
/*!40000 ALTER TABLE `employee_addr` DISABLE KEYS */;
INSERT INTO `employee_addr` (`employee_addr_no`, `employee_no`, `employee_addr_content`) VALUES
	(1, 1, 'thddnjsals@naver.com'),
	(2, 2, 'xkrwodms@naver.com'),
	(3, 3, 'chldbstjr@naver.com'),
	(4, 4, 'rngotjd@naver.com'),
	(5, 5, 'dlrhkdwo@naver.com'),
	(6, 6, 'rlawnsdud@naver.com'),
	(7, 7, 'gusgmlans@naver.com'),
	(8, 8, 'rlawlsdn@naver.com'),
	(9, 9, 'thddbqls@naver.com');
/*!40000 ALTER TABLE `employee_addr` ENABLE KEYS */;


-- 테이블 mysqlcrud_2의 구조를 덤프합니다. employee_score
CREATE TABLE IF NOT EXISTS `employee_score` (
  `employee_score_no` int(10) NOT NULL AUTO_INCREMENT,
  `employee_no` int(10) DEFAULT NULL,
  `score` int(10) DEFAULT NULL,
  PRIMARY KEY (`employee_score_no`),
  KEY `FK_employee_score_employee` (`employee_no`),
  CONSTRAINT `FK_employee_score_employee` FOREIGN KEY (`employee_no`) REFERENCES `employee` (`employee_no`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=euckr;

-- Dumping data for table mysqlcrud_2.employee_score: ~9 rows (대략적)
/*!40000 ALTER TABLE `employee_score` DISABLE KEYS */;
INSERT INTO `employee_score` (`employee_score_no`, `employee_no`, `score`) VALUES
	(3, 1, 100),
	(4, 2, 100),
	(5, 3, 50),
	(6, 4, 60),
	(7, 5, 70),
	(8, 6, 100),
	(9, 7, 50),
	(10, 8, 60),
	(11, 9, 100);
/*!40000 ALTER TABLE `employee_score` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
