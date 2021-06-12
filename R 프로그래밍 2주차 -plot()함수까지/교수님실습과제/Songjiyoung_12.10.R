# 송지영 12.10
#* 실습 결과를 R Script file로 제출
#* R Script file 이름은 "영문본인이름_제출일날짜.R" 부여하여 제출
#* R Script file의 처음에 주석으로 본인 이름과 작성일/제출일 기록


#문1)
#	R에서 제공하는 state.x77 데이터셋을 차원 축소하여 2차원 산점도와 3차원 산점도를 작성하시오.
#	(state.x77은 매트릭스 타입이기 때문에 데이터프레임으로 변환하여 실습한다.)

install.packages( "Rtsne")

library( Rtsne )
library( ggplot2 )

View(state.x77)
str(state.x77)
stname <- rownames(state.x77)
stname
state <- data.frame(state.x77, stname)
str( state )

st <- state[ , -9 ]
str( st )


# 차원 축소 수행 -t-sne 실행
tsne <- Rtsne( st, dim = 2, perplexity = 10 )   # 2차원 그리기위해 데이터셋 만듦
tsne

df.tsne <- data.frame( tsne$Y )                 #col Y 값만 데이터프레임 생성
head( df.tsne )

ggplot( df.tsne, aes( x= X1, y= X2, color = stname ) ) +
  geom_point( size =2 )

# 2차원 데이터로 stname 주별로 데이터 뽑음


install.packages(c("rgl", "car"))
library( car )
library( rgl )
library( mgcv )

#3차원 데이터로 보기위해서 

tsne3 <- Rtsne( st, dims=3, perplexity= 10 )  #3차원 그리는 데이터셋
df.tsne3 <- data.frame( tsne3$Y)
head( df.tsne3 )

scatter3d( x = df.tsne3$X1, y = df.tsne3$X2, z= df.tsne3$X3 )



# 문2)
#	R에서 제공하는 swiss 데이터셋을 차원 축소하여 2차원 산점도와 3차원	산점도를 작성하시오.

View(swiss)
str( swiss )

#차원 축소
#중복 데이터제거
dup = which( duplicated( swiss ) )
dup
swi.d <- swiss[ -dup, ]                  
#중복된 데이터가 있는 품종도 지워야 해서 
str(swi.d) # 확인해보니 얘도 중복된 데이터 없어???

name <- rownames(swiss)
name
s.name <- data.frame(swiss, name)
str(s.name)


# 이름 넣은 데이터 셋트 완성
swi <- s.name[ , -7 ]
str( swi )


# 차원 축소 수행 -t-sne 실행
s.tsne <- Rtsne( swi, dim = 2, perplexity = 10 )   # 2차원 그리기위해 데이터셋 만듦
s.tsne

tsne <- data.frame( s.tsne$Y )                 #col Y 값만 데이터프레임 생성
head( tsne )

ggplot( tsne, aes( x= X1, y= X2), color =name ) +
  geom_point( size =2 )




s.tsne3 <- Rtsne( swi, dims=3, perplexity= 10 )  #3차원 그리는 데이터셋
tsne3 <- data.frame( s.tsne3$Y)
head( tsne3 )

scatter3d( x = tsne3$X1, y = tsne3$X2, z= tsne3$X3 )



# 문3) 
# R을 이용하여 지도를 출력하시오.
# (1) 서울시청을 중심으로 지도 크기는 600x600, 지도 유형은 roadmap인 지도를 출력하시오.


library( ggmap )
register_google( key = 'AIzaSyADTPbx7CV4F_kF-Ha1TmhHfwertA9Hub4' )

gc <- geocode( enc2utf8( "서울시청" ) )           # 원하는 지점 경도/위도 획득
gc

cen <- as.numeric( gc )                       # 경도 / 위도를 숫자로 변환
cen

#지도 표시
map <- get_googlemap( center = cen, zoom = 10, size = c( 600, 600),
                      maptype = "roadmap" )          
ggmap( map )


#	(2) 금강산 지역을 근방으로 지도 크기는 500x500, 지도 유형은 hybrid, zoom은 8인 지도를 출력하시오.


gc <- geocode( enc2utf8( "금강산" ) )           # 원하는 지점 경도/위도 획득
gc

cen <- as.numeric( gc )                       # 경도 / 위도를 숫자로 변환
cen

