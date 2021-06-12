install.packages("dplyr")
library(dplyr)
df<-read.csv("d:\\machine_r\\aasample.csv",header=T)
sample_n(df,5)
r1<-distinct(df)
r1
r2<-distinct(df,Index,.keep_all=TRUE)
r2

s1<-select(df,State,Y2013:Y2015)
s1
s2<-select(df,-contains('3'))
s2
#FILTER
f1<-filter(df,Index %in% c('A','D') & Y2015<1640000)
f1

f2<-filter(df,!Index %in% c('I','N'))
f2
#aggregate함수예
data<-read.csv("d:\\machine_r\\accdata2.csv",header=T)
head(data,5)
result<-aggregate(사상자수~발생년+요일,data,sum)
result
filter(result,사상자수>1200)
#summarise함수
summarise(df,avg_2014=mean(Y2014,na.rm=TRUE))
summarise_at(df,vars(Y2013:Y2015),mean,na.rm=TRUE)
summarise_at(df,vars(Y2013:Y2015),funs(mean,sd),na.rm=TRUE)

# why chain operation
a<-group_by(df,Index)
a
a1<-select(a,Y2014:Y2015)
a1
summarise_at(a1,vars(Y2014:Y2015),mean,na.rm=TRUE)

#chain operator sample
sample<-df %>% group_by(Index) %>% select(Y2014:Y2015) 
summarise_at(sample,vars(Y2014:Y2015),mean,na.rm=TRUE)

#mutate사용예
m1<-mutate(df,rank=min_rank(desc(Y2015)))
m1

m2<-mutate_at(df,vars(Y2014,Y2015),funs(rank=min_rank(desc(.))))
m2



