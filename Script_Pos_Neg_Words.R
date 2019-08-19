require(plyr); 
library(dplyr)
require(stringr)
library(qdap)
library(ggplot2)
#install.packages("SnowballC")
library(SnowballC)
#install.packages("SnowballC")
#install.packages("tmap")

library(SnowballC)
library(tm)
library(tmap)
library(gridExtra)



all_tweets_w_sent<- read.csv("All_Sentiment_Score_V1.csv",header= TRUE, sep=",", na.strings=c(""," ","NA"))


#cleaned_text, Telco, Polarity

tdmCreator <- function(dataframe, stemDoc = F, rmStopwords = T){
  
  tdm <- Corpus(VectorSource(dataframe$cleaned_text))
  if (isTRUE(rmStopwords)) {
    tdm <- tm_map(tdm, removeWords, c(stopwords(),"telus", "thatâ", "cmcdavid", "allstardadjoke", "dad",
                                      "jonathantoews", "funny", "don", "joke","versions", 
                                      "rickyberwick", "ragegame", "rage", "games",
                                      "sobeys", "will", "sobâ", "itâ","self","cmncanada","itâ",
                                      "itâ","amp","storâ","canadian","nextgenplayer","bethesda","can","one","canada","senateaggop","ralphsgrocery","senateagdems","grocerymakersã","thank","please")) 
  }
  if (isTRUE(stemDoc)) {
    tdm <- tm_map(tdm, stemDocument)
  }
  tdm <- TermDocumentMatrix(tdm,
                            control = list(wordLengths = c(3, Inf))) 
  tdm <- rowSums(as.matrix(tdm))
  tdm <- sort(tdm, decreasing = T)
  df <- data.frame(term = names(tdm), freq = tdm)
  return(df)
} 
  
  # sentiment score distribution
ggplot(data=all_tweets_w_sent) + geom_bar(mapping = aes(x=Polarity_Score, fill=Telco), binwidth = 1) +
    facet_grid(Telco~.) + theme_bw()# + scale_fill_brewer()

# focusing on very negative and very positive tweets
#all_tweets_w_sent$very.pos <- as.numeric(all_tweets_w_sent$Polarity_Score >= .4)
#all_tweets_w_sent$very.neg <- as.numeric(all_tweets_w_sent$Polarity_Score <= -.4)

# focusing on very negative and very positive tweets based on polarity
all_tweets_w_sent$very.pos <- as.numeric(all_tweets_w_sent$Polarity == 'Positive')
all_tweets_w_sent$very.neg <- as.numeric(all_tweets_w_sent$Polarity == 'Negative')

# creating a summary of the count and score
twitter.df <- ddply(all_tweets_w_sent, "Telco", summarise, pos.count = sum(very.pos), 
                    neg.count = sum(very.neg))


twitter.df$all.count <- twitter.df$pos.count + twitter.df$neg.count
twitter.df$score <- round(100 * twitter.df$pos.count / twitter.df$all.count)


# order by score
#install.packages("doBy")
library(doBy)

orderBy(~-score, twitter.df)

# spliting very pos/neg datasets for airlines 
Telus_pos <- subset(all_tweets_w_sent, Telco == "Telus" & very.pos == 1)
Telus_neg <- subset(all_tweets_w_sent, Telco == "Telus" & very.neg == 1)

Rogers_pos <- subset(all_tweets_w_sent, Telco == "Rogers" & very.pos == 1)
Rogers_neg <- subset(all_tweets_w_sent, Telco == "Rogers" & very.neg == 1)

Freedom_pos <- subset(all_tweets_w_sent, Telco == "FreedomMobile" & very.pos == 1)
Freedom_neg <- subset(all_tweets_w_sent, Telco == "FreedomMobile" & very.neg == 1)

Bell_pos <- subset(all_tweets_w_sent, Telco == "Bell" & very.pos == 1)
Bell_neg <- subset(all_tweets_w_sent, Telco == "Bell" & very.neg == 1)



telusPos_clean <- tdmCreator(Telus_pos)
telusPos_clean_top10 <- telusPos_clean[1:15,]
telusPos_clean_top10
telusNeg_clean <- tdmCreator(Telus_neg)
telusNeg_top10 <- telusNeg_clean[1:15,]
telusNeg_top10 


