library(twitteR)
library(tm)
library(wordcloud)
library(RColorBrewer)
library(ggmap)

consumer_key = "TkimlsBLO0yImQRkoPyXhUVVr"
consumer_secret = "o0C0Oaf71HQT9VH73p90VwQgG6ELKJO3q6V66b8wzsmZteUDBm"
access_token = "591002069-HpN0mLL4D8EKVC0BFtzhFLkC5OM93QRaAzsMs6rW"
access_secret = "yBeIPg7CNLKGrDVVwZ2XzptOXfcPyDK4YuKcTloXZJgz5"
setup_twitter_oauth(consumer_key, consumer_secret, access_token, access_secret)

tweets = searchTwitter("#michaelscott", n = 75, lang = "en")

twitter.text = sapply(tweets, function(x) x$getText())

do.call(rbind, lapply(tweets, function(x) x$toDataFrame()))

twitter.text= gsub("[^[:print:]]", "", twitter.text)
twitter.text= twitter.text[-81]

twitter.text = gsub("http[s]?://(?:[a-zA-Z]|[0-9]|[$-_@.&+]|[!*\\(\\),]|(?:%[0-9a-fA-F][0-9a-fA-F]))+", "", twitter.text)

twitter.text = gsub("[^[:space:]]*???$", "", twitter.text)

twitter.corpus = Corpus(VectorSource(twitter.text))

