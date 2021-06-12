# 송지영 2019.12.18

#* 실습 결과를 R Script file로 제출
#* R Script file 이름은 "영문본인이름_제출일날짜.R" 부여하여 제출
#* R Script file의 처음에 주석으로 본인 이름과 작성일/제출일 기록

#문1)
#	R에서 제공하는 state.x77 데이터셋에 대해 k-평균 군집화를 실시하고 결과를 그래프로 
# 출력하시오.
str(state.x77)
head(state.x77, 10)

st.77 <- kmeans( x= state.x77, centers = 5 )
st.77	

#리스트형 데이터프레임에서 넘버형 데이터프레임으로 바꿔서 해봄
state <- data.frame(state.x77)
state
str(state)
st.0 <- kmeans( x= state, centers = 5 )
st.0	
#결과는 똑같이 나옴

#	• 군집의 수는 5로 한다.


#K-means clustering with 5 clusters of sizes 1, 21, 10, 15, 3
# 5개의 Cluster means: 중심점
#   Population   Income Illiteracy Life Exp    Murder  HS Grad    Frost      Area
#1    365.000   6315.000   1.500000 69.31000 11.300000 66.70000 152.0000 566432.00
#2   5916.048   4198.952   1.404762 70.18190  9.261905 48.00476  85.7619  47483.43
#3   2583.000   4677.400   1.100000 71.33700  5.040000 53.85000 113.0000   8192.00
#4   1847.200   4458.267   0.840000 71.61733  5.680000 58.19333 128.6667  88480.53
#5  11393.667   4549.667   1.300000 71.05667  9.166667 56.40000  70.0000 188027.33


#	• state.x77은 각 변수(열)의 값들의 단위의 차이가 많이 나기 때문에 0~1 표준화를 실시한 후 
#   군집화를 실행한다.
	

library( cluster )
clusplot(state, st.0$cluster, color= T, shade= T, labels =0, lines =1)
clusplot(state.x77, st.77$cluster, color= T, shade= T, labels =0, lines =1)

# 대상 데이터 표준화 후 군집화
# 데이터와 데이터의 거리를 계산할 때 발생하는 문제 
# 모든 변수가 거리 계산에 동등한 영향을 갖도록 하기 위해서
# 모든 변수의 자료 범위를 0~1 사이로 표준화 한 후 거리 계산을 한다.
#    (x -min(A) ) /( max(A) - min(A) )
#       x : 변수 A 의 임의의 관측값
#  max(A), min(A) 는 변수A 관측값 중 최대/최소값



std <- function(x) {
  return( (x - min(x) )/ (max(x) - min(x) ) )
}
mydata <- apply( state.x77, 2,  std )
st.1 <-  kmeans( x= mydata, centers = 5 );st.1


clusplot(state.x77, st.1$cluster, color= T, shade= T, labels =0, lines =1)







# 문2)
#	mlbench 패키지에서 제공하는 Sonar 데이터셋에 대해 k-평균 군집화를 실시하고 결과를 
# 그래프로 출력하시오.

#	• 군집의 수는 2로 한다.
#	• Sonar 데이터셋에서 마지막에 있는 Class 열은 제외하고 군집화를 실행한다.

	library( mlbench )
	data( "Sonar" ) 			# 데이터셋 불러오기


Sonar
str(Sonar)
head(Sonar)

s60 <- Sonar[, 1:60]
sonar <- kmeans( x=s60, center=2)
sonar
#K-means clustering with 2 clusters of sizes 98, 110

sonar$cluster

clusplot( s60, sonar$cluster, color=T, shade=T, labels=0, lines=1 )


# 문3) 
#	mlbench 패키지에서 제공하는 Sonar 데이터셋에 대해 k-최근접 이웃 알고리즘을 이용하여 
# 모델을 만들고 예측 정확도를 측정하시오.
	
#	. Sonar 데이터셋에서 마지막에 있는 Class 열이 그룹 정보이다.

library( class)

#	. Sonar 데이터셋에서 홀수 번째 데이터(관측값)를 훈련용 데이터로 하고, 
#   짝수번째 데이터(관측값)를 테스트용 데이터로 한다.
#	. k-최근접 이웃에서 k를 3, 5, 7로 다르게 하여 예측 정확도를 비교한다.

