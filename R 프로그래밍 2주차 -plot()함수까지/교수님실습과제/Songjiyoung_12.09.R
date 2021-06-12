#송지영 2019.12.09

#* 실습 결과를 R Script file로 제출
#* R Script file 이름은 "영문본인이름_제출일날짜.R" 부여하여 제출
#* R Script file의 처음에 주석으로 본인 이름과 작성일/제출일 기록


#문1)
#R에서 제공하는 mtcars 데이터셋에서 gear(기어의 수)에 대해 ggplot으로 막대그래프를 작성하시오. 
#단, 제목과 x축 레이블은 ‘기어의 수’, y축 레이블은 ‘빈도수’로 나타내시오.
str( mtcars )
ggplot( mtcars , aes( x= gear, y= "빈도수" ) ) +
  geom_bar (stat ="identity",
            fill="pink")

#문2)
#R에서 제공하는 mtcars 데이터셋에서 cyl(실린더의 수)에 대해 막대 색이
#초록색인 막대그래프를 ggplot으로 작성하시오.


ggplot( mtcars, aes( x= cyl )) +
  geom_bar(width= 2.0,
           fill= "darkgreen",
           col= "white" )

#문3) 
#R에서 제공하는 mtcars 데이터셋에서 mpg(연비)에 대해 구간 간격이 5.0인 
#히스토그램을 ggplot으로 작성하시오.

fillPalette <- c("red", "yellow", "black")
ggplot( mtcars, aes( x= mpg )) +
  geom_histogram( binwidth = 5.0 , fill = "blue", colour ="white") 


#+ scale_fill_manual(values = "fillPalette")

#문4)
#R에서 제공하는 trees 데이터셋의 Girth(나무 둘레)에 대해 ggplot으로
#히스토그램을 작성하시오. 여기에서는 히스토그램의 제목, x축 레이블, y축
#레이블을 한글로 표시하시오. (구간 간격은 3.0, 막대의 색은 steelblue로 한다.)

str(trees)

ggplot( trees, aes( x= Girth )) +
  geom_histogram(binwidth = 3.0, fill="darkgreen", color= "white") +
  ggtitle("나무둘레에 대한 나무 종류")+
  theme(plot.title = element_text( size = 20, colour = "darkgreen"))+
  labs( x= "나무둘레", y="나무수" )

#문5)
#R에서 제공하는 mtcars 데이터셋에서 mpg(연비)를 x축으로 하고, 
#wt(중량)를 y축으로 하는 산점도를 ggplot으로 작성하시오. 
#(단, 점의 색은 gear의 수에 따라 다르게 표시한다.)

str(mtcars)
gear <- as.factor(mtcars$gear)
str(gear)

ggplot( mtcars, aes( x= mpg, y=wt , color=gear) ) +
  geom_point()+
  ggtitle( "mpg(연비) 와 wt(중량) 의 상관관계" )


#문6)
#R에서 제공하는 mtcars 데이터셋에서 mpg(연비)에 대해 ggplot으로 상자그림을 작성하되,
#cyl(실린더 수)에 따라 그룹을 나누어 작성하시오.


ggplot(mtcars, aes(x=as.factor(cyl), y=mpg ) )+
  geom_boxplot( fill="slateblue", alpha=0.2 ) +
  ggtitle( "cyl(실린더수)에 따른 mpg(연비)" )+
  xlab("cyl")





#문7) 
#다음은 2015년부터 2026년도까지의 예상 인구수 추계 자료이다. 
#연도를 x축으로 하여 ggplot으로 선그래프를 작성하시오.

#연도		총인구 (천명)		연도		총인구 (천명)
#2015		51014				2021		52123
#2016		51245				2022		52261
#2017		51446				2023		52388
#2018		51635				2024		52504
#2019		51811				2025		52609
#2020		51973				2026		52704	

year <- c(2015:2026)
pop <- c(51014, 51245, 51446, 51635, 51811, 51973,
                52123, 52261, 52388, 52504, 52609, 52704)
df <- data.frame(year, pop)

df

ggplot( df, aes( x= year , y=pop)) +
  geom_line(col= "red")


#문8)
#다음과 같이 데이터셋 us를 생성한 후 물음에 답하시오. 
#여기서 state.x77은 미국 50개 주의 통계정보가, state.division은 
#미국 50개 주의 지역 구분(예: 북부, 중부, 남부……) 정보가 저장된 데이터셋이다.

us <- data.frame(state.x77, state.division)

dim(state.x77)
str(us)
head(us, 20)

#(1) 미국 50개 주에 대해 각각의 주들이 지역구분별로 묶인 트리맵을 작성하시오.
#또한, 타일의 면적은 Population(인구수), 타일의 색은 Income(소득)으로 나타내고,
#각각의 타일에는 주의 이름을 표시하시오. 마지막으로 이 트리맵에서 관찰할 수 있는 것이 
#무엇인지 설명하시오


