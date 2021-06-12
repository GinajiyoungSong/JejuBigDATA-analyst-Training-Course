#4일차
#Matrix 생성

z <- matrix( 1:20 , nrow = 4 );z       
# row는 행/관측치 행을 4개 만들면 자연스럽게 20개의 데이터를
# 5열/변수가 완성된다

z <- matrix( 1:20 , ncol = 4 );z       
#col 행/관측치 - 그렇지만 변수 채워넣는건 1열부터 쭉~

z <- matrix( 1:20 , nrow = 4, ncol = 4);z

z <- matrix( 1:20, nrow = 4, ncol = 5, byrow = T );z       
# byrow = True :: 행중심으로 데이터 채워라

# R프로그램에서는 기본이 변수/열 중심



x <- 1:4 ;x
y <- 5:8 ;y
z <- matrix( 1:20, nrow = 4, ncol = 5 ); z

m1 <- cbind( x, y )                        #c <- col 변수 x, 변수 y 로 보고 bind 함
m1
str(m1)
#bind 함수에 넣으면 무조건 매트릭스 완성

m2 <- rbind( x, y )                        #r <- row 관측치 x, 관측치 y
m2
m3 <- rbind( m2, x ) ; m3
m4 <- cbind( z, x) ; m4                    # matrix에 배열추가 가능


# Matrix에서 cell 값 호출
# vector 랑 동일 [] 값 호출함수
z[ 2, 4 ]
z[ 1, 4 ]
z[ 2, ]
z[  , 4 ]

z[ 2, 1:3 ]
z[ 1, c( 1, 2, 4 ) ]
z[ 1:2, ]
z[ , c( 1, 4 ) ]

# Matrix 에서 행/열에 이름 지정
score <- matrix( c( 90, 85, 69, 78,
                    85, 96, 49, 95,
                    90, 80, 70, 70),
                 nrow = 4, ncol = 3)
score
rownames( score ) <- c( "Hong", "Kim", "Lee", "Yoo" )
colnames( score ) <- c( "English", "Math", "Science" )
score


score[ 'Hong', 'Math']
score[ 'Kim' , c( 'Math', 'Science') ]
score[ 'Lee' , ]
score[ , 'English']
rownames( score )
colnames( score )
colnames( score )[ 2 ]


#matrix 복습은 책  64page 참고

#***************************************



#Data Frame 생성  # Matrix와 달리 열/변수의 이름이 지정된다.
#즉 city벡터와 rank 벡터가 이름이 되므로, 따로 이름 지정 안하는거???

city <- c( "Seoul", "Tokyo", "Washington" )
rank <- c( 1, 2, 3 )
city.info <- data.frame( city, rank )             # city 변수 이름표기 / rank 변수 이름표기
city.info

str(city.info)
#charater타입의 문자형 변수가 factor형으로 돰 <- 이거 factor형으로 안하는 방법 있음


# data.frame 만드는 2가지 방법. 각각 변수로 지정후 하나로 묶기
# 데이타가 많지 않을때는 데이타프레임 함수에 직접적용


name <- c( "Hong", "Kim", "Lee" )
age <- c( 22, 20, 25 )
gender = factor( c ( "M", "F", "M"))
blood.type = factor( c( "A", "O", "B" ))
person.info <- data.frame( name, age, gender, blood.type )
person.info

person2.info <- data.frame( name = c( "Hong", "Kim", "Lee" ),         # data.frame 각각 모두 적은것
                            age = c( 22, 20, 25 ),                    # 변수의 수가 적을때만 가능
                            gender = factor( c ( "M", "F", "M")),
                            blood.type = factor( c( "A", "O", "B" )))
person2.info

#****************************************************

# 요소 접근 방법

str(city.info)
city.info
city.info[ 1, 1 ] #factor형 함수: 범위형 : level 나옴
city.info[ 1,  ] #1행내역만 뽑을때는 level 안나옴
city.info[ , 1 ]

city.info[ city.info$city, ]
city.info[ , "rank"]            # 값만 추출할때는 " " 처리???

city.info$city




person.info$name                                 #변수명만 주면 그 변수name 이 list 로 불러옴
person.info[ person.info$name == "Hong", ]       #변수 중에서도 name 이 "Hong" 모든 변수를 불러움
person.info[ person.info$name == "Hong", c( "name", "age" ) ]



data()  #R에서 제공하는 R data sets 를 새 script를 불러옴

