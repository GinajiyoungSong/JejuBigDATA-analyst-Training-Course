#
# 5일차
#
#data분석절차

#1.문제정의-> 수집-> 정제,전처리-> 탐색-> 분석-> 보고서

#
# 단일변수(일변량) 범주형 자료 탐색   
#- 범주형: factor 문자형값들이 이루어진, 산술연산 불가한 수치들


favorite <- c('WINTER', 'SUMMER', 'SPRING',
              'SUMMER', 'SUMMER', 'FALL',
              'FALL', 'SUMMER', 'SPRING', 'SPRING')
favorite
class( favorite )
table( favorite )                            #table 로 표기
                                             #table 같은 단어들끼리 빈도로 모은거???

table( favorite ) / length( favorite )       # 해당하는 도수분포표의 비율 계산

ds <- table ( favorite )
ds
barplot( ds, main = 'favorite season')         

#barplot 막대그래프 만들기

 #내가 만든 데이터의 계절순으로 넣기 위해, index 순서를 섞어서
 #재배열 ! 시각화 - 보고서 작성시 매우 중요
#인덱스2, spring 부터 순서 정리한 new 벡터 생성
ds.new <- ds[ c( 2, 3, 1, 4)]              
ds.new                                                 
barplot( ds.new, main = 'favorite season')




#pie 원그래프

pie( ds, main = 'favorite season')
pie( ds.new, main = 'favorite season' )





favorite.color <- c( 2, 3, 2, 1, 1, 2, 2,
                     1, 3, 2, 1, 3, 2, 1, 2)

ds <- table( favorite.color );           ds            #talbe 함수를 쓰면 숫자값들도 각 종류별
barplot( ds, main = 'favorite season' )                #도수분포표를 만들수 있다.

colors <- c('green', 'red', 'blue') 
names( ds ) <- colors;                   ds
barplot( ds, main = 'favorite season' )                # x축에 이름을 넣었다.
barplot( ds, names=c('초록','레드','블루'),            # names = c() 이름넣기 가능
         main = 'favorite season')

barplot( ds, main = 'favorite season', col = colors)

#파이그래프 - names안됨, labels 로 각 이름 넣기
pie( ds, main = 'favorite season', col = colors, labels=c('초록장미','장미','파란장미') )




#
# 단일변수(일변량) 연속형 자료 탐색
#
weight <- c( 60, 62, 64, 65, 68, 69 ); weight
weight.heavy <- c( weight, 120 ); weight.heavy
barplot( weight, main = ' fat weight / woman',
         names=c( 'a', 'b', 'c', 'd', 'e', 'f'), ylim =c(0,80) )

#평균
mean( weight );
mean( weight.heavy )                       #값이 고르지 않아서 평균에서 왜곡이 생길수 있음

#중앙값
median( weight );
median( weight.heavy )                     # 아무리 큰값의 수치가 하나 있어도  
                                           # 대부분의 수치들의 분포도가 비슷해서
                                           # 중앙값이나 절사평균은 왜곡이 없는 수로 나옴

#절사평균
mean( weight, trim = 0.2 );
mean( weight.heavy, trim = 0.2 )            # 앞뒤로 20% 분포에서 
                                            # 벗어난 수치를 제외하고 평균을 구하니 왜곡이 없음

mean( weight, trim = 0.1 );
mean( weight.heavy, trim = 0.1 )            # 10%만 제외했을경우에는 왜곡된 수가 나타남, 
                                                                #    분포 범위를 어떻게 잡느냐도 중요


#사분위수
quantile( weight.heavy )
quantile( weight.heavy, (0:10) / 10 )
summary( weight.heavy )                    #summary 함수를 이용하면 
                                           #최소값0% 2사분위, 중앙값, 3사분위50%, 최대값 다 표현해줌.

#산포(distribution)
#분산
var( weight )

#표준편차
sd( weight )

#값의 범위( 최소값과 최대값 )
range( weight )

#최대값과 최소값의 차이
diff(range( weight ) )





#=====================================================
#histogram : 연속형 자료의 분포를 시각화
# 연속형 자료에서는 구간을 나누고 구간에 속한 값들의
# 개수를 세는 방법으로 사용

cars
str( cars )
dist <- cars [, 2]
hist( dist, main = 'histogram for 제동거리',
      xlab = '제동거리', ylab = '빈도수',
      border = 'red', col = 'pink' ,
      las = 2, breaks = 5 )

# 상자그림(boxplot, 상자수염그림)
# 사분위수를 시각화하여 그래프 형태로 표시
# 상자그림은 하나의 그래프로 데이터의 분포
# 형태를 포함한 다양한 정보를 전달
# 자료의 전반적인 분포를 이해하는데 도움
#구체적인 최소/최대/중앙값을 알기는 어렵다
boxplot( dist, main = '자동차 제동거리', ylab = '제동거리')

#데이터에 보면 120 이라는 이상치 
#[ 분포값 내에서 매우 벗어난 수치] 값이 하나 있었다


boxplot.stats( dist )
# $stats   최소값, 1사분위, 중간값, 3사분위, 최대값 
[1]  2 26 36 56 93
#  $n   관측치 개수  
[1] 50
#  $conf   중앙값 신뢰구간
[1] 29.29663 42.70337
# $out                    #이상치/특이값
[1] 120

boxplot.stats( dist )$stats  #정상범위사분위수
boxplot.stats( dist )$n      #관측치 개수 
boxplot.stats( dist )$conf   #중앙값 신뢰구간
boxplot.stats( dist )$out    #이상치(특이값) 목록



#일변량중 그룹으로 구성된 자료의 상자그림
boxplot( Petal.Length ~ Species,        # ~ 뒤 그룹 / 묶어야 하는 변수
         data = iris,                     
         main = '품종별 꽃잎의 길이')
boxplot( iris$Petal.Length~iris$Species,
         main = '품종별 꽃잎의 길이')


# 한 화면에 여러 그래프 작성
par( mfrow = c( 1, 3))          # 1 X 3 가상화면 분할

barplot( table( mtcars$carb), main = "C",
         xlab = "carburetors", ylab = "freq",
         col = "green")
barplot( table( mtcars$cyl), main = "Cyl",
         xlab = "cyl", ylab = "freq",
         col = "red")
barplot( table( mtcars$gear), main = "g",
         xlab = "gear", ylab = "freq",
         col = "blue")

par( mfrow = c(1, 1))         #분할 해제. 결국 1x1


