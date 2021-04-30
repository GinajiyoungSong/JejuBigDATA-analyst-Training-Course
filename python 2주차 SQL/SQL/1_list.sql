jeju

#CRUD ( insert into, select, update, delete ) 문 사용
insert into authors(name, korean, english, math) VALUES("대한이", 90, 90, 90);
insert into authors(name, korean, english, math) VALUES("민국이", 80, 80, 80);
insert into authors(name, korean, english, math) VALUES("만세", 100, 100, 100);



#데이터베이스 (외부접속단위), 테이블, 필드, 레코드
# * : 모두다
SELECT * FROM authors;
SELECT * FROM authors WHERE NAME="대한이";
SELECT korean FROM authors WHERE NAME="만세";

#update 테이블명 set 콜룸명 =' 넣고자하는 데이터' where ~ : 내가 원하는 데이터를 변경하고 싶을때
UPDATE authors SET NAME ="대한민국" WHERE NAME ="대한이";
SELECT * FROM AUTHORS;


# delete from 테이블명
DELETE FROM authors WHERE NAME="만세;

# 문제 : 3인분 성적을 students 테이블에 입력하고 출력해보시요
# 이름 국어 영어 수학 총점 평균
# 대한이, 90, 90, 90
# 민국이, 80, 80, 80
# 만세, 100, 100, 100

SELECT korean, english, math FROM authors WHERE NAME='대한민국' 
UPDATE authors SET total =korean+english+math WHERE NAME ="대한민국";
SELECT * FROM AUTHORS;


UPDATE authors SET total =korean+english+math WHERE NAME ="민국이";
UPDATE authors SET total =korean+english+math WHERE NAME ="만세";
UPDATE authors SET average = ROUND((total)/3,2) WHERE NAME='대한민국';
UPDATE authors SET average = ROUND((total)/3,2) WHERE NAME='민국이';
UPDATE authors SET average = ROUND((total)/3,2) WHERE NAME='만세';
SELECT * FROM AUTHORS;
