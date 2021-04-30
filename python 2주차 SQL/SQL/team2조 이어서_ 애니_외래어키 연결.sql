INSERT INTO student VALUES('20090101', '루피', 'IDE', '01112345678', 1);
INSERT INTO student VALUES('20100102', '조로', 'CSE', '01123435343', 4);
INSERT INTO student VALUES('20110103', '상디', 'MSE', '01121342443', 1);
INSERT INTO student VALUES('20100204', '버기', 'ESE', '01123424343', 2);
INSERT INTO student VALUES('20110106', '프랑키', 'IME', '01134343222' , 0);
INSERT INTO student VALUES('20080104', '나미', 'IDE', '01123432432', 6);
INSERT INTO student VALUES('20090105', '쵸파', 'CSE', '01112342433', 8);
INSERT INTO student VALUES('20090301', '에릭', 'ESE', '01132424244', 5);
INSERT INTO student VALUES('20090302', '전진', 'IDE', '01112321313', 3);
INSERT INTO student VALUES('20100505', '오공', 'CSE', '01123534644', 2);
INSERT INTO student VALUES('20110506', '오천', 'MSE', '01121334525', 8);
INSERT INTO student VALUES('20100507', '베지터', 'ESE', '01123423623', 0);
INSERT INTO student VALUES('20110502', '부우', 'IME', '01134332634', 1);
INSERT INTO student VALUES('20080501', '크리링', 'IDE', '01123436346', 2);
INSERT INTO student VALUES('20090503', '피콜로', 'CSE', '01113634645', 3);
INSERT INTO student VALUES('20090509', '셀', 'ESE', '01132427535', 0);

SELECT * FROM student;


# 5개의 코드가 너무 많이 불러옴
#INSERT INTO department(department_code)
#SELECT belong FROM student
#ORDER BY belong;

#SELECT * FROM department;



INSERT INTO department(department_code)
SELECT distinct(belong) FROM student
ORDER BY belong;

SELECT * FROM department;

# 새로운 테이블 생성

CREATE TABLE department2
( department_code CHAR(5) PRIMARY KEY) AS 
SELECT DISTINCT(belong) AS department_code FROM student
ORDER BY belong;

SELECT * FROM department2;

# DDL 언어 사용 alter
ALTER TABLE student
  ADD CONSTRAINT student_department # 새로운 제약조건 추가
  FOREIGN KEY(belong)  # 외래키를 belong 으로 추가
  REFERENCES department2(department_code) #외래열 참고 
  ON UPDATE CASCADE ON DELETE CASCADE; 

SELECT * FROM student; # belong 에 키 생긴거 볼수 있음

# 데이터를 수정해주자
UPDATE department2
SET department_code = 'CCE' # 데이터수정해줌 => 예)프랑키 CCE 로 바뀜
WHERE department_code = 'IME';
SELECT * FROM student;

# 데이터 삭제하고 싶다면
DELETE FROM department2 WHERE department_code = 'MSE';



# 외래키 제거
# DDL 언어 사용  Drop 

ALTER TABLE student
  DROP FOREIGN KEY student_department,
  DROP KEY student_department;

#참조의 무결성
#department2 테이블에는 IDE, CSE, CCE, ESE, MSE 이렇게 5가지 값이 있다. 
#그리고 student 테이블의 belong값도 마찬가지로 5개의 값을 가지고 있다.
#만약 department2의 테이블에서 MSE가 제거가 되었고, 
#student(belong)에는 여전히 5개의 값을 가지고 있는 상태에서 
#department2(department_code)를 외래키로 지정할 때 오류가 발생한다. 
#그 이유는 참조하는 테이블에 없는 값을 가지고 있기 때문이다.
# 외래키로 설정한 값이 참조하는 테이블의 속성 없으면 안된다는 규칙이다.

#출처: https://futurists.tistory.com/16 [미래학자]