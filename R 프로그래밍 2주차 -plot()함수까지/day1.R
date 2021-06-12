#
# R 프로그래밍 1일차
#
# first.R
#
# 작성자 : GinaJiyoungSong
#
# 최초작성일 : 2019.11.26
#
#
print ("hello, world!!!")

number <- 10 ; number
number2 <- 100
number <- 10

number3 <- number
number3

numberValue <- 1             # camel 표기법 - 대문자로 써서
str_value <- "R Language"    # snake  표기법 - 아래바를 써서
booleanvalue <- TRUE         # 일반적으로 변수명은 소문자로 쓰는게 좋다

numberValue <- "R script"; numberValue
numberValue <- 1

print(numberValue)
print(str_value)
print(booleanvalue)


cat("Numeric number : ", numberValue, "\t")   #cat() 출력:읽기
cat("Numeric number :",numberValue,"\n" )
cat("String :", str_value, "\n" )
cat("booleanvalue :", booleanvalue, "\n")

cat("Numeric number : ", numberValue, "\n")   # "\n" 줄바꿈
cat("Numeric number : ", numberValue, "\n \n")  # "\n \n " 엔터두번

numberValue <- scan() #scan() 함수는 읽어와라.명령


is.numeric(number)  # : 숫자형인지 자료 확인
is.logical(booleanvalue)  # : 논리형인지 **
is.logical(numberValue)

number1 <- 10 
number2 <- 20



#연산 = 산술

Add <- number1 + number2 ;Add    
Sub <- number1 - number2
Mul <- number1 * number2
Div <- number1 / number2
Rem <- number2 %% number1
Sec <- number2 ** 5

print( Add )   #print()함수는 출력기능 : 읽기명령
print( Sub )
print( Mul )
print( Div )
print( Rem )
print( Sec )



#산술연산: 사칙연산시 = 결과는 숫자형

number1 <- 10                     #  누적시 = 초기값 설정 필수!
number1 <- number1 + 10
number1
number1 <- number1 + 10   #같은수 + 10 = 누적
number1
number1 <- number1 + 10; number1


number2 <- 100
number1 <- number2 + 10   #다른수 + 10 = 치환
number1
number2


print( number1 + 10 * number2 / 2 )


#관계 연산 기능시 = 결과는 논리형으로 나온다.

number1 <- 10.5
number2 <- 10
print( number1 > number2 )
print( number1 >= number2 )
print( number1 < number2 )
print( number1 <= number2 )
print( number1 == number2 )
print( number1 != number2 )



#논리연산 : 또는OR 그리고& = 결과는 논리형

print( number1 > 10 & number2 > 10 )    # & : AND
print( number1 > 10 | number2 > 10 )    # | : OR
print( ! (number1 > 10 ))               # ! : NOT


number <- 100           #숫자형
str <- "R Language"     #문자형
result = number + str   #숫자형 + 문자형
print( result )         #결과는 에러. 연산이 안됨.



number <- "100"         #문자형
str <- "Ｒanguage"     #문자형
result = number + str   #숫자형 + 문자형
print( result )         #결과는 에러, 문자형끼리 연산이 안됨.
                        #R 에서는 무조건 숫자형만 연산이 됨.



#첫날 배운내용 습득완료

