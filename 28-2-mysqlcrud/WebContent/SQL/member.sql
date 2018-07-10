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


-- 테이블 mysqlcrud_2의 구조를 덤프합니다. member
CREATE TABLE IF NOT EXISTS `member` (
  `member_no` int(10) NOT NULL AUTO_INCREMENT,
  `member_name` varchar(50) NOT NULL,
  `member_age` int(10) NOT NULL,
  PRIMARY KEY (`member_no`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=euckr;

-- Dumping data for table mysqlcrud_2.member: ~0 rows (대략적)
/*!40000 ALTER TABLE `member` DISABLE KEYS */;
INSERT INTO `member` (`member_no`, `member_name`, `member_age`) VALUES
	(1, '현희문', 26),
	(2, '김진우', 25),
	(3, '송유빈', 22),
	(4, '김호순', 25),
	(5, '송원민', 25),
	(6, '이경선', 26),
	(7, '정민수', 25),
	(8, '김지완', 26),
	(9, '김준영', 25);
/*!40000 ALTER TABLE `member` ENABLE KEYS */;


-- 테이블 mysqlcrud_2의 구조를 덤프합니다. member_addr
CREATE TABLE IF NOT EXISTS `member_addr` (
  `member_addr_no` int(10) NOT NULL AUTO_INCREMENT,
  `member_no` int(10) NOT NULL,
  `member_addr_content` varchar(50) NOT NULL,
  PRIMARY KEY (`member_addr_no`),
  KEY `FK__member` (`member_no`),
  CONSTRAINT `FK__member` FOREIGN KEY (`member_no`) REFERENCES `member` (`member_no`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=euckr;

-- Dumping data for table mysqlcrud_2.member_addr: ~0 rows (대략적)
/*!40000 ALTER TABLE `member_addr` DISABLE KEYS */;
INSERT INTO `member_addr` (`member_addr_no`, `member_no`, `member_addr_content`) VALUES
	(1, 1, 'gusgmlans@naver.com'),
	(2, 2, 'rlawlsdn@naver.com'),
	(3, 3, 'thddbqls@naver.com'),
	(4, 4, 'rlaghtns@naver.com'),
	(5, 5, 'thddnjsals@naver.com'),
	(6, 6, 'dlrudtjs@naver.com'),
	(7, 7, 'wjdalstn@naver.com'),
	(8, 8, 'rlawldhks@naver.com'),
	(9, 9, 'rlawnsdud@naver.com');
/*!40000 ALTER TABLE `member_addr` ENABLE KEYS */;


-- 테이블 mysqlcrud_2의 구조를 덤프합니다. member_score
CREATE TABLE IF NOT EXISTS `member_score` (
  `member_score_no` int(10) NOT NULL AUTO_INCREMENT,
  `member_no` int(10) NOT NULL,
  `score` int(10) NOT NULL,
  PRIMARY KEY (`member_score_no`),
  KEY `FK_member_score_member` (`member_no`),
  CONSTRAINT `FK_member_score_member` FOREIGN KEY (`member_no`) REFERENCES `member` (`member_no`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=euckr;

-- Dumping data for table mysqlcrud_2.member_score: ~0 rows (대략적)
/*!40000 ALTER TABLE `member_score` DISABLE KEYS */;
INSERT INTO `member_score` (`member_score_no`, `member_no`, `score`) VALUES
	(10, 1, 100),
	(11, 2, 100),
	(12, 3, 100),
	(13, 4, 80),
	(14, 5, 60),
	(15, 6, 20),
	(16, 7, 50),
	(17, 8, 60),
	(18, 9, 70);
/*!40000 ALTER TABLE `member_score` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
