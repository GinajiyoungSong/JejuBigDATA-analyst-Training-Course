#
# 제어구조 - 선택구조
#
           
# if문 ~ else 넣으면 양자택일구조
# if~ else 문 : 참일때 조건수행 , 거짓일때 조건수행


job.type <- 'A'  
if ( job.type =='B') {
  bonus <- 200          # 참일때
} else {
  bonus <-  100          # 거짓일때 
}
cat( 'job type : ', job.type, '\t\tbonus : ', bonus)   #\t tab간격



name <- 'Gina'
if (name == 'jein'){
  girl <- 'shortcutHair'
} else  {
  girl <- 'longHair'
}
cat( 'name :', name, '\t\ girl :', girl )









# if문 : if 참일때만 명령수행


job.type <- "B"

if ( job.type =="A" ){                 #if 이지만 else x때, 하나만 택하는 구조
  bonus <- 200
}
cat( "job.type : ", job.type, "\t\tbonus : ", bonus )





name <- 'Jein'
if( name =='Jein'){
  girl <- 'shortcut_hair'
}
cat( "name: ", name, "\t\t girl :", girl )



skin <- 'blackskin'
hobby <- 'surfing'
if  (hobby == 'reading'){
  skin <- 'white_girl' 
}
cat( 'hobby :', hobby, '\t\t skin :', skin)













#다중선택구조                
#if ~ else if ~~ else if ~~~ 선택지가 많은 구조.

score <- 85

if ( score >= 90 ){    #오류는 조건순서를 잘못주었을때 많이 나타난다. 처음조건이 90 이상은 아니기에
  grade <- 'A'                            #다음 등급으로 내려가지만,  처음조건을 80 이상으로 해버리면 무조건 참
} else if ( score >= 80 ){
  grade <- 'B'
} else if ( score >= 70 ){                 # 처음조건을 70 이상으로 넣어버리면 70 이상이 모두 같은 등급으로 나옴.
  grade <- 'C'
} else if ( score >= 60 ){
  grade <- 'D'
} else  {
  grade <- 'F'
}
cat( "score : ", score, "\t\t grade : ", grade )
















#연습문제
#number <- 15

#결과로 15는 홀수이다. 산출해보아라.
#내가 풀었던 문제

  

number <- 15
if ( number%%2 == 0 ){
  value = 'even'
} else {    
  value = 'odd' 
}
cat( "number : ", number, "는" , value, "이다." )


number <- 10
if ( number%%2 == 0 ){
  value = 'even'
} else  {      
  value = 'odd' 
}
cat( "number : ", number, "=" , value  )


#교수님풀이
number <- 15
if ( number %% 2 == 0 ){
  oddeven = '짝수'
} else {     
  oddeven = '홀수' 
}
cat( "number : ", number, "는" , oddeven, "이다." )


#else if
#구조는 여기에 못쓰나?
#이건 내가 억지로 만든거
#else if 는 다중선택지 이므로
#짝수 도 아니면 홀수도 아니면 다음 조건이 또 있어야함... 결국 안되는걸로

number <- 15
if ( number%%2 == 0 ){
  value = 'even'
} else if ( ! (number%%2 == 0) ) {      
  value = 'odd' 
}
cat( "number : ", number, "=" , value  )

#( ! (number%%2 == 0) ) 함수를 만들때 ( !() 괄호 넣어야 에러 없음)


#---------------------------------------------------------------------------------------------
  #교수님 답
  #교수님이 변수로 또 지정해주는건, 편의상인가?
  
  number <- 10
remainder <- number %% 2        

if ( remainder == 0 ){          #if ( number%%2 == 0 ){ 해도 같음
  oddeven = '짝수'
} else  (
  oddeven = '홀수' 
)
cat( "number : ", number, "는" , oddeven, "이다." )




#-----------------------------------------------------------------------------------------------
  
a <- 10
b <- 20

if ( a > 5 & b > 5 ){
  cat ( a, " > 5 and ", b, " > 5 ")
} else {
  cat( a, "<= 5 or ", b, "<= 5 ")
}



a <- 4
b <- 20

if ( a > 5 & b > 5 ){
  cat ( a, " > and ", b, " > 5 ")
} else {
  cat(a, " <= 5 or ", b, "<= 5 ")
}



a <- 5
b <- 20

if ( a > 5 & b > 5 ){
  cat ( a, " > 5 and ", b, " > 5 ")
} else {
  cat(a, " <= 5 or ", b, "<= 5 ")
}



#----------------------------------------------------
a <- 10
b <- 20

if ( a > b ){
  c <- a
} else {
  c <- b
}
cat ( "a = ", a, "\tb = ", b, "\tc = ", c )














