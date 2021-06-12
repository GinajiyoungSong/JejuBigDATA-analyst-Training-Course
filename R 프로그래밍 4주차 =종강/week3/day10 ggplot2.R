# Markdown 형식 : 보고서 작성에 편리
#
# 10일차
# https://www.tidyverse.org/packages/

# ggplot2 함수는 그래프 시각화를 매우 고품질로 좋게 만듦

install.packages( "tidyverse")
library( tidyverse )
library(ggplot2)

head(mtcars)
mpg
dim( mpg )
str( mpg )
head( mpg )
view( mpg )

ggplot( data = mtcars )+
  geom_point( mapping = aes( x = wt, y =mpg ) )

# 1번째 = plot 을 그려라 ( 좌표 그리기 )
# ggplot (data, aes(x= , y= )) <- ggplot 1 layer 안에 x축\y축 먼저 지정시
# gepm_시각화 ( mapping = aes( x = , y = )) <- geom_ 2 layer 그래프에 직접넣을때 
#                                              mapping =  지정 필수

# geom_시각화 넣는건  plot 과 동일
# geom_point() 쓸때 기본함수 ggplot( data ) 함수와 ' + ' 기호 연산자 써야함     


# 2번째 geom_그래프 () 시각화 
# ggplot 으로 일단 1차 레이어를 만들어 준뒤에 내가 원하는 시각화를 선택한다.
# bar <- 막대그래프, point <- 산점도, histogram () 등등


#컴띵 인강에 나온 산점도 추가
#기차 정보를 가지고 산점도를 그렸을때

ggplot(datainfo, aes(x=총운행횟수, y=이용율))+
  geom_point(aes(color=노선별), size=거리)
# 운행거리에 따라 점의크기를 넣어주면 좀더 데이터 시각화 - 잘 뜨지 않을까/

data1 <- data.frame( mat=c(55,75,80,65,90,100,70,85), 
                     eng=c(65,100,45,50,75,90,90,65),
                     avg=c(53,70,83,70,93,95,75,80),
                     irum=c('김','이','박','최','문','윤','손','정'))
ggplot(data1, aes(mat,avg))+
  geom_line(color="red")+
  geom_point()+
  geom_line(aes(eng,avg), color="blue")+
  geom_point(aes(eng,avg), color="white")

# 2차 layer 에 선그래프 중첩시키고 싶으면 추가로 + 계속 적으면 됨






# 가장 기본  - 막대그래프 

month <- c(1, 2, 3, 4, 5, 6 )
rain <- c(55, 50, 45, 50, 60, 70 )
df <- data.frame( month, rain )
df

ggplot( df, aes( x = month, y = rain) ) +
  geom_bar( stat = "identity",
            width = 1.0,
            fill ="steelblue", color="white")



# stat = "identity" :y축의 값을 그대로 가지고 그래프를 그려라
# “stat” 요소를 “identity” 
#(데이터 프레임의 값을 그대로 사용해서 그래프를 그리라는 뜻)
# 어떨때는 stat 지정을 안해도 되는데, y 축이 범주?? 무슨 기준일때 생략??








# 3번째, 그래픽 디자인하기

# ggtitle() 원하는 타이틀 설정
# theme() 에서 : 내부 표기된 타이틀의 디자인을 변경 : 메인타이틀 크기, 글씨두께, 컬러 등등
#                아래 추가 설명: theme() 안에서 디자인 추가 다양함 - 범례 디자인도 적용

# + coord_flip() : 가로형 그래프로 바꾸기
#

ggplot( df, aes(x = month, y = rain) ) +
  geom_bar( stat = "identity",
            width = 1.0,
            fill ="steelblue", color ="white") +
  ggtitle( "1월~ 6월까지 상반지 월별강수량") +
  theme( plot.title =  element_text( size = 25,
                                     face = "bold",
                                     colour = "steelblue" ) ) +
  labs( x = "월", y = "강수량" ) +
  coord_flip()                       


