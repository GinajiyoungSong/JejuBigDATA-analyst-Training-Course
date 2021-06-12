
# 데이터 가공
#

#---------------------------------------------------------------
# 1. 데이터 정렬


# vector 정렬
v1 <- c( 1, 7, 6, 8, 4, 2, 3 )
order( v1 )                           
#order() 값이 sort 함수처럼 정렬되는게 아님
#인덱스값을 적어줌 - 어떻게 순서가 되어있는지 보여주는 듯 ㅋㅋ

v1 <- sort( v1 ) ; v1                       #오름차순으로 sort
v2 <- sort( v1, decreasing = T ); v2




# Matrix /Data.frame 정렬

head( iris )
order( iris$Sepal.Length )                      #Sepal.length 를 정렬해라, 숫자크기순으로 됨
iris[ order( iris$Sepal.Length), ] #Ascending
iris[ order( iris$Sepal.Length, decreasing = T ), ] #Descending


iris.new <- iris[ order( iris$Sepal.Length), ]
head( iris.new )
iris[ order( iris$Species, decreasing = T,
             iris$Sepal.Length), ] #정렬 기준을 2개 설정










# 데이터 분리  #split () 함수를 이용하여 

sp <- split( iris, iris$Species ); sp  
#                                                 품종별 변수들을 갖는 list 함수로 뽑아냄

summary( sp )
summary( sp$setosa )
sp$setosa                               #변수 내용만 출력








# 데이터 선택
# subset() 함수 이용. 원하는 조건에 맞는 데이터 추출

subset( iris, Species == "setosa" )
subset( iris, Sepal.Length > 7.5 )                       #Sepal.Length > 7.5 데이터 다른 정보도 다 출력
subset( iris, Sepal.Length > 5.1 & Sepal.Width > 3.9 )
subset( iris, Sepal.Length > 7.6,
        select = c( Petal.Length, Petal.Width ) )         #select = 내가 원하는 데이터값만 추출








# 데이터 Sampling
# 숫자를 임의로 추출

# -R 실습: 비복원추출                              / 복원추출
#       샘플링 하면 다음에 그 수는 추출하지 않음
#         replace = False                           replace = True 
x <- 1:100
y <- sample( x, size= 10, replace = FALSE )
y
y <- sample( x, size= 10, replace = FALSE )
y


# 행을 임의로 추출

idx <- sample( 1:nrow( iris ), size = 50, replace = FALSE )
idx
iris.50 <- iris[ idx, ]   #iris 가 150개의 행이라서 
#                                  idx 50개의 행만 뽑아서 iris[ __ , ] 행자리에 넣어줌
dim( iris.50 )
head( iris.50 )



sample( 1:20, size = 5)   #비복원추출을 안함/ 복원추출

sample( 1:20, size = 5)   # 매번 나온 수는 다르지만 뽑혔던 추출값이 겺침.

sample( 1:20, size = 5)


set.seed( 100 )                #set.seed( 동일숫자 ) 계속 반복해서 넣어주면 같은 값
sample( 1:20, size = 5)
set.seed( 100 )
sample( 1:20, size = 5)
set.seed( 100 )
sample( 1:20, size = 5)














# 데이터 조합
combn( 1:5, 3 )             #1부터 5사이에서 3개의 수를 뽑아내는 경우의 수

x = c("red", "green", "blue", "black", "white" )
com <- combn( x, 2 )       # 색 5가지 중에서 2개의 색만 뽑아내는 경우의 수
com

for (i in i:ncol( com ) ) {
  cat( com[ , i ], "\n" )
}








# rename () 이름 변경
# rename( )함수 / ( data.set , 1번째col 기존이름, 2번째col 기존이름 ) 

df <- data.frame(var1=c(1,2,1),
                 var2=c(2,3,2))
df

df <- rename( df, v1 = var1, v2 = var2 );df

# 매트릭스와 달리 데이터프레임은 내가 지정하는 벡터이름이 자동으로 열이름
# 내가 추가적으로 열이름 변경해줄때 colnames 말고 rename() 함수사용
      





#-----------------------------------------------------------------------------

# 2. 데이터 집계
agg <- aggregate( iris[, -5],
                  by = list ( iris$Species ),             #by = 집계하고자 하는 변수 지정
                  FUN = mean )    ;agg                        #FUN = 원하는 값


agg <- aggregate( iris[, -5],
                  by = list ( iris$Species ),            
                  FUN = sd )      ;agg              

head( mtcars )
agg <- aggregate( mtcars,
                  by = list ( mtcars$cyl,
                              vs = mtcars$vs ),     #  list( x , vs= y )   x가 그룹으로 묶는 기준점
                  FUN = max )       ;agg            #                그다음으로 y로 나눔









#----------------------------------------------------------------------------------------

# 3. 데이터 병합
x <- data.frame( name = c( "a", "b", "c"),
                 mat = c( 90, 80, 40) ) ;x
y <- data.frame( name = c( "a", "b", "d" ),
                 korean = c( 75, 60, 90) )

z <- merge( x, y, by = c( "name" ) )                  #name 변수안에 이름이 같은 변수만 merge 합침
z


merge( x, y )
merge( x, y, all.x = T )               #all 함수를 쓰면 병합기준 만들어줘서 결측치 넣을수 있다.
merge( x, y, all.y = T )                                      # 있는 데이터에 변수만 추가될 뿐

merge( x, y, all = T )                 #단순 병합 -> 없던 데이터도 추가됨


# 데이터 분석할때 이쪽저쪽에서 데이터를 가져와서 병합해야 한다
# 그때 기준을 잡아서 결측치가 있더라도 병합을 시킬수 있다







x <- data.frame( name = c( "a", "b", "c"),
                 mat = c( 90, 80, 40) )
y <- data.frame( name = c( "a", "b", "d" ),
                 korean = c( 75, 60, 90) )

merge( x, y, by.x = c("name"), by.y = c("name") )          #by 기준에 x,y 둘다 name기준






#-----------------------------------------------------------------------

df <- data.frame(var1=c(1,2,1),
                 var2=c(2,3,2))
df

df <- rename( df, v1 = var1, v2 = var2 );df

# 4. 파생변수 추가
df$sum <- df$v1 +df$v2
df

#만약 내가 변수를 치환한다면?

df[ 2, 1 ] <- 5
df
# sum 틀렸네? 
# 자동으로 변화안하니까 다시 df$sum 리핏해줄것

df$sum <- df$v1 +df$v2
df

