f_data<-c(2,1,1,1,1,3,3,2,2,2,1,1,3,3,3,2,2,1)
idx<-which.max(table(f_data))
table(f_data)[idx]

height<-c(165,177,178,180,172,175,166,168,175,168)
weight<-c(68,73,78,75,77,73,69,65,72,60)
plot(weight,height,main="키와 몸무게 분포",xlab="weight",ylab="height")


#범위,사분위편차분석
x<-c(27,37,45,37,18,38,46,50,35,15,38,52,53,37,26)
diff(range(x))
quantile(x)
summary(x)

#histogram
data<-read.csv("d:\\machine_r\\birthdie.csv",sep=",",header=T)
head(data,5)
hist(data$출생,main="출생자분포",col="yellow",breaks=8)

#boxplot
data1<-read.csv("d:\\machine_r\\sales_result.csv",sep=",",header=T)
head(data1,5)
summary(data1$AI드럼세탁기)
summary(data1$둥글청소기)
boxplot(data1$AI드럼세탁기,data1$둥글청소기,names=c("드럼세탁기","둥글청소기"),col=c("pink","gray"),main="판매실적비교")

#variation,std 
var(data1$AI드럼세탁기)
sd(data1$AI드럼세탁기)
sd(data1$둥글청소기)

#normal
x<-seq(-3,3,length=100)
y<-dnorm(x,mean=0,sd=1)
plot(x,y,type="l")
