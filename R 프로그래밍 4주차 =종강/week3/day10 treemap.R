# treemap
install.packages( "treemap")
library( treemap )


data( GNI2014 )
dim( GNI2014 )
str( GNI2014 )
head( GNI2014 )
View( GNI2014 )

# 대륙별 그룹핑 가능하고 - 나라이름 약어표시 iso3 로 트리맵 만들기
# 각 나라별 크기표시는 인구수로 ~
# 각 나라별 컬러는 GNI 수치에 따라 진하기 표시

treemap( GNI2014,
         index = c("continent", "iso3" ),  #계층구조
         vSize = "population",             #타일 크기
         vColor = "GNI",                   #타일 컬러
         title = "World's GNI" )
         

# treemap 전체 타일컬러링을 바꾸고 싶으면
# type = " 바꾸기"

treemap( GNI2014,
         index = c("continent", "iso3" ),  
         vSize = "population",             
         vColor = "GNI",                   
         type = "value",                             #타일 컬러링 방법
         bg.labels = "yellow",                       #레이블배경색
         title = "World's GNI" )                     #제목







# 트리맵을 그려보자. 
# 일단 데이터셋을 얻어야하는데
# 주어진 정보가 데이터셋이 아니라면 ?

head(state.x77)
str(state.x77)
class(state.x77)

# str()로 봤을때 메트릭스 구조로 되어있는것을 확인, 
# 내가 원하는 데이터는 50개의 미국 주
# 그곳에 인구/수입 등등에 대해서 데이터프레임을 그려야함


# 1단계. 데이터셋으로 만들어준다.

st <- data.frame( state.x77 )
st


# 데이터프레임으로 바꾸고 나서 
# 주에 대한 정보가 rownames 으로 정해짐
str(st)
stname = rownames( st )
stname

# 내가 트리맵을 그리려면 주별로 데이터가 변수가 되어야함

# 2단계
# index = c() 에 들어갈 변수 만들기
# 만든 데이터에 변수를 추가 <- 주이름을 벡터로 만들어줌

st <- data.frame(st, stname = rownames( st ))
st

# 원하는 데이터셋 완성
# 트리맵 그리기

treemap( st,
         index = c( "stname" ),
         vSize = "Area",
         vColor = "Income",
         type = "index",
         title = "미국 주별 수입" )




#https://jjeongil.tistory.com/349
#R : 나무지도-treemap (개념 및 예제)

블로그참고자료






















#illiteracy : 문맹률 과 Murder 살인범죄발생률의 상관관계


# 산점도에 Bubble 추가 (bubble chart)
# symbols() 함수를 통해서
# 산점도 위에 공기방울 같이 원하는 크기로 표현할수 있다.

# 이전에 산점도 시각화
# 점을 그리는데 geom_point(size= 점크기를 변수로 지정)했을때 크기를 다르게 시각화함


symbols( st$Illiteracy, st$Murder,        # (x =, y = ) #원의 x,y좌표    
         circles = st$Population,         # 원의 반지름
         inches = 0.3,                    # 원크기 조절값
         fg = "white",                    # 원 테두리 색
         bg = "lightgray",                # 원 바탕색
         lwd = 1.5,                       # 원 테투리선 두께
         xlab = "rate of Illiteracy",
         ylab = "crime(murder) rate",
         main = "Illiteracy and Crime" )
text( st$Illiteracy, st$Murder,                #텍스트 출력 x,y좌표
      rownames( st ),                          #출력할 text
      cex = 0.6,                               #폰트 크기
      col = "brown")                           #폰트 컬러


# https://www.r-graph-gallery.com/index.html
# 홈페이지 참고 - bubble 차트 찾으면 돼



#https://jjeongil.tistory.com/350?category=691385
블로그참고자료

#ggplot bubble chart 오픈소스 복사해와서 실행

# Libraries
library(ggplot2)
library(dplyr)
library(plotly)
library(viridis)
library(hrbrthemes)

View(gapminder)
#gapminder 데이터는 스웨덴의 비영리 통계분석 서비스의 일종이며, 
#유엔의 데이터를 바탕으로 한 인구 예측, 부의 이동 등과 같은 연구논문을 게재하고 있다.
#RStudio 회사에서 직접 데이터셋을 정리하여 업데이트를 하고 있다.

#각 변수에 대한 자세한 설명은 RStudio Editor에서 gapminder를 실행해보자.

# The dataset is provided in the gapminder library
library(gapminder)
data <- gapminder %>% filter(year=="2007") %>% dplyr::select(-year)

str(data)
summary(data)

# Interactive version
p <- data %>%
  mutate(gdpPercap=round(gdpPercap,0)) %>%
  mutate(pop=round(pop/1000000,2)) %>%
  mutate(lifeExp=round(lifeExp,1)) %>%
  
  # Reorder countries to having big bubbles on top
  arrange(desc(pop)) %>%
  mutate(country = factor(country, country)) %>%
  
  # prepare text for tooltip
  mutate(text = paste("Country: ", country, "\nPopulation (M): ", pop, "\nLife Expectancy: ", lifeExp, "\nGdp per capita: ", gdpPercap, sep="")) %>%
  
  # Classic ggplot
  ggplot( aes(x=gdpPercap, y=lifeExp, size = pop, color = continent, text=text)) +
  geom_point(alpha=0.7) +
  scale_size(range = c(1.4, 19), name="Population (M)") +
  scale_color_viridis(discrete=TRUE, guide=FALSE) +
  theme_ipsum() +
  theme(legend.position="none")

# turn ggplot interactive with plotly
pp <- ggplotly(p, tooltip="text")
pp

# save the widget
# library(htmlwidgets)
# saveWidget(pp, file=paste0( getwd(), "/HtmlWidget/ggplotlyBubblechart.html"))





# https://www.r-graph-gallery.com/index.html
# 다양한 그래프 시각화 
# 모두 ggplot2 기반 !