#송지영 / 2019.12.04
#* 실습 결과를 R Script file로 제출
#* R Script file 이름은 "영문본인이름_제출일날짜.R" 부여하여 제출
#* R Script file의 처음에 주석으로 본인 이름과 작성일/제출일 기록

# 문1)
# 다음과 같이 결측값이 포함된 데이터셋 ds를 생성한 후, 다음 문제를 해결하기 위한 R 코드를 작성하시오.

ds <- state.x77 ;ds
ds[2,3] <- NA; ds[3,1] <- NA; ds[2,4] <- NA; ds[4,3] <- NA

head(ds)

#(1) 각 열별로 결측값이 몇 개인지 출력하시오.
#data.frame이니까 열별 결측치를 확인하려면 #ncol()함수를 써야함. 각 열별 결측치
col_na <- function( y ){
  return( sum( is.na( y ) ) )
}
na_count <- apply( ds, 2, col_na ); na_count


#(2) 결측값이 포함된 행들의 데이터를 출력하시오.
#결측값이 있는 행 #nrow() 함수
na_count <- apply( ds, 1, col_na ); na_count
head(na_count)
ds[ !complete.cases( ds), ]

#(3) 결측값이 포함된 행은 몇 개인지 출력하시오.
# 결측값 총 몇개: sum( is.na( ds ))

# rowSums( is.na( ds )) 이건 행별 결측치라 오답

#(4) 결측값이 포함된 행들을 제외하고 새로운 데이터셋 ds.new를 만들어보시오.
ds.new <- ds[ complete.cases( ds ), ];
ds.new
head( ds.new )
str( ds.new )


#문2)
#다음과 같이 state.x77 데이터셋을 st에 저장한 후 다음 문제를 해결하기 위한 R 코드를 작성하시오.

st <- data.frame(state.x77)
st

#(1) st의 각 변수(열)들에 대해 특이값이 존재하는지 상자그림을 그려 확인하시오.
boxplot( st, main= "state.x77" )

# (2) 특이값이 존재하는 경우 이상치를 NA로 대체하여 저장하시오.
boxplot.stats (st$Population)$out
boxplot.stats (st$Income)$out
boxplot.stats (st$Area)$out     
               
out.p <- boxplot.stats (st$Population)$out
out.i <- boxplot.stats (st$Income)$out
out.a <- boxplot.stats (st$Area)$out

st$Population[ st$Population %in% out.p ] <- NA
st$Income[ st$Income %in% out.i ] <- NA
st$Area[ st$Area %in% out.a ] <- NA

head ( st )

boxplot( st, main= "state.x77" )

# (3) st에서 NA가 존재하는 행들을 제거하여 st2에 저장하시오.

st2 <- st[ complete.cases( st ), ]

head(st2)

#문3) 
#R에서 제공하는 airquality 데이터셋에 대해 다음의 문제를 해결하기 위한 R 코드를 작성하시오.
str( airquality)

#(1) airquality를 AQ에 저장하시오.
AQ <- data.frame( airquality)
head( AQ )

# (2) AQ에서 열별로 NA의 개수를 출력하시오.
is.na(AQ)
col_na <- function( y ){
  return( sum (is.na (y) ) )
}

na_count <- apply( AQ, 2, col_na); na_count


#(3) AQ에서 행별로 NA의 개수를 출력하시오.
na_count <- apply( AQ, 1, col_na); na_count

#(4) AQ에서 NA를 포함하지 않은 행들만 출력하시오.
z <- AQ[ complete.cases( AQ), ]; z
head(z)


#(5) AQ에서 NA를 NA가 속한 열의 평균값으로 치환하여 AQ2로 저장하고, AQ2의 내용을 출력하시오.		


  
  
  
  
#문4)
#R에서 제공하는 state.x77 데이터셋에 대하여 다음 문제를 해결하기 위한 R 코드를 작성하시오.

