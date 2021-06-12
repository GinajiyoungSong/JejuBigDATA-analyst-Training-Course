# week4 = 데이터 모델 만들기
#
# 14일차
#
# 단순 선형 회귀 분석 ( simple linear regression analysis )

# 341 page ~ 365 page : 20쪽정도 모두 통계내용
# 371 page ~ 485 page : 여러가지 통계기법을 이용한 분석방법
# 489 page ~ : model





# Modeling : 현실 세계에서 일어나는 현상을 수학식으로 표현하는 행위
#
# 데이터 과학에서 독립변수 x를 설명하는 변수 (explanatatory variable), 특징(feature)
# 종속변수 y를 반응변수 (response variavle), 레이블(label)
# x가 입력되면 y를 맞추어야 하는 문제, y를 ground truth로 간주

# 데이터 과학에서 Modeling 이란 수집한data(훈련data)를 이용하여
# 최적의 모델을 찾아내는 과정
# 모델 : y =Wx + b            -> w, b : 계수(매계변수)

# 1. 모델 선택 -> 선형 방정식 선택
# 2. 주어진 data(훈련data)를 적용하여 매개변수 결정
# 3. 예측은 훈련data에 없는 새로운 data로 모델이 :: 레이블을 추정하는 과정
# 4. 완성된 모델에 대한 품질 평가













# 회귀분석 (Regression Analysis)
# 관찰된 연속형 변수들에 대해 두변수 사이의 모형을 구한 뒤 적합도를 측정해내는 분석방법
# 시간에 따라 변화하는 데이터나 어떤 영향, 가설적 실험, 인과 관계의 모델링등의
# 통계적 예측에 이용될 수 있다.

# 단순 선형 회귀 분석 ( simple linear regression analysis )
# - 독립변수와 종속변수와의 관계가 선형으로 표현
#   하나의 독립변수를 다루는 분석방법

# 단순선형 회귀모델의 회귀식 : y= Wx + b ( W,b는 상수)
#          W,b는 어떻게 찾을수 있을까
#          x,y로 구성된 data를 이용하여 W,b를 찾아내는 모델

# 주행거리와 제동거리 사이의 회귀모델
str( cars )   #훈련데이터 = cars 데이터셋 변수가 2개 : speed, distance
head( cars )

# 산점도를 통한 선형 관계 확인 - 어떤것이 x축으로 독립변수로 잡을것인지
# 자동차의 스피드에 따른 제동거리의 변화를 보는게 모델링 하기에 적합
plot( dist~speed, data =cars )   ;plot( cars )

# 회귀모델 구하기
# 종속(반응)변수 = 독립(설명)변수 순서로 지정
# 내가 알고자 하는 weight, bias 알아내기
model <- lm( dist~speed, cars) ; model
abline(model, col="red", lwd=3, lty="solid")

#Call:  lm(formula = dist ~ speed, data = cars)
#
#Coefficients: <- 계수, 매개변수
#  (Intercept)        speed  
#      -17.579        3.932  
#        b값           W값
# y = 3.932 * x  - 17.579


coef( model )  #매개변수 (계수) - W,b값 출력
cars
fitted(model)  #훈련data에 있는 샘플에 대한 예측값
#               회귀선 기준으로 점의 분포가 나타난 값 = y축

residuals( model )  #잔차 : 회귀식으로 추정된 값과의 차이
# 데이터셋에 나온 값들이 - 회귀선 기준 예측값과의 차이를 봄.
#                         (회귀선에서 얼마나 떨어져있는지)

# 잔차 제곱합의 평균제곱오차 (MES-mean squared error)로 변환
deviance( model )/ length( cars$speed )


#내가 주어진 데이터를 통해 얻어낸 회귀선에 도입할 w,b 가 즉, model

model <- lm( dist~speed, cars) ; model


b <- coef( model )[1]
W <- coef( model )[2]  #예측모형이 만들어 짐. : 회귀선 수식 도출이 되었으니

speed <- 21.5          # x값을 넣어주면 종속변수가 도출됨.
dist <- W * speed +b; dist


# 3.번째과정 : 내가 만든 회귀선이 즉 data model 이 되고
#  예측할 x값을 도입해서 y값 도출!


