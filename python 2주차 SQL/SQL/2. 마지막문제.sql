CALL shop_insert('BBK', '바비킴', 1973, '서울', '010', '0000000', 176, 20130505, @res);
CALL shop_insert('EJW', '은지원', 1972, '경북', '011', '8888888', 174, 20140303, @res);
CALL shop_insert('JKW', '조관우', 1965, '경기', '018', '9999999', 172, 20101010, @res);
CALL shop_insert('JYP', '조용필', 1950, '경기', '011', '4444444', 166, 20090404, @res);
CALL shop_insert('KBS', '김범수', 1979, '경남', '011', '2222222', 173, 20120404, @res);
CALL shop_insert('KKH', '김경호', 1971, '전남', '019', '3333333', 177, 20070707, @res);
CALL shop_insert('LJB', '임재범', 1963, '서울', '016', '6666666', 182, 20090909, @res);
CALL shop_insert('LSG', '이승기', 1987, '서울', '011', '1111111', 182, 20080808, @res);
CALL shop_insert('SSK', '성시경', 1979, '서울', ' ', ' ', 186, 20131212, @res);
CALL shop_insert('YJS', '윤종신', 1969, '강남', ' ', ' ', 170, 20050505, @res);
SELECT *FROM shop;
update shop set mobile1='010', mobile2='0000000' WHERE userID='BBK';
update shop set mobile1='011' WHERE userID='EJW';

# shop_customer 테이블 데이터 넣기
INSERT INTO shop_customer(userID, prodName, groupName, price, amount) VALUES('KBS','운동화','전자',30,2);
INSERT INTO shop_customer(userID, prodName, groupName, price, amount) VALUES('KBS','노트북','전자',1000,1);
INSERT INTO shop_customer(userID, prodName, groupName, price, amount) VALUES('JYP','모니터','전자',200,1);
INSERT INTO shop_customer(userID, prodName, groupName, price, amount) VALUES('BBK','모니터','전자',200,5);
INSERT INTO shop_customer(userID, prodName, groupName, price, amount) VALUES('KBS','청바지','의류',50,3);
INSERT INTO shop_customer(userID, prodName, groupName, price, amount) VALUES('BBK','메모리','전자',80,10);
INSERT INTO shop_customer(userID, prodName, groupName, price, amount) VALUES('SSK','책','서적',15,5);
INSERT INTO shop_customer(userID, prodName, groupName, price, amount) VALUES('EJW','책','전자',15,2);
INSERT INTO shop_customer(userID, prodName, groupName, price, amount) VALUES('EJW','청바지','의류',50,1);
INSERT INTO shop_customer(userID, prodName, groupName, price, amount) VALUES('BBK','운동화','전자',30,2);
INSERT INTO shop_customer(userID, prodName, groupName, price, amount) VALUES('EJW','책','서적',15,1);
INSERT INTO shop_customer(userID, prodName, groupName, price, amount) VALUES('BBK','운동화','서적',30,2);
SELECT *FROM shop_customer

#  - BBK 가 구매한 데이터를 출력하시오
SELECT so.name, sc.prodName
	FROM shop so INNER JOIN shop_customer sc
	ON NAME='바비킴'
	and so.userID = sc.userID


#  - 김씨인 사람중 이름과 키를 기준으로 이름, 키, 주소를 내림차순으로 출력하시요
#  ( 이름 뒤에는 '님'을 붙여서 출력)

#group by, having, order by, limit

SELECT *FROM shop WHERE NAME LIKE '김%';
SELECT *FROM shop WHERE NAME LIKE '김%' order BY NAME DESC; 
SELECT CONCAT(NAME,'님') AS '이름', height AS '키', addr AS '주소' FROM shop WHERE NAME LIKE '김%' ORDER BY '주소' DESC;
SELECT CONCAT(NAME,'님') AS '이름', height AS '키', addr AS '주소' FROM shop WHERE NAME LIKE '김%' ORDER BY '키' DESC;


# - user를 출생년도별 오름차순으로 이름, 주소, 키, 출생년도를 출력하시요
#  ( 이름은 성을 빼고 출력)
SELECT SUBSTR(CONCAT(NAME,'님'),2,3) as '이름', height as '키', addr AS '주소', birthYear AS '출생년도'  from shop ORDER BY birthYear ASC;  



# - 모바일 번호가 011로 시작하는 사람이 몇명인지 출력하시요
SELECT COUNT(*) FROM shop WHERE mobile1='011'

SELECT * FROM shop WHERE birthYear between 1960 AND 1979;
# - 출생년도가 1960년에서 1979년까지 태어난 사람들이 구매한 품목을 출력하시오
SELECT prodName FROM shop_customer WHERE userID IN (SELECT userID FROM shop WHERE birthYear BETWEEN 1960 AND 1979);


SELECT sc.prodName FROM shop so INNER JOIN shop_customer sc
   ON so.userID = sc.userID 
	and so.birthYear between 1960 AND 1979;
	
	
	
	
# - user ID 별로 구매한 price, amount 합계를 출력하시요 ( 이 때 userID는 name 으로 출력하시요)
SELECT SUBSTR(NAME,
IN(select so.name, sc.userID, sc.price, sc.amount
	FROM shop so INNER JOIN shop_customer sc
	ON so.userID = sc.userID group BY userID);
	
	
select sum(price) AS pricehab, sum(amount) as amounthab from shop_customer WHERE userID='BBK';
# - 주소가 서울인 사람이 구매한 총액을 구하시요

# - 품목별 판매 총액을 출력하시요
# - 출생년도가 1970년도 이상인 사람을 대상으로 구매한 갯수가 2개 이상인 것의 판매 총합계를 구하시요
# - 모든 유저를 출력하시요 ( 이름 중에 김씨와 조씨는 모두 컬씨로 바꾸어 출력)
# - 책을 구매한 사람의 이름과 출생년도와 주소를 출력하시오.

