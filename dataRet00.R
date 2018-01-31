library(twitteR)
api_key <- "7Xj9XRUSdInhsCX2mPE3l3gHl"
api_secret <- "Nje3xVOyExfHT9mFrZb3aBzGDVzKUxldGMG5U3wgpiYwt5C39u"
token <- "3421100999-9N00tjAfTPjAdTL2P1Gm6328tXAbN10ShC5rHMg"
token_secret <- "LE7EyBzyFtbBcEOv8JTpxCrkjdMr9IwqermfRvWp4JrWP"
setup_twitter_oauth(api_key, api_secret, token, token_secret)

tweets <- searchTwitter("bus OR #bus", n = 500)

tweets.df <- twListToDF(tweets)
write.csv(tweets.df, "/home/james/cw3/tweets.csv")

library(leaflet)
library(maps)

read.csv("/home/james/cw3/tweets.csv", stringsAsFactors = FALSE)


mymap <- read.csv("/home/james/cw3/tweets.csv", stringsAsFactors = FALSE)
m <- leaflet(mymap) %>% addTiles()
m %>% addCircles(lng = ~longitude, lat = ~latitude, popup = mymap$type, weight = 8, radius = 40, color = "#fb3004", stroke = TRUE, fillOpacity = 0.8)
