# 문제
--  전공인의 국어 : 80, 영어 90 으로 변경하고  함계와 평균 그리고 grade 를 수정 - 계산을 수동으로 하고 변화만 적용하시요
-- student 중 kor, mat 점수만 출력하시요
-- student 중 average 가 90이상의 사람의 name, schoolname을 출력하시요
-- student 중 eng 점수를 출력하되 그 이름을 '영어'로 하시요
-- 이름 가운데 자가 '공'인 사람을 모두 출력하시요
-- 학교 이름이 충주여자고등학교 인 사람의 name 과 total 을 출력하시요
-- student 에서 total을 이용하여 정렬하고 상위 2사람만 출력하시요


# 점수변경
UPDATE student SET kor=80, eng=90 WHERE NAME ='전공인';
# 함계와 평균 그리고 grade 수정

SELECT kor,mat,eng FROM student WHERE NAME ='전공인';
UPDATE student SET total = 90+80+90, average = ROUND((90+80+90)/3,2), grade='B' WHERE NAME='전공인';
UPDATE student SET total = kor+mat+eng, average = ROUND((kor+mat+eng)/3,2), grade='B' WHERE NAME='전공인';



#grade 수정
UPDATE student SET total = 90+80+90, average = ROUND((90+80+90)/3,2), grade='B' WHERE NAME='전공인';
SELECT * FROM student
UPDATE student SET total = kor+mat+eng, average = ROUND((kor+mat+eng)/3,2), grade=( CASE WHEN score>='90' THEN 'A학점'
 WHEN (score>='80' AND score <'90') THEN 'B학점'
 WHEN (score>='70' AND score <'80') THEN 'C학점'
 WHEN (score>='60' AND score <'70') THEN 'D학점'
 ELSE 'F학점'
END) WHERE NAME='전공인';



SELECT kor, mat FROM student;
-- student 중 average 가 90이상의 사람의 name, schoolname을 출력하시요
# inner joint / outer joint => https://toma0912.tistory.com/51?category=205530
# 순서  select ____________ (from _______ as 별칭 inner join ______ as 별칭) 
#       on 조건 and 별칭.외래코드명 = 별칭.외래코드명

SELECT st.name, sc.schoolname 
    from student as st INNER JOIN school AS sc
    on st. average > 90 AND  st.schoolcode = sc.schoolcode;

-- student 중 eng 점수를 출력하되 그 이름을 '영어'로 하시요
SELECT eng AS '영어' FROM student;

-- 이름 가운데 자가 '공'인 사람을 모두 출력하시요
SELECT * FROM student WHERE NAME LIKE '%공%';

-- 학교 이름이 충주여자고등학교 인 사람의 name 과 total 을 출력하시요
SELECT st.name, st.total FROM student AS st
    INNER JOIN school AS sc
    ON sc.schoolname='충주여자고등학교'
    AND st.schoolcode = sc.schoolcode;


-- student 에서 total을 이용하여 정렬하고 상위 2사람만 출력하시요
SELECT * FROM student ORDER BY total DESC LIMIT 2;
# 순서지키기 = > where, group by, having, order by, limit  순서대로 적어줘야함