#지도 표시
map <- get_googlemap( center = cen, zoom = 8, size = c( 500, 500),
                      maptype = "hybrid" )          
ggmap( map )



#	(3) 강남역 근방으로 지도 크기는 640x640, 지도 유형은 roadmap, zoom은 16인 지도를 출력하시오.


gc <- geocode( enc2utf8( "강남역" ) )           # 원하는 지점 경도/위도 획득
gc

cen <- as.numeric( gc )                       # 경도 / 위도를 숫자로 변환
cen

#지도 표시
map <- get_googlemap( center = cen, zoom = 16, size = c( 640, 640),
                      maptype = "roadmap" )          
ggmap( map )
	

#(4) 지도 유형은 roadmap, zoom은 9인 경도 127.397692, 위도 36.337058 지역의 지도를 출력하시오.


dae <- c( 127.397692, 36.337058 )
gc <- data.frame( lon = 127.397692, lat = 36.337058 )
#지도 표시
map <- get_googlemap( center = dae, zoom = 13, size = c( 600, 600), markers = gc)
ggmap( map )

	
#(5) 지도 유형은 roadmap, zoom은 10인 경도 135.502330, 위도 34.693594 지역의 지도를 출력하시오.


cen <- c( 135.502330, 34.693594 )
gc <- data.frame( lon = 135.502330, lat = 34.693594 )
#지도 표시
map <- get_googlemap( center = cen, zoom = 10, size = c( 600, 600), markers = gc )
ggmap( map )





#문4)
#	R을 이용하여 서울시 한강 이남의 구청들의 위치에 마커와 구청 이름을	지도 위에 표시하시오.
# 한강 이남지역은 강남으로, 강남구, 서초구, 송파구지역에 해당한다


names <- c("강남구청", "서초구청", "송파구청")
addr <- c( "서울특별시 강남구 삼성2동 학동로 426",
           "서울특별시 서초구 서초2동 남부순환로 2584",
           "서울특별시 송파구 잠실6동 올림픽로 326")
gc <- geocode( enc2utf8( addr ) )
gc


df <- data.frame( name = names, lon = gc$lon, lat = gc$lat ); df
cen <- c( mean( df$lon ), mean(df$lat) )                         
map <- get_googlemap( center= cen, maptype = "roadmap",
                      zoom = 12, size = c(640, 640), markers = gc)  
ggmap( map )    

gmap <- ggmap( map )               
gmap +
  geom_text( data = df, aes( x = lon, y = lat ),   
             size = 5,                             
             label = df$name )      


#문5)
#	R을 이용하여 대한민국의 광역시를 지도 위에 출력하시오. 
# 단, 마커와 광역시 이름을 함께 표시하시오.
#대한민국의 광역시 부산광역시, 인천광역시, 광주광역시, 대구광역시, 대전광역시, 울산광역시
	


names <- c("부산광역시", "인천광역시", "광주광역시", "대구광역시", "대전광역시", "울산광역시")
addr <- c( "부산광역시", "인천광역시", "광주광역시", "대구광역시", "대전광역시", "울산광역시")
gc <- geocode( enc2utf8( addr ) )
gc


df <- data.frame( name = names, lon = gc$lon, lat = gc$lat ); df
cen <- c( mean( df$lon ), mean(df$lat) )                            
map <- get_googlemap( center= cen, zoom = 8,
                      size = c(640, 640), markers = gc)  
ggmap( map )    

gmap <- ggmap( map )               
gmap +
  geom_text( data = df, aes( x = lon, y = lat ),   
             size = 5,                             
             label = df$name )                     



#문6)
#	R을 이용하여 서울, 경기, 강원 지역의 국립공원 위치를 지도 상에 마커로	표시하되 
# 국립공원의 이름을 함께 표시하시오.
	

#강원도 설악산 강원 속초시 고성군 양양군 인제군
#       오대산 강원 강릉시 평창군 홍천군
#       치악산 강원 원주시 횡성군
#       태백산 강원 영월군 정선군 태백시
#서울 북한산 서울 강북구 도봉구 성북구 은평구 종로구
#경기 북한산 경기 고양시 덕양구 양주시 의정부시



