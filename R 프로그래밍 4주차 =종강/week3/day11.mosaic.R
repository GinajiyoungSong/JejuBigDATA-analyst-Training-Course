#
# 11일차
#
# Open Source 시대
#
# 주의점 1. Bug 가 존재가능
#        2. 저작권 확인 -GPL, LGPL, APL, BSD, MPL

# 범주형 데이터 일때 - 단일변수 : 막대그래프
#                      다중변수 : mosaic
#mosaic plot
#다중변수 범주형 데이터에 대한 각 변수의 그룹별 비율을 면적으로 표시
#                                 변수의 비율을 시각화할때

str( mtcars )
head( mtcars )
mosaicplot( ~gear + vs,             #대상변수
            data = mtcars,          #데이터셋
            color = TRUE,           # y축 변수의 그룹별 음영 다르게
            main = "Gear and Vs")

mosaicplot( ~gear +vs, data = mtcars,             #변수를 ~ x + y 지정해서 만들기
            color = c("green", "blue"),           # y축 변수의 그룹별 컬러를 다르게
            main = "Gear and Vs" )

#https://jjeongil.tistory.com/352
#table 함수 : 빈도표 만들때 쓰는데
#단일변수가 아닌 이변량을 가지고 빈도표 생성

tb1 <- table(mtcars$gear, mtcars$vs )
tb1
mosaicplot( tb1, color = T,  main = "Gear and Vs" )   #변수를 데이터 테이블형태로 주기


#https://www.rdocumentation.org/packages/vcd/versions/1.4-4/topics/mosaic

