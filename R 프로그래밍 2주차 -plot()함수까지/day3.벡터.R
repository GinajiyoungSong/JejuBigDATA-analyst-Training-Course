
#Scalar (원시값) : 하나의 값
#변수는 하나의 값을 지정해서 만들고 memory에 저장
#변수가 100가지나 된다면? 각각 이름을 지정하면 a,b,c,d,e,........ 어디까지?

#그래서 나온 개념이 vector (1차원 배열, 열의 집합)

#
a <- 10
b <- 5
c <- 8
max <- a
if ( b > max ){ max <- b }
if ( c > max ){ max <- c }
max

# vector 사용
v <- c( 10, 5, 8  )
max <- v[ 1 ]
for ( i in 2:length( v ) ){
  if ( v[ i ] > max ) {
    max <- v[ i ]
  }
}
max




a <- 10 ; b <- 5 ; c <- 8 ; d <- 25 ; e <- 3 ; f <- 71 ; g <- 8
h <- 89 ; i <- 7 ; j <- 11 ; max <- a
if ( b > max ){ max <- b } ; if ( c > max ){ max <- c }
if ( d > max ){ max <- d } ; if ( e > max ){ max <- e }
if ( f > max ){ max <- f } ; if ( g > max ){ max <- g }
if ( h > max ){ max <- h } ; if ( i > max ){ max <- i }
if ( j > max ){ max <- j } 
max


#vector 를 사용하면 간단해짐
v <- c( 10, 5, 8, 25, 3, 71, 8, 89, 7, 11  )
max <- v[ 1 ]
for ( i in 2:length( v ) ){
  if ( v[ i ] > max ) {
    max <- v[ i ]
  }
}
max


# vector 생성              #c( ) 함수 : 백터 생성함수
x <- c( 1, 2, 3 )
y <- c( "a", "b", "c" )
z <- c( TRUE, TRUE, FALSE, TRUE )
x; y; z

class( x ) ; class( y ); class( z )

w <- c( 1, 2, 3, "a", "b", "c" )   # 동일자료형 집합이어야 하는데 숫자랑 문자로 되었네?
w                                  # 결과를 보면 숫자를 문자로 강제변경시킴
class( w )


v1 <- 50:90; v1                   
v2 <- c( 1, 2, 3, 50:90 ); v2
class( v1 ); class ( v2 )       #numeric 숫자형  interger정수 floating 실수 / 다 숫자인거임.





#seq 함수

v3 <- seq( 1, 101, 3);                    v3        # 1:from      101:to      3:by

v4 <- seq( 0.1, 1.0, 0.1 );               v4        # 0.1:start   1.0: ent    0.1:by

v5 <- rep( 1, times = 5 );                v5          #times : 반복횟수

v6 <- rep( 1:5, times = 3 );              v6        # 1-5까지 3번을 반복해라
v7 <- rep( c( 1, 5, 9 ), times = 3 );     v7        # vector 를 3번 반복해라.




# 벡터 원소값에 이름 지정
score <- c( 90, 85, 70 );               score                       # NULL(아무것도 없다는 뜻)
names( score )                                  #이름을 지정하는 함수  이름이 없어서 결과는 NULL
names( score ) <- c( "Hong", "Kim", "Lee" )     #R value 에 이름 벡터를 만들어서 읽어오게함.
names( score )                                  #이름이 지정되서 결과값이 "Hong" "Kim"  "Lee"  지정됨
score

# 벡터에 원소값과 이름부여하는 이름수가 일치해야한다.


# 벡터 원소 접근
score[ 1 ]
score[ 2 ]
score[ 3 ]
score[ "Hong" ]
score[ "Kim" ]
score[ "Lee" ]

d <- c( 1, 4, 3, 7, 8 )
d[ 1 ]; d[ 2 ]; d[ 3 ]; d[ 4 ]; d[ 5 ]; d [ 6 ]
#결과에서 보면 d [ 6 ] 값이 없어서 NA 라는 결과가 나옴 : 

# NA : 결측치 (missing value) 읽을수 없다
# Nan: 계산할 수 없다,    inf : 무한대


for (i in 1:length( score )) {                 # i in 1:length 는 index1의 값부터 length 까지
  print( score[ i ])                           # 여기서는 값이 3개라 3번째까지
}

score_names <- c( "Hong", "Kim", "Lee" )
for ( i in 1:length( score )) {
  print( score[ score_names[ i ]])
}



#벡터에서 여러개의 값을 한번에 추출
d <- c( 1, 4, 3, 7, 8 )
d[ c( 1, 3, 5 ) ]         #index 1, 3, 5 만 추출
d[ 1:3 ]
d[ seq( 1, 5, 2 ) ]       #index 1부터 5까지 2간격으로 추출
d[ -2 ]                   #index 2만 빼고 추출
d[ -c( 3:5 ) ]



GNP <- c( 2090, 2450, 960 );GNP
names( GNP ) <- c( "Korea", "Japan", "Nepal" ); 
GNP
GNP[ 1 ]
GNP[ "Korea" ]
GNP[ c( "Korea", "Nepal" ) ]