m.names <- c("설악산", "오대산", "치악산" ,"태백산", "북한산", "북한산")
m.addr <- c( "강원 속초시 고성군", "강원 강릉시 평창군", 
           "강원 원주시 횡성군", "강원 영월군 태백시",
           "서울 강북구 ", "경기 고양시 덕양구 양주시")
gc <- geocode( enc2utf8( m.addr ) )
gc

center <- geocode( enc2utf8( "강남역" ) )           # 원하는 지점 경도/위도 획득
center

cen <- as.numeric( center )                       # 경도 / 위도를 숫자로 변환
cen

mountain<- data.frame( name = m.names, lon = gc$lon, lat = gc$lat ); mountain
map <- get_googlemap( center= cen, zoom = 7, maptype = "roadmap",
                      size = c(640, 640), markers = gc)  
ggmap( map )    


gmap <- ggmap( map )                  #1 layer 를 googlemap 으로 해서
gmap +
  geom_text( data = mountain, aes( x = lon, y = lat ),    #텍스트 위치
             size = 5,                              #텍스트 크기
             label = mountain$name )                      #텍스트 이름




#문7) 
#	‘2018년도 시군구별 월별 교통사고 자료’로부터 서울시의 각 구별 1년 교통사고 발생건수를
# 지도상에 원의 크기로 나타내시오.

install.packages("xlsx")
install.packages("rJava") 

library( rJava )  # 내가 원하는 패키지를 쓰겠다 지정함수
library( xlsx)  

setwd("D:/WorkR")
accident <- read.csv("2018.csv")

View(accident)
	
ac <- accident[ 5:29, 2:5] # 샘플링
ac
str( ac )
head( ac )
names(ac) <- c("시군구",	"발생건수(건)",	"사망자수(명)",	"부상자수(명)")

ac
str( ac )

accident.sum <- ac[, 2]
accident.sum

c.names <- c("종로구", "중구", "용산구", "성동구" ,"동대문구" ,"성북구",
             "도봉구", "은평구", "서대문구", "마포구", "강서구", "구로구",
             "영등포구", "동작구", "관악구", "강남구", "강동구", "송파구",
             "서초구", "양천구", "중랑구", "노원구", "광진구", "강북구",
             "금천구" )
c.addr <- c( "종로구", "중구", "용산구", "성동구" ,"동대문구" ,"성북구",
             "도봉구", "은평구", "서대문구", "마포구", "강서구", "구로구",
             "영등포구", "동작구", "관악구", "강남구", "강동구", "송파구",
             "서초구", "양천구", "중랑구", "노원구", "광진구", "강북구",
             "금천구" )
gc <- geocode( enc2utf8( c.addr ) )
gc



seoul <- data.frame( name = c.names, lon = gc$lon, lat = gc$lat ); seoul
seoul <- data.frame( seoul, accident.sum ); seoul
cen <- c( mean( seoul$lon ), mean(seoul$lat) )                            
cen
map <- get_googlemap( center= cen, zoom = 11, maptype = "roadmap",
                      size = c(640, 640), markers =gc )  
ggmap( map )

gmap <- ggmap( map )
gmap +
  geom_point( data = seoul, aes( x = lon, y = lat, size =accident.sum ),
              alpha = 0.5)






#문8)
#	7번과 동일한 자료를 이용하여 제주시 1년 교통사고 발생건수를 지도상에 원의 크기로 나타내시오.
	

j.ac <- accident[ 208:209, 2:5] # 샘플링
j.ac
str( j.ac )
names( j.ac) <- c("시군구",	"발생건수(건)",	"사망자수(명)",	"부상자수(명)")

j.ac

accident.sum <- j.ac[, 2]
accident.sum

j.names <- c("제주시","서귀포시" )
j.addr <- c("제주시","서귀포시" )
gc <- geocode( enc2utf8( j.addr ) )
gc

jeju <- data.frame( name = j.names, lon = gc$lon, lat = gc$lat ); jeju
jeju <- data.frame( jeju, accident.sum ); jeju
cen <- c( mean( jeju$lon ), mean(jeju$lat) )                            
cen
map <- get_googlemap( center= cen, zoom = 11, maptype = "roadmap",
                      size = c(640, 640), markers =gc )  
ggmap( map )

gmap <- ggmap( map )
gmap +
  geom_point( data = jeju, aes( x = lon, y = lat, size =accident.sum ),
              alpha = 0.5)


