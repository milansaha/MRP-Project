library(ggplot2)
library(lubridate)
library(tidyr)
library(httr)
library(rjson)
library(tm)
library(gridExtra)
library(NLP)
library(SnowballC)
library(dplyr)
library(scales)
library(stringr)
library(wordcloud)
library(ggthemes)
# install.packages("plotrix")
library(plotrix)

#https://rdrr.io/cran/plotrix/man/pie3D.html
#http://www.datasciencemadesimple.com/r-pie-chart/

###Bell Metadata 

bell_tweets <- read.csv("C:\\Users\\msaha\\Desktop\\Office\\Wind Invoices\\MS_Course\\MRP\\MRP_Tweet_Final\\Tweet_Bell_Data.csv",header= TRUE, sep=",", na.strings=c(""," ","NA"))
bell_tweets$Unnamed..0 <- NULL
bell_tweets$isOfficialAccount <- bell_tweets$screenName == "Bell"
bell_tweets$isRetweet <- as.logical(bell_tweets$isRetweet)
bell_tweets$isReply <- ifelse((!is.na(bell_tweets$replyToSID)| !is.na(bell_tweets$replyToSN) | !is.na(bell_tweets$replyToUID)), TRUE, FALSE)


bell_retweet_rate <- sum(as.numeric(bell_tweets$isRetweet)) / nrow(bell_tweets)
bell_reply_rate <- sum(as.numeric(bell_tweets$isReply)) / nrow(bell_tweets)
bell_own_tweet_rate <- sum(as.numeric(bell_tweets$isOfficialAccount)) / nrow(bell_tweets)



bell_summary <- data.frame(c("Retweets", "Replies","Own Acc"), 
                           c(bell_retweet_rate, bell_reply_rate, bell_own_tweet_rate))
colnames(bell_summary) <- c("Criteria", "Value")
bell_summary$Telco_Name = "Bell"
bell_summary

#Pie chart code
x = bell_summary$Value
pct <- round(x/sum(x)*100)
labels = bell_summary$Criteria
lbls <- paste(labels, pct) # add percents to labels
lbls <- paste(lbls,"%",sep="") # ad % to labels

# x <- c(32, 12, 30, 45)
# labels <- c("California", "Paris", "Moscow", "Mumbai")
# pct <- round(x/sum(x)*100)
# lbls <- paste(labels, pct) # add percents to labels
# lbls <- paste(lbls,"%",sep="") # ad % to labels

#Normal Pie
pie(x,labels = lbls, main="Bell Tweet Distribution",col=c("brown","#ddaa00","pink"))

#3D Pie
pie3D(x,labels=lbls,radius=0.8,explode=0.1,main="Bell Tweet Distribution")



###Rogers Metadata 

rogers_tweets <- read.csv("C:\\Users\\msaha\\Desktop\\Office\\Wind Invoices\\MS_Course\\MRP\\MRP_Tweet_Final\\Tweet_Rogers_Data.csv",header= TRUE, sep=",", na.strings=c(""," ","NA"))
rogers_tweets$Unnamed..0 <- NULL
rogers_tweets$isOfficialAccount <- rogers_tweets$screenName == "Rogers"
rogers_tweets$isRetweet <- as.logical(rogers_tweets$isRetweet)
rogers_tweets$isReply <- ifelse((!is.na(rogers_tweets$replyToSID)| !is.na(rogers_tweets$replyToSN) | !is.na(rogers_tweets$replyToUID)), TRUE, FALSE)


rogers_retweet_rate <- sum(as.numeric(rogers_tweets$isRetweet)) / nrow(rogers_tweets)
rogers_reply_rate <- sum(as.numeric(rogers_tweets$isReply)) / nrow(rogers_tweets)
rogers_own_tweet_rate <- sum(as.numeric(rogers_tweets$isOfficialAccount)) / nrow(rogers_tweets)



rogers_summary <- data.frame(c("Retweets", "Replies","Own Acc"), 
                             c(rogers_retweet_rate, rogers_reply_rate, rogers_own_tweet_rate))
colnames(rogers_summary) <- c("Criteria", "Value")
rogers_summary$Telco_Name = "Rogers"
rogers_summary


#Pie chart code
x = rogers_summary$Value
pct <- round(x/sum(x)*100)
labels = rogers_summary$Criteria
lbls <- paste(labels, pct) # add percents to labels
lbls <- paste(lbls,"%",sep="") # ad % to labels

