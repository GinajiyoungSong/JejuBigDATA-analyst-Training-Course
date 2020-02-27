INSERT INTO student VALUES(20120001, '고길동', 'm', 27, '선박', 'seoul', '010-000-4512', 5000);
INSERT INTO student VALUES(20120002, '최둘리', 'm', 22, '역사', 'busan', '010-999-9999', 4500);
INSERT INTO student VALUES(20120003, '도우너', 'w', 15, '역사', 'daegu', '010-555-5555', 6500);
INSERT INTO student VALUES(20120004, '김만덕', 'm', 15, '유아', 'mokpo', '010-555-7777', 7000);
INSERT INTO student VALUES(20120005, '소지섭', 'm', 22, '컴퓨터공학', 'seoul', '010-122-2222', 8000);
INSERT INTO student VALUES(20120006, '손흥민', 'm', 22, '컴퓨터공학', 'seoul', '010-999-9999', 8000);

SELECT * FROM student

# 직업별로 급여의 합계를 내시오
SELECT major, sum(money) FROM student GROUP BY major;
#         group by 함수에는 집계가 가능한 필드만 가능
select COUNT(*) FROM student;

#최씨로 시작하는 사람 출력
SELECT *FROM student WHERE NAME LIKE '최%';

# 서울이 주소이고 고씨인 사람
SELECT *FROM student WHERE address LIKE 'seoul' AND NAME LIKE '고%';

SELECT COUNT(*)"전체행수", COUNT(money) "급여건수",
MAX(money)최대급여, MIN(money)최소급여,
ROUND(AVG(money),2) 평균급여 FROM student;


#SELECT COUNT(*), COUNT(money) ,   # count() 함수에서 콜롬이름 바꾸기
#MAX(money)최대급여, MIN(money)최소급여,
#ROUND(AVG(money),2) 평균급여 FROM student;


SELECT COUNT(*), COUNT(money) ,
MAX(money)최대급여, MIN(money)최소급여,
ROUND(AVG(money),2) 평균급여 FROM student;
 SELECT MAX(money) - MIN(money) AS 급여구간 FROM student;
 
#money에 대하여 min-max 정규화를 실행하시요
# 정규화는 0~1 사이의 값으로 표현하는 것
# 그룹 함수이기 때문에 그룹값을 상수화해야 정상적으로 계산됨
SELECT (money-MIN(money))/(MAX(money)-MIN(money)) AS 정규화 FROM student;
#프로그램으로 변경(데이터베이스에서는 사용자변수 @ 붙여줘야함. @@ 골뱅이2개는 시스템변수)


SELECT MIN(money) INTO @minvalue from student;
SELECT @minvaule;

SELECT MAX(money) - MIN(money) INTO @rangevalue FROM student;
SELECT @rangevalue;

SELECT (money-@minvalue)/@rangevalue AS 정규화값 FROM student;

