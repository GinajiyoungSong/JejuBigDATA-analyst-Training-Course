#
# 15일차
#
# 다중선형 회귀분석 ( multiple linear regression analysis )
#
# 다중선형 회귀모델 : 여러 개의 독 독립변수를 다루는 회귀모델
#
# 회귀식
# y= B0 + B1X1 + B2X2 + B3X3 + ... + BnXn
#
# 독립변수가 n개인 다중선형 회귀에서 주어진 자료를 이용해
# B0, B1, B2, B3, ... , Bn의 값을 알아내는 회귀모델

library( tidyverse )
library( car )
library( dplyr )

str( Prestige )
head( Prestige )

newdata <- Prestige[ ,c(1:4) ]
head( newdata )
plot( newdata, pch =16, col="blue", main = 'Matrix Scatterplot')

#산점도를 통해 각각의 변수들간의 상관관계를 보아
#income 을 종속변수로 보고 - education과의 관계, Women과의 관계 prestige와의 관계
#각각의 상관도를 분석했다
# edu는 상관관계가 보이는 분포
# women : 음의 상관관계
# prestige : 양의 상관관계
# model <- lm ( y축 종속변수~ x1독립변수 + x2독립변수 + x3독립변수, data= df이름 )
model <- lm( income~education + prestige + women, data= newdata )
model
coef( model )

#회귀식
income = (-253.8497 ) + (177.1990 * newdata$education ) +
  (141.4354 * newdata$prestige) - (50.8957 * newdata$women)

fitted( model )
residuals( model )
deviance ( model ) #잔차
deviance( model ) / length( newdata$education ) # 평균 제곱 오차

# 최소자승법 = deviancd 설명
#http://phylab.yonsei.ac.kr/board.php?board=excel&indexorder=2&command=body&no=17

summary( model )

#Coefficients:
#            Estimate  Std. Error   t value   Pr(>|t|)    
#(Intercept) -253.850   1086.157     -0.234    0.816    
# education    177.199    187.632     0.944    0.347    
# prestige     141.435     29.910     4.729    7.58e-06 ***
#  women        -50.896      8.556   -5.948    4.19e-08 ***
#  ---
#  Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

# Residual standard error: 2575 on 98 degrees of freedom
# Multiple R-squared:  0.6432,	Adjusted R-squared:  0.6323
# Adjusted R-squared : 1에 가까워 질수록 현실설명력이 높아진다
# 예측값이 실제값과 오차가 작아질 가능성이 높다
# F-statistic: 58.89 on 3 and 98 DF,  p-value: < 2.2e-16


# 평균은 클수록, 분산은 작을수록, 데이터 크기가 클수록 믿음이 커진다.
# <- t-통계량(t-statistics)/ t-값(t-value)
# t-값이 크면 대립가설에 대한 믿음이 강해진다. 반대: 신뢰도 약해짐

# 데이터를 통해 '대립가설이 통계학적으로 유의미하다'라는 것을 
# 증명하고 확인하는 작업을 t-검정(t-test)라 한다.
# '귀무가설이 참이라고 가정했을 때, 
#  표본으로부터 얻어지는 통계치가 나타날(관측될) 확률'을 계산하는데 
#  이때 계산된 확률값을 p값이라 한다.

#귀무가설 : 독립변수는 종속변수에 영향을 주지 않는다
#대립가설 : 독립변수는 종속변수에 영향을 준다 

#  p값이 매우 낮으면, 이러한 표본 통계값은 우연히 나타나기 어려운 케이스이기 때문에,
#  우리는 귀무가살을 채택하지 않고 (기각하고) #  대안적인 가설, 즉, 대립가설을 채택한다

cor( newdata )
#상관계수 계산해봄 

newdata2 <- Prestige[ , c(1:5) ]
model2 <- lm(income~., data=newdata2 )
summary( model2 )






library( MASS )
model3 <- stepAIC( model2 )
summary( model3 )







# Linear Regression 연속형 데이터에 대한 예측 - 단순선형 / 다중선형 회귀분석

# Logistic Regression  범주형 데이터에 대한 예측 
#                    : 결과값을 범주형태로 변환해줘야한다. : One-hot encoding



