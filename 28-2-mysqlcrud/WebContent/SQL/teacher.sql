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


-- 테이블 mysqlcrud_2의 구조를 덤프합니다. teacher
CREATE TABLE IF NOT EXISTS `teacher` (
  `teacher_no` int(10) NOT NULL AUTO_INCREMENT,
  `teacher_name` varchar(50) NOT NULL,
  `teacher_age` int(10) NOT NULL,
  PRIMARY KEY (`teacher_no`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=euckr;

-- Dumping data for table mysqlcrud_2.teacher: ~0 rows (대략적)
/*!40000 ALTER TABLE `teacher` DISABLE KEYS */;
INSERT INTO `teacher` (`teacher_no`, `teacher_name`, `teacher_age`) VALUES
	(1, '정규룡', 26),
	(2, '전재현', 26),
	(3, '이원상', 28),
	(4, '공세준', 32),
	(5, '정민수', 25),
	(6, '현희문', 26),
	(7, '김진우', 25),
	(8, '이응빈', 24),
	(9, '김소희', 26);
/*!40000 ALTER TABLE `teacher` ENABLE KEYS */;


-- 테이블 mysqlcrud_2의 구조를 덤프합니다. teacher_addr
CREATE TABLE IF NOT EXISTS `teacher_addr` (
  `teacher_addr_no` int(10) NOT NULL AUTO_INCREMENT,
  `teacher_no` int(10) NOT NULL,
  `teacher_addr_content` varchar(50) NOT NULL,
  PRIMARY KEY (`teacher_addr_no`),
  KEY `FK__teacher` (`teacher_no`),
  CONSTRAINT `FK__teacher` FOREIGN KEY (`teacher_no`) REFERENCES `teacher` (`teacher_no`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=euckr;

-- Dumping data for table mysqlcrud_2.teacher_addr: ~0 rows (대략적)
/*!40000 ALTER TABLE `teacher_addr` DISABLE KEYS */;
INSERT INTO `teacher_addr` (`teacher_addr_no`, `teacher_no`, `teacher_addr_content`) VALUES
	(1, 1, 'wjdrbfyd@naver.com'),
	(2, 2, 'wjswogus@naver.com'),
	(3, 3, 'dldnjstkd@naver.com'),
	(4, 4, 'rhdtpwns@naver.com'),
	(5, 5, 'wjdalstn@naver.com'),
	(6, 6, 'gusgmlans@naver.com'),
	(7, 7, 'rlawlsdn@naver.com'),
	(8, 8, 'dldmdqls@naver.com'),
	(9, 9, 'rlathgml@naver.com');
/*!40000 ALTER TABLE `teacher_addr` ENABLE KEYS */;


-- 테이블 mysqlcrud_2의 구조를 덤프합니다. teacher_score
CREATE TABLE IF NOT EXISTS `teacher_score` (
  `teacher_score_no` int(10) NOT NULL AUTO_INCREMENT,
  `teacher_no` int(10) NOT NULL,
  `score` int(10) NOT NULL,
  PRIMARY KEY (`teacher_score_no`),
  KEY `FK_teacher_score_teacher` (`teacher_no`),
  CONSTRAINT `FK_teacher_score_teacher` FOREIGN KEY (`teacher_no`) REFERENCES `teacher` (`teacher_no`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=euckr;

-- Dumping data for table mysqlcrud_2.teacher_score: ~0 rows (대략적)
/*!40000 ALTER TABLE `teacher_score` DISABLE KEYS */;
INSERT INTO `teacher_score` (`teacher_score_no`, `teacher_no`, `score`) VALUES
	(1, 1, 100),
	(2, 2, 20),
	(3, 3, 50),
	(4, 4, 60),
	(5, 5, 90),
	(6, 6, 100),
	(7, 7, 90),
	(8, 8, 60),
	(9, 9, 100);
/*!40000 ALTER TABLE `teacher_score` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
