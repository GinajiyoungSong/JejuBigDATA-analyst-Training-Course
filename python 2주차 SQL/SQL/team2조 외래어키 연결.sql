SELECT * FROM bigdata; 
SELECT * FROM team;

SELECT distinct team.name AS '이름', team.dep AS '전공' FROM team JOIN bigdata ON team.city = bigdata.city ;# WHERE city='제주' 왜 에러나지?;

# bigdata 와 team 을 join 해서 원하는 2조 정보만 출력하기
SELECT * FROM bigdata JOIN team ON bigdata.city= team.city;
#테이블 2개가 합쳐짐


SELECT bigdata.number '출석부no.', bigdata.name '이름' FROM bigdata JOIN team ON bigdata.city = team.city;


# 여기서 부터 모르겠음
#CREATE VIEW allView as
#SELECT bigdata.number AS '출석부no', team.name as'이름' , team.city FROM bigdata JOIN team ON bigdata.city= team.city ;#WHERE city='제주';
#SELECT * from allView;

# view 를 만들었더니 city 값을 가진 애들로 다 덮어씌워진??


SELECT NAME AS '이름', dep AS '전공' FROM team WHERE city IN (SELECT city FROM bigdata );