#Normal Pie
pie(x,labels = lbls, main="Rogers Tweet Distribution",col=c("brown","#ddaa00","pink"))

#3D Pie
pie3D(x,labels=lbls,radius=.9,explode=0.2,main="Rogers Tweet Distribution")


###Telus Metadata 

telus_tweets <- read.csv("C:\\Users\\msaha\\Desktop\\Office\\Wind Invoices\\MS_Course\\MRP\\MRP_Tweet_Final\\Tweet_Telus_Data.csv",header= TRUE, sep=",", na.strings=c(""," ","NA"))
telus_tweets$Unnamed..0 <- NULL
telus_tweets$isOfficialAccount <- telus_tweets$screenName == "TELUS"
telus_tweets$isRetweet <- as.logical(telus_tweets$isRetweet)
telus_tweets$isReply <- ifelse((!is.na(telus_tweets$replyToSID)| !is.na(telus_tweets$replyToSN) | !is.na(telus_tweets$replyToUID)), TRUE, FALSE)

telus_retweet_rate <- sum(as.numeric(telus_tweets$isRetweet)) / nrow(telus_tweets)
telus_reply_rate <- sum(as.numeric(telus_tweets$isReply)) / nrow(telus_tweets)
telus_own_tweet_rate <- sum(as.numeric(telus_tweets$isOfficialAccount)) / nrow(telus_tweets)



telus_summary <- data.frame(c("Retweets", "Replies","Own Acc"), 
                            c(telus_retweet_rate, telus_reply_rate, telus_own_tweet_rate))
colnames(telus_summary) <- c("Criteria", "Value")
telus_summary$Telco_Name = "Telus"
telus_summary


#Pie chart code
x = telus_summary$Value
pct <- round(x/sum(x)*100)
labels = telus_summary$Criteria
lbls <- paste(labels, pct) # add percents to labels
lbls <- paste(lbls,"%",sep="") # ad % to labels

#Normal Pie
pie(x,labels = lbls, main="Telus Tweet Distribution",col=c("brown","#ddaa00","pink"))

#3D Pie
pie3D(x,labels=lbls,radius=.9,explode=0.2,main="Telus Tweet Distribution")


### FreedomMobile Metadata 

freedommobile_tweets <- read.csv("C:\\Users\\msaha\\Desktop\\Office\\Wind Invoices\\MS_Course\\MRP\\MRP_Tweet_Final\\Tweet_Freedom_Data.csv",header= TRUE, sep=",", na.strings=c(""," ","NA"))
freedommobile_tweets$Unnamed..0 <- NULL
freedommobile_tweets$isOfficialAccount <- freedommobile_tweets$screenName == "FreedomMobile"
freedommobile_tweets$isRetweet <- as.logical(freedommobile_tweets$isRetweet)
freedommobile_tweets$isReply <- ifelse((!is.na(freedommobile_tweets$replyToSID)| !is.na(freedommobile_tweets$replyToSN) | !is.na(freedommobile_tweets$replyToUID)), TRUE, FALSE)


freedommobile_retweet_rate <- sum(as.numeric(freedommobile_tweets$isRetweet)) / nrow(freedommobile_tweets)
freedommobile_reply_rate <- sum(as.numeric(freedommobile_tweets$isReply)) / nrow(freedommobile_tweets)
freedommobile_own_tweet_rate <- sum(as.numeric(freedommobile_tweets$isOfficialAccount)) / nrow(freedommobile_tweets)



freedommobile_summary <- data.frame(c("Retweets", "Replies","Own Acc"), 
                                    c(freedommobile_retweet_rate, freedommobile_reply_rate, freedommobile_own_tweet_rate))
colnames(freedommobile_summary) <- c("Criteria", "Value")
freedommobile_summary$Telco_Name = "FreedomMobile"
freedommobile_summary

#Pie chart code
x = freedommobile_summary$Value
pct <- round(x/sum(x)*100)
labels = freedommobile_summary$Criteria
lbls <- paste(labels, pct) # add percents to labels
lbls <- paste(lbls,"%",sep="") # ad % to labels

#Normal Pie
pie(x,labels = lbls, main="FreedomMobile Tweet Distribution",col=c("brown","#ddaa00","pink"))

#3D Pie
pie3D(x,labels=lbls,radius=.9,explode=0.2,main="FreedomMobile Tweet Distribution")


#### ALL Telco Metadata ###

all_telco_tweets <- rbind(bell_tweets,
                          rogers_tweets,
                          telus_tweets,
                          freedommobile_tweets
)

#Found difference in isRetweet column, changed all to common lable.
#levels(can_tire_tweets$isRetweet) <- c('True', 'False')


all_telco_retweet_rate <- sum(as.numeric(all_telco_tweets$isRetweet)) / nrow(all_telco_tweets)
all_telco_reply_rate <- sum(as.numeric(all_telco_tweets$isReply)) / nrow(all_telco_tweets)
all_telco_offacct_rate <- sum(as.numeric(all_telco_tweets$isOfficialAccount)) / nrow(all_telco_tweets)

all_telco_summary <- data.frame(c("Retweets", "Replies", "Own Acc"), 
                                c(all_telco_retweet_rate, all_telco_reply_rate, all_telco_offacct_rate))

all_telco_summary


colnames(all_telco_summary) <- c("Criteria", "Value")
all_telco_summary$Telco_Name = "All Telco"

#Pie chart code
x = all_telco_summary$Value
pct <- round(x/sum(x)*100)
labels = all_telco_summary$Criteria
lbls <- paste(labels, pct) # add percents to labels
lbls <- paste(lbls,"%",sep="") # ad % to labels

#Normal Pie
pie(x,labels = lbls, main="All Telco Tweet Distribution",col=c("brown","#ddaa00","pink"))

#3D Pie
pie3D(x,labels=lbls,radius=.9,explode=0.2,main="All Telco Tweet Distribution")



telco_data_summary <- rbind(bell_summary,
                            rogers_summary, 
                            telus_summary, 
                            freedommobile_summary,
                            all_telco_summary)


telco_data_summary

#Now plot the tweet data all together
windowsFonts(sans=windowsFont("TT Courier New"))



ggplot(data=telco_data_summary, aes(y=Value, x=Telco_Name, label=Value)) + 
  geom_bar(aes(fill=Telco_Name),data=telco_data_summary, stat="identity")  +
  coord_flip() + 
  facet_grid(Criteria ~ .) +
  scale_y_continuous(labels=percent, limits=c(0,1)) + 
  labs(title="Tweet Metadata Analysis") + 
  geom_text(aes( y = Value, label = paste0(round(Value * 100,1),"%")), size=4, hjust=-0.1) + 
  theme_economist_white(gray_bg = FALSE, base_family="Verdana") + 
  scale_colour_economist() + 
  scale_fill_economist() + 
  theme(plot.title=element_text(family="sans"),
        text=element_text(family="sans"), legend.position="bottom", legend.direction="horizontal",
        legend.title = element_blank()) 


#### To change the theme for above viz pls follow the link: https://www.rdocumentation.org/packages/ggthemes/versions/3.5.0/topics/theme_economist
###End Of Metadata Analysis



#####Exloratory Analysis STart from here######

### Bell #####

#rm(bell_tweets1)
#summary(bell_tweets1)

#Import tweet data
bell_tweets1 <- read.csv("C:\\Users\\msaha\\Desktop\\Office\\Wind Invoices\\MS_Course\\MRP\\MRP_Tweet_Final\\Tweet_Bell_Data.csv",header= TRUE, sep=",", na.strings=c(""," ","NA"))
bell_tweets1$Unnamed..0 <- NULL

########  ########   ########  Version II #########  ##########  ########
summary(bell_tweets1)

min(bell_tweets1$created)  # check start date
sum(is.na(bell_tweets1$created)) #check for any NA in dates
bell_tweets1 <- subset(bell_tweets1, created > as.Date("2019-04-01"))
#min(bell_tweets1$created)  # check min date

tail(bell_tweets1, 10)
head(bell_tweets1, 10)
NROW(bell_tweets1)
dim(bell_tweets1)

# Create a new column that contains duplicate status of each tweet (True or False)
bell_tweets1$isDuplicated <- duplicated(bell_tweets1)
# Keep the rows, those are not marked as duplicate.
bell_tweets1 <- bell_tweets1[!bell_tweets1$isDuplicated,]


summary(is.na(bell_tweets1$created))
bell_tweets1$created <- ymd_hms(bell_tweets1$created, tz="America/Toronto") #<-

#tweets by time of the day
bell_tweets1$timeonly <- strftime(bell_tweets1$created, format="%H:%M:%S")
bell_tweets1$timeonly <- as.POSIXct(bell_tweets1$timeonly, format="%H:%M:%S")
#Check NA's
bell_tweets1[(minute(bell_tweets1$created) == 0 & second(bell_tweets1$created) == 0),5] <- NA
mean(is.na(bell_tweets1$timeonly))

#isReply
bell_tweets1$isReply <- ifelse((!is.na(bell_tweets1$replyToSID) |
                                  !is.na(bell_tweets1$replyToSN) |
                                  !is.na(bell_tweets1$replyToUID)), TRUE, FALSE)

bell_topten_user <- bell_tweets1 %>% count(screenName) %>% top_n(n=10)
qplot(created, data=bell_tweets1, fill=isRetweet, facets = isReply~.)



ggplot(data = bell_tweets1, aes(x = created)) +
  geom_histogram(aes(fill = ..count..)) +
  theme(legend.position = "none") +
  labs(title="Daily Tweet Count Trend - Bell", x = "Time", y="Tweets count") +
  scale_fill_gradient(low = "#68a4bd", high = "red") +
  geom_density()


# Replies by count
ggplot(bell_tweets1, aes(bell_tweets1$isReply)) +
  geom_bar(fill = "#ff9900") +
  theme(legend.position="none", axis.title.x = element_blank()) +
  ylab("Tweets Count") +
  ggtitle("Replied/Not Replied Trend - Bell") +
  scale_x_discrete(labels=c("Not in Reply", "Replied Tweets"))


# Top 10 users
ggplot(data= bell_topten_user, aes(reorder(screenName, n),n)) +
  geom_bar(stat="identity", fill="red") +
  coord_flip() +
  labs(x = "User Name", y = "Tweet Count", title = "Top 10 Account - Bell")

bell_topten_user


#####Telus #########

#rm(telus_tweets1)
#summary(telus_tweets1)

#Import tweet data
telus_tweets1 <- read.csv("C:\\Users\\msaha\\Desktop\\Office\\Wind Invoices\\MS_Course\\MRP\\MRP_Tweet_Final\\Tweet_Telus_Data.csv",header= TRUE, sep=",", na.strings=c(""," ","NA"))
telus_tweets1$Unnamed..0 <- NULL

########  ########   ########  Version II #########  ##########  ########
summary(telus_tweets1)

min(telus_tweets1$created)  # check start date
sum(is.na(telus_tweets1$created)) #check for any NA in dates
telus_tweets1 <- subset(telus_tweets1, created > as.Date("2019-04-01"))
#min(telus_tweets1$created)  # check min date

tail(telus_tweets1, 10)
head(telus_tweets1, 10)
NROW(telus_tweets1)
dim(telus_tweets1)

# Create a new column that contains duplicate status of each tweet (True or False)
telus_tweets1$isDuplicated <- duplicated(telus_tweets1)
# Keep the rows, those are not marked as duplicate.
telus_tweets1 <- telus_tweets1[!telus_tweets1$isDuplicated,]


summary(is.na(telus_tweets1$created))
telus_tweets1$created <- ymd_hms(telus_tweets1$created, tz="America/Toronto") #<-

#tweets by time of the day
telus_tweets1$timeonly <- strftime(telus_tweets1$created, format="%H:%M:%S")
telus_tweets1$timeonly <- as.POSIXct(telus_tweets1$timeonly, format="%H:%M:%S")
#Check NA's
telus_tweets1[(minute(telus_tweets1$created) == 0 & second(telus_tweets1$created) == 0),5] <- NA
mean(is.na(telus_tweets1$timeonly))

#isReply
telus_tweets1$isReply <- ifelse((!is.na(telus_tweets1$replyToSID) |
                                   !is.na(telus_tweets1$replyToSN) |
                                   !is.na(telus_tweets1$replyToUID)), TRUE, FALSE)

telus_topten_user <- telus_tweets1 %>% count(screenName) %>% top_n(n=10)
qplot(created, data=telus_tweets1, fill=isRetweet, facets = isReply~.)



ggplot(data = telus_tweets1, aes(x = created)) +
  geom_histogram(aes(fill = ..count..)) +
  theme(legend.position = "none") +
  labs(title="Daily Tweet Count Trend - Telus", x = "Time", y="Tweets count") +
  scale_fill_gradient(low = "#68a4bd", high = "red") +
  geom_density()



# Replies by count
ggplot(telus_tweets1, aes(telus_tweets1$isReply)) +
  geom_bar(fill = "#ff9900") +
  theme(legend.position="none", axis.title.x = element_blank()) +
  ylab("Tweets Count") +
  ggtitle("Replied/Not Replied Trend - Telus") +
  scale_x_discrete(labels=c("Not in Reply", "Replied Tweets"))


# Top 10 users
ggplot(data= telus_topten_user, aes(reorder(screenName, n),n)) +
  geom_bar(stat="identity", fill="red") +
  coord_flip() +
  labs(x = "User Name", y = "Tweet Count", title = "Top 10 Account - Telus")

telus_topten_user



######### Rogers ################

#rm(rogers_tweets1)
#summary(rogers_tweets1)

#Import tweet data
rogers_tweets1 <- read.csv("C:\\Users\\msaha\\Desktop\\Office\\Wind Invoices\\MS_Course\\MRP\\MRP_Tweet_Final\\Tweet_Rogers_Data.csv",header= TRUE, sep=",", na.strings=c(""," ","NA"))
rogers_tweets1$Unnamed..0 <- NULL

########  ########   ########  Version II #########  ##########  ########
summary(rogers_tweets1)

min(rogers_tweets1$created)  # check start date
sum(is.na(rogers_tweets1$created)) #check for any NA in dates
rogers_tweets1 <- subset(rogers_tweets1, created > as.Date("2019-04-01"))
#min(rogers_tweets1$created)  # check min date

tail(rogers_tweets1, 10)
head(rogers_tweets1, 10)
NROW(rogers_tweets1)
dim(rogers_tweets1)

# Create a new column that contains duplicate status of each tweet (True or False)
rogers_tweets1$isDuplicated <- duplicated(rogers_tweets1)
# Keep the rows, those are not marked as duplicate.
rogers_tweets1 <- rogers_tweets1[!rogers_tweets1$isDuplicated,]


summary(is.na(rogers_tweets1$created))
rogers_tweets1$created <- ymd_hms(rogers_tweets1$created, tz="America/Toronto") #<-

#tweets by time of the day
rogers_tweets1$timeonly <- strftime(rogers_tweets1$created, format="%H:%M:%S")
rogers_tweets1$timeonly <- as.POSIXct(rogers_tweets1$timeonly, format="%H:%M:%S")
#Check NA's
rogers_tweets1[(minute(rogers_tweets1$created) == 0 & second(rogers_tweets1$created) == 0),5] <- NA
mean(is.na(rogers_tweets1$timeonly))

#isReply
rogers_tweets1$isReply <- ifelse((!is.na(rogers_tweets1$replyToSID) |
                                    !is.na(rogers_tweets1$replyToSN) |
                                    !is.na(rogers_tweets1$replyToUID)), TRUE, FALSE)

rogers_topten_user <- rogers_tweets1 %>% count(screenName) %>% top_n(n=10)
qplot(created, data=rogers_tweets1, fill=isRetweet, facets = isReply~.)



ggplot(data = rogers_tweets1, aes(x = created)) +
  geom_histogram(aes(fill = ..count..)) +
  theme(legend.position = "none") +
  labs(title="Daily Tweet Count Trend - Rogers", x = "Time", y="Tweets count") +
  scale_fill_gradient(low = "#68a4bd", high = "red") +
  geom_density()


# Replies by count
ggplot(rogers_tweets1, aes(rogers_tweets1$isReply)) +
  geom_bar(fill = "#ff9900") +
  theme(legend.position="none", axis.title.x = element_blank()) +
  ylab("Tweets Count") +
  ggtitle("Replied/Not Replied Trend - Rogers") +
  scale_x_discrete(labels=c("Not in Reply", "Replied Tweets"))

# Top 10 users
ggplot(data= rogers_topten_user, aes(reorder(screenName, n),n)) +
  geom_bar(stat="identity", fill="red") +
  coord_flip() +
  labs(x = "User Name", y = "Tweet Count", title = "Top 10 Account - Rogers")

rogers_topten_user


##### FreedomMobile #######

rm(freedom_tweets1)
#summary(freedom_tweets1)

#Import tweet data
freedom_tweets1 <- read.csv("C:\\Users\\msaha\\Desktop\\Office\\Wind Invoices\\MS_Course\\MRP\\MRP_Tweet_Final\\Tweet_Freedom_Data.csv",header= TRUE, sep=",", na.strings=c(""," ","NA"))
freedom_tweets1$Unnamed..0 <- NULL

########  ########   ########  Version II #########  ##########  ########
summary(freedom_tweets1)

min(freedom_tweets1$created)  # check start date
sum(is.na(freedom_tweets1$created)) #check for any NA in dates
freedom_tweets1 <- subset(freedom_tweets1, created > as.Date("2019-04-01"))
#min(freedom_tweets1$created)  # check min date

tail(freedom_tweets1, 10)
head(freedom_tweets1, 10)
NROW(freedom_tweets1)
dim(freedom_tweets1)

# Create a new column that contains duplicate status of each tweet (True or False)
freedom_tweets1$isDuplicated <- duplicated(freedom_tweets1)
# Keep the rows, those are not marked as duplicate.
freedom_tweets1 <- freedom_tweets1[!freedom_tweets1$isDuplicated,]


summary(is.na(freedom_tweets1$created))
freedom_tweets1$created <- ymd_hms(freedom_tweets1$created, tz="America/Toronto") #<-

#tweets by time of the day
freedom_tweets1$timeonly <- strftime(freedom_tweets1$created, format="%H:%M:%S")
freedom_tweets1$timeonly <- as.POSIXct(freedom_tweets1$timeonly, format="%H:%M:%S")
#Check NA's
freedom_tweets1[(minute(freedom_tweets1$created) == 0 & second(freedom_tweets1$created) == 0),5] <- NA
mean(is.na(freedom_tweets1$timeonly))

#isReply
freedom_tweets1$isReply <- ifelse((!is.na(freedom_tweets1$replyToSID) |
                                     !is.na(freedom_tweets1$replyToSN) |
                                     !is.na(freedom_tweets1$replyToUID)), TRUE, FALSE)

freedom_topten_user <- freedom_tweets1 %>% count(screenName) %>% top_n(n=10)
qplot(created, data=freedom_tweets1, fill=isRetweet, facets = isReply~.)


windowsFonts(sans=windowsFont("TT Courier New"))

ggplot(data = freedom_tweets1, aes(x = created)) +
  geom_histogram(aes(fill = ..count..)) +
  theme(legend.position = "none") +
  labs(title="Daily Tweet Count Trend - FreedomMobile", x = "Time", y="Tweets count") +
  scale_fill_gradient(low = "#68a4bd", high = "red") +
  geom_density()

ggplot(data = freedom_tweets1, aes(x = created)) +
  geom_histogram(aes(fill = ..count..)) +
  theme(legend.position = "none") +
  labs(title="Daily Tweet Count Trend - FreedomMobile", x = "Time", y="Tweets count") +
  scale_fill_gradient(low = "#68a4bd", high = "red") +
  geom_density()

# AM Tweets
latenight_can_tire_met <- freedom_tweets1[(hour(freedom_tweets1$created) < 6),]
ggplot(data = latenight_can_tire_met, aes(x = created)) +
  geom_histogram(aes(fill = ..count..)) +
  theme(legend.position = "none") +
  labs(title = "Late Night Tweets - FreedomMobile", x="Time", y = "Number of tweets") +
  scale_fill_gradient(low = "midnightblue", high = "aquamarine4")

# Tweets count in three hour intrvl
class(freedom_tweets1$timeonly) <- "POSIXct"
class(freedom_tweets1$created)

ggplot(data = freedom_tweets1, aes(x = timeonly)) +
  geom_histogram(aes(fill = ..count..)) +
  theme(legend.position = "none") +
  scale_x_datetime(breaks = date_breaks("3 hour")
                   ,labels = date_format("%H:00")) +
  labs(title = "Telus", x = "Time", y="Number of Tweets") +
  scale_fill_gradient(low = "midnightblue", high = "aquamarine4")


# Replies by count
ggplot(freedom_tweets1, aes(freedom_tweets1$isReply)) +
  geom_bar(fill = "#ff9900") +
  theme(legend.position="none", axis.title.x = element_blank()) +
  ylab("Tweets Count") +
  ggtitle("Replied/Not Replied Trend - FreedomMobile") +
  scale_x_discrete(labels=c("Not in Reply", "Replied Tweets"))


# Top 10 users
ggplot(data= freedom_topten_user, aes(reorder(screenName, n),n)) +
  geom_bar(stat="identity", fill="red") +
  coord_flip() +
  labs(x = "User Name", y = "Tweet Count", title = "Top 10 Account - FreedomMobile")

freedom_topten_user