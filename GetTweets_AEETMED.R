# ---
# title: "Tweets AEETMED"
# author: "Aitor Ameztegui"
# date: "February 5th, 2017"
# output: html_document
# ---
   
rm(list=ls())
# Install "openssl" package
  pkg_url <- "https://cran.r-project.org/bin/macosx/mavericks/contrib/3.3/openssl_0.9.4.tgz"

# install.packages(pkg_url)
# install.packages(c("devtools", "rjson", "bit64", "httr"))
# install.packages("httpuv")

library(devtools)
library(twitteR)
library(tidyverse)
   
consumerKey <- "r4XXel5ykYZEfTdGanqsmOGXi"
consumerSecret <- "Dk97BOArn2KFQCAPwxHXYMCzKF7s95ZL5HttQ0ikgvDB7atD2U"
setup_twitter_oauth(consumerKey, consumerSecret, access_token=NULL, access_secret=NULL)

## This is the code I used to retrieve the tweets.

## I started to ask the API for 5000 tweets but realized it wasn't
## enough to get them all, so I did a second call, that reached the
## limit on how far back it can get.

## To archive the data, I generated a RDS file, that I later exported
## to CSV and archived on figshare.

tweets <- searchTwitter("#SIBECOL2019", n = 5000, 
                        since="2019-01-29", until="2019-02-08")
#saveRDS(tweets, "./data/AEETMED_raw_tweets.rds")

dt_tweets <- twListToDF(tweets)

saveRDS(dt_tweets, file = "./data/AEETMED_df_tweets.rds")
write_csv(dt_tweets, path = "./data/AEETMED_df_tweets.csv")




