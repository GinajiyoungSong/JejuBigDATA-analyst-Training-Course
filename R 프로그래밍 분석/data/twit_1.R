install.packages(c("twitteR","dplyr"))
library(twitteR)
library(dplyr)
Sys.setenv(JAVA_HOME="c:\\program files\\java\\jdk1.8.0_141")
install.packages("KoNLP")
library(KoNLP)
api_key <-"fxd8VtG22tTN25KvQLiF5DjfE"
api_secret <-"nAhcVYDk4aGvlD5W4Hr5GizSsbKEafy2LmiUJ0PYbxpufTh6xY"
access_token <-"257325922-KAH1GdOi2Z4jwDRGDIgkvO24eJN3MwymrZ3gYoJH"
access_token_secret <-"P8ap67uUllyXc45A10PwSRhdzcaMpbAxBNDsT8ujBA7e4"
setup_twitter_oauth(api_key,api_secret,access_token,access_token_secret)
msg_tweet<-searchTwitter(enc2utf8("새해"),n=1000,lang="ko")
head(msg_tweet)
class(msg_tweet)
length(msg_tweet)
#데이터프레임으로 구조변환
df<-twListToDF(msg_tweet)
class(df)
df1<-distinct(df,text)
txt<-df1$text
txt
#특수기호 트윗태그 url제거하는 작업
txt1<-gsub('RT','',txt)
txt1<-gsub('https.* *','',txt1)
txt1<-gsub('@[[:graph:]]*','',txt1)
txt1<-gsub('[\t\r\n]+','',txt1)
txt1<-gsub('[[:punct:]]+','',txt1)
txt1<-gsub('[A-Za-z]+','',txt1)
txt1<-gsub('\\d+','',txt1)
txt1<-gsub('[ㅏㅑㅜㅠㅗㅛㅋㅍ]*','',txt1)
head(txt1,10)
#명사형단어 추출작업
txt_word<-sapply(txt1,extractNoun,USE.NAMES=F)
txt_data<-unlist(txt_word)
txt_data
txt_r<-Filter(function(x){nchar(x)>=2},txt_data)
head(txt_r,20)
txt_r<-table(txt_r)
class(txt_r)
head(sort(txt_r,decreasing=T),30)
#시각화
install.packages(c("wordcloud","RColorBrewer"))
library(wordcloud)
library(RColorBrewer)
choice_pal<-brewer.pal(8,'Dark2')
wordcloud(names(txt_r),freq=txt_r,scale=c(7,1),rot.per=0.2,min.freq=2,colors=choice_pal)