# 송지영 20191116

#* 실습 결과를 R Script file로 제출
#* R Script file 이름은 "영문본인이름_제출일날짜.R" 부여하여 제출
#* R Script file의 처음에 주석으로 본인 이름과 작성일/제출일 기록
#
#문1)
#	state.x77 데이터셋에서 문맹률(Illiteracy)을 이용해 범죄율(Murder)을 예측하는 단순선형
# 회귀모델을 만드시오. 그리고 문맹률이 0.5, 1.0, 1.5일 때 범죄율을 예측하여 보시오.
#	

head(state.x77)
str(state.x77)
plot( Murder~Illiteracy, data=state.x77)
class(state.x77)
state<- data.frame(state.x77)
class(state)


m.s <- lm(Murder~Illiteracy, state )
m.s
abline(m.s, col="red", lwd=3)
coef(m.s)

W <- coef( m.s )[2] 
b <- coef( m.s )[1]
Ill <- c(0.5, 1.0, 1.5)
m.1 <- W* Ill + b; m.1

Ill.df<- data.frame(Illiteracy=c(0.5, 1.0, 1.5))
str(Ill.df)

predict( m.s,  Ill.df)
plot(Ill.df$Illiteracy, predict( m.s,  Ill.df), col="red", cex=2 ,pch =20)
#문2)
#	trees 데이터셋에서 나무둘레(Girth)로 나무의 볼륨(Volume)을 예측하는 단순선형 회귀모델을
# 만드시오. 그리고 나무 둘레가 8.5, 9.0, 9.5일 때, 나무의 볼륨(Volume)을 예측하여 보시오.
#

str(trees)
plot(Volume~Girth, data = trees)
model <- lm( Volume~Girth, trees);model
abline( model, col="blue", lwd=3)
coef(model)

W <- coef( model )[2]
b <- coef( model )[1]
Gir <- c(8.5, 9.0, 9.5)
model.t <- W*Gir +b; model.t

df <- data.frame(Girth=c(8.5, 9.0, 9.5))
predict( model, df)
plot( df$Girth, predict(model, df), col="blue", cex=2, pch=13)

#문3) 
#	pressure 데이터셋에서 온도(temperature)로 기압(pressure)을 예측하는 단순선형 회귀모델을
# 만드시오. 그리고 온도가 65, 95, 155일 때 기압을 예측하여 보시오.

str(pressure)
plot( pressure~temperature, data=pressure)
model <- lm( pressure~temperature, pressure); model
abline( model, col="green", lwd=3)
coef(model)


W <- coef( model )[2]
b <- coef( model )[1]
tm <- c(65, 95, 155)
model.p <- W*tm +b; model.p

df <- data.frame(temperature= c(65, 95, 155))
predict(model, df)
plot( df$temperature, predict(model, df), col="green", cex=2, pch=15)
