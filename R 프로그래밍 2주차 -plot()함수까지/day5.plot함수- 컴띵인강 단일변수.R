# 그래프 기본
plot.new()
age<-c(24,36,40,42,27,35,55,48)
plot(age, main = "나이분포", ylab="나이", col="red")

# 산점도 그릴때
height<-c(165,170,177,167,180,172,169,179)
weight<-c(70,73,62,80,85,74,75,68)
plot(weight,height,main="키와 몸무게 분포",xlab="체중",ylab="키",
     col=rainbow(length(height)))

#
plot.new()
x<-1:5
y<-x
par(mfrow=c(2,3))

#점 디자인 pch = 숫자로 지정
#선 디자인 type= 알파벳으로 지정
par(pch=18)
kind=c('p','b','l','o','s','h')
for (i in 1:length(kind)) {
title <- paste("type",kind[i])
plot(x,y, type = kind[i], main = title)
}

#cex 점의 크기
plot(x,y, cex=3)

lines( c(1,3), c(4,4), lwd=3, col="green")
#lines( x범위 , y범위 , lwd=선두께) 선 추가 가능

plot.new()
par(mfrow=c(1,1))
x<-1:5
y<-x
plot(x,y,main="sample")
abline(h=c(1:5), v=3, col="red",lty="dotted")
#abline()함수 
#     (h=수평선, v=수직선)
text(3,3,"중심")


plot.new()
height<-c(165,170,177,167,180,172,169,179)
weight<-c(70,73,62,80,85,74,75,68)
irum<-c('김', '박', '최', '신', '정', '문', '오', '추')
plot(weight, height, main="키와 몸무게 분포",
     type='p', pch=18, 
     xlab="몸무게",ylab="키",
     col=rainbow(length(height)))

abline(h=seq(165,180,5),col="gray",lty=2)
# h수평선 165부터 180까지 5간격으로 seq()함수에 넣어서 지정
text(73,174,"평균",col="brown")

axis(2,at=height,labels=height,col.axis="gray")
# axis ()를 통해서 내가 표시한 점의 y값. 키를 모두 표시함

legend("bottomright",col=rainbow(length(height)),legend=irum,lty=1)
# 범례지정


