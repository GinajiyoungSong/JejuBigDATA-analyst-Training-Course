#
#16일차
#
# 군집화 (clustering) 
#
# 군집화 : data를 유사한것끼리 묶는 것
#           - Group, Catergory : 주어진 정보에 group이 지정되지 않아서
#             데이터들의 기준점 중심을 잡고 추가되는 데이터들에 의해 기준점이 보정되어
#             기준점이 움직이지 않은 시점이 오면 군집화완료 - Group이 생성되는 것.

# 주어진 대상 데이터들을 유사성이 넢은 것낄 묶어주는 기술 (군집, 범주, 그룹이라 칭함)
# K-means(평균) 군집화 알고리즘

mydata <- iris[ ,1:4 ]
fit <- kmeans ( x= mydata, center =3 );fit

 #K-means clustering with 3 clusters of sizes  50, 62, 38 (3개 군집에 속한 데이터 개수)

 # Cluster means: <- 3개 군집의 중심점 좌표
#              Sepal.Length Sepal.Width Petal.Length Petal.Width
# 군집번호1     5.006000    3.428000     1.462000    0.246000
# 군집번호2     5.901613    2.748387     4.393548    1.433871
# 군집번호3     6.850000    3.073684     5.742105    2.071053

# Clustering vector: <- 각 데이터에 대한 군집번호

fit$cluster
fit$centers

# 차원축소 후 군집 시각화 패키지
library( cluster )

clusplot(mydata, fit$cluster, color= T, shade= T, labels =0, lines =1)
#        군집대상  군집번호   원의색   빗금표시  관측값출력  중심선 연결

subset( mydata, fit$cluster ==2 )




# 대상 데이터 표준화 후 군집화
# 데이터와 데이터의 거리를 계산할 때 발생하는 문제 
# 모든 변수가 거리 계산에 동등한 영향을 갖도록 하기 위해서
# 모든 변수의 자료 범위를 0~1 사이로 표준화 한 후 거리 계산을 한다.

#    (x -min(A) ) /( max(A) - min(A) )
#       x : 변수 A 의 임의의 관측값
#  max(A), min(A) 는 변수A 관측값 중 최대/최소값



std <- function(x) {
  return( (x - min(x) )/ (max(x) - min(x) ) )
}
mydata <- apply( iris[, 1:4], 2,  std )
fit <-  kmeans( x= mydata, centers = 3 );fit