df <- data.frame( speed = c(21.5, 25.0, 25.5, 26.0,
                            26.5, 27.0, 27.5, 28.0))
#R에서 제공하는 예측 수행 함수
predict( model,                df )  
#   회귀선의  w,b 매개변수  = 예측하기위해 도입할 x값
#predict() 를 통해 나온 값은 예측값

plot( df$speed, predict( model, df ), col ="red", cex =2, pch=20)
abline( model )








speed <- cars[ , 1] #cars 데이터셋의 speed 다시 도입
pred <- W * speed + b #pred distance 예측값
pred

# 데이터프레임 만들기 = 예측값, 실제 제동거리, 실제값과의 오차
compare <- data.frame( pred, cars[ ,2], pred-cars[, 2])
compare
colnames( compare ) <- c('예상','실제','오차')

head( fitted( model ), 3 )
head( residuals( model ), 3 )
head( compare, 3 )

summary( model )
# 평균은 클수록, 분산은 작을수록, 데이터 크기가 클수록 믿음이 커진다. <- t-통계량(t-statistics)/ t-값(t-value)
# t-값이 크면 대립가설에 대한 믿음이 강해진다. 반대: 신뢰도 약해짐

# 데이터를 통해 '대립가설이 통계학적으로 유의미하다'라는 것을 증명하고 확인하는 작업을 t-검정(t-test)라 한다.
# '귀무가설이 참이라고 가정했을 때, 표본으로부터 얻어지는 통계치가 나타날(관측될) 확률'을 계산하는데 
#  이때 계산된 확률값을 p값이라 한다.

#귀무가설 : 독립변수는 종속변수에 영향을 주지 않는다
#대립가설 : 독립변수는 종속변수에 영향을 준다 

#  p값이 매우 낮으면, 이러한 표본 통계값은 우연히 나타나기 어려운 케이스이기 때문에,
#  우리는 귀무가살을 채택하지 않고 (기각하고) #  대안적인 가설, 즉, 대립가설을 채택한다

# Call:
#  lm(formula = dist ~ speed, data = cars)

# Residuals:
#  Min      1Q  Median      3Q     Max 
#-29.069  -9.525  -2.272   9.215  43.201 

# Coefficients:
#            Estimate  Std. Error  t value    Pr(>|t|)    
#(Intercept) -17.5791     6.7584  -2.601      0.0123 *  
#  speed       3.9324     0.4155   9.464     1.49e-12 ***
#  ---
#  Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

# Residual standard error: 15.38 on 48 degrees of freedom
# Multiple R-squared:  0.6511,	Adjusted R-squared:  0.6438 
# F-statistic: 89.57 on 1 and 48 DF,  p-value: 1.49e-12



str( cars )
head( cars )
car_model <- lm( dist~speed, data= cars )
coef( car_model )
plot( car_model , col="Red", cex=2)
abline( car_model, col='red')

summary( car_model)
# Coefficients:
#            Estimate   Std.Error  t value    Pr(>|t|)    
#(Intercept) -17.5791     6.7584  -2.601      0.0123 *  # p값이 크다는건 : 데이터가 회귀선에 퍼져있다
#  speed      3.9324      0.4155   9.464      1.49e-12 ***
#  ---
#  Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1


str( women )
head( women )
women_model <- lm( weight~height, data= women )
coef( women_model )
plot( women_model )
abline( women_model, col="red")
summary( women_model)

#Coefficients:
#               Estimate   Std. Error  t value     #p값  Pr(>|t|)    
#(Intercept)  -87.51667    5.93694  -14.74          1.71e-09 ***   #  p값이 작음: 데이터가 회귀선에 모여있다
#  height     3.45000      0.09114   37.85           1.09e-14 ***  
#  ---
#  Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1
#                       *    :   P < .05
#                       **   :   P < .01
#                       ***  :   P < .001

#p value = 히스토그램상 좌측끝 면적값 + 오른쪽끝 면적값 합(p1 + p2) 했을때 값
#p값<0.05 일때 유의함 : 독립변수가 종속변수에 영향을 주지않는다.
# http://blog.naver.com/PostView.nhn?blogId=istech7&logNo=50152984368&parentCategoryNo=&categoryNo=22&viewDate=&isShowPopularPosts=true&from=search
