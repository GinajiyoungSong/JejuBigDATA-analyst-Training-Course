# 12일차
#
#워드 클라우드(Word Cloud)
#

#Data Mining : 의사결정을 위해서 DB로부터 규칙과 패턴을 발견하는 기법
                               #  ↖ 정형화 Data


#   비정형 데이터 ↘               
#Text Mining : text data로부터 규칙과 패턴을 발견하는 기법
#                 자료처리과정과 자료 분석 과정
#                                --------------

# 자료 분석과정이 바로 ::::::: Word Cloud <- 단어빈도수
#
# 한글 워드클라우드 절차
#
# 1. java 실행환경 구축하기.
# 2. 자료수집 (Text)
#  2.1 text file 형태로 수집
#  2.2 web scraping 을 이용하여 수집
# 3. 명사 추출
# 4. 추출된 단어 ( 주로 명사 ) 에 대한 빈도수 계산 빛 시각화
# 5. word cloud 작성
# 6. 전처리 과정수행
#   6.1 불필요한 단어 삭제
#   6.2 생략된 단어를 사전에 등재


Sys.setenv( JAVA_HOME ='C:/Program Files/Java/jre1.8.0_231' )

# 필요시 설치
install.packages( "wordcloud")     #wordcloud
install.packages( "wordcloud2")    #wordcloud
install.packages( "KoNLP" )        #한국어처리
install.packages( "RColorBrewer")  #색상선택

library( wordcloud)
library( wordcloud2)
library( KoNLP)
library( RColorBrewer)


library( dplyr)
library( ggplot2)


setwd('D:/WorkR')
text <- readLines('mis_document.txt', encoding='UTF-8')
text

# text 파일 읽을때 메모장에 들어가서 공백1줄을 넣어야함. 공백없으면 R에서 load 시 오류생김
# readLines <- 한줄씩 읽어와라

# wordcloud : 문자만 불러와서 분석하기 위해서 (문장은 너무 장황해서 분석이 쉽지 않아)

buildDictionary( ext_dic ='woorimalsam') #사전로딩
pal2 <- brewer.pal( 8, 'Dark2')          #컬러를 어떻게 할지 지정해주는 함수
noun <- sapply( text ,extractNoun, USE.NAMES = F)
noun


# 4. 추출된 단어 ( 주로 명사 ) 에 대한 빈도수 계산 빛 시각화
noun2 <- unlist( noun ) #list -> vector로 변환
wordcount <- table( noun2 )
sort.noun <- sort( wordcount, decreasing = T)[ 1:10 ]
sort.noun
sort.noun <- sort.noun[ -1 ]                      # 의미없는 공백 41개 [-1] 제거
barplot( sort.noun, names.arg = names (sort.noun ),
         col = 'steelblue', main = '빈도수 높은 단어',
         ylab= '단어 빈도수')






df <- as.data.frame(sort.noun)
df
str( df )
ggplot( df, aes( x= df$noun2, y= df$Freq)) +
  geom_bar( stat= 'identity',
            width = 0.7,
            fill= 'steelblue') +
  ggtitle( '빈도수 높은 단어' ) +
  theme( plot.title = element_text( size = 25, face = 'bold', colour = 'steelblue',
                                    hjust = 0, vjust = 1) ) +
  labs ( x= '명사' , y = '단어빈도수' ) +
  geom_text( aes( label =df$Freq ), hjust = -0.3) +          #빈도표시
  coord_flip()
  


# 5. word cloud 작성
pal3 <- brewer.pal( 9, 'Purples') [5:9]   #시각화 도구의 컬러를 내가 지정
brewer.pal.info
# brewer.pal 색상표 참고
# https://m.blog.naver.com/PostView.nhn?blogId=hsj2864&logNo=220978821195&proxyReferer=https%3A%2F%2Fwww.google.com%2F

wordcloud( names( wordcount),           #단어 
           freq = wordcount,            #단어 빈도
           scale = c( 6, 0.7 ),         #단어 폰트크기 (최대,최소)
           min.freq = 3,                #단어 최소빈도
           random.order = F,            #단어 출력 위치
           rot.per = .1,                #90도 회전단어비율
           colors = pal3 )               #단어 색


