# SCHOOL 쿼리
INSERT INTO school(schoolname, address, schoolcode, studentcount) VALUES ("충주여자고등학교", "충주시", "CH00000001", 300);
INSERT INTO school(schoolname, address, schoolcode, studentcount) VALUES("신성여자고등학교", " 제주시", "IC00000001", 560);
INSERT INTO school(schoolname, address, schoolcode, studentcount) VALUES("종로여자고등학교", "제주시", "JR00000001", 300);
INSERT INTO school(schoolname, address, schoolcode, studentcount) VALUES("제주여자고등학교", "서울시", "SE00000001", 300);


#student 쿼리 채우기
INSERT INTO student(NAME,kor,mat,eng,schoolcode) VALUES("전공인", 81, 81, 81, "SE00000001");
INSERT INTO student(NAME,kor,mat,eng,schoolcode) VALUES("전공이", 81, 81, 81, "SE00000001");
INSERT INTO student(NAME,kor,mat,eng,schoolcode) VALUES("전공삼삼", 91, 100, 100, "CH00000001");
INSERT INTO student(NAME,kor,mat,eng,schoolcode) VALUES("전공사",100, 100, 100, "CH00000001");
INSERT INTO student(NAME,kor,mat,eng,schoolcode) VALUES("고려인",100, 100, 100, "CH00000001");
INSERT INTO student(NAME,kor,mat,eng,schoolcode) VALUES("종로구",100, 81, 71, "IC00000001");
INSERT INTO student(NAME,kor,mat,eng,schoolcode) VALUES("김만덕",100, 81, 71, "IC00000001");

SELECT * FROM school;
SELECT * FROM student;

SELECT * FROM school WHERE schoolcode = 'CH00000001';
SELECT * FROM student WHERE NAME='고려인';

SELECT NAME, kor, mat, eng FROM student WHERE NAME ='전공인';
# 내가 원하는 데이터만 뽑아낼때

SELECT NAME AS '이름', kor AS '국어', mat AS '수학', eng AS '영어' FROM student WHERE NAME ='전공이';
# names as '콜룸명' 바꾸고싶은 콜룸명으로 고쳐서  = 내가 원하는 데이터를 뽑아낼때

# 서브 쿼리 = > ()괄호 안에 있는 것부터 먼저 실행한다음 밖에 코드를 실행
SELECT NAME,kor,mat,eng FROM student WHERE schoolcode IN (SELECT schoolcode FROM school WHERE schoolcode ='CH00000001');
SELECT NAME,kor,mat,eng FROM student WHERE schoolcode IN (SELECT schoolcode FROM school WHERE schoolname ='신성여자고등학교');






SELECT NAME,kor,mat,eng FROM student WHERE NAME LIKE '전공%';
# 전공 이라는 두글자를 포함한 이름 읽어냄
SELECT NAME,kor,mat,eng FROM student WHERE NAME LIKE '%공%';
# 가운데 공이라고 들어간 이름 모두 ( % 는 글자수 상관없음)
SELECT NAME,kor,mat,eng FROM student WHERE NAME LIKE '_려_';
# _려_ 글자수 맞게



# 관계연산을 이용해서 원하는 점수대로만 뽑아내기
SELECT * FROM student WHERE kor>90 AND mat>90 AND eng>90;
SELECT * FROM student WHERE kor>90 OR mat>90 OR eng>90;
SELECT * FROM student WHERE kor>80 AND kor<90;
SELECT * FROM student WHERE kor BETWEEN 80 AND 100;



#group by, having, order by, limit
SELECT * FROM student LIMIT 1;
SELECT * from student order by name DESC; #descent 내림차순
SELECT * from student order by name ASC; #ascen 오름차순


# group by => 집계가 가능한 콜룸에서 데이터를 뽑아낼때
# 직업별로 급여의 합계를 내시오
# SELECT major, sum(money) FROM student GROUP BY major;







# inner join : 2개의 조건이 만족하는 것만 출력
# from student st  inner join school sc
#              --별칭               --별칭

SELECT sc.shcoolname, sc.schoolcode, st.name, st.average
     FROM student st  inner join school sc
        ON st.schoolcode = sc.schoolcode
        
# left / right outer join : 일치하지 않은거도 다 불러올때







# name as 콜롬에 한국어로 이름을 붙여라
SELECT NAME AS '이름', kor AS '국어', mat AS '수학', eng AS '영어' FROM student WHERE NAME ='전공이';


SELECT CONCAT(NAME, '님') AS '이름', kor AS '국어', mat AS '수학', eng AS '영어' FROM  student WHERE NAME='전공인';
#       뒤에 님을 붙여라 = 합치라는 함수
SELECT CONCAT(NAME, '님') AS '이름', LPAD(kor,10, '*') AS '국어', mat AS '수학', eng AS '영어'FROM student WHERE NAME='전공삼';
#                                    10자리를 만들어 놓고 왼쪽에 * 를 채워라
#                                    RPAD : 오른쪽정렬




SELECT REPLACE(CONCAT(NAME,'님'),'님','형') AS '이름', LPAD(kor, 10, '*') AS '국어', mat AS '수학', eng AS '영어' FROM student WHERE NAME='전공삼';
#      '님' 을 다시 '형'으로 바꿔라

SELECT SUBSTR(REPLACE(CONCAT(NAME,'님'),'님','형'),1,2) AS '이름', RPAD(kor, 10,'*') AS '국어', mat AS '수학', eng AS '영어' FROM student where NAME='김만덕';
#      원하는 데이터만 빼내라                    ), 1번째부터 2번째까지 빼내라 as 이름
#                                                ), 시작, 끝) as 빼내고 싶은 열

SELECT LENGTH(SUBSTR(REPLACE(CONCAT(NAME,'님'),'님','형'),1,2)) AS '이름', substr(RPAD(kor, 10,'*'),1,3) AS '국어', mat AS '수학', eng AS '영어' FROM student where NAME='김만덕';
#      이름대신에 길이값 출력 = 2글자를 뽑았기 때문에 1글자는 3개로 계산 => 김만 : 6글자


