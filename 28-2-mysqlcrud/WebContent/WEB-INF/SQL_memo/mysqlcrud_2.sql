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
CREATE DATABASE IF NOT EXISTS `mysqlcrud_2` /*!40100 DEFAULT CHARACTER SET euckr */;
USE `mysqlcrud_2`;


-- 테이블 mysqlcrud_2의 구조를 덤프합니다. employee
CREATE TABLE IF NOT EXISTS `employee` (
  `employee_no` int(11) NOT NULL AUTO_INCREMENT,
  `employee_name` varchar(50) DEFAULT NULL,
  `employee_age` int(11) DEFAULT NULL,
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
  `employee_addr_no` int(11) NOT NULL AUTO_INCREMENT,
  `employee_no` int(11) DEFAULT NULL,
  `employee_addr_content` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`employee_addr_no`),
  KEY `FK_employee` (`employee_no`),
  CONSTRAINT `FK_employee` FOREIGN KEY (`employee_no`) REFERENCES `employee` (`employee_no`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=euckr;

-- Dumping data for table mysqlcrud_2.employee_addr: ~10 rows (대략적)
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
	(9, 9, 'thddbqls@naver.com'),
	(10, 1, '500');
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


-- 테이블 mysqlcrud_2의 구조를 덤프합니다. member
CREATE TABLE IF NOT EXISTS `member` (
  `member_no` int(10) NOT NULL AUTO_INCREMENT,
  `member_name` varchar(50) NOT NULL,
  `member_age` int(10) NOT NULL,
  PRIMARY KEY (`member_no`)
) ENGINE=InnoDB DEFAULT CHARSET=euckr;

-- Dumping data for table mysqlcrud_2.member: ~0 rows (대략적)
/*!40000 ALTER TABLE `member` DISABLE KEYS */;
/*!40000 ALTER TABLE `member` ENABLE KEYS */;


-- 테이블 mysqlcrud_2의 구조를 덤프합니다. member_addr
CREATE TABLE IF NOT EXISTS `member_addr` (
  `member_addr_no` int(10) NOT NULL AUTO_INCREMENT,
  `member_no` int(10) NOT NULL,
  `member_addr_content` varchar(50) NOT NULL,
  PRIMARY KEY (`member_addr_no`),
  KEY `FK__member` (`member_no`),
  CONSTRAINT `FK__member` FOREIGN KEY (`member_no`) REFERENCES `member` (`member_no`)
) ENGINE=InnoDB DEFAULT CHARSET=euckr;

-- Dumping data for table mysqlcrud_2.member_addr: ~0 rows (대략적)
/*!40000 ALTER TABLE `member_addr` DISABLE KEYS */;
/*!40000 ALTER TABLE `member_addr` ENABLE KEYS */;


-- 테이블 mysqlcrud_2의 구조를 덤프합니다. student
CREATE TABLE IF NOT EXISTS `student` (
  `student_no` int(10) NOT NULL AUTO_INCREMENT,
  `student_name` varchar(50) NOT NULL,
  `student_age` int(10) NOT NULL,
  PRIMARY KEY (`student_no`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=euckr;

-- Dumping data for table mysqlcrud_2.student: ~9 rows (대략적)
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
  `student_no` int(11) NOT NULL,
  `student_addr_content` varchar(50) NOT NULL,
  PRIMARY KEY (`student_addr_no`),
  KEY `FK__student` (`student_no`),
  CONSTRAINT `FK__student` FOREIGN KEY (`student_no`) REFERENCES `student` (`student_no`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=euckr;

-- Dumping data for table mysqlcrud_2.student_addr: ~9 rows (대략적)
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

-- Dumping data for table mysqlcrud_2.student_score: ~9 rows (대략적)
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


-- 테이블 mysqlcrud_2의 구조를 덤프합니다. teacher
CREATE TABLE IF NOT EXISTS `teacher` (
  `teacher_no` int(10) NOT NULL AUTO_INCREMENT,
  `teacher_name` varchar(50) NOT NULL,
  `teacher_age` int(10) NOT NULL,
  PRIMARY KEY (`teacher_no`)
) ENGINE=InnoDB DEFAULT CHARSET=euckr;

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
) ENGINE=InnoDB DEFAULT CHARSET=euckr;

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
	(9, 9, 'rlathgml@naver.com'),
	(10, 2, 'hi@naver.com'),
	(11, 1, '삼천동 1가 777-777');

/*!40000 ALTER TABLE `teacher_addr` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;


-- 테이블 mysqlcrud_2의 구조를 덤프합니다. teacher_score
CREATE TABLE IF NOT EXISTS `teacher_score` (
  `teacher_score_no` int(10) NOT NULL AUTO_INCREMENT,
  `teacher_no` int(10) NOT NULL,
  `score` int(10) NOT NULL,
  PRIMARY KEY (`teacher_score_no`),
  KEY `FK_teacher_score_teacher` (`teacher_no`),
  CONSTRAINT `FK_teacher_score_teacher` FOREIGN KEY (`teacher_no`) REFERENCES `teacher` (`teacher_no`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=euckr;

-- Dumping data for table mysqlcrud_2.teacher_score: ~9 rows (대략적)
/*!40000 ALTER TABLE `teacher_score` DISABLE KEYS */;
INSERT INTO `teacher_score` (`teacher_score_no`, `teacher_no`, `score`) VALUES
	(1, 1, 50),
	(2, 3, 10),
	(3, 4, 100),
	(4, 5, 60),
	(5, 7, 100),
	(6, 8, 15),
	(7, 9, 100);
	