# http://www.dodomira.com/2016/03/18/ggplot2-%EA%B8%B0%EC%B4%88/
# R을 사용한 막대 그래프 그리기 – ggplot2 초급
















# 히스토그램 시각화 예시

str(iris)
str(iris$Petal.Length)
iris$Petal.Length

ggplot( iris, aes(x = Petal.Length )) +   
  geom_histogram( binwidth = 0.5 ) 
# binwidth : count의 기준을 정하는 것. ex) 0.5 간격으로로 그룹핑



# 시각화 히스토그램 :  컬러 설정 할때
# 채우기 색, 경계선 색 : geom_histogram(binwidth, fill, color)


fillPalette <- c("red", "yellow", "black")


ggplot( iris, aes( x = Sepal.Width, fill = Species) ) +
  geom_histogram( binwidth = 0.5, position = "dodge" ) +
  theme( legend.position = "top" ) +
  scale_fill_manual(values=fillPalette)



ggplot(Cars93, aes(x=Price)) + 
  geom_histogram(binwidth=5, fill = "blue", color = "black") + 
  ggtitle(Binwidth=5, fill = "blue", color = "black")



# fill : 막대를 채울때 쓰인 색 # color : 막대 경계선 컬러
# position : 그래프 형태를 어떻게 그릴것인가, 중첩? 겹침?
#                  dodge : 그래프 각각 그려라 
#                  fill :중첩: 100% 누적막대 그려라


# ggplot( , fill = Speicies ) 컬러별 범례 넣을때ㅡ factor 범주형만 그룹핑 가능
# 3가지 그룹으로 나눈후 내가 원하는 컬러 넣을때 추가로 + 
# 기존에 제공되는 컬러는 안이쁘니까 내가 임의의 컬러 이름을 지정해서
# scale_fill_manual( values = ) 지정

# scale_fill_manual(values= 지정컬러 )
# 참고자료 http://egloos.zum.com/entireboy/v/4800689



# theme( legend ) 범례의 위치 * 범례  표시는 막대그래프나 히스토그램 필수
# 출처: https://rfriend.tistory.com/67 [R, Python 분석과 프로그래밍의 친구 (by R Friend)]

#https://rpubs.com/kimwoohyung/ggplot2














# 산점도 예시
# 2개의 변수를 뽑아서 그룹화된 범주형 데이터별 시각화

# ggplot 2 Scatter chart 
# ggplot() : 1계층 layer 지정시 격자무늬 그래프

ggplot( data = iris, mapping = aes( x= Petal.Length, y= Petal.Width ) ) +
  geom_point()
                   #기본 size = 2 point

# 2단계 - 그래픽 시각화 : 사이즈 변경 ( 산점도의 점 사이즈 크기 증가시킴 )
ggplot( data = iris ) + 
  geom_point( mapping =  aes( x= Petal.Length, y= Petal.Width ),
              size = 3)


                                      
# 3단계 - 그룹별 컬러/시각화 다르게 표기
# 1 layer 에 추가로 범주형 데이터 이용 : color = 점의 컬러 다르게 팩터 그룹핑
#                                        shape = 점의 모양 다르게 팩터 그룹핑
                                      
ggplot( data = iris, mapping = aes( x= Petal.Length, y= Petal.Width,
                                    color = Species, shape = Species ) ) +
  geom_point( size = 4) +
  ggtitle( " iris 꽃잎의 길이와 폭" ) +
  theme( plot.title = element_text( size = 25, face = "bold", colour = "black") ) +
  scale_color_brewer(palette = 1) # 숫자형 = 블루, "" 문자형 = 그린


#  scale_shape_manual(values = ) 어떻게 원하는 컬러로 내가 점의 컬러를 설정하는가??

# 보통 컬러는 RGB = (red, green, blue)
# ARGB = ( Alpha, + RGB )
# RGB 는 16진수로 표현할 때 #000000 ~ #ffffff
#        16진수 한자리 + 2진수 4자리 <- 4비트 <- 1 Nibble 이다 칭함
# 16진수 1자리가 4비트 
# 16진수 2자리는 총 8비트 <- 1바이트

