Sys.setenv(JAVA_HOME="c:\\program files\\java\\jdk1.8.0_141")
install.packages(c("dplyr","KoNLP"))
library(dplyr)
library(KoNLP)
install.packages("twitteR")
library(twitteR)
api_key <-"fxd8VtG22tTN25KvQLiF5DjfE"
api_secret<-"nAhcVYDk4aGvlD5W4Hr5GizSsbKEafy2LmiUJ0PYbxpufTh6xY"
access_token<-"257325922-KAH1GdOi2Z4jwDRGDIgkvO24eJN3MwymrZ3gYoJH"
access_token_secret<-"P8ap67uUllyXc45A10PwSRhdzcaMpbAxBNDsT8ujBA7e4"
setup_twitter_oauth(api_key,api_secret,access_token,access_token_secret)
msg_tweet<-searchTwitter(enc2utf8("새해"),n=1200,lang="ko")
head(msg_tweet)
class(msg_tweet)
length(msg_tweet)
#데이터프레임으로 구조 변환
df<-twListToDF(msg_tweet)
class(df)
head(df,20)
df1<-distinct(df,text)
txt<-df1$text
txt
#특수문자,RT,URL,무의미한 단어 추출하는 작업
txt1<-gsub('RT','',txt)
txt1<-gsub('https.* *','',txt1)
txt1<-gsub('@[[:graph:]]*','',txt1)
txt1<-gsub('[\t\r\n]+','',txt1)
txt1<-gsub('[[:punct:]]+','',txt1)
txt1<-gsub('[A-Za-z]+','',txt1)
txt1<-gsub('\\d+','',txt1)
txt1<-gsub('[ㅏㅑㅓㅕㅗㅛㅜㅠㅇㅋㅍㅎ]*','',txt1)
head(txt1,10)
#명사형단어 추출
txt_word<-sapply(txt1,extractNoun,USE.NAMES=F)
txt_word
txt_data<-unlist(txt_word)
txt_data
txt_r<-Filter(function(x) {nchar(x)>=2},txt_data)
head(txt_r,20)
# 빈도수 계산
txt_r<-table(txt_r)
head(txt_r,5)
class(txt_r)
a<-head(sort(txt_r,decreasing=T),40)
a
a1<-head(sort(txt_r,decreasing=T),10)
#빈도에 대한 시각화 작업
install.packages(c("wordcloud","RColorBrewer"))
library(wordcloud)
library(RColorBrewer)
choice_pal<-brewer.pal(8,"Dark2")
wordcloud(names(a),freq=a,scale=c(7,1),rot.per=0.2,colors=choice_pal,random.order=FALSE,random.color=TRUE)
visual_a<-barplot(a1,main="핫 키워드10",col=rainbow(10),ylim=c(0,300))
visual_a







