#
# 7일차
# 데이터 정제하기
#
# 결측치 처리
#
# vector의 결측치처리

z <- c( 1, 2, 3, NA, 5, NA, 8 )
sum( z )                # 결측치가 있어 값이 안나옴
is.na( z )              #is 함수는 논리형 - is.na : NA 논리형이 있냐없냐
sum( is.na( z ) )       # sum함수에 논리형을 넣으면 갯수 확인
sum( z, na.rm = T )          #na.remove 이라는 인수 = True를 넣으면 NA 결측치 무시하고 함수 실행해라


# 결측치 대체 및 제거

z1 <- z
z1[ is.na( z1 ) ] <- 0              ;z1

#단순대입법   is.na( z1 ) 안쪽함수 먼저 # 결측치 호출 z1 [ ] <- 0 0으로 치환



# listwise delection  # na.omit( z2 ) : z2 안에 결측치 삭제  
z2 <- c( 5, 8, 1, NA, 3, NA, 7 )
z3 <- as.vector( na.omit( z2 ) ); z3                         
















# Matrix / Data.frame 결측치 처리
x <- iris
x[ 1, 2 ] <- NA
x[ 1, 3 ] <- NA
x[ 2, 3 ] <- NA
x[ 3, 4 ] <- NA
head( x )


# Matrix / Data.frame  열별 결측치 확인
# for문 이용
#is.na 함수로 결측치 있는 함수 호출 - this.na 라는 벡터 만듬
#sum ( 논리형 ) 함수 : 갯수 확인함수 : 몇개의 결측치 있는지 확인

for (i in 1:ncol( x ) ) {
  this.na <- is.na( x [ , i ] )      
  cat( colnames( x )[ i ], "\t", 
       sum( this.na ), "\n" )        
}


# apply( ) 함수 이용
#col_na 란 사용자정의 함수 생성

col_na <- function( y ){
  return( sum( is.na( y ) ) )      
}

na_count <- apply( x , 2, col_na );   
na_count



na_count <- apply( x, 2,                             # 사용자 정의 함수 안만들고 익명함수 직접 사용하겠면
                   function( y) sum( is.na( y) ) )   # apply( data.frame,  행/렬 , 함수자체 )
na_count          #----------------------------#  익명함수라 함
                  #   LAMDA식 표기법           #



barplot( na_count[ na_count > 0 ] )





install.packages( "VIM" )
require( VIM )                                #library() 메모리에 로드 하는 함수 : 같은 역활


# 결측치 자료 조합 확인용 시각화 도구        
aggr ( x, prop = FALSE, numbers = TRUE )                     # 이제껏 열에 있는 결측치확인

# 두 개의 변수간의 결측치 관계 확인 시각화 도구
marginplot( x[c("Sepal.Width","Petal.Width" )], peh=20,
              col = c("darkgrey", "red", "blue") )              # 이건 질문

marginplot( x[c("Sepal.Width","Sepal.Length" )], peh=20,
            col = c("darkgrey", "red", "blue") )    














# is.na() #p44

# Matrix, Data.frame의 행(Data)별 결측치 확인
rowSums( is.na( x ))                                       #rowSum() 함수를 이용: x행에 결측치 몇개?
sum( rowSums( is.na( x ) > 0 ) )                           #sum 함수 : 전체중에 결측치 몇개?

sum( is.na( x ) )




# 결측치를 제외한 새로운 데이터셋 생성
head( x )
x[ !complete.cases( x ), ]                     # ! (NA가 포함된 행) 출력

y <- x[ complete.cases( x ), ]                 #NA가 포함된 행 제외하고 출력해서 y에 넣어라
head( y )                                      # listwise deletion  방법













################################################

#특이값, 이상치 정제하기

st <- data.frame( state.x77 );st
summary( st$Income )
boxplot( st$Income )                   #boxplot 을 그리면 이상치 표시
boxplot.stats( st$Income )$out         #boxplot.stats( )$out 이상치 출력      

# 특이값 처리 : NA로 변환후 결측치 처리방법 이용하기

out.val <- boxplot.stats( st$Income )$out  
st$Income[ st$Income %in% out.val ] <- NA        #%in% : 연산자 : 포함되어있다는
                                                #out.val 이라는 (이상치)있는 st$Income 의 인덱스 <-  NA 처리

#   이상치를 결측치로 바꿔서 이제  이상치 없음/ 결측치만 있는 데이터로 만듦
#   이상치 역시 결측치 정제방법을 이용한다
head( st )

newdata <- st[ complete.cases( st ), ]              ## listwise deletion  방법
head( newdata )
boxplot( st$Income )     