#continent 이름이 필요한가?
str(state.x77)
View(state.x77)
st <- data.frame( state.x77 )
st <- data.frame( state.x77, stname = rownames( st ))
                
st <- data.frame(st, state.division)
st

treemap(st,
        index=c("state.division","stname"),
        vSize="Population",
        vColor="Income",
        type="value",
        bg.labels="yellow",
        title="미국 주별 수입과 인구수")

#이 트리맵을 통해서 미국주별로 인구수가 큰 지역은 네모박스가 크면서 수입에 대한 수치는 컬러로 비교하여
# 진한컬러가 수입이 아주 높음을 알수 있는데 예를 들어 Alaska 는 인구는 매우 적어 아주 작은 네모박스지만
# 다크그린 컬러로 색이 진함을 알수 있다.
# 주별로 인구수와 수입이 비례하진 않는다는 것이 보인다

#(2) 미국 50개 주에 대해 각각의 주들이 지역구분별로 묶인 트리맵을 작성하시오.
#또한, 타일의 면적은 HS.Grad(고등학교 졸업률), 타일의 색은 Murder(범죄률)로 나타내고, 
#각각의 타일에는 주의 이름을 표시하시오. 마지막으로 이 트리맵에서 관찰할수 있는 것이 무엇인지 설명하시오.

treemap(st,
        index=c("state.division","stname"),
        vSize="HS.Grad",
        vColor="Murder",
        type="value",
        bg.labels="yellow",
        title="미국 주별 문명률과 살인범죄 상관관계")

# 이 트리맵을 통해 주별로 문맹률이 높음과 살인범죄의 상관관계는 없다는 것을 볼수 있다
# 문맹률이 높음은 네모박스 상자크기로 확인할수 있는데 문맹률이 높다해도 Utah와 같이 살인범죄
# 발생률이 적음이 확인되고 바로 아래 비슷한 크기의 Nevada는 워낙 유명한 살인범죄율이 높은 도시라
# 둘의 상관관계가 없음이 확인된다.


#(3) us 데이터셋에 대해 x축은 Income(소득), y축은 Illiteracy(문맹률), 
#원의 크기는 Population(인구수), 원의 색은 green(초록색), 
#원 내부에는 주의 이름을 표시한 버블차트를 작성하시오. 
#또한 이 버블차트에서 관찰할 수 있는 것이 무엇인지 설명하시오.


symbols( st$Income, st$Illiteracy,        # (x =, y = ) #원의 x,y좌표    
         circles = st$Population,         # 원의 반지름
         inches = 0.3,                    # 원크기 조절값
         fg = "white",                    # 원 테두리 색
         bg = "green",                    # 원 바탕색
         lwd = 1.5,                       # 원 테투리선 두께
         xlab = "Income",
         ylab = "rate of Illiteracy",
         main = "Income and Illiteracy" )
text( st$Income, st$Illiteracy,                #텍스트 출력 x,y좌표
      rownames( st ),                          #출력할 text
      cex = 0.6,                               #폰트 크기
      col = "brown")                           #폰트 컬러

# 이 버블차트를 보면 수입이 높을수록 문맹률의 관계가
# 인구수가 높은 지역과 어떤 연관이 있는지 추측을 할 수 있다.
# 인구수가 많다고 해서 수입이 매우 높게 나타나진 않고, 역시 인구수가 많다고 문맹률이 높지도 않다.



#(4) us 데이터셋에 대해 x축은 Illiteracy(문맹률), y축은 Murder(범죄률), 
#원의 크기는 Area(면적), 원의 색은 green(초록색), 
#원 내부에는 주의 이름을 표시한 버블차트를 작성하시오. 
#또한 이 버블차트에서 관찰할 수 있는 것이 무엇인지 설명하시오.

symbols( st$Illiteracy, st$Murder,        # (x =, y = ) #원의 x,y좌표    
         circles = st$Area,         # 원의 반지름
         inches = 0.3,                    # 원크기 조절값
         fg = "white",                    # 원 테두리 색
         bg = "green",                # 원 바탕색
         lwd = 1.5,                       # 원 테투리선 두께
         xlab = "rate of Illiteracy",
         ylab = "crime(murder) rate",
         main = "Illiteracy and Crime" )
text( st$Illiteracy, st$Murder,                #텍스트 출력 x,y좌표
      rownames( st ),                          #출력할 text
      cex = 0.6,                               #폰트 크기
      col = "brown")                           #폰트 컬러

# 이 버블차트를 보면 문맹률이 높아질수록 살인범죄의 발생빈도가 높은지, 연관관계가 있는지
# 비교할수 있는데, 주의 면적의 크기는 상관이 없어 보인다.
