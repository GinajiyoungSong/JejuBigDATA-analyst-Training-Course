#ggplot2
install.packages("ggplot2")
require(ggplot2)

data1<-data.frame(mat=c(55,75,80,65,90,100,70,85),
                  eng=c(65,100,45,50,75,90,90,65),
                  avg=c(53,70,83,70,93,95,75,80),
                  irum=c('은민','지혜','동현','지영','규진','영훈','지나','진욱'))

ggplot(data1,aes(avg,mat))+
  geom_line(colour="red")+
  geom_point(colour="yellow")

# qplot() 함수
qplot(avg,mat,data=data1,geom=c("line","point"))


#ggplot 
ggplot(data1,aes(mat,avg))+
  geom_line(colour="red")+
  geom_point()+
  geom_line(aes(eng,avg),color="darkgreen")+
  geom_point(aes(eng,avg),color="pink")




# ggplot2 응용해서 산점도 그릴것. 
# 다중변수에 대해서 산점도 그리기
datainfo<-read.csv("C:/Users/SJY/Desktop/빅데이터전문가/highwaybus09.csv",sep=",",header=TRUE)
datainfo
head(datainfo)
str(datainfo)
# 데이터프레임으로 구성된 자료를 가져왔고, 
# 그중에 num숫자형 데이터 이용해서 그래프 그리기

ggplot(datainfo, aes(총운행횟수, 이용율))+
  geom_point(aes(colour=선별, size=거리))


#
# x값만 넣었을때는 그냥 빈도수 카운팅
str(datainfo)
datainfo

# 몇번 언급되었는지 빈도
ggplot(datainfo,aes(선별))+
  geom_bar(fill="orange",color="green")


# geom_bar()의 stat요소는 

# 기본적으로 stat_bin() 내가 표시하려는 x항목의 개수를 카운트해서 빈도표시
# 원하는 y축 표시 할때 : 항목의 계산을 위해서는 stat="identity" 적어줘야함

# y축 총 이용인원에 대한 막대그래프 시각화

ggplot(datainfo,aes(선별, 총이용인원))+
  geom_bar(stat="identity", fill="orange",color="green")





# 고속버스의 데이터를 가지고 응용
# 데이터
str(datainfo)
# 차종 2개의 그룹
# 선별 8개의 그룹

# 그룹별 평균을 계산하여 막대그래프로 표시하는 작업
# with()함수 : 같은 단어를 여러번 반복하는걸 도와줌

# 데이터에서 x축으로 쓰기엔 선별 데이터로 시각화 하는게 좋아보이네?
# 노선별 이용율의 평균을 뽑아보기로 함

meandf<-as.data.frame(with(datainfo,tapply(이용율, 선별, mean,na.rm=TRUE)))
meandf

# 새로운 데이터프레임 새로 만들어주고 <- 평균이용율 이므로
# 행별 네임을 다시 변수로 추가해줄것 

meandf$선<-rownames(meandf)
meandf

# 내가 원하는 선별 데이터 , 평균이용율 데이터, 2개의 변수 완성

# tapply함수로 만들어준 데이터를 새로운 이름으로 바꿔주기
names(meandf)<-c("이용률","선별")
meandf

ggplot(meandf,aes(선별,이용률))+geom_bar(stat="identity",aes(fill=선별))



# 새로운 응용
# list 함수 
# 누적막대그래프 작업
# 누적막대는 list 로 묶어줘야함

meandf1<-as.data.frame(with(datainfo,aggregate(이용율,list(선별=선별,차종=차종),mean,na.rm=TRUE)))
meandf1

#선별/차종 list로 만들어서, 데이터셋을 보면 선별로 - 고속/ 선별로- 우등 호출
#데이터 프레임으로 치환해줬으므로 - 내가 원하는 그룹화 한 상태.

#새로운 변수를 행숫자로 만들어줌. 왜???
meandf1$평균이용율<-rownames(meandf1)
meandf1


names(meandf1)<-c("선별","차종","평균이용율")
meandf1

# ggplot 을 그릴때, 내가 원하는 그룹은 고속/ 우등 으로 구분하는 거였으므로
# 누적막대그래프에 fill= 그룹 네임을 적어줌.
ggplot(meandf1,aes(선별,평균이용율))+
  geom_bar(stat="identity",aes(fill=차종))



#position="fill 넣었을때 100프로 누적막대로 그려짐
# 차종 2개의 그룹별 어디가 점유율이 높은지 볼수 있어서 - 비교할때 좋음

ggplot(meandf1,aes(선별,평균이용율))+
  geom_bar(stat="identity",aes(fill=차종),position="fill")



#position="dodge" 넣었을때는 그룹화 막대그래프
# plot함수에서는 beside=T 와 같음

ggplot(meandf1,aes(선별,평균이용율))+
  geom_bar(stat="identity",aes(fill=차종),position="dodge")+
  geom_text(aes(y=평균이용율, label=평균이용율), color="black", size=2.5)
