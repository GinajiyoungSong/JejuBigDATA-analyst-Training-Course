setwd("d:\\machine_r")
source1<-read.csv("point_satisfy.csv",header=TRUE)
head(source1,5)
b<-table(source1)
b
a<-table(source1$연령대,source1$포인트만족도)
a
mosaicplot(a)