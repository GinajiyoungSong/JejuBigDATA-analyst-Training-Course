#단순if예문
a<-5
if(a%%2==0){
  result<-"짝수"
  result
}else{
   result<-"홀수"
   result
}
# 논리연산자 이용한 if예문
a<-75
if(a%%3==0 && a%%5==0){
result<-"3의 배수이면서 5의 배수"
}else if(a%%3==0){ 
result<-"3의 배수"
}else if(a%%5==0){
result<-"5의 배수"
}
result
# ifelse 이용하여 벡터객체 일괄비교 분석 후 프레임으로 결과 표시예
a<-c(10,13,7,8,100)
result<-c(ifelse(a%%2==0,"짝수","홀수"))
df<-data.frame(a,result)
df

#ifelse 응용예문
a<-c(10,13,22,15,9)
result<-ifelse(a>mean(a),"평균초과",ifelse(a<mean(a),"평균미달","평균값"))
df2<-data.frame(a,result)
df2

a<-c(4,25,8,33,17,20)
evensum<-0
for(x in 1:length(a)){
  if(a[x]%%2==0) evensum<-evensum+a[x]
}
evensum


#구구단
gugudan<-matrix(0,nrow=9,ncol=9)
for(i in 1:9){
  for(j in 1:9) {
   gugudan[i,j]<-i*j
}
}
gugudan

#while -1
i<-1
isum<-0
while(i<=10){
isum<-isum+i
i<-i+1
}
isum

#while-2
i<-1
isum<-0
while(TRUE) {
isum<-isum+i
cat("1부터",i,"까지 합=",isum,"\n")
if(isum>500) break
i<-i+1
}
#repeat
a<-c(23,15,17,33,45)
i<-1
repeat{
if(a[i]<mean(a)) break
i<-i+1
}
a[i]
mean(a)




