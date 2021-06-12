#apply-1
height<-c(177,180,167,165,170,NA)
weight<-c(NA,77.3,80,60,NA,64)
df<-data.frame(신장=height,체중=weight)
names(df)<-c("신장","체중")
df
apply(df,2,mean,na.rm=TRUE)
lapply(df,max,na.rm=TRUE)
sapply(df,max,na.rm=TRUE)
#tapply활용
dflist<-read.table("d:\\r1\\passlist.txt", header=TRUE)
dflist
tapply(dflist$나이,dflist$성별,mean,simplify=FALSE)

#사용자정의함수-1
guideinfo<-function(msg){
writeLines(msg)
}
guideinfo("나도 배운다")
guideinfo("r을 배워요^^")
#사용자정의함수-2
basicst<-function(x){
amin<-min(x)
amax<-max(x)
amean<-mean(x)
avar<-var(x)
astd<-sd(x)
totinfo<-list(최소값=amin,최대값=amax,평균=amean,분산=avar,표준편차=astd)
return(totinfo)
}
a<-c(68,75,80,85,45,70,95,55)
basicst(a)
b<-c(66,75,35,55)
basicst(b)

#사용자정의함수-3
source("d:\\r1\\calc.txt")
a<-c(35,77,155,50,67)
calc(a)
