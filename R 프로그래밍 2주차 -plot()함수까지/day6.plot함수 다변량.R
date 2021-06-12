

# 5일차까지 = 일변량, 범주형/연속형 데이터셋 분석

# **************************************************

# 6일차
#
# 다중변수 자료 탐색

# # # 두 변수 사이의 산점도
# 산점도 ( scatter plot ) - 2변수로 구성된 자료의 분포를 알아보는 그래프
#                            관측값들의 분포를 통해 2변수 사이의 관계파악


wt <- mtcars$wt
mpg <- mtcars$mpg                               #plot()함수 : 산점도
str(wt);str(mpg)
plot( wt, mpg, main = "중량-연비 그래프",
      xlab ="중량", ylab="연비",
      col="red", pch = 19 )    #0~20 까지 산점도에 보여지는 점?들의 모양이 바뀜

#위 그래프를 보아 중량이 낮을때 연비가 높고 중량이 높아지면 연비가 낮은 차가 많았다 : 상관분석 때 용이


#같은 산점도, plot() 괄호 안에 두 변수 표현법.

wt <- mtcars$wt
mpg <- mtcars$mpg
plot( mtcars$wt, mtcars$mpg, main = "중량-연비 그래프",
      xlab ="중량", ylab="연비",
      col="red", pch = 19 )   


plot( mtcars[, c( "wt", "mpg")], main = "중량-연비 그래프",
      xlab ="중량", ylab="연비",
      col="red", pch = 19 )    


plot( mpg~wt, data=mtcars, main = "중량-연비 그래프",
      xlab ="중량", ylab="연비",
      col="red", pch = 19 )    







# # # 여러 변수들간의 산점도
# pairs()함수

vars <- c( "mpg", "disp", "drat", "wt" )    #벡터생성 - 변수이름
target <- mtcars[ ,vars ]                   #원하는 데이터를 뽑아냄 : matrix 2차원변수
target <- mtcars[ , c("mpg", "disp", "drat", "wt")]
head( target )
pairs( target, main = "muti plots" )       

# pairs() 함수를 써서 다변량 산점도 
# 다변량 산점도 그려서
# 각 변수끼리의 상관관계 육안으로 확인

# 산점도를 통해서 대각선의 사선에 분포가 있을수록 상관관계가 높다/밀접하다
# 분포가 넓게 퍼지면 두변수 관의 상관관계가 별로 없다.



# # # 그룹정보가 있는 두 변수의 산점도

iris.2 <- iris[ ,3:4 ]; iris.2        # 3:4  -   Petal.Length Petal.Width

point <- as.numeric( iris$Species )   
point  

# 5열의 품종은 범주형 - 3개의 품종. 즉, 그룹으로 되어있다
# 품종을 숫자형으로 바꿔서 point 로 바꿔줌 - 색별로 그룹화

color <- c( "red", "green", "blue" )
#숫자로 그룹화한 변수들에 컬러를 주기 위해서, 임의로 컬러변수 - 컬러 3가지 지정

plot( iris.2, main ="iris plot",
      pch = c( point ), col = color[ point])

# pch 점의 모양에다가 c벡터를 넣어서 
# names= c() 처럼 각 변수에 모양을 숫자별로 지정해줌, pch 1부터 25까지 존재
# col = color[] 색깔역시 수로 지정 되어있어 지정가능











# 상관분석 - 선점도 작성후/ 회귀식 계산/ 상관계수 도출

beers <- c( 5, 2, 9, 8, 3, 7, 3, 5, 3, 5 )           # beers 맥주잔
bal <- c( 0.1, 0.03, 0.19, 0.12, 0.04, 0.0095,       # bal 혈중알콜농도
          0.07, 0.06, 0.02, 0.05 )
tb1 <- data.frame( beers, bal ); tb1
plot( bal~beers, data =tb1, col="red" )                       

#상관계수가 |0.5<= r <=1| 일때 높다고 함


# 회귀식 계산
# lm() 함수를 통해 weingt / bias 회귀식 수치 계산
res <- lm( bal~beers, data = tb1 ); res              


abline( res ) #회귀선 그리는 함수

#상관분석에서는 상관계수를 구해내야한다.   
#cor() 상관계수 계산함수

cor( tb1[, 1:2 ] )  #이변량
cor( iris[ , 1:4] ) #다변량으로 상관계수



# 상관분석 순서
#
# 1. 상관분석 대상 변수선정
# 2. 산점도 작성( 관측값 분포 확인) : plot()
# 3. 회귀식 도출: lm()
#    (회귀식 : 두 변수의 선형관계를 가장 잘 나타낼 수 있는 선의 식)
#     y= xw + b
# 4. 회귀선을 산점도에 표시 : abline ()
#    (회귀선 : 관측값들의 주제를 가장 잘 나타낼수 있는 선)
# 5. 상관계수 계산 : cor ()
# 6. 상관분석 결과 해석


# 시계열 Data - 선그래프

month <- 1:12
late <- c( 5, 8, 7, 9, 4 ,6 ,12 ,13, 8, 6, 6, 4 )
plot( month, late, main = "지각생통계",
      type = "l", lty = 1, lwd = 1,
      xlab = "Month", ylab = "late cnt")
plot( month, late, main = "지각생통계",
      type = "b", lty = 1, lwd = 1,
      xlab = "Month", ylab = "late cnt")
plot( month, late, main = "지각생통계",
      type = "c", lty = 1, lwd = 1,
      xlab = "Month", ylab = "late cnt")
plot( month, late, main = "지각생통계",
      type = "s", lty = 1, lwd = 1,
      xlab = "Month", ylab = "late cnt")



#복수의 선 그래프
late1 <- c( 5, 8, 7, 9, 4, 6, 12, 13, 8, 4, 6, 4)
late2 <- c( 4, 6, 5, 8, 7, 8, 10, 11, 6, 5, 7, 3)
plot( month, late1, main = "지각생통계",
      type = "b", lty = 1, col = "red",
      xlab = "Month", ylab = "late cnt",
      ylim= c(1, 15) )
lines( month, late2, type = "b", col= "blue")
