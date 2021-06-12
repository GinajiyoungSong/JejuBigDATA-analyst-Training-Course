#2019.11.28. 셋째날 작업
#
# 사용자 정의 함수
# 어제 문제 10,5,8 3개의 수중에 가장큰수를 산출해라. -> 내가 정의한 함수로 쉽게 도출하기.
#  내가 정의한 mymax <- function ( x, y ) 인수를 2개로 지정 -------- return 값은 1개.


mymax <- function( x, y ){                          # 1. 함수정의
  num.max <- x
  if ( y > num.max ){
    num.max <- y
  }
  return ( num.max )
}
mymax( 10, 15 )                                     # 2. 함수호출
a <- 10
b <- 5
c <- 8
max <- mymax( a, b )
max <- mymax( max, c )
max


# 사용자 정의함수 매개변수 초기값 설정                        y = 2 라는 default 값 (무조건 오른쪽에)
mydiv <- function( x, y = 2 ){                              # y = 값이 없으면 '2'라는 값을 쓰라는 명령
  result <- x / y
  
  return( result )
}

mydiv( x = 10, y = 3 )       #인수이름 = 값
mydiv( 10, 3 )               #인수값만 표기해도 됨
mydiv( 10 )                  #인수를 한개만 줬을때, y값은 기존에 함수에 정해준 값을 인식 '2'


#사용자정의 함수 만들어서 이제 불러읽기를 하려면
#새로운 script 를 만들어라 . name:mylib.R 이름으로 저장하고
#최대값함수와 #나눗셈함수 만든 정의만
#복사해서 넣어놓았다.

#나의 example.F 에 불러와서 #함수호출 을 해야하는데
#불러쓰는 방법은?



#외부 파일에 잇는 함수 호출 (탐색기로 들어가서 내가만든 mylib.R이 있는 폴더주소 복사- 역슬래시만 교체)
setwd( "D:/workR" )             #경로 지정
source( "mylib.R" )             #lib 파일 지정

#함수호출 완료
my_max( 10, 5 )
my_div( 10, 2 )


# 함수 반환값 (return값)이 여러 개일때의 처리
# 사용자정의 함수 이용
myfunc <- function( x, y ) {
  val.sum <- x + y
  val.mul <- x * y
  
  return( list( sum = val.sum, mul = val.mul ) )    #return 값은 하나니까 list 하나임
}                                                   #list 에 2개의 값을 넣어서 난 return을 list로 받음

myfunc( 5, 8)

result <- myfunc( 5, 8 )
s <- result$sum                                     #list의 첫번째키 $sum 키의 value 값을 s로 지정
m <- result$mul                                     #list의 두번째키 $mul 키의 value 값을 m로 지정
cat( '5 + 8 = ', s, '\n')
cat( '5 * 8 = ', m, '\n')
