
# 패키지 1번째 #------------------------------------------------------------------------
#
# dplyr package
#


df <- data.frame( id = c(1, 2, 3, 4, 5, 6),
                  class = c(1, 1, 1, 1, 2, 2),
                  math = c(50, 60, 45, 30, 25, 50),
                  english = c(98, 98, 86, 98, 80, 89),
                  science = c(50, 60, 78, 58, 65, 98) )
df


install.packages("dplyr")
library( dplyr )  

# 엄청 좋아하는 패키지~~~~

#  %>% (pipe) 연산자 (왼쪽 ctlr + 왼쪽 shift + M )



# filter () 함수 : 행 추출
df %>% filter( class == 1 )
df %>% filter( class == 2 )
df %>% filter( class != 1 )
df %>% filter( class != 2 )


df %>% filter( science > 70)
df %>% filter( math < 50 )

df %>% filter( class == 1 & math >= 50 )
df %>% filter( math > 50 | english >= 90 )
df %>% filter( class %in% c( 1, 3, 5) )        


# 데이터프레임 df가 pipe 에 입력을 받아서 filter ( 조건식 ) 함수에 적용
#  -------- + 조건식에는 논리형만 가능
# 코딩 과정이 단순해 질수 있어서
# filter 함수를 많이 씀



class1 <-  df %>% filter( class == 1 )
class2 <-  df %>% filter( class == 2 )
class1
class2






# select() : 변수 추출

df %>%  select( math )
df %>% select( science )

df %>% select( class, math, science )

df %>%  select( -math )


# dplyr 함수 조합
df %>% 
  filter( class == 1) %>% 
  select( science )

df %>% 
  select( id, science ) %>% 
  head

df %>% 
  select( id, science ) %>% 
  max


# arrange () : 정렬
df %>%  arrange( science )           #ascending
df %>% arrange( desc( science ) )    #descending


# mutate() :파생변수 추가
df %>% 
  mutate( total = math + english + science ) %>% 
  head

df %>% 
  mutate( total = math + english + science,
          average = ( math + english + science )/3 ) %>% 
  head

df %>% 
  mutate( grade = ifelse(science >=60, 'pass', 'fail' )) %>% 
  head





df %>% 
  mutate( total = math + english + science,
          average = ( math + english + science )/3 ) %>% 
  mutate( grade = ifelse(average >= 90, 'pass',
                         ifelse(average < 60, 'fail', 'normal') )) %>% 
  head



df %>% 
  mutate( total = math + english + science,
          average = ( math + english + science )/3 ) %>% 
  arrange( desc( average) ) %>% 
  head





#내가 가공한 파이프를 통해나온 변수들을 구분해야하면 꼭 이름붙일것
df.sort <- df %>% 
  mutate( total = math + english + science,
          average = ( math + english + science )/3 ) %>% 
  arrange( desc( average) ) %>% 
  head

df.sort




# summarise() : 집단별 요약
# group_by() : 집단별 나누기
df %>% summarise( mean_math = mean( math ) )

df %>% 
  group_by( class ) %>%                              # group을 class 로 나눔 / 2개의 행이 생김
  summarise( mean_math = mean( math),
             mean_english = mean( english),          # 변수명 class + summarize 4개 합쳐서 5개의 열
             mean_science = mean( science),
             n = n() )                               #빈도수를 계산 - 몇개 /  () 인수없음









#libraty() 또는 require() 함수 쓰지 않고 '::' 로 로드함
# 예시 ggplot2 설치후 로드하기
install.packages("ggplot2")
str( ggplot2::mpg )               

#이렇게 이용이 가능하다.

mpg <- data.frame( ggplot2::mpg )
dim( mpg )
str( mpg )
head( mpg )
View( mpg )                       
# 대문자 View() 함수 : script 를 엑셀시트 형식으로 보게 새창을 띄움

mpg %>% 
  group_by( manufacturer, drv ) %>% 
  summarise( mean_cty = mean( cty ) ) %>% 
  head( 10 )

mpg %>% 
  group_by( manufacturer ) %>% 
  filter( class == 'suv' ) %>%
  mutate( tot = (cty+hwy)/2 ) %>% 
  summarise( mean_tot = mean( tot ) ) %>% 
  arrange( desc( mean_tot ) ) %>% 
  head(5)













library(dplyr)

# 데이터 합치기
#  left_join() : 가로로 합치기 (변수 추가)
#  inner_join() : 가로로 합치기 (변수 추가)
#  full_join() : 가로로 합치기 (변수 추가)
#  bind_rows() : 세로로 합치기 (data 추가)

df1 <- data.frame( id= c(1, 2, 3, 4, 5),
                   midterm= c(60, 80, 70, 90, 85 ) )
df2 <- data.frame( id= c(1, 2, 3, 4, 5),
                   final= c(60, 80, 70, 90, 85 ) )
total <- left_join( df1, df2, by = "id" ); total          #by ="기준변수"
# 가로로 합치기 (변수 추가)




# factor 자료는 시각화가 어려워서  
# ( , stringsAsFactors = F , ) 
# factor로 로딩을 막아주는 인수

df1 <- data.frame( id= c(1, 2, 3), address= c("서울", "부산", "제주"),
                   stringsAsFactors=F )  
str(df1) ; df1

#stringsAsFactors 없을때랑 비교하기.
df2 <- data.frame( id= c(1, 2, 4), gender= c("남", "여", "남" ) )
df2
str(df2)



df_left <- left_join( df1, df2, by ='id' ); df_left          #df1 을 기준으로 해서 df2를 추가한다. (id =123 데이터만)
str(df_left)


df_inner <- inner_join( df1, df2, by ='id' ); df_inner       # inner 는 df1 & df2 동일한 변수만 추가 = merge
df_full <- full_join( df1, df2, by ='id' ); df_full          # 모두  = all




# bind_rows( df1, df2 ) 함수
# 추가데이터를 행으로 넣기
# id 가 1:5 행 구성 df1,               
#         6 행부터 다시 df2 의 id 1:5 추가

df1 <- data.frame( id= c(1, 2, 3, 4, 5), midterm= c(60, 80, 70, 90, 85 ) ); df1
df2 <- data.frame( id= c(1, 2, 3, 4, 5), final= c(60, 80, 70, 90, 85 ) ); df2

df_all <- bind_rows( df1, df2 )
df_all                       




# 패키지 2번째 #------------------------------------------------------------------------

install.packages("psych")
library( psych )

summary( mtcars )
describe( mtcars )

install.packages( "descr" )
require( descr )

df <- data.frame( id= c(1, 2, 4), gender= c("남", "여", "남"));df
table( df$gender )                                # 도수분포표 함수

freq( df$gender )               # 도수분포표 + 막대그래프 같이 그려짐
freq( df$gender, plot = F )



#page 172 패키지함수 불러오기
