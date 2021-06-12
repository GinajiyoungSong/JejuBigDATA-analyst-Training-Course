# 제주도내 관광 교통수단 현황
#

setwd('D:/TeamProject-R/teamproject2차/data')
jeju.trans<- read.csv('18년 교통관광산업 현황.csv', header=T, stringsAsFactor=F)
str(jeju.trans)

# 기존에 만든 시각화 데이터 말고
# ggplot 하기 위해서 데이터 프레임 만들기

# R 에서 데이터안에 들어있는 문자열은 기본적으로 factor 로 취급됨
# 문자형으로 데이터 가져오기 위해서  stringsAsFactor=F
head(jeju.trans) #원하는 데이터를 가져왔는데 년도별 col 이라서 #행으로 년도별 치환
head(jeju.trans)

j.t <- data.frame(jeju.trans[,2:6])
j.t
names(j.t) <- c(2014:2018)
rownames(j.t) <- c('전체',' 버스','택시업체','개인택시','전세버스','렌터카')
name <- rownames(j.t);name
j.t

str(j.t)
library(ggplot2)

ggplot(j.t, aes(x=name))+
  scale_x_discrete(limits=c('전체',' 택시','버스','전세버스','렌터카'))

# 내가 원하는 순서가 한글순서가 아님, 내가 원하는 배열순서 지정
# 이제 내가 원하는 데이터 프레임을 만들어야 하므로 
#                  택시업체 + 개인택시 를 합해서 '택시' 행 추가해야함
  
#새로운 행을 만들기 위해 mutate 해서 택시합계를 만들것
#그후 3행을 합계로 치환후 4행은 제거할 예정

j.t %>% mutate(j.t, sum=paste0())
















#t() 함수 이용
jeju.t <- t(jeju.trans)
jeju.t
str(jeju.t) # list 함수로 바뀜 <- 데이터프레임으로 바꿔서 시각화 하기

jeju.df <- data.frame(jeju.t);jeju.df
names(jeju.df) <- c("전체", "버스(시내,외,농어촌)",
                   "업체택시 ", "개인택시", "전세버스" ,"렌터카")
jeju.df
jeju.df <- jeju.df[2:6, ]



# 이 과정이 너무 긴데...
# 처음에 데이터를 일단 행렬 변환 시켜준뒤 해보자.

jeju.tr <- t(jeju.trans[, 2:6]);jeju.tr
str(jeju.tr)
jeju.tr<- data.frame(jeju.tr);jeju.tr
str(jeju.tr)
rownames(jeju.tr)       
names(jeju.tr) <- c("전체", "버스",
                   "업체택시 ", "개인택시", "전세버스" ,"렌터카")

jeju.tr

library(ggplot2)
x <- 2014:2018
ggplot(jeju.tr, aes(x, 전체))+
  geom_bar(stat="identity", fill=rainbow(5)) +
  ggtitle( "제주의 관광 교통수단별 차량 등록대수") +
  theme( plot.title = element_text( size = 25, face = "bold")) +
  labs( x= "년도", y ="차량 등록대수")

#제주 관광교통수단 총 대수 그래프 
# 각 수단별 

jeju.bus <- jeju.tr$버스
jeju.bus

jeju.taxi <- jeju.tr$업체택시  +jeju.tr$개인택시
jeju.taxi

jeju.trbus <- jeju.tr$전세버스
jeju.trbus

jeju.rentcar <- jeju.tr$렌터카
jeju.rentcar

x <- 2014:2018

#plot 함수
par(mfrow=c(2,2))
plot(x, jeju.bus, type="b", cex=2, pch=15, fg="blue", lty="dashed", ylim=c(0,2000), 
     main="버스(시내,외,농어촌)")

plot(x, y=jeju.taxi, type="b", cex=2,  pch=15, fg="red", lty="dashed", ylim=c(5000,7000), 
     main=" 개인택시 + 업체택시")
plot(x ,jeju.trbus,  type="b", cex=2,  pch=15,  fg="darkgreen", lty="dashed", ylim=c(2000,4000),
     main="관광전세버스")
plot(x ,jeju.rentcar,  type="b", cex=2, pch=15, fg="pink", lty="dashed", ylim=c(20000,40000),
     main="렌트카의 수")




par(mfrow=c(1,1))

barplot(x, jeju.bus, xlab = "년도", ylab ="시내,외 +농어촌 버스 대수", 
        col="red" )
barplot(x, jeju.taxi, xlab = "년도", ylab ="개인택시 + 업체택시 수", 
        col="red")
barplot(x ,jeju.trbus, xlab = "년도", ylab ="전세버스 대수",  
        col="red")
barplot(x ,jeju.rentcar, xlab = "년도", ylab ="렌트카 수", 
        col="red")


y <- c("버스", "업체택시 ", "개인택시", "전세버스" ,"렌터카")