# 6. 전처리 과정수행
#   6.1 불필요한 단어 삭제
#   6.2 생략된 단어를 사전에 등재

buildDictionary( ext_dic ='woorimalsam',
                 user_dic = data.frame( '정치', 'ncn'),
                 replace_usr_dic = T )
noun <- sapply( text, extractNoun, USE.NAMES = F )
noun2 <- unlist( noun )

# 6.1 불필요한 단어 삭제
noun2 <- noun2[ nchar ( noun2) > 1 ] #한글자 의미없는 단어 빼기
noun2 <- gsub( '하지', ' ', noun2 )  #조사 제외
noun2 <- gsub( '때문', ' ', noun2 )  #조사 제외
wordcount <- table ( noun2 )

# 7. wordcloud 작성
wordcloud( names( wordcount),           #단어 
           freq = wordcount,            #단어 빈도
           scale = c( 6, 0.7 ),         #단어 폰트크기 (최대,최소)
           min.freq = 3,                #단어 최소빈도
           random.order = F,            #단어 출력 위치
           rot.per = .1,                #90도 회전단어비율
           colors = pal2 )               #단어 색


#참고자료
#https://jjeongil.tistory.com/355


#
# 애국가 형태소 분석
#
library(KoNLP)
useSystemDic()
useSejongDic()
useNIADic()
#
# 1 .사전설정
useSejongDic()

# 2. 텍스트 데이터 가져오기
word_data <- readLines( '애국가(가사).txt')
word_data

# 3. 명사 추출
word_data2 <- sapply( word_data, extractNoun, USE.NAMES = F )
word_data2

# 명사추출 하더라도 제대로 추출안될수 있다 <- 사전에 추가로 단어등록을 해야한다

#. 3.1 제대로 추출하지 않은 단어를 사용자 사전에 등록
add_words <- c('백두산', '남산', '철갑', '가을', '하늘', '달', '삼천리')
buildDictionary( user_dic = data.frame( add_words ,
                                        rep('ncn', length(add_words ) ) ),
                 replace_usr_dic = T )
get_dictionary('user_dic')

# 3.2 단어 추가 후 다시 명사 추출            
word_data2 <- sapply( word_data, extractNoun, USE.NAMES = F )
word_data2


# 4. 행렬을 벡터로 변환
undata <- unlist( word_data2 )
undata

# 5. 사용 빈도 확인
word_table <- table( undata )
word_table

# 6. 필터링: 두글자 이상 단어만 선별, 공백이나 한자리문자 제외시키기.
undata2 <- undata[ nchar(undata) >= 2 ]
undata2 
word_table2 <-  table( undata2 )
word_table2

# 7. 데이터 정렬
sort( word_table2, decreasing = T )

# 애국가 형태 분석 완료
# 가장 기본적인 전처리만 수행, 100 % 정확한 데이터라 볼 수 없음



# 8. word cloud 작성 후 분석
library(wordcloud2)
wordcloud2( word_table2 )

# 8.1 배경 및 색상 변경
wordcloud2( word_table2 ,
            color = 'random-light',
            backgroundColor = 'black')

# 8.2 모양 변경
wordcloud2( word_table2 ,
            fontFamily = '맑은 고딕', size =1.2,
            color = 'random-light', backgroundColor = 'black',
            shape = 'star')


# 8.3 선택 색상 반복
wordcloud2( word_table2, size = 1.6,
            color = rep_len( c('red', 'blue'), nrow( word_table2 )))
wordcloud2( demoFreq, size =1.6,
            color = rep_len( c('red', 'blue'), nrow( word_table2 )))

# 8.4 일정 방향 정렬
wordcloud2( word_table2,
            minRotation = pi /20,   #시계반대방향 / 왼쪽기준
            maxRotation = pi /20,
            rotateRatio = 1 )

wordcloud2( demoFreq,
            minRotation = -pi /3,
            maxRotation = -pi /3,
            rotateRatio = 1 )
