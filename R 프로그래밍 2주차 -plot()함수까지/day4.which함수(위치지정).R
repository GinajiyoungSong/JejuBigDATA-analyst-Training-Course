

score <- c( 76, 84, 69, 50, 95, 6, 82, 71, 88, 84 )
which( score == 69 )
which( score == 84 )        #내가 원하는 수의 index 위치
max( score )
which.max( score )          #최대값이 어디 위치에 있느냐
min( score )
which.min( score )

idx <- which( score >= 60 ) ; idx    #60보다 큰수가 있는 수들 idx라는 벡터지정
score [ idx ] <-  61                #벡터 idx 의 score들을 모두 61로 바꿔라.
score




idx <- which ( iris[ , 1:4 ] > 5.0, arr.ind = TRUE )  #arr.ind = T 함수는 세로 좌표로 보게 표시
idx
idx1 <- which ( iris[ , 1:4 ] > 5.0 )
idx1
head(iris)

