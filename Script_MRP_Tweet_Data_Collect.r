### installing/loading libraries
library(twitteR)


#####################################
# Data Collection and preprocessing #
#####################################

# Oauth authentication with API key and token
consumer_key <- "Plvzd9TAYPHicSTylSk1MZb3f"
consumer_secret <- "2o0uJQq5ibWINVx7TSzEO8mXRAoVc5u6gYJPTV72byBwUKoL6V"
access_token <- "18792555-ntGozN0Djz67IYosH5DceMkJ9eVVab56Hb1KcZo73"
access_secret <- "nthO4KcSl01Uk2SrSMrMXcg4lrDO1PN70e9nFxxAtaqeR"

collection_date <- format(Sys.time(), "%d%b%Y")
# Twitter oauth
setup_twitter_oauth(consumer_key, consumer_secret, access_token, access_secret)


#freedommobile
#3000 on 7th June Try-1
freedom_mobile <- twListToDF(userTimeline(user="@FreedomMobile", n=3200, includeRts = TRUE, retryOnRateLimit=2000))
write.csv(file = paste("freedom_mobile_usertimeline_", collection_date, ".csv"), x= freedom_mobile, quote = TRUE, col.names = TRUE)

#215 on 7th June Try-1
freedom_mobile2 <- twListToDF(searchTwitter("freedommobile", n=1000, retryOnRateLimit=2000)) 
write.csv(file = paste("freedom_mobile_mentions_", collection_date,".csv"), x= freedom_mobile2, quote = TRUE, col.names = TRUE)

#9 on 7th June Try-1
freedom_mobile3 <- twListToDF(searchTwitter("#freedommobile", n=2000, retryOnRateLimit=2000))
write.csv(file = paste("freedom_mobile_hashtag_", collection_date,".csv"), x= freedom_mobile3, quote = TRUE, col.names = TRUE)

freedom_mobile4 <- twListToDF(searchTwitter("@FreedomMobile", n=2000, retryOnRateLimit=2000))
write.csv(file = paste("freedom_mobile_atmention_", collection_date,".csv"), x= freedom_mobile4, quote = TRUE, col.names = TRUE)

freedom_mobile5 <- twListToDF(searchTwitter("to:freedommobile", n=1000, retryOnRateLimit=2000))
write.csv(file = paste("freedom_mobile_touser_", collection_date,".csv"), x= freedom_mobile5, quote = TRUE, col.names = TRUE)

freedom_mobile6 <- twListToDF(searchTwitter("from:freedommobile", n=1000, retryOnRateLimit=2000))
write.csv(file = paste("freedom_mobile_fromuser_", collection_date,".csv"), x= freedom_mobile6, quote = TRUE, col.names = TRUE)



#Rogers Canada

rogers1 <- twListToDF(userTimeline(user="@Rogers", n=3200, includeRts = TRUE, retryOnRateLimit=2000))
write.csv(file = paste("rogers_usertimeline_", collection_date, ".csv"), x= rogers1, quote = TRUE, col.names = TRUE)

rogers2 <- twListToDF(searchTwitter("rogers", n=1000, retryOnRateLimit=2000))
write.csv(file = paste("rogers_mentions_", collection_date,".csv"), x= rogers2, quote = TRUE, col.names = TRUE)

rogers3 <- twListToDF(searchTwitter("#rogers", n=2000, retryOnRateLimit=2000))
write.csv(file = paste("rogers_hashtag_", collection_date,".csv"), x= rogers3, quote = TRUE, col.names = TRUE)

rogers4 <- twListToDF(searchTwitter("@Rogers", n=2000, retryOnRateLimit=2000))
write.csv(file = paste("rogers_atmention_", collection_date,".csv"), x= rogers4, quote = TRUE, col.names = TRUE)

rogers5 <- twListToDF(searchTwitter("to:Rogers", n=1000, retryOnRateLimit=2000))
write.csv(file = paste("rogers_touser_", collection_date,".csv"), x= rogers5, quote = TRUE, col.names = TRUE)

rogers6 <- twListToDF(searchTwitter("from:Rogers", n=1000, retryOnRateLimit=2000))
write.csv(file = paste("rogers_fromuser_", collection_date,".csv"), x= rogers6, quote = TRUE, col.names = TRUE)



#Telus Canada

telus1 <- twListToDF(userTimeline(user="@TELUS", n=3200, includeRts = TRUE, retryOnRateLimit=2000))
write.csv(file = paste("telus_usertimeline_", collection_date, ".csv"), x= telus1, quote = TRUE, col.names = TRUE)

telus2 <- twListToDF(searchTwitter("telus", n=1000, retryOnRateLimit=2000))
write.csv(file = paste("telus_mentions_", collection_date,".csv"), x= telus2, quote = TRUE, col.names = TRUE)

telus3 <- twListToDF(searchTwitter("#telus", n=2000, retryOnRateLimit=2000))
write.csv(file = paste("telus_hashtag_", collection_date,".csv"), x= telus3, quote = TRUE, col.names = TRUE)

telus4 <- twListToDF(searchTwitter("@TELUS", n=2000, retryOnRateLimit=2000))
write.csv(file = paste("telus_atmention_", collection_date,".csv"), x= telus4, quote = TRUE, col.names = TRUE)

telus5 <- twListToDF(searchTwitter("to:TELUS", n=1000, retryOnRateLimit=2000))
write.csv(file = paste("telus_touser_", collection_date,".csv"), x= telus5, quote = TRUE, col.names = TRUE)

telus6 <- twListToDF(searchTwitter("from:TELUS", n=1000, retryOnRateLimit=2000))
write.csv(file = paste("telus_fromuser_", collection_date,".csv"), x= telus6, quote = TRUE, col.names = TRUE)



#Bell Canada

bell1 <- twListToDF(userTimeline(user="@Bell", n=3200, includeRts = TRUE, retryOnRateLimit=2000))
write.csv(file = paste("bell_usertimeline_", collection_date, ".csv"), x= bell1, quote = TRUE, col.names = TRUE)

bell2 <- twListToDF(searchTwitter("bell", n=1000, retryOnRateLimit=2000))
write.csv(file = paste("bell_mentions_", collection_date,".csv"), x= bell2, quote = TRUE, col.names = TRUE)

bell3 <- twListToDF(searchTwitter("#bell", n=2000, retryOnRateLimit=2000))
write.csv(file = paste("bell_hashtag_", collection_date,".csv"), x= bell3, quote = TRUE, col.names = TRUE)

bell4 <- twListToDF(searchTwitter("@Bell", n=2000, retryOnRateLimit=2000))
write.csv(file = paste("bell_atmention_", collection_date,".csv"), x= bell4, quote = TRUE, col.names = TRUE)

bell5 <- twListToDF(searchTwitter("to:Bell", n=1000, retryOnRateLimit=2000))
write.csv(file = paste("bell_touser_", collection_date,".csv"), x= bell5, quote = TRUE, col.names = TRUE)

bell6 <- twListToDF(searchTwitter("from:Bell", n=1000, retryOnRateLimit=2000))
write.csv(file = paste("bell_fromuser_", collection_date,".csv"), x= bell6, quote = TRUE, col.names = TRUE)

