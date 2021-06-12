#지역별 교통사상자수합계
setwd("d:\\machine_r")
source1<-read.csv("accdata2.csv",header=T)
head(source1,5)
table(source1$발생지시도)
totinfo<-tapply(source1$사상자수,source1$발생지시도,sum)
class(totinfo)
df<-data.frame(지역=names(totinfo),사상자총계=totinfo)
df
df<-df[order(df$사상자총계,decreasing=TRUE),]
vcol1<-as.vector(df[,1])
vcol1
vcol2<-as.vector(df[,2])
vcol2
barplot(vcol2,beside=T,names=vcol1,col=rainbow(length(vcol1)),ylim=c(0,5000),main="지역별 교통사고사상자 분석")

#지역별 주간/야간 교통사상자수 합계
tot2<-tapply(source1$사상자수,list(source1$발생지시도,factor(source1$주야,level=c("주간","야간"))),sum)
tot2
class(tot2)
a<-data.frame(tot2)
class(a)
install.packages("data.table")
library(data.table)
t_1<-transpose(a)
rownames(t_1)<-colnames(a)
colnames(t_1)<-rownames(a)
t_1
t_2<-rbind(t_1,total=colSums(t_1))
t_2
barplot(as.matrix(t_1[,]),beside=T,col=c("pink","darkblue"),main="지역별 주간/야간 교통사상사고 통계",
legend=c("주간사상자수","야간사상자수"))
axis(2,seq(0,3000,500))