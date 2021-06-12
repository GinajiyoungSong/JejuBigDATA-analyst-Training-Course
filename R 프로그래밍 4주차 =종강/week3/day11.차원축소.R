#
# 차원 축소 ( dimension reduction ) <- t-sne () 함수 이용 : 패키지 설치해야함
#
install.packages( "Rtsne")

library( Rtsne )
library( ggplot2 )

ds <- iris[ , -5 ]


#차원 축소
#중복 데이터제거
dup = which( duplicated( ds ) )
dup
ds <- ds[ -dup, ]                   #중복된 데이터가 있는 품종도 지워야 해서 
ds.y <- iris$Species[-dup]         #데이터 처리

# 차원 축소 수행 -t-sne 실행
tsne <- Rtsne( ds,                  # 차원 축소 대상 데이터셋
               dim = 2,             # 축소할 차원 2 / 3 차원
               perplexity = 10 )    # 차원 축소과정에서 데이터 샘플링을 수행하는데 필요한
# 샘플의 갯수 (대상데이터 수) / 3 보다 작게 지정

# 예를 들어 iris$Species 에서 중복데이터 어디 있는지 확인 하니 143번에 있어서
# 하나의 중복데이터를 빼서 총 149개 데이터
# 그렇다면 샘플의 갯수는 149 /3 =49 보다 작게 지정한다.

tsne <- Rtsne( ds, dim = 2, perplexity = 10 ); tsne

#참고자료 https://www.rdocumentation.org/packages/Rtsne/versions/0.15
#https://www.rdocumentation.org/packages/Rtsne/versions/0.15/topics/Rtsne

#Rtsne(X, ...)
# S3 method for default
#Rtsne(X, dims = 2, perplexity = 30, theta = 0.5, check_duplicates = TRUE,...
#Arguments
#X
#matrix; Data matrix (each row is an observation, each column is a variable)
#
#...
#Other arguments that can be passed to Rtsne
#dims
#integer; Output dimensionality (default: 2)
#perplexity
#numeric; Perplexity parameter (should not be bigger than 3 * perplexity < nrow(X) - 1, see details for interpretation)
#theta
#numeric; Speed/accuracy trade-off (increase for less accuracy), set to 0.0 for exact TSNE (default: 0.5)

# 차원 축소 결과 시각화
df.tsne <- data.frame( tsne$Y )
head( df.tsne )

ggplot( df.tsne, aes( x= X1, y= X2, color = ds.y ) ) +
  geom_point( size =2 )




#3차원 함수로 시각화
#scatter3d( x = , y = , z=  ) 


install.packages(c("rgl", "car"))
library( car )
library( rgl )
library( mgcv )

tsne <- Rtsne( ds, dims=3, perplexity= 10 )
df.tsne <- data.frame( tsne$Y)
head( df.tsne )

scatter3d( x = df.tsne$X1, y = df.tsne$X2, z= df.tsne$X3 )


#가운데 회귀단면 없애고 싶을때

points <- as.integer( ds.y )
color <- c('red', 'green','blue' )
scatter3d(  x = df.tsne$X1, y = df.tsne$X2, z= df.tsne$X3,
            point.col = color [ points ],
            surface = FALSE )


#tsnes 뭔줄 잘 모르지만, 고차원을 하늘에서 볼때 단면으로 보는것처럼 2차원화 데이터 시각화
https://skyeong.net/186