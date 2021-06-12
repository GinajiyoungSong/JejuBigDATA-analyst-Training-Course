# csv file 내용 읽기
setwd( "D:/R 프로그래밍 2주차/week1" )
air <- read.csv( "airquality.csv", header = T )        #98page   #엑셀로 만든 csv 파일 읽어오기

class( air )
dim( air )
str( air )
head( air )
tail( air )

name <- c( "Hong", "Kim", "Lee" )
age <- c( 22, 20, 25 )
gender = factor( c ( "M", "F", "M"))
blood.type = factor( c( "A", "O", "B" ))
person.info <- data.frame( name, age, gender, blood.type )
person.info

setwd("D:/R 프로그래밍 2주차/week1")
write.csv( person.info, "person_info.csv", row.names = F )          #csv 파일로 저장 : 엑셀로 읽기가능

# page109  write.csv()함수



#96page. read.table 함수

setwd("D:/R 프로그래밍 2주차/week1")
df <-  read.table( file = "airquality.txt", header = T)
df

class( df )
dim( df )
str( df )
head( df, 3 )
tail( df, 3 )





#-------------------------------------------------------
#엑셀파일 을 R 에서 로드하기 위한 구축환경 셋팅하기.
#JAVA <- 1. JDK 설치 (java 개발환경 구축)
#        2. D/S별 환경설정. 윈도우 시스템 고급설정에서
#            환경변수 path에 jdk파일 설치된 위치 주소 등록후
#            제일 윗상단으로 이동시켜 편집완료
#패키지 설치함수
install.packages("xlsx")  #설치가 안되었을때하는 것
install.packages("rJava")                                             


#패키지 로드함수
library( rJava )  # 내가 원하는 패키지를 쓰겠다 지정함수
library( xlsx)                                                       


df.xlsx <-  read.xlsx( file = "airquality.xlsx", sheetIndex = 1,
                       encoding = "UTF-8")

df.xlsx
class(df.xlsx )
str( df.xlsx )
head( df.xlsx )
tail( df.xlsx )


head( df.xlsx, 1 )
tail( df.xlsx, 1 )



#Base 함수
# read.table()  -일반 text file
# load.csv()    -csv text file

#rJAva <- xlsx 함수
# read.xlsx     -xlsx file