#즉 컬러 표기시 16진수 6개가 필요하니까 4*6 = 24비트 <- 3바이트

#ARGB 는 투명 알파도 포함 #00000000~ ffffffff 총 8자리 필요함
# 4*8 32비트 <- 4바이트










#  상자 수염 그래프 예시
# ggplot Box plot

ggplot( data = iris, mapping = aes( y= Petal.Length ) ) +
  geom_boxplot( fill = "yellow")


ggplot( data = iris, mapping = aes( y= Petal.Length,
                                    fill = Species)) +
  geom_boxplot()+
  scale_fill_manual(values=fillPalette)


#https://rpubs.com/kimwoohyung/ggplot2












# 선그래프 예시
# ggplot Line chart
year <- 1937:1960
cnt <- as.vector( airmiles)
df <-  data.frame( year, cnt )
head( df )

ggplot( df, aes( x = year, y= cnt ) ) +
  geom_line( col = "red")




























#----------------------------------------------------------------------------
# ggplot 작성

# 선 추가 및 텍스트 추가

# 그래픽 시각화를 통해서 추가적인 디자인 예시

str( economics )

# 사선
ggplot( economics, aes( x= date, y= psavert ) ) +
  geom_line( col = "blue") +
  geom_abline( intercept =  12.18671, slope = 0.0005444 )

# intercept: y 절편값,   # slope = 기울기


# 평행선

ggplot( economics, aes( x= date, y= psavert ) ) +
  geom_line( col = "blue") +
  geom_hline( yintercept =  mean(economics$psavert ))


# 수직선
x_inter <- filter( economics,
                   psavert == min( economics$psavert ) )$date
ggplot( economics, aes( x= date, y= psavert ) ) +
  geom_line( col = "blue") +
  geom_vline( xintercept =  x_inter)






# 텍스트 추가

ggplot( airquality, aes( x= Day, y= Temp ) ) +
  geom_point() +
  geom_text( aes ( label = Temp, vjust = 0, hjust= 0 ) )


# vjust = 0, hjust= 0  점옆: 텍스트의 위치




ggplot( airquality, aes( x= Day, y= Temp, col= 1) )+
  geom_point() +
  geom_text( aes ( label = Temp, vjust = -1, hjust= 0 ) )





# 영역 지정 및 화살표 표시

ggplot( mtcars, aes( x= wt, y= mpg ) ) +
  geom_point() +
  annotate( "rect", 
            xmin = 3, xmax = 4, ymin = 12, ymax = 21,
            alpha = 0.3, fill = "skyblue" )

#annotate 뜻 :주석을 달다. 보충 설명을 더 추가하는 함수
#rect 네모박스의 크기
#alpha 값은 1에 가까울 수록 불투명 / 0에 가까울 수록 투명

ggplot( mtcars, aes( x= wt, y= mpg ) ) +
  geom_point() +
  annotate( "rect", 
            xmin = 3, xmax = 4, ymin = 12, ymax = 21,
            alpha = 0.3, fill = "skyblue" ) +
  annotate("segment", x= 2.5, xend =3.7, 
           y= 10, yend= 17, color = "red" , arrow = arrow())


#segment 화살표의 길이  #arrow()함수를 넣어야 > 화살표 머리 생성




ggplot( mtcars, aes( x= wt, y= mpg ) ) +
  geom_point() +
  annotate( "rect", 
            xmin = 3, xmax = 4, ymin = 12, ymax = 21,
            alpha = 0.3, fill = "skyblue" ) +
  annotate("segment", x= 2.5, xend =3.7, 
           y= 10, yend= 17, color = "red" , arrow = arrow()) +
  annotate("text", x=2.5, y= 10, label = "point")

# text 그래프에 넣고 싶은 단어 위치 선택지정