iris     #R data sets 중에서 iris 라는 data.frame 을 볼수있다
iris[ , c( 1:2 ) ]
iris[ , c( 1, 3, 5 ) ]
iris[ , c("Sepal.Length", "Species") ]
iris[ 1:5, ];     
iris[ 1:5, c( 1, 3 ) ]



# 68 page

# Matrix 와 Data Frame 에서 사용하는 함수
person.info
dim( person.info )  ;   dim( iris )             #자주씀    #관측치 몇행 / 변수 몇열

nrow( person.info ) ;nrow( m3 )
ncol( person.info ) ;ncol( m3 )
head( iris )                                    #자주씀  
tail( iris )                                    #자주씀

#원하는 data.frame 요약정보보기
str( iris )                                     #자주씀
str( city.info )
str( person.info )

#원하는 정보 추출
iris[ , 5 ]
unique( iris[,5 ] )                             #종류가 x개인데 꽃품종마다 다 표기되다보니
#같은이름이 엄청 많이 나옴. x 를 알기 위해
# unique 한번씩 표기된거 count


#table함수는 도수분포표.
#표로 수치화 해서 보고싶을때 
table( iris[, "Species" ] ) 
# 수많은 데이터들 중에서 카테고리화 시켜서 분포도 확인 #자주씀

table( person.info[ , "blood.type" ] )
table( person.info[ , "gender" ] )



# Matrix/Data Frame 사용함수
# 행별/열별 합계와 평균 계산

colSums( iris[ , -5 ] );       #변수합계               


#5열을 제외해서        #1부터 4변수 (5변수 제외 : factor 타입)   
# apply ( 데이터셋, 1:row방향 2:col방향, 원하는값 )
#편리한 apply() 함수이용
apply( iris[ , 1:4 ], 2, sum )

#내가 원하는 수식
#colsums(), colMeans 등을 써도 되고  
#apply( , , sum) / apply( , , mean) 써도 됨

colMeans( iris[ , -5 ] );                apply( iris[ , 1:4 ], 2, mean )
rowSums( iris[ , -5 ] );                 apply( iris[ , -5 ], 1, sum )
rowMeans( iris[ , -5 ] );                apply( iris[ , -5 ], 1, mean )

apply( iris[ , -5 ], 2, median )


# 행/열 방향 전환 : t()함수
z <- matrix( 1:20, nrow = 4, ncol = 5); z
t( z )





#조건에 맞는 행과 열의 값 추출(Data Frame만 가능)                                       
#부분추출
#subset() 함수

#data.frame. 에서 내가 원하는 조건에 맞는 부분추출
#매우 많이씀
#행추출 filter()
#열추출 seclet() 와 비숫

IR.1 <- subset( iris, Species == "setosa" );                                 IR.1    
IR.2 <- subset( iris, Sepal.Length > 5.0 & Sepal.Width > 4.0 );              IR.2
IR.2[ ,  c( 2, 4) ]

person.info
p.age <- subset( person.info, age >20 ); p.age


#*************************************************************
# Matrix/Data Frame 산술연산

a <- matrix( 1:20, 4 , 5 );         a
b <- matrix( 21:40, 4, 5 );         b

2 * a
b - 5
2 * a + 3 * b

a + b
b - a
b / a
a * b








#Matrix/Data Frame 자료구조 확인/ 변환
class( iris )                                 #벡터인지 메트리스 인지, 데이터프레임인지 물어볼때
class( state.x77)


is.matrix( iris )                             # 자료확인
is.data.frame( iris )

is.matrix( state.x77 )
is.data.frame( state.x77 )


str( iris ); 
str( state.x77 )               #state.x77 메트리스함수(동일자료형)

st <- data.frame( state.x77 ); st
str( st )                                   
#state.x77 을 데이터프레임으로 바꿈 <-시각화 하면서 메트리스함수인경우 난감
# data.frame 작업을 편하게 함.


head( st )
class( st )

iris.m <- as.matrix( iris[, 1:4 ] )         #data.frame 인 iris 에서 factor형 5열을 빼고
iris.m                               #숫자형 자료가 있는 열만 추출해서 매트리스함수 변환

head( iris.m )                              #matrix로 바꿔서 iris.m
class( iris.m )



head ( st )




#attach ( ) 함수

#Population 값이 안나오니까      
#변수이름을 직접쓰고 싶을때

attach ( st )
Population                
Income


# 원래는 호출시 $를 넣어야했는데 편하게 쓸때 attach () 를 씀
# st$Population

detach( st )               # attach() 함수 해제
Population
