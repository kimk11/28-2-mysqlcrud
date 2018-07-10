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


-- 테이블 mysqlcrud_2의 구조를 덤프합니다. student
CREATE TABLE IF NOT EXISTS `student` (
  `student_no` int(10) NOT NULL AUTO_INCREMENT,
  `student_name` varchar(50) NOT NULL,
  `student_age` int(10) NOT NULL,
  PRIMARY KEY (`student_no`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=euckr;

-- Dumping data for table mysqlcrud_2.student: ~0 rows (대략적)
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` (`student_no`, `student_name`, `student_age`) VALUES
	(1, '김호순', 25),
	(2, '이응빈', 24),
	(3, '박원우', 26),
	(4, '김정연', 17),
	(5, '김지완', 26),
	(6, '서연문', 26),
	(7, '최지수', 25),
	(8, '이경선', 26),
	(9, '이원상', 28);
/*!40000 ALTER TABLE `student` ENABLE KEYS */;


-- 테이블 mysqlcrud_2의 구조를 덤프합니다. student_addr
CREATE TABLE IF NOT EXISTS `student_addr` (
  `student_addr_no` int(10) NOT NULL AUTO_INCREMENT,
  `student_no` int(10) NOT NULL,
  `student_addr_content` varchar(50) NOT NULL,
  PRIMARY KEY (`student_addr_no`),
  KEY `FK__student` (`student_no`),
  CONSTRAINT `FK__student` FOREIGN KEY (`student_no`) REFERENCES `student` (`student_no`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=euckr;

-- Dumping data for table mysqlcrud_2.student_addr: ~0 rows (대략적)
/*!40000 ALTER TABLE `student_addr` DISABLE KEYS */;
INSERT INTO `student_addr` (`student_addr_no`, `student_no`, `student_addr_content`) VALUES
	(1, 1, 'rlaghtns@naver.com'),
	(2, 2, 'dldmdqls@naver.com'),
	(3, 3, 'qkrdnjsdn@naver.com'),
	(4, 4, 'rlawjddus@naver.com'),
	(5, 5, 'rlawldhks@naver.com'),
	(6, 6, 'tjdusans@naver.com'),
	(7, 7, 'chlwltn@naver.com'),
	(8, 8, 'dlrudtjs@naver.com'),
	(9, 9, 'dldnjstkd@naver.com');
/*!40000 ALTER TABLE `student_addr` ENABLE KEYS */;


-- 테이블 mysqlcrud_2의 구조를 덤프합니다. student_score
CREATE TABLE IF NOT EXISTS `student_score` (
  `student_score_no` int(10) NOT NULL AUTO_INCREMENT,
  `student_no` int(10) DEFAULT NULL,
  `score` int(10) DEFAULT NULL,
  PRIMARY KEY (`student_score_no`),
  KEY `FK_student_score_student` (`student_no`),
  CONSTRAINT `FK_student_score_student` FOREIGN KEY (`student_no`) REFERENCES `student` (`student_no`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=euckr;

-- Dumping data for table mysqlcrud_2.student_score: ~0 rows (대략적)
/*!40000 ALTER TABLE `student_score` DISABLE KEYS */;
INSERT INTO `student_score` (`student_score_no`, `student_no`, `score`) VALUES
	(2, 1, 100),
	(3, 2, 50),
	(4, 3, 70),
	(5, 4, 50),
	(6, 5, 80),
	(7, 6, 70),
	(8, 7, 60),
	(9, 8, 30),
	(10, 9, 100);
/*!40000 ALTER TABLE `student_score` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
