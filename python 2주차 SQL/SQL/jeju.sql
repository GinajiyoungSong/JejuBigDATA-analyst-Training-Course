-- --------------------------------------------------------
-- 호스트:                          127.0.0.1
-- 서버 버전:                        10.4.11-MariaDB - mariadb.org binary distribution
-- 서버 OS:                        Win64
-- HeidiSQL 버전:                  10.2.0.5599
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- jeju 데이터베이스 구조 내보내기
CREATE DATABASE IF NOT EXISTS `jeju` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `jeju`;

-- 테이블 jeju.authors 구조 내보내기
CREATE TABLE IF NOT EXISTS `authors` (
  `name` varchar(50) DEFAULT NULL,
  `korean` varchar(50) DEFAULT NULL,
  `english` varchar(50) DEFAULT NULL,
  `math` varchar(50) DEFAULT NULL,
  `total` varchar(50) DEFAULT NULL,
  `average` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 테이블 데이터 jeju.authors:~3 rows (대략적) 내보내기
/*!40000 ALTER TABLE `authors` DISABLE KEYS */;
INSERT INTO `authors` (`name`, `korean`, `english`, `math`, `total`, `average`) VALUES
	('대한민국', '90', '90', '90', '270', '90'),
	('민국이', '80', '80', '80', '240', '80'),
	('만세', '100', '100', '100', '300', '100');
/*!40000 ALTER TABLE `authors` ENABLE KEYS */;

-- 테이블 jeju.goods 구조 내보내기
CREATE TABLE IF NOT EXISTS `goods` (
  `code` int(11) NOT NULL,
  `name` varchar(20) NOT NULL,
  `su` int(11) DEFAULT NULL,
  `dan` int(11) DEFAULT NULL,
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='primart key :  중복이 불가능. 외부에서 참조가 가능한 키';

-- 테이블 데이터 jeju.goods:~7 rows (대략적) 내보내기
/*!40000 ALTER TABLE `goods` DISABLE KEYS */;
INSERT INTO `goods` (`code`, `name`, `su`, `dan`) VALUES
	(1, '냉장고', 2, 850000),
	(2, '세탁기', 3, 550000),
	(3, '전자레인지', 2, 350000),
	(4, 'HDTV', 3, 1500000),
	(5, 'VR기기', 2, 1440000),
	(6, 'Drone', 1, 890000),
	(7, '고성능컴퓨터', 3, NULL);
/*!40000 ALTER TABLE `goods` ENABLE KEYS */;

-- 테이블 jeju.school 구조 내보내기
CREATE TABLE IF NOT EXISTS `school` (
  `no` int(11) NOT NULL AUTO_INCREMENT,
  `schoolname` varchar(20) DEFAULT NULL,
  `address` varchar(50) DEFAULT NULL,
  `schoolcode` char(10) NOT NULL,
  `studentcount` int(11) DEFAULT NULL,
  PRIMARY KEY (`schoolcode`),
  KEY `no` (`no`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COMMENT='vanchar는 변할수 있고\r\nchar 는 10자리 fix\r\n\r\n\r\n기본값 auto_increment 자동으로 지정되는 것';

-- 테이블 데이터 jeju.school:~4 rows (대략적) 내보내기
/*!40000 ALTER TABLE `school` DISABLE KEYS */;
INSERT INTO `school` (`no`, `schoolname`, `address`, `schoolcode`, `studentcount`) VALUES
	(8, '충주여자고등학교', '충주시', 'CH00000001', 300),
	(9, '신성여자고등학교', ' 제주시', 'IC00000001', 560),
	(10, '종로여자고등학교', '제주시', 'JR00000001', 300),
	(11, '제주여자고등학교', '서울시', 'SE00000001', 300);
/*!40000 ALTER TABLE `school` ENABLE KEYS */;

-- 테이블 jeju.shop 구조 내보내기
CREATE TABLE IF NOT EXISTS `shop` (
  `userID` varchar(50) NOT NULL DEFAULT 'NULL',
  `name` varchar(50) DEFAULT NULL,
  `birthYear` int(11) DEFAULT NULL,
  `addr` char(50) DEFAULT NULL,
  `mobile1` char(50) DEFAULT NULL,
  `mobile2` char(50) DEFAULT NULL,
  `height` int(11) DEFAULT NULL,
  `mDate` date DEFAULT NULL,
  PRIMARY KEY (`userID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 테이블 데이터 jeju.shop:~10 rows (대략적) 내보내기
/*!40000 ALTER TABLE `shop` DISABLE KEYS */;
INSERT INTO `shop` (`userID`, `name`, `birthYear`, `addr`, `mobile1`, `mobile2`, `height`, `mDate`) VALUES
	('BBK', '바비킴', 1973, '서울', '010', '0000000', 176, '2013-05-05'),
	('EJW', '은지원', 1972, '경북', '011', '8888888', 174, '2014-03-03'),
	('JKW', '조관우', 1965, '경기', '018', '9999999', 172, '2010-10-10'),
	('JYP', '조용필', 1950, '경기', '011', '4444444', 166, '2009-04-04'),
	('KBS', '김범수', 1979, '경남', '011', '2222222', 173, '2012-04-04'),
	('KKH', '김경호', 1971, '전남', '019', '3333333', 177, '2007-07-07'),
	('LJB', '임재범', 1963, '서울', '016', '6666666', 182, '2009-09-09'),
	('LSG', '이승기', 1987, '서울', '011', '1111111', 182, '2008-08-08'),
	('SSK', '성시경', 1979, '서울', '', '', 186, '2013-12-12'),
	('YJS', '윤종신', 1969, '강남', '', '', 170, '2005-05-05');
/*!40000 ALTER TABLE `shop` ENABLE KEYS */;

-- 테이블 jeju.shop_customer 구조 내보내기
CREATE TABLE IF NOT EXISTS `shop_customer` (
  `num` int(11) NOT NULL AUTO_INCREMENT,
  `userID` varchar(50) DEFAULT NULL,
  `prodName` varchar(50) DEFAULT NULL,
  `groupName` char(2) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  PRIMARY KEY (`num`),
  KEY `userID` (`userID`),
  CONSTRAINT `FK__shop` FOREIGN KEY (`userID`) REFERENCES `shop` (`userID`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- 테이블 데이터 jeju.shop_customer:~12 rows (대략적) 내보내기
/*!40000 ALTER TABLE `shop_customer` DISABLE KEYS */;
INSERT INTO `shop_customer` (`num`, `userID`, `prodName`, `groupName`, `price`, `amount`) VALUES
	(2, 'KBS', '운동화', '전자', 30, 2),
	(3, 'KBS', '노트북', '전자', 1000, 1),
	(4, 'JYP', '모니터', '전자', 200, 1),
	(5, 'BBK', '모니터', '전자', 200, 5),
	(6, 'KBS', '청바지', '의류', 50, 3),
	(7, 'BBK', '메모리', '전자', 80, 10),
	(8, 'SSK', '책', '서적', 15, 5),
	(9, 'EJW', '책', '전자', 15, 2),
	(10, 'EJW', '청바지', '의류', 50, 1),
	(11, 'BBK', '운동화', '전자', 30, 2),
	(12, 'EJW', '책', '서적', 15, 1),
	(13, 'BBK', '운동화', '서적', 30, 2);
/*!40000 ALTER TABLE `shop_customer` ENABLE KEYS */;

-- 프로시저 jeju.shop_insert 구조 내보내기
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `shop_insert`(
	IN `userID` VARCHAR(50),
	IN `name` VARCHAR(50),
	IN `birthYear` INT,
	IN `addr` CHAR(50),
	IN `mobile1` CHAR(50),
	IN `mobile2` CHAR(50),
	IN `height` INT,
	IN `mdate` DATE,
	OUT `result` INT









)
BEGIN
	DECLARE exit handler for SQLEXCEPTION
	BEGIN
	ROLLBACK; #COMMIT, SAVEPOINT
	SET RESULT = -1; # 에러나면 -1
	END;
	
	START TRANSACTION; #에러가 날수 있기때문에 transaction을 실행하겠다.
	INSERT INTO shop(userID, name, birthYear, addr, mobile1, mobile2, height, mDATE)
	VALUE(userID, name, birthYear, addr, mobile1, mobile2, height, mDATE);
	COMMIT; # 에러가 없으면 바로 commit
	SET RESULT = 0; # 에러가 나지 않으면 0
END//
DELIMITER ;

-- 테이블 jeju.student 구조 내보내기
CREATE TABLE IF NOT EXISTS `student` (
  `bunho` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  `kor` tinytext DEFAULT NULL,
  `mat` tinytext DEFAULT NULL,
  `eng` tinytext DEFAULT NULL,
  `total` int(11) DEFAULT NULL,
  `average` float DEFAULT NULL,
  `grade` char(2) DEFAULT NULL,
  `schoolcode` char(10) DEFAULT NULL,
  PRIMARY KEY (`bunho`),
  KEY `schoolcode` (`schoolcode`),
  CONSTRAINT `FK__school` FOREIGN KEY (`schoolcode`) REFERENCES `school` (`schoolcode`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8 COMMENT='2개의 테이블을 연결하기 위해서\r\nschool 이라는 테이블과  student 테이블을 연결하려면 외래키를 만들어줘야한다.\r\n열이름 ex)schoolcode 와 외래키 지정 참조테이블의 외래키 ex)schoolcode 이름이 일치하지 않아도 된다.';

-- 테이블 데이터 jeju.student:~8 rows (대략적) 내보내기
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` (`bunho`, `name`, `kor`, `mat`, `eng`, `total`, `average`, `grade`, `schoolcode`) VALUES
	(32, '전공인', '82', '82', '82', 246, 82, 'B', 'SE00000001'),
	(33, '전공이', '82', '82', '82', 246, 82, 'B', 'SE00000001'),
	(34, '전공삼삼', '92', '101', '101', 294, 98, 'A', 'CH00000001'),
	(35, '전공사', '101', '101', '101', 303, 101, 'A', 'CH00000001'),
	(36, '고려인', '101', '101', '101', 303, 101, 'A', 'CH00000001'),
	(37, '종로구', '101', '82', '72', 255, 85, 'B', 'IC00000001'),
	(38, '김만덕', '101', '82', '72', 255, 85, 'B', 'IC00000001'),
	(39, '제주민', '101', '101', '101', 303, 101, 'A', 'IC00000001');
/*!40000 ALTER TABLE `student` ENABLE KEYS */;

-- 테이블 jeju.student2 구조 내보내기
CREATE TABLE IF NOT EXISTS `student2` (
  `num` int(11) NOT NULL,
  `name` varchar(12) DEFAULT NULL,
  `sex` char(1) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `major` varchar(20) DEFAULT NULL,
  `address` varchar(15) DEFAULT NULL,
  `tel` varchar(15) DEFAULT NULL,
  `money` int(11) DEFAULT NULL,
  PRIMARY KEY (`num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='varchar 문자열보다는 / 전공은 code화 해주면 좋음 = 역사 1번, 경제 2번, 이런 식으로';

-- 테이블 데이터 jeju.student2:~6 rows (대략적) 내보내기
/*!40000 ALTER TABLE `student2` DISABLE KEYS */;
INSERT INTO `student2` (`num`, `name`, `sex`, `age`, `major`, `address`, `tel`, `money`) VALUES
	(20120001, '고길동', 'm', 27, '선박', 'seoul', '010-000-4512', 5000),
	(20120002, '최둘리', 'm', 22, '역사', 'busan', '010-999-9999', 4500),
	(20120003, '도우너', 'w', 15, '역사', 'daegu', '010-555-5555', 6500),
	(20120004, '김만덕', 'm', 15, '유아', 'mokpo', '010-555-7777', 7000),
	(20120005, '소지섭', 'm', 22, '컴퓨터공학', 'seoul', '010-122-2222', 8000),
	(20120006, '손흥민', 'm', 22, '컴퓨터공학', 'seoul', '010-999-9999', 8000);
/*!40000 ALTER TABLE `student2` ENABLE KEYS */;

-- 프로시저 jeju.student_insert 구조 내보내기
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `student_insert`(
	IN `name` VARCHAR(50),
	IN `kor` INT,
	IN `mat` INT,
	IN `eng` INT,
	IN `schoolcode` CHAR(10),
	OUT `result` INT


)
    COMMENT '# 클라이언트에서 넘어와야 되는 정보라서 매개변수를 추가해서 만들어줘야함 # 데이터를 다 가져오고 마지막에 result =out 으로 결과값을 돌려줘야함'
BEGIN
	DECLARE exit handler for SQLEXCEPTION
	BEGIN
	ROLLBACK; #COMMIT, SAVEPOINT
	SET RESULT = -1; # 에러나면 -1
	END;
	
	START TRANSACTION; #에러가 날수 있기때문에 transaction을 실행하겠다.
	INSERT INTO student(name, kor, mat, eng, schoolcode)
	VALUE(name, kor, mat, eng, schoolcode);
	COMMIT; # 에러가 없으면 바로 commit
	SET RESULT = 0; # 에러가 나지 않으면 0
END//
DELIMITER ;

-- 프로시저 jeju.student_select 구조 내보내기
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `student_select`()
BEGIN
   select * from student;
END//
DELIMITER ;

-- 프로시저 jeju.student_sum 구조 내보내기
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `student_sum`()
    COMMENT 'select 하는 변수합계라서 데이터 안받아와도 됨'
BEGIN
	DROP TABLE IF EXISTS sungjuk_hab; # 미리 만들어진 테이블이 있으면 지워라
	
	# 데이터 테이블 만들건데, select 해서 만들것
	CREATE TABLE sungjuk_hab(korhab float, mathab float, enghab float) AS
		select sum(kor) as korhab, sum(mat) as mathab, sum(eng) as enghab from student;
	# 성적합계를 넣어라 => 위에 만들 테이블에 3가지 필드 sungjuk_hab(korhab, mathab, enghab ) 에 넣어라
	insert into sungjuk_hab(korhab, mathab, enghab )
		select round(avg(kor),2) , round(avg(mat),2) , round(avg(eng),2) from student;
		select * from sungjuk_hab;
END//
DELIMITER ;

-- 프로시저 jeju.student_updatename 구조 내보내기
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `student_updatename`(
	IN `name1` VARCHAR(50),
	IN `name2` VARCHAR(50),
	OUT `result` INT
)
BEGIN
	DECLARE cnt int default 0; #cnt=0
	SELECT count(*) INTO cnt FROM student where name =name1;
	
	IF cnt > 0 then 
			UPDATE student SET name = name2 where name = name1;
			SET result := 0;
	
	ELSE SET result := -1;
	END IF;
	
END//
DELIMITER ;

-- 프로시저 jeju.student_updateone 구조 내보내기
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `student_updateone`()
BEGIN
	DECLARE _done INT DEFAULT FALSE;   # 무한루프의 종료조건
	DECLARE name_var VARCHAR(20);  # 하나의 데이터를 처리하기 위한 변수
	DECLARE kor_var INT;
	DECLARE mat_var INT;
	DECLARE eng_var INT;
	
	# 커서 선언 = 학생의 모든 데이터를 가져와서 데이터를 가리키는 위치를 말함
	# CURSOR = 데이터를 가리키는 위치
	DECLARE CURSOR_STUDENT CURSOR FOR SELECT name, kor, mat, eng from student;
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET _done = TRUE; # 종료조건 = TRUE

	# 오픈해야 데이터를 가져옴
	OPEN CURSOR_STUDENT;
	REPEAT
	# 데이터를 하나씩 가져오기 위해서 fetch 시킴
		FETCH CURSOR_STUDENT INTO name_var, kor_var, mat_var, eng_var;

		IF NOT _done THEN # if not = 거짓부정 = 즉 TRUE 참일때 
			UPDATE student SET kor = kor_var+1, mat = mat_var+1, eng = eng_var+1 where name = name_var;
			SET _done = FALSE;
		END IF;
	UNTIL _done #종료조건이 TRUE 가 될때까지 무한루프 반복함
	END REPEAT;
	CLOSE CURSOR_STUDENT;
END//
DELIMITER ;

-- 테이블 jeju.sungjuk_hab 구조 내보내기
CREATE TABLE IF NOT EXISTS `sungjuk_hab` (
  `korhab` float DEFAULT NULL,
  `mathab` float DEFAULT NULL,
  `enghab` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 테이블 데이터 jeju.sungjuk_hab:~2 rows (대략적) 내보내기
/*!40000 ALTER TABLE `sungjuk_hab` DISABLE KEYS */;
INSERT INTO `sungjuk_hab` (`korhab`, `mathab`, `enghab`) VALUES
	(761, 732, 712),
	(95.12, 91.5, 89);
/*!40000 ALTER TABLE `sungjuk_hab` ENABLE KEYS */;

-- 트리거 jeju.student_before_insert 구조 내보내기
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `student_before_insert` BEFORE INSERT ON `student` FOR EACH ROW BEGIN -- OLD : 입력된 값, NEW : 새롭게 만들어질 데이터, 
#        변수에 값을 대입할때 set 이라는 명령어를 써준다
   set New.total = NEW.kor + NEW.mat +NEW.eng;
   set NEW.average = round(NEW.total/3,2);
   
   IF NEW.average >= 90 THEN SET NEW.grade='A';
   ELSEIF NEW.average >= 80 THEN SET NEW.grade='B';
   ELSEIF NEW.average >= 70 THEN SET NEW.grade='C';
   ELSEIF NEW.average >= 60 THEN SET NEW.grade='D';
   ELSE SET NEW.grade='F';
   END IF;
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- 트리거 jeju.student_before_update 구조 내보내기
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `student_before_update` BEFORE UPDATE ON `student` FOR EACH ROW BEGIN
   set New.total = NEW.kor + NEW.mat +NEW.eng;
   set NEW.average = round(NEW.total/3,2);
   
   IF NEW.average >= 90 THEN SET NEW.grade='A';
   ELSEIF NEW.average >= 80 THEN SET NEW.grade='B';
   ELSEIF NEW.average >= 70 THEN SET NEW.grade='C';
   ELSEIF NEW.average >= 60 THEN SET NEW.grade='D';
   ELSE SET NEW.grade='F';
   END IF;
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