for (i in 1:nrow(Sonar)) {
  if(Sonar[i]%%2 =0){
    print()
  }
}

# 훈련용/ 테스트용 데이터 준비
str(Sonar)
head(Sonar,10)

even.test <- c()
for (i in 1:nrow(Sonar)) {
  if(i%%2 ==0){
    even.test <- c(even.test,i)
   }
}
print(even.test)


ds.ts; ds.tr
ds.ts <- Sonar[ even.test, 1:60] #테스트용
ds.tr <- Sonar[ -even.test, 1:60 ] #훈련용
cl.tr <- factor( Sonar[-evev.test, 61 ] ) #훈련용 그룹정보
cl.ts <- factor( Sonar[ even.test, 61] ) #테스트용 그룹정보

pred <- knn( ds.tr, ds.ts, cl.tr, cl.ts, k=3, prob = T)
pred

acc <- mean( pred == cl.ts )
acc


# seq()함수 이용하기
# 훈련용/ 테스트용 데이터 준비
odd <- seq(1, nrow(Sonar), 2);odd
ds.tr <- Sonar[ odd , 1:60 ] #훈련용
ds.ts <- Sonar[ -odd, 1:60 ] #테스트용
cl.tr <- factor( Sonar[ odd, 61 ] ) #훈련용 그룹정보
cl.ts <- factor( Sonar[-odd, 61] ) #테스트용 그룹정보

pred.1 <- knn( ds.tr, ds.ts, cl.tr, cl.ts, k=3, prob = T)
pred.1

acc <- mean( pred.1 == cl.ts )
acc
# k=3 일때 82%
table( pred.1, cl.ts )




pred.2 <- knn( ds.tr, ds.ts, cl.tr, cl.ts, k=5, prob = T)
pred.2

acc <- mean( pred.2 == cl.ts )
acc
# k =5 일때 75 %
table( pred.2, cl.ts )




pred.3 <- knn( ds.tr, ds.ts, cl.tr, cl.ts, k=7, prob = T)
pred.3

acc <- mean( pred.3 == cl.ts )
acc
# k=7 일때 71%
table( pred.3, cl.ts )


# 문4) 
#	mlbench 패키지에서 제공하는 Sonar 데이터셋에 대해 k-최근접 이웃 알고리즘을 이용하여  
# 모델을 만들고 예측 정확도를 측정하시오.
	
#	. Sonar 데이터셋에서 마지막에 있는 Class 열이 그룹 정보이다.
#	. k-최근접 이웃에서 k는 3으로 한다.


#	. 5-fold 교차 검증 방법으로 예측 정확도를 측정한다.

odd <- seq(1, nrow(Sonar), 2);odd
ds.tr <- Sonar[ odd , 1:60 ] #훈련용
ds.ts <- Sonar[ -odd, 1:60 ] #테스트용
cl.tr <- factor( Sonar[ odd, 61 ] ) #훈련용 그룹정보
cl.ts <- factor( Sonar[-odd, 61] ) #테스트용 그룹정보

pred.1 <- knn( ds.tr, ds.ts, cl.tr, cl.ts, k=3, prob = T)
pred.1

acc <- mean( pred.1 == cl.ts )
acc
# k=3 일때 82%
# 교차 검증 # k -fold cross validation
install.packages("cvTools")
library( cvTools )


k=5
folds <- cvFolds( nrow(Sonar), K = k ) # 폴드 생성

#폴드별 예측 정확도 저장용벡터
acc <- c()
for (i in 1:k) {
  ts.idx <- folds$which == i
  ds.tr <- Sonar[-ts.idx, 1:60 ]
  ds.ts <- Sonar[ts.idx, 1:60 ]
  cl.tr <- factor( Sonar[-ts.idx, 61 ] )
  cl.ts <- factor( Sonar[ts.idx, 61 ] )
  pred <- knn( ds.tr, ds.ts, cl.tr, k=5 )
  acc[ i ] <- mean( pred == cl.ts)
}
acc #폴드별 예측정확도

folds$n; folds$K ;folds$R ; folds$which

mean( acc )

# 86% 