#조건제어문, 단순표기 방법
# 조건문 적어주고 , 참일때 값, 거짓일때 값 
#ifelse( , , )

c <- ifelse( a > b, a, b )                          # 위 if else 구조를 단순하게
cat( "a = ", a, "\tb = ", b, "\tc = ", c )          # ifelse(test, yes, no)


#----------------------------------------------------------------------------------------
  
  
  
  
  
  문제
a <- 10
b <- 5
c <- 8
#이중에 제일 큰수를 max에 저장후 
#max를 출력



답 

a <- 10
b <- 5
c <- 8
max <- a
if( b > max ) {
  max = b
}
if ( c > max ){
  max = c
}
cat( "a = ", a, "b = ", b, "c = ", c, "max = ", max )    




















#-----------------------------------------------------------------------------------------
 









 
  #반복구조
  #for 문
  # 1에서 10까지 i 변수로 대입
  # 1 = i 라서 print 1  다음수로 넘어가면 2 = i 라서 print 2
  
  
for ( i in 1:10){
  print ( i ) 
}

#범위가 2:9 까지 명확할때 씀

multiple <-  2
for ( i in 2:9 ){                                           
  cat( multiple, 'x', i , ' = ', multiple*i, '\n')
}












#----------------------------------------------------------------------------------------------------
  
# while 문                             
# i가 10보다 작거나 같으면 반복하겠다   
# : 범위가 명확하지 않을때

i <- 1
while ( i <= 10 ){    
  print ( i )
  i <- i + 1                     #while 문에서는 i 끝을 정해주지 않으면 무한반복!! 내실수였음 ㅋㅋㅋ
}

multiple <-  2
i <- 2
while ( i <= 9 ){
  cat( multiple, 'x', i, ' = ', multiple*i,'\n')
  i <-  i+1
}








# break/next                      
#break 문법은 자주 남발하지 말것. 어쩔수없는 상황에 사용


#
sum <- 0
for ( i in 1: 10 ){
  sum <- sum + i
  if ( i >= 5 ){
    break
  }
}
sum
# next  다시 반복제어문으로 올라갈것 
sum <- 0                            # (sum 안에 2의배수만 빼고 싶을때) 1:10까지의 합에서
for ( i in 1:10 ){
  if ( i %% 2 == 0 ){
    next
  }
  sum <- sum + i
}
sum


#
# 산술 내장 함수

log( 10 )
log( 10 ) + 5          #로그함수
log( 10, base = 2 )
sqrt( 25 )             #제곱근
max( 5, 3, 2 )         #가장 큰 수
min( 3, 9, 5 )         #가장 작은 수
abs( -10 )             #절대값
factorial( 5 )         #팩토리얼
sin( pi / 2 )          #삼각함수



# 1줄에 10개 나열
#잘모르겠음 ㅠㅠㅠ
#---------------------------------------------------------------------------------------

  # 1부터 100까지 1줄에 10개씩 나열하는 script 를 만들어라
  #초기화

lineCount <- 1                     
for( i in 1:100) {
  cat(i,'')
  lineCount <- lineCount+1
  if (lineCount>10) {
    print ('\n')
    lineCount <- 1
  }
}


#reset
for ( i in 1:100 ) {  
  cat(i,'')
  if ( i %% 10 == 0 ) {
    print ('\n')
  }   
}


#---------------------------------------------------------------
  #문제
  # 1 ~ 1000 사이의 3의 배수와 5의 배수를 한줄에 10개씩 출력하고
  #마지막에 개수를 출력하는 Script 를 만들어라
  --------------------------------------------------------------------------------------------
  
  i <- 1
count <- 0
lineCount <- 1
multiple3 <- NULL                           #code 로 옮기기 위해 방편때문에 나온 변수 : 처리변수
miltuple5 <- NULL                           # ex) multiple3, multiple5
while ( i <= 1000 ){                        # 1-1000 까지 반복 : 1차 변수
  multiple3 <-  i %% 3                                                      #3의배수 판별   - 같이 판별해야함.
  multiple5 <-  i %% 5                                                      #5의배수 판별   따로 반별하면 3과5의 배수 중복카운트
  if ( multiple3 == 0 | multiple5 == 0 ){
    count <- count + 1                                                      #3의배수이거나 5의배수이면(공배수) 개수 세고
    cat ( i, " " )
    lineCount <- lineCount + 1
    if ( lineCount > 10 ){
      lineCount <- 1
      print( '\n' )
    }
  }
  i <- i+1
}
print( '\n' )
cat ( ' 1 ~ 1000사이의 3의 배수와 5의 배수의 개수: ', count, '\n' )



#2019.11.27 둘째날 작업완료