freedom_pos_clean <- tdmCreator(Freedom_pos)
freedom_pos_clean_top10 <- freedom_pos_clean[1:15,]
freedom_pos_clean_top10
freedNeg_clean <- tdmCreator(Freedom_neg)
freedomNeg_top10 <- freedNeg_clean[1:15,]
freedomNeg_top10 

bell_pos_clean <- tdmCreator(Bell_pos)
bell_pos_clean_top10 <- bell_pos_clean[1:15,]
bell_pos_clean_top10
bell_Neg_clean <- tdmCreator(Bell_neg)
bell_Neg_top10 <- bell_Neg_clean[1:15,]
bell_Neg_top10 


rogers_pos_clean <- tdmCreator(Rogers_pos)
rogers_pos_clean_top10 <- rogers_pos_clean[1:15,]
rogers_pos_clean_top10
rogers_Neg_clean <- tdmCreator(Rogers_neg)
rogers_Neg_top10 <- rogers_Neg_clean[1:15,]
rogers_Neg_top10 



# viz

telus_plot_pos <- ggplot(telusPos_clean_top10, aes(x = reorder(term, freq), y = freq)) +
  geom_bar(stat = "identity", fill = "green") +
  xlab("Most Positive Used") + ylab("How Often") +
  coord_flip() + theme(text=element_text(size=25,face="bold")) + ggtitle("Telus")

telus_plot_neg <- ggplot(telusNeg_top10, aes(x = reorder(term, freq), y = freq)) +
  geom_bar(stat = "identity", fill = "red") +
  xlab("Most Negative Used") + ylab("How Often") +
  coord_flip() + theme(text=element_text(size=25,face="bold")) + ggtitle("Telus")

grid.arrange(telus_plot_pos, telus_plot_neg, ncol=2)

##Freedom Mobile

freedom_plot_pos <- ggplot(freedom_pos_clean_top10, aes(x = reorder(term, freq), y = freq)) +
  geom_bar(stat = "identity", fill = "green") +
  xlab("Most Positive Used") + ylab("How Often") +
  coord_flip() + theme(text=element_text(size=25,face="bold")) + ggtitle("Freedom Mobile")

freedom_plot_neg <- ggplot(freedomNeg_top10, aes(x = reorder(term, freq), y = freq)) +
  geom_bar(stat = "identity", fill = "red") +
  xlab("Most Negative Used") + ylab("How Often") +
  coord_flip() + theme(text=element_text(size=25,face="bold")) + ggtitle("Freedom Mobile")




grid.arrange(freedom_plot_pos, freedom_plot_neg, ncol=2)

##Bell



bell_plot_pos <- ggplot(bell_pos_clean_top10, aes(x = reorder(term, freq), y = freq)) +
  geom_bar(stat = "identity", fill = "green") +
  xlab("Most Positive Used") + ylab("How Often") +
  coord_flip() + theme(text=element_text(size=25,face="bold")) + ggtitle("Bell")

bell_plot_neg <- ggplot(bell_Neg_top10, aes(x = reorder(term, freq), y = freq)) +
  geom_bar(stat = "identity", fill = "red") +
  xlab("Most Negative Used") + ylab("How Often") +
  coord_flip() + theme(text=element_text(size=25,face="bold")) + ggtitle("Bell")




grid.arrange(bell_plot_pos, bell_plot_neg, ncol=2)


##Rogers


rogers_plot_pos <- ggplot(rogers_pos_clean_top10, aes(x = reorder(term, freq), y = freq)) +
  geom_bar(stat = "identity", fill = "green") +
  xlab("Most Positive Used") + ylab("How Often") +
  coord_flip() + theme(text=element_text(size=25,face="bold")) + ggtitle("Rogers")

rogers_plot_neg <- ggplot(rogers_Neg_top10, aes(x = reorder(term, freq), y = freq)) +
  geom_bar(stat = "identity", fill = "red") +
  xlab("Most Negative Used") + ylab("How Often") +
  coord_flip() + theme(text=element_text(size=25,face="bold")) + ggtitle("Rogers")




grid.arrange(rogers_plot_pos, rogers_plot_neg, ncol=2)

