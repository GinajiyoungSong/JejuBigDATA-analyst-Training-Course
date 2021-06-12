Sys.setenv(JAVA_HOME="c:\\program files\\java\\jdk1.8.0_141")
install.packages("KoNLP")
library(KoNLP)
install.packages("stringr")
library(stringr)
#useSystemDic()
useNIADic()
#useSejongDic()
txt_1<-"°¡»óÈ­Æó ¿­Ç³ÀÌ ºÐ´Ù. ºñÆ®ÄÚÀÎ, ÀÌ´õ¸®¿ò,¸®ÇÃ µîÀÌ °­¼¼¸¦ º¸ÀÌ°í ÀÖ´Ù. È¥¹äÀ» ¸ÔÀ»¶§µµ ´ç½ÅµéÀÌ Àáµé¶§¿¡µµ ÀÌ°÷Àú°÷À» ´©ºñ¸ç"
extractNoun(txt_1)
SimplePos09(txt_1)
SimplePos22(txt_1)
# paste »ç¿ë¹ý paste("good","bye",collapse="")

#º¸Åë¸í»ç¸¸ ÃßÃâÇÏ°íÀÚ ÇÒ °æ¿ì
txt_2<-paste(SimplePos22(txt_1))
txt_2
txt_3<-str_match(txt_2,"[°¡-ÆR]+/NC")
txt_3
txt_4<-txt_3[,1]
txt_4
txt_4[!is.na(txt_4)]
#»çÀü¿¡ ´Ü¾îÃß°¡
sample_1<-"¿ç·ÎÁ·ÀÇ Áõ°¡·Î È¥¿©°¡ ´Ã¾î³ª°íÀÖ´Ù. ¶ÇÇÑ ¹æ¼Û¿¡¼­µµ ¸Ô¹æ,Äî¹æÀÇ ¿­Ç³ÀÌ ÀÌ¾îÁö°í ÀÎ½ºÅ¸¿¡µµ ±×·±³»¿ëÀÌ ¼öµÎ·è"
extractNoun(sample_1)
buildDictionary(ext_dic="NIADic",user_dic=data.frame(c("È¥¿©","¸Ô¹æ","Äî¹æ","ÀÎ½ºÅ¸"),c("ncn")))
extractNoun(sample_1)
j<-convertHangulStringToJamos(sample_1)
j