install.packages(c("KoNLP","arules"))
library(KoNLP)
library(arules)
install.packages("igraph")
library(igraph)
useNIADic()
big_source<-readLines("d:\\mining-r\\bigdata.txt",encoding="utf-8")
head(big_source)
find_word<-Map(extractNoun,big_source)
find_word
#중복제거
ex_word<-unique(find_word)
ex_word2<-sapply(ex_word,unique)
ex_word2
filter_con<-function(x) {nchar(x)>=2 && nchar(x)<=4}
filter_apply<- function(x) {Filter(filter_con,x)}
ex_word2<-sapply(ex_word2,filter_apply)
ex_word2
# 트랜잭션객체 생성
word_trans<-as(ex_word2,"transactions")
word_trans
word_table<-crossTable(word_trans)
word_table
#apriori(트랜잭션,parameter=지지도,신뢰도)
ar_assoc<-apriori(word_trans,parameter=list(supp=0.25,conf=0.08))
inspect(ar_assoc)
#시각화작업
rule_1<-labels(ar_assoc,ruleSep=" ")
class(rule_1)
rule_2<-sapply(rule_1,strsplit," ",USE.NAMES=F)
rule_2
#행 단위로 묶어서 매트릭스구조 변환
rule_matc<-do.call("rbind",rule_2)
rule_matc
rule_visual<-graph_from_edgelist(rule_matc[,1:2,drop=FALSE],directed=TRUE)
plot.igraph(rule_visual,vertex.label=V(rule_visual)$name,vertex.label.cex=1.2,vertex.size=30,vertex.color='pink')
