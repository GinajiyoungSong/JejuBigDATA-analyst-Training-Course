#* 실습 결과를 R Script file로 제출
#* R Script file 이름은 "영문본인이름_제출일날짜.R" 부여하여 제출
#* R Script file의 처음에 주석으로 본인 이름과 작성일/제출일 기록

#문1)
#	20대 국회 개원 여·야 3당 대표 국회연설문에 대해 각각 워드클라우드를 작성하시오.
#	예제소스 파일은 ‘ex_10-1.txt’, ‘ex_10-2.txt’, ‘ex_10-3.txt’이다.

Sys.setenv( JAVA_HOME ='C:/Program Files/Java/jre1.8.0_231' )

library( wordcloud )
library( wordcloud2 )
library( KoNLP )
library( RColorBrewer )

setwd('D:/WorkR/Exam')
text1 <- readLines('ex_10-1.txt', encoding = 'UTF-8')
text2 <- readLines('ex_10-2.txt', encoding = 'UTF-8')
text3 <- readLines('ex_10-3.txt', encoding = 'UTF-8')

text1 ; View(text1)
text2	
text3


buildDictionary( ext_dic = 'woorimalsam' )
brewer.pal.info
pal1 <- brewer.pal(8, 'Set2')

noun1 <- sapply( text1, extractNoun, USE.NAMES = F )
noun1

noun.chu <- unlist(noun1)
wordcount1 <- table(noun.chu)
wordcount1
sort.noun1 <- sort( wordcount1, decreasing = T)[1:20]
sort.noun1

sort.noun1 <- sort.noun1[-1]
sort.noun1

noun.chu
count1 <- noun.chu[ nchar(noun.chu)>=2 ]
count1

count1 <- table(count1)
count1

sort.noun1 <- sort( count1, decreasing = T)[1:20]
sort.noun1

chu <- as.data.frame(sort.noun1)
chu
library(ggplot2)

ggplot( chu, aes( x=chu$count1, y=chu$Freq) ) +
  geom_bar( stat = 'identity', width = 0.7, fill='violet') +
  ggtitle( '추미애 연설문 중에 빈도수 높은 단어') +
  theme( plot.title = element_text( size = 25, face = 'bold', colour = 'violet',
                                    hjust = 0, vjust = 1 ) )+
  labs( x='명사', y='단어빈도수') +
  geom_text(aes( label = chu$count1), hjust= -0.3)

wordcloud( names(count1), freq = count1,
           scale = c(13, 0.7), min.freq = 10, random.order = F,
           rot.per = .5, colors = pal1)



View(text2)
noun2 <- sapply(text2, extractNoun, USE.NAMES = F)
noun2

noun.lee <- unlist(noun2)
wordcount2 <- table(noun.lee)
wordcount2
sort.noun2 <- sort( wordcount2, decreasing = T )[1:20]
sort.noun2

sort.noun2 <- sort.noun2[-1]
sort.noun2

lee <- as.data.frame(sort.noun2)
lee

#역시나 불필요한 단어 삭제해야함
noun.lee <- noun.lee[ nchar( noun.lee) > 1 ]
noun.lee
wordcount2 <- table(noun.lee)
wordcount2

sort.noun2 <- sort( wordcount2, decreasing = T )[1:20]
sort.noun2


lee <- as.data.frame(sort.noun2)
lee

pal2 <- brewer.pal(9, 'Reds')[3:9]
wordcloud( names(wordcount2), freq = wordcount2,
           scale = c(5, 1), min.freq = 10, random.order = T,
           rot.per = .2, colors =pal2 )



View(text3)
noun3 <- sapply(text3, extractNoun, USE.NAMES = F )
noun3

noun.park <- unlist(noun3)
wordcount3 <- table(noun.park)
wordcount3

sort.noun3 <- sort( wordcount3, decreasing = T)[1:15]
sort.noun3

sort.noun3 <- sort.noun3[-1]
sort.noun3

noun.park <- noun.park[ nchar( noun.park) >1 ]
noun.park
wordcount3 <- table(noun.park)
wordcount3

sort.noun3 <- sort( wordcount3, decreasing = T)[1:15]
sort.noun3

sort.noun3 <- sort.noun3[-1]
sort.noun3

park <- as.data.frame(sort.noun3)
park

brewer.pal.info
pal3 <-brewer.pal(9, 'OrRd')[3:9] 
wordcloud( names(wordcount3), freq = wordcount3,
           scale = c(12, 1), min.freq = 10, random.order = F,
           rot.per = .2, colors =pal3 )

#문2)
#	스티브 잡스의 스탠포드 대학 졸업식 연설문에 대해 워드클라우드를 작성하시오.
#	Tip. 예제소스 파일은 ‘ex_10-4.txt’이다.


steave <- readLines( 'ex_10-4.txt', encoding = 'UTF-8')
steave

steave.noun <- sapply( steave, extractNoun, USE.NAMES = F )
steave.noun

undata <- unlist( steave.noun)
undata

undata2 <- undata[ nchar(undata)>=2 ]
undata2


word_table <- table(undata2)
sort( word_table, decreasing = T) [1:30]


undata2 <- gsub('하지', ' ', undata2)
undata2 <- gsub('가지', ' ', undata2)
undata2 <- gsub('들이', ' ', undata2)
undata2 <- gsub('점들', ' ', undata2)
undata2 <- gsub('10', ' ', undata2)

st.table <- table(undata2)
st.table

st.table <- sort( st.table, decreasing = T) [1:35]
st.table
st.table <- st.table[-1]
st.table

wordcloud(names(st.table), freq = st.table, scale = c(6, 0.7), min.freq = 4,
          random.order = F, rot.per = .1 , colors = pal2)


#문3) 
#	오바마 대통령의 데통령 당선 연설문에 대해 워드클라우드를 작성하시오
#	Tip. 예제소스 파일은 ‘ex_10-5.txt’이다.

obama <- readLines('ex_10-5.txt', encoding = 'UTF-8')
obama

brewer.pal.info
pal4 <- brewer.pal(11, 'BrBG')[5:11]

obama.noun <- sapply(obama, extractNoun, USE.NAMES = F)
obama.noun
obama.noun <- unlist(obama.noun)


obama.n <- obama.noun[ nchar( obama.noun)>1]
obama.n


obama.t <- table(obama.n)
obama.t
sort.o <- sort(obama.t, decreasing = T)[1:30]
sort.o


# 불필요한 단어 삭제
obama.n <- gsub('때문', ' ', obama.n)
obama.n <- gsub('미국은', ' ', obama.n)
obama.n <- gsub('들이', ' ', obama.n)

obama.n

ob.table <- table(obama.n)
ob.table

sort(ob.table, decreasing = T)

sort.o <- sort(ob.table, decreasing = T)[1:30]
sort.o

obama <- sort.o[-2]
obama




wordcloud( names(obama), freq = obama,
           scale = c(5, 0.5), min.freq = 5,
           random.order = F, rot.per = .2, colors = pal1)