# 벡터 요소값 변경
v1 <- c( 1, 5, 7, 8, 9 );         v1
v1[ 2 ] <-  3;                    
v1
v1[ c( 1, 5 ) ] <- c( 10, 20 );   v1

#c함수를 잘 이용하면 인덱스를 여러개 변경하는게 용이하다.



# 벡터간 연산
x <- c( 1, 2, 3 )
y <- c( 4, 5, 6 )
x + y
x * y
z <- x + y
z



# 벡터에 적용가능한 함수
d <- c( 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 );d
sum( d )                                   #합계
sum( 2 * d )                         
length( d )   
length( GNP  )                      #벡터의 요소 개수(길이)

mean( d[ 1:5 ] )                           #평균
mean( d )
median( d[ 1:5 ] )                         #중앙값
median( d )
max( d )                                   #최대값
min( d )                                   #최소값
sort( d )                                  #정렬
sort( d, decreasing = FALSE )
sort( d, decreasing = TRUE )
range( d )                                 #값의 범위(최소값-최대값)
var( d )                                   #분산
sd( d )                                    #표준편차


v <- sum( d ) / length( d );  
v                
#v 라는 변수지정         #합계/개수 = 즉 평균



#벡터에 논리연산 적용
d <- c( 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 )
d >= 5              #논리형 확인

d[ d> 5 ]           #[] 추출



#sum함수가 아닌경우 = 논리연산 넣었을때

sum( d > 5 ) 

# ****************** 합계아님!! 
# sum 안에 대소비교가 들어갈수 없음
# 조건에 맞는 갯수 카운트
# sum 각 수치의 합계가 아님, # 실수하기 쉬워보임
# length () 와 비슷


sum( d[ d > 5 ] )     #조건에 맞는 인덱스 5개의 합계
# 내가 원하는 수치들의 합계를 구하려면
# [] 추출 과정이 선행되어야 함.






#==========================================================================
d <- c( 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 )

d == 5       #함수를 안쓰면 그냥 논리형 확인
# = 만 쓰면 지정
# == 이것은 \5인 인덱스 확인
# 논리형이라는것을 잊지 말것

cond <- d > 5 & d < 9;     
cond   #cond 라는 변수 지정 
# d 벡터 중에서도 논리형 연산에 맞는 인덱스값

d[ cond ]     
# 벡터 [] 추출함수 
# d벡터 속에 내가 지정한 조건 cond 값 : 불러옴



all( d > 5 )                      #조건에 만족하는 변수가 모두다 인가
any( d > 5 )                      #조건에 만족하는 변수가 하나라도 있는가

head( d )                         # 이 함수속에는 default 된 개수가 6개라서
tail( d )                         # 앞부터든 뒤에숫자든 6개씩 나타남
head( d, 3 )
tail( d, 3 )                      # , 갯수지정 : 원하는 갯수 가능


x <- c( 1, 2, 3 )
y <- c( 3, 4, 5 )
z <- c( 3, 1, 2 )

w <- c( x, y); w

union( x, y )                     #합집합  
intersect( x, y )                 #교집합
setdiff( x, y )                   #차집합
setequal( x, y )                  # x,y에 동일한 요소가 있는지 확인
setequal( x, z )                  #논리형




#list - key:value 한쌍의 값의 형태
#1차원 배열이지만 다른 자료형의 집합

ds <- c( 90, 85, 70, 84); ds

my.info <- list( name='Hong', age=30, status=TRUE, score= ds)
my.info
my.info [ 1 ]               #list 에서는 key변수값과 / value 2개의 값이 다 나옴
my.info[[1]]                #내가 원하는 value 값을 원하면 더블대괄호
my.info$name
my.info[[4]]
# 인덱스4자리에 벡터ds 가 들어감
my.info [ 2 ]  
my.info$age

#*******************
#list 에서 인덱스 안에 있는 값 출력하기.
my.info[[4]][1]     #4번째 value값은 벡터라서 벡터의 인덱스1 출력시켜라.





#Factor형 (여러자료형)
bt <- c( 'A', 'B', 'B', 'O', 'AB', 'A' ); class(bt)
bt.new <- factor( bt )                     #factor형 벡터
class( bt.new )

bt
bt.new                                     
#factor형 벡터 : levels 갖을수 있는 값의 범위가 생성됨


bt[ 5 ]
bt.new[ 5 ]


levels( bt.new )
as.integer( bt.new )                       
#page44.45 변환함수, 
#levels 기준으로 1:A 2:AB 3:B 4:O
#factor를 숫자로 치환시 그룹화하기 좋음, 테이블함수 만들고 빈도표/ 막대그래프 시각화



bt.new[ 7 ] <- 'B'
bt.new[ 8 ] <- 'C'                         
#factor형 벡터의 범위가 정해지면 다른 값을 넣을수가 없다.
# 즉 level 이 정해져 있는데 level에 속한 값은 넣을수 없음
bt.new

