install.packages(c("tm","wordcloud"))
library("tm")
library("wordcloud")
a1<-readLines("d:\\machine_r\\poem.txt")
msg1<-Corpus(VectorSource(a1))
msg1
inspect(msg1[3:7])
msg2<-tm_map(msg1,stripWhitespace)
msg2<-tm_map(msg2,removePunctuation)
msg2<-tm_map(msg2,tolower)
msg2<-tm_map(msg2,removeNumbers)
msg2<-tm_map(msg2,stemDocument)
#시각화작업결과 무의미한 단어들 제거할 필요성 발생
stop_words<-c(stopwords('english'),"the","and","was","this","than")
msg2<-tm_map(msg2,removeWords,stop_words)

msg3<-TermDocumentMatrix(msg2)
inspect(msg3)
class(msg3)
msg_result<-findFreqTerms(msg3,lowfreq=2)
class(msg_result)
#시각화를 위한 별도의 matrix
msg4<-as.matrix(msg3)
msg4
msg_result1<-sort(rowSums(msg4),decreasing=T)
#연관단어분석
findAssocs(msg3,'she',0.5)
wordcloud(names(msg_result1),freq=msg_result1,scale=c(4,0.5),rot.per=0.2,min.freq=2,
random.color=TRUE,colors=brewer.pal(9,'Set3'))