#제주관광지 현황 분석

#2019 12.13 송지영
#

#제주도내 관광유람선업 데이터
setwd('D:/TeamProject-R/teamproject1차/jejudo')
j.cruze <- read.csv( "관광유람선업_20190731.csv", header= T)
View(j.cruze)
library(dplyr)
library(ggplot2)

nrow(j.cruze)


#제주도내 외국인전용기념품샵 데이터
t.shop <- read.csv( "외국인전용기념품판매업_20190701.csv", header= T)
View(t.shop)


nrow(t.shop)
num<-  c(nrow(j.cruze), nrow(t.shop))
name <- c("관광유람선업", "외국인전용 기념품샵")

jeju<-data.frame(name,num)
jeju

library(ggplot2)
str(jeju)
ggplot(jeju, aes(x=name, y=num))+
  geom_bar( stat="identity", width = 0.9, fill = "green")+
  lims(y=c(0,150))+
  labs(x=" 업종별", y="사업체수 ")+
  ggtitle("제주도내 관광객 이용 업종별 수")+
  theme(element_rect( fill="white"), element_line(colour = "black"))
  

#제주도내 외국인전용기념품샵 데이터
t.convenience <- read.csv( "관광편의시설업_20181030.csv", header= T)
View(t.convenience)
class(t.convenience)
str(t.convenience)

t.jeju<- table( t.convenience[,"구분"]);t.jeju
colors <- rainbow(1:8)#레인보우컬러 어케하징?

barplot(t.jeju, main= "제주도내 관광편의시설 업종별 수", col= 2,
        xlab= "업종별", ylab= "사업체수",
        ylim=c(1,150))
abline( h = seq(0, 150, 50), col = "black", lty=3) 

#제주도내 유원시설업 데이터
t.entertainment <- read.csv( "유원시설업_20181030.csv", header= T)
View(t.entertainment)
str(t.entertainment)

e.jeju <- table(t.entertainment[,"구분"]);e.jeju
barplot( e.jeju, main = " 제주도내 유원시설업 업종별 수", col=4,
         xlab= "업종별", ylab="사업체수", ylim=c(1,150))
abline( h = seq(0, 150, 50), col="black", lty=3)