s1 <- state.x77
s1
#(1) state.x77 데이터셋을 Population(인구수)를 기준으로 오름차순 정렬하시오.
head(s1)
str(s1)
s1 <- data.frame(s1)
s1[ order(s1$Population), ]


#(2) state.x77 데이터셋을 Income(소득)을 기준으로 내림차순 정렬하시오.
s1[ order(s1$Income, decreasing=T ), ]

#(3) Illiteracy(문맹률)가 낮은 상위 10개 주의 이름과 문맹률을 출력하시오.	

s1 %>% arrange (Illiteracy ) %>% 
  head(10)

s2 <- s1[ order(s1$Illiteracy), ]
s2 %>% head(10)


#문5)
#R에서 제공하는 mtcars 데이터셋에 대하여 다음 문제를 해결하기 위한 R코드를 작성하시오.
str( mtcars )

#(1) mtcars 데이터셋을 gear(기어)의 개수에 따라 그룹을 나누어 mt.gear에 저장하시오.(단, split() 함수를 사용)

mt.gear <- split( mtcars, mtcars$gear); mt.gear



#(2) mt.gear에서 gear(기어)의 개수가 4인 그룹의 데이터를 출력하시오.

summary( mt.gear$'4')
mt.gear$`4`
#(3) mt.gear에서 gear(기어)의 개수가 3인 그룹과 5인 그룹의 데이터를 합쳐서 
#    mt.gear.35에 저장하고 내용을 출력하시오.

g3 <- subset(mtcars, gear == 3 ); g3
g5 <- subset(mtcars, gear == 5 ); g5

mt.gear.35 <- merge( g3, g5, all = T )
mt.gear.35

# (4) mtcars 데이터셋에서 wt(중량)가 1.5~3.0 사이인 행들을 추출하여 출력하시오.

wt <- subset ( mtcars, wt >= 1.5 & wt <=3.0 ); wt


#문6)
#다음의 문제를 해결하기 위한 R코드를 작성하시오.

#다음과 같이 데이터프레임 authors와 books를 생성하고 authors와 books의 내용을 출력하시오.	

authors <- data.frame( surname = c( "Twein", "Venables", "Tierney", "Ripley", "McNeil" ),
                       nationality = c( "US", "Australia", "US", "UK", "Australia" ),
                       retired = c( "yes", rep( "no", 4 ) ) )
books <- data.frame( name = c( "Johns", "Venables", "Tierney", "Ripley", "Ripley", "McNeil" ),
                     title = c( "Exploratory Data Analysis", 
                                "Modern Applied Statistics ...",
                                "LISP-STAT",
                                "Spatial Statistics", "Stochastic Simulation",
                                "Interactive Data Analysis" ),
                     other.author = c( NA, "Ripley", NA, NA, NA, NA ) )
authors
books

#authors <- rename( authors, surname = name , )
#str(authors)
#name<- as.vector(authors$surname)


#(1) surname과 name을 공통 열로 하여 authors와 books를 병합하여 출력하시오
#(두데이터프레임에서 공통 열의 값이 일치하는 것들만 병합).
z <- merge( authors, books, by.x = c("surname"), by.y=c("name") )
z


# (2) surname과 name을 공통 열로 하여 authors와 books를 병합하여 출력하되
#     authors의 행들이 모두 표시되도록 하시오.
z <- merge( authors, books, by.x = c("surname"), by.y=c("name"), all.x = T)
z


# (3) surname과 name을 공통 열로 하여 authors와 books를 병합하여 출력하되 
#     books의 행들은 모두 표시되도록 하시오.
z <- merge( authors, books, by.x = c("surname"), by.y=c("name"), all.y = T)
z


# (4) surname과 other.author를 공통 열로 하여 authors와 books를 병합하여 출력하시오.	

authors.books <- merge( authors, books,  by.x = c("surname"), by.y=c("other.author"), all = T )
authors.books
