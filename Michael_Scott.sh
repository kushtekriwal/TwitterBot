#!/usr/bin/Rscript

library(twitteR)
library(tm)
library(wordcloud)
library(RColorBrewer)
library(ggmap)

consumer_key = "MDJAcaDOpE89zR6cfOs79dRgG"
consumer_secret = "3W4RfbY7uV5DjuPjhPCYVwo1kBvLV8pDNlxd3hrt8C5A5QbhO2"
access_token = "884404333558804482-P4Y7f08sW7NVHi2eut0js1YuNYzmrdb"
access_secret = "ARd9WkeAp7YFwYM1n6tUzPBeCTiepw8kUUcqZvXRaUG6Y"
setup_twitter_oauth(consumer_key, consumer_secret, access_token, access_secret)

tweets = searchTwitter("#michaelscott", n = 73, lang = "en")

twitter.text = sapply(tweets, function(x) x$getText())

twitter.texts=do.call(rbind, lapply(tweets, function(x) x$toDataFrame()))

twitter.text= gsub("[^[:print:]]", "", twitter.text)
twitter.text= twitter.text[-81]

twitter.text = gsub("http[s]?://(?:[a-zA-Z]|[0-9]|[$-_@.&+]|[!*\\(\\),]|(?:%[0-9a-fA-F][0-9a-fA-F]))+", "", twitter.text)

twitter.text = gsub("[^[:space:]]*???$", "", twitter.text)
twitter.text = gsub("/", "", twitter.text)
twitter.text = gsub('\"', "", twitter.text, fixed = TRUE)

new.tweet = paste("Dwight,", twitter.text, sep = " ")
updateStatus(new.tweet)
