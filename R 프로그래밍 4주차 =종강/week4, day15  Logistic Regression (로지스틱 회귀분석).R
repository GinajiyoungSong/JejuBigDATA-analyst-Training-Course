# Logistic Regression (로지스틱 회귀분석)
# 회귀모델에서 종속변수의 값의 형태가 범주형인 경후 예측모델
#
# 주어진 data로부터 어떤 범주를 예측하는 분야를 회귀와 구분하여
# 분류(classification) 라고 한다
#
# 로지스틱 회귀도 기본적으로 회귀 기법이기 때문에
# 종속변수는 숫자로 표현되어야 한다.
# 예) yes와 No는 0과 1로 
#     setosa, versicolor, virginica는 1,2,3 과 같이 숫자로 바꾼 후에
# 로지스틱 회귀 분석을 한다.

iris.new <- iris
iris.new$Species <- as.integer( iris.new$Species)
head( iris.new )

# 범주형 데이터여야만 함 <- Species 3가지 범주로 그룹화
# 숫자형 데이터 타입으로 바꿔줌 as.interger() 치환

iris_model <- glm(Species~., data= iris.new )
iris_model
coef( iris_model )
summary( iris_model )

unknown <- data.frame( rbind(c(5.1, 3.5, 1.4, 0.2 ) ) )
names(unknown) <- names( iris )[1:4]
unknown

#예측하는 결과값이 범주형 숫자형데이터으로 나오기 때문에 - one hot encoing 필요.


pred <- predict( iris_model, unknown )
pred

pred <- round( pred, 0 ) #반올림함수
levels( iris$Species )[pred] #레벨-그룹핑




test <-  iris[, 1:4 ]


pred <- predict( iris_model, test )
pred
pred <- round( pred, 0 ); pred

answer <- as.integer(iris$Species)
pred == answer
acc <- mean( pred == answer )
acc
