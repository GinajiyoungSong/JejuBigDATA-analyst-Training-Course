install.packages("twitteR")
library(twitteR)
api_key <-"fxd8VtG22tTN25KvQLiF5DjfE"
api_secret<-"nAhcVYDk4aGvlD5W4Hr5GizSsbKEafy2LmiUJ0PYbxpufTh6xY"
access_token<-"257325922-KAH1GdOi2Z4jwDRGDIgkvO24eJN3MwymrZ3gYoJH"
access_token_secret<-"P8ap67uUllyXc45A10PwSRhdzcaMpbAxBNDsT8ujBA7e4"
setup_twitter_oauth(api_key,api_secret,access_token,access_token_secret)
twUser<-getUser("richardquest")
twContent<-userTimeline(twUser,n=10)
twContent
twContent[[1]]$getClass()
twContent[[1]]$retweetCount
twContent[[1]]$favoriteCount