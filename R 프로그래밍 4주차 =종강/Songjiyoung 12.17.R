# 송지영 12.17
#* 실습 결과를 R Script file로 제출
#* R Script file 이름은 "영문본인이름_제출일날짜.R" 부여하여 제출
#* R Script file의 처음에 주석으로 본인 이름과 작성일/제출일 기록
#
#문1)
#	trees 데이터셋에 대해 다음의 문제를 해결하는 R 코드를 작성하시오.

str(trees)
head(trees)
#	(1) 나무 둘레(Girth)와 나무의 키(Height)로 나무의 볼륨을 예측하는 다중선형 회귀
#	모델을 만드시오.
model <- lm( Volume~Girth + Height, data= trees )
model
coef( model )
summary( model )


#	(2) 다중선형 회귀모델을 이용하여 trees 데이터셋의 나무 둘레(Girth)와 나무의 키(Height)로
# 나무의 볼륨을 예측하시오.
Volume = (-57.9877) + (4.7082*trees$Girth) + (0.3393*trees$Height)
Volume
predict(model, trees)


  #Girth 와 Height 변수 모두 유의도가<0.05이므로
  #대립가설인 volume에 영향을 미친다는 정의가 성립된다.
  #결정계수 역시 0.9442 이므로 예측값은 신뢰도가 높다


#	(3) (2)에서 예측한 볼륨과 실제 trees 데이터셋의 볼륨(Volume)이 얼마나 차이가 나는지 
#보이시오. (예측값, 실제값, 예측값-실제값을 나타낸다.)
	
Volume
predict(model, trees) # = fitted( model )  같은값 # 오차 residuals( model )
diff <- Volume - trees$Volume ;diff

#문2)
#	mtcars 데이터셋에서 다른 변수들을 이용하여 연비(mpg)를 예측하는 다중 회귀모델을 만드시오.

str(mtcars)
head(mtcars)
#	(1) 전체 변수를 이용하여 연비(mpg)를 예측하는 회귀모델을 만들고 회귀식을 나타내시오.
#

mpg.model <- lm(mpg~., data=mtcars)
mpg.model
plot(mtcars$mpg~., data=mtcars, pch= 15, col="blue")
#	(2) 연비(mpg)를 예측하는 데 도움이 되는 변수들만 사용하여 예측하는 회귀모델을 만들고  
# 회귀식을 나타내시오.

coef(mpg.model)
summary( mpg.model )
	
model.m <- stepAIC(mpg.model)
#am 과 qsec, wt 를 도움이 되는 변수로 확인함

model.t <- lm(mpg~ am + qsec + wt, data =mtcars )
model.t

mpg = (9.618) + (2.936*mtcars$am) + (1.226*mtcars$qsec) - (3.917*mtcars$wt)
mpg

#	(3) (1), (2)에서 만든 예측모델의 설명력(Adjusted R-squared)을 비교하시오.

summary(model.t)
 
# 결정계수 0.8336 으로 처음에 모든 인자들로 구성된 예측모델에서는 0.8066 이었는데
# 도움이 되는 변수들로 예측모델을 만들었더니 더 신뢰가능한 모델임을 알수 있다.

#문3) 
#	UCLA 대학원의 입학 데이터를 불러와서 mydata에 저장한 후 다음 물음에 답하시오.

mydata <- read.csv( "https://stats.idre.ucla.edu/stat/data/binary.csv" )
str(mydata)	
head(mydata)


#	(1) gre, gpa, rank를 이용해 합격 여부(admit)를 예측하는 로지스틱 모델을 만드시오
# (0: 불합격, 1:합격).

model.ucla <- glm(admit~ ., data=mydata)
model.ucla	
coef( model.ucla)
summary( model.ucla)

admit= (-0.1824127) + (0.0004424258*mydata$gre) + (0.1510402328*mydata$gpa) - (0.1095019242*mydata$rank)
admit
pred <- round( admit, 0)
pred
str(pred)
admit.pred <- table(pred)
admit.pred
names(admit.pred) <- c("불합격", "합격")
admit.pred

admit.n<- table(mydata$admit)
admit.n
names(admit.n) <- c("불합격","합격")
admit.n


predict( model.ucla, mydata)

#	(2) mydata에서 합격 여부(admit)를 제외한 데이터를 예측 대상 데이터로 하여 (1)에서 만든 
# 모델에 입력하여 합격 여부를 예측하고 실제값과 예측값을 나타내시오.

mydata.0<- mydata %>% filter(admit == 0)
str(mydata.0)


admit= (-0.1824127) + (0.0004424258*mydata.0$gre) + (0.1510402328*mydata.0$gpa) - (0.1095019242*mydata.0$rank)
admit
pred <- round( admit, 0)
pred
admit.pred <- table(pred)
admit.pred
names(admit.pred) <- c("불합격","합격")
admit.pred

#	(3) 만들어진 모델의 예측 정확도를 나타내시오.

#실제값 - 예측값 : 오차

coef( model.ucla)
summary( model.ucla)
	
admit.pred #예측값
admit.n #실제값
result <-  admit.n - admit.pred
result #결과 17개의 불합격 대상자가 - 합격으로 바뀜

# 불합격 
answer <- mydata.0$admit
admit.pred == answer
acc <- mean( pred == answer )
acc

# 답 0.9377289 <- 93% 의 예측정확도.