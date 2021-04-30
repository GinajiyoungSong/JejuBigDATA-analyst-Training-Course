INSERT INTO goods VALUES(1, '냉장고', 2, 850000);
INSERT INTO goods VALUES(2, '세탁기', 3, 550000);
INSERT INTO goods VALUES(3, '전자레인지', 2, 350000);
INSERT INTO goods VALUES(4, 'HDTV', 3, 1500000);

# 테이블 만들때 name 은  not null 로 지정했는데
# INSERT INTO goods(CODE,su,dan) VALUES(4,3,1500000);
# primary key = code 기본값이 0 , 코드는 중복이 되면 안됨
# INSERT INTO goods(NAME,su,dan) VALUES("py", 3, 1500000);

SELECT * FROM goods
INSERT INTO goods(CODE, NAME, su) VALUES(5, '드론', 1);
UPDATE goods SET dan = 1000000 WHERE CODE=5; #중복없이 데이터 입력
DELETE FROM goods WHERE CODE = 5
INSERT INTO goods VALUES(5, 'VR기기', 2, 1440000);
INSERT INTO goods VALUES(6, 'Drone', 1, 890000);
INSERT INTO goods(CODE,NAME,su) VALUES(7,'고성능컴퓨터', 3);

# 이름이 냉장고이고 단가가 750000원 이상인 데이터 출력
SELECT * FROM goods WHERE NAME='냉장고'and dan >750000 ;
#단가가 750000원 이하인 제품 출력
SELECT * FROM goods WHERE dan<750000;
# 단가가 500000원 이상이고 1200000이하인 제품출력
SELECT * FROM goods WHERE dan>500000 AND dan<1200000;
# 판매 수량이 3개 이상인 제품명과 단가의 출력
SELECT NAME, dan FROM goods WHERE su>=3;