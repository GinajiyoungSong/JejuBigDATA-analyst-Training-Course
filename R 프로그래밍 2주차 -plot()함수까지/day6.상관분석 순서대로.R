
#chapter.5 데이터시각화  140p

# 자료 탐색 실습 - 탐색적 데이터 분석
  #
  # 0단계 : 문제 정의
  # 1단계 : 분석 대상 데이터셋 준비

# BostonHousing 데이터셋 (mlbench pac.)



install.packages( "mlbench" )
library( mlbench )
data ( "BostonHousing" )
  
# crim : 1인당 범죄율  ; rm : 주택 1가구당 방수
# dis : 보스턴 5개 지역센터까지의 거리; tax : 재산세율 ; medv : 주택가격
  

myds <- BostonHousing[ , c("crim", "rm", "dis", "tax","medv")]; myds

class( BostonHousing )
dim( BostonHousing )   #몇행 몇열
str( BostonHousing )
head ( BostonHousing )
tail( BostonHousing )
  
BostonHousing$rad
BostonHousing$medv       #내가 보고 싶은 데이터 벡터만 추출
  
  
  
  
  
  
  # 2단계 파생변수 추가 : grp 변수 추가(주택가격상중하)
range(BostonHousing$medv) #최소값, 최대값 확인
  
grp <- c()
for ( i in 1:nrow(myds) ){
  if ( myds$medv[ i ] >= 25.0 ){
    grp[ i ] <- 'H'
  } else if ( myds$medv[ i ] <= 17.0 ){
    grp[ i ] <- 'L'
  } else {
    grp[ i ] <- 'M'
  }
}                                                
  
grp

#빈 벡터에 내가 원하는 수치의 값을 H, L, M 으로 레벨을 만듬
# 25 이하는 H, 17 이하는 L 그외에는 M

  
#숫자형이었던걸 문자형으로 해서 factor 생성
grp <- factor( grp );  grp
str( grp )
  
grp <- factor( grp, levels = c( "H", "M", "L") )
grp

myds <- data.frame( myds, grp )
  
myds
  



# 3단계 : 데이터셋의 형태와 기본적인 내용 파악
  
str( myds )
head( myds )
table( myds$grp)

  
  
#4단계 : 히스토그램에 의한 관측값의 분포 확인
  
par( mfrow = c( 2, 3 ) )                   # 가상화면 만드는 함수 par()
  
for ( i in 1:5) {           #변수 5개                  
  hist ( myds[ , i ],
         main = colnames( myds )[ i ],
         col ="yellow")
  }
  
  
par( mfrow = c( 1, 1 ) )
  
  
# 5단계 : 상자 그림에 의한 관측값의 분포 확인
  
  
par( mfrow = c( 2, 3 ) )                  
  
for ( i in 1:5) {                             
    boxplot( myds[ , i ],
             main = colnames( myds )[ i ])
  }
  
  
par( mfrow = c( 1, 1 ) )
  
  
# 6단계 : 그룹별 관측값 분포 확인
  
boxplot( myds$crim~myds$grp,
         main = "1인당 범죄율")
boxplot( myds$rm~myds$grp,
         main = "방의 개수")
  
# 7단계 : 다중 산점도를 통한 변수간 상관관계 확인
#
pairs( myds[ , -6] )
  
  
# 8단계 : 그룹 정보를 포함한 변수간 상관관계 확인
  
point <- as.integer( myds$grp )
color <- c("red", "green", "blue")


pairs( myds[ , -6 ] , pch = point, col = color[point])
  
  
# 9단계 : 변수 간 상관계수 확인
cor(myds[ , -6 ] )
