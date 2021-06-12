#scan사용
setwd("d:\\r1")
a<-scan("irum.txt",what='char',sep=",")
a

x<-scan()

#readLines함수
data<-readLines("consumer.txt")
data
#read.csv함수
data<-read.csv('seoulpopulation.csv',header=TRUE)
data
#XLConnect패키지
install.packages("XLConnect")
require(XLConnect)
wb<-loadWorkbook("subway.xlsx")
df<-readWorksheet(wb,sheet=1,header=TRUE,startRow=20,endRow=47)
df
names(df)<-c("구분","역이름","1월이용자","2월이용자","3월이용자","합","1일평균")
df

#XLSX패키지 
install.packages("xlsx")
require(xlsx)
df2<-read.xlsx2("subway.xlsx",1)
df2

#clipboard
a<-readClipboard()
a



