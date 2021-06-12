# 구글 지도 데이터
# google maps 이용하려면 API Key 필요 (Allication programming)
# 아무나 무분별하게 쓰는걸 막기위해서, 승인받고 key 제공받아야 이용가능

# 구글이 사용할수 있는 Interface 함수를 주니까 호출해서 써라

# 공간 시각화
# google map 사용
#
#절차
# 1. R 최신버전 설치
# 2. ggplot2 최신버젼 설치
# 3. ggmap 설치
# 4. 구글맵을 사용하기 위한 API key 획득
# 5. 구글맵을 이용한 공간 시각화 수행

library( ggmap )
register_google( key = 'AIzaSyADTPbx7CV4F_kF-Ha1TmhHfwertA9Hub4' )

gc <- geocode( enc2utf8( "제주" ) )           # 원하는 지점 경도/위도 획득
gc

cen <- as.numeric( gc )                       # 경도 / 위도를 숫자로 변환
cen

#지도 표시
map <- get_googlemap( center = cen )          # 지도 중심점 좌표
ggmap( map )


#geocode 로 원하는 지점경도위도 획득후 as.numeric() 함수로 숫자로 경도 위도변환시켜주고
#지도 표시는 get_googlemap() 함수 이용해서 어떤 시각화 할지 정한뒤
#ggmap() 함수에 넣어서 호출!!

gc <- geocode( enc2utf8 ( "한라산" ) )
cen <- as.numeric( gc )
map <- get_googlemap( center = cen, zoom = 10, size = c( 640, 640), maptype = "roadmap")
ggmap( map )

#maptype = roadmap / hybrid /terrain

cen <- c( 126.561099, 33.253077 )
map <- get_googlemap( center = cen, zoom = 16, maptype = "roadmap" )
ggmap( map )


#지도위 마커 표시
gc <- geocode( enc2utf8 ( "제주대학교" ) )
cen <- as.numeric( gc )
map <-get_googlemap( center = cen,  zoom = 15, maptype = "satellite", marker = gc )
ggmap( map )


names <- c("성산일출봉", "정방폭포", "중문관광단지",
           "한라산1100고지", "차귀도", "제주아가씨홈스테이")
addr <- c( "서귀포시 성산읍 성산리", "서귀포시 동홍동 299-3",
          "서귀포시 중문동 2624-1", "서귀포시 색달동 산1-2",
          "제주시 한경면 고산리 125", "제주시 광양13길 16-18")
gc <- geocode( enc2utf8( addr ) )
gc


# 관광지 명칭과 좌표값으로 Data Frame 생성
df <- data.frame( name = names, lon = gc$lon, lat = gc$lat ); df
cen <- c( mean( df$lon ), mean(df$lat) )                            #중심점을 경도/위도의 평균으로
map <- get_googlemap( center= cen, maptype = "roadmap",
                      zoom = 10, size = c(640, 640), markers = gc)  
ggmap( map )                                                         # markers 는 벡터 gc 
                                                                     # -경도위도 addr 에 넣기


#지도에 관광지 이름 추가
gmap <- ggmap( map )                  #1 layer 를 googlemap 으로 해서
gmap +
  geom_text( data = df, aes( x = lon, y = lat ),    #텍스트 위치
             size = 5,                              #텍스트 크기
             label = df$name )                      #텍스트 이름


#참고자료
# https://m.blog.naver.com/PostView.nhn?blogId=liberty264&logNo=221013286783&proxyReferer=https%3A%2F%2Fwww.google.com%2F
# https://jjeongil.tistory.com/371



#지도에 데이터표시

dim( wind )
str( wind )
View( wind )
sp <- sample( 1:nrow( wind ), 50 )        #50개만 샘플링
str( sp )

df <- wind[ sp, ]
head( df )

cen <- c( mean( df$lon ), mean(df$lat) )       # 지도에 원하는 중심점 잡고
gc <- data.frame( lon = df$lon, lat = df$lat ) # 내가 보려고 하는 데이터셋 만듦
head( gc )


#지도에 마커표시
map <- get_googlemap( center = cen, maptype = "roadmap", zoom = 6, markers = gc)
ggmap( map )

# 지도에 마커 말고 풍속을 원의 크기로 표시

map <- get_googlemap( center = cen, maptype = "roadmap", zoom = 6)
gmap <- ggmap( map )
gmap +
  geom_point( data = df, aes( x = lon, y = lat, size = spd ),
             alpha = 0.5, col ="steelblue" ) +
  scale_size_continuous( range = c( 1, 14) )


#원 크기 넣기 참고자료
https://jjeongil.tistory.com/373



# 내가 원하는 주소  + 마커 + 텍스트넣기

cen <- c( 126.532448, 33.498619 )
gc <- data.frame( lon = 126.532448, lat = 33.498619 )
map <- get_googlemap( center = cen,  zoom = 15, maptype = "roadmap", marker = gc )          # 지도 중심점 좌표
ggmap( map )

map <- ggmap( map ) 
map +
  geom_text(data = gc , aes( x = lon, y = lat ),    #텍스트 위치
            size = 5,                              #텍스트 크기
            label = "제주아가씨 홈스테이")











# 단계 구분도
install.packages( "ggiraphExtra")
library( ggiraphExtra )
View( USArrests)
dim( USArrests )
str( USArrests )
head( USArrests )

#state 주별 문자형 데이터를 넣어야함
#tibble 패키지: tidyverse 작업을 약간 쉽게 만들어주는, 고집있는 데이터프레임을 제공한다. 
library( tibble )
crime <- rownames_to_column( USArrests, var = "state" ) #state 변수를 생성
crime
crime$state <- tolower( crime$state )
str( crime )


library( ggplot2 )
install.packages( "mapproj" )
library( mapproj )

state_map <- map_data( "state" )
str( state_map )

ggChoropleth( data = crime, aes( fill = Murder, map_id = state),
              map = state_map )


#

#마우스에 움직임에 반응하는 interactive
ggChoropleth( data = crime,
              aes( fill = Murder, 
                   map_id = state ),
              map = state_map,
              interactive = T ) # interactive를 T로 하면 지도위에  마우스 가져가면 내용이 보임
#
#
#http://rpubs.com/cardiomoon/222145
#한국행정지도(2014) 패키지 kormaps2014 안내
install.packages("stringi")
install.packages( "devtools" )

devtools::install_github("cardiomoon/kormaps2014")
devtools::install_github("cardiomoon/moonBook2")

library( kormaps2014 )
library(moonBook2)

areacode
str( changeCode(areacode))
str( changeCode(kormap1) ) #: 2014년 한국행정지도(시도별)

theme_set( theme_gray(base_family = "NanumGothic"))

library( ggplot2 )

ggplot(korpop1,aes(map_id=code,fill=총인구_명))+
  geom_map(map=kormap1,colour="black",size=0.1)+
  expand_limits(x=kormap1$long,y=kormap1$lat)+
  scale_fill_gradientn(colours=c('white','orange','red'))+
  ggtitle("2015년도 시도별 인구분포도")+
  coord_map()
