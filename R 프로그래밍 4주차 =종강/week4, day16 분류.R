# /분류(classification)

# 분류예측 : Logistic regression
# 분류 : KNN 이용해서 분류 알고리즘, 
#        decision tree ( yes or no 기준으로 단계반복) 더이상 질문 안될때까지 진행,
#        : Random Forest : d.t 앙상블집합 (세분화된 나무 집합) , 등등



# KNN ( K-Nearest Neighbor, K-최근 접이웃) : 분류 알고리즘
#
library( class )
# 훈련용/ 테스트용 데이터 준비
tr.idx <- c(1:25, 51:75, 101:125)
ds.tr <- iris[ tr.idx , 1:4 ] #훈련용
ds.ts <- iris[ -tr.idx, 1:4 ] #테스트용
cl.tr <- factor( iris[tr.idx, 5 ] ) #훈련용 그룹정보
cl.ts <- factor( iris[-tr.idx, 5] ) #테스트용 그룹정보

pred <- knn( ds.tr, ds.ts, cl.tr, cl.ts, k=3, prob = T)
pred

acc <- mean( pred == cl.ts )
acc

# KNN 을 통해 93% 예측이 가능했다.

table( pred, cl.ts )


#예측의 정확도를 올리기 위해서
#예측을 여러번 폴드에 넣어서 n번의 횟수로 반복검증후
#예측평균을 내면 
#예측의 정확도가 더 올라간다.
# 교차 검증 # k -fold cross validation
install.packages("cvTools")
library( cvTools )


# 10번을 test하겠다. 10번의 폴드를 생성한다
k = 10
folds <- cvFolds( nrow(iris), K = k ) # 폴드 생성

#폴드별 예측 정확도 저장용벡터
acc <- c()
for (i in 1:k) {
  ts.idx <- folds$which == i
  ds.tr <- iris[-ts.idx, 1:4 ]
  ds.ts <- iris[ts.idx, 1:4 ]
  cl.tr <- factor( iris[-ts.idx, 5 ] )
  cl.ts <- factor( iris[ts.idx, 5 ] )
  pred <- knn( ds.tr, ds.ts, cl.tr, k=5 )
  acc[ i ] <- mean( pred == cl.ts)
}
acc #폴드별 예측정확도

folds$n; folds$K ;folds$R ; folds$which

mean( acc ) #폴드 평균 예측정확도
# 교차 검증을 통해서 96.66 예측 정확도가 올라갔다
