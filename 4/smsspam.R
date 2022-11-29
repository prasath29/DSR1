install.packages('tm', dependencies = TRUE, repos='http://cran.rstudio.com/')
library(tm)
library(SnowballC)
library(RColorBrewer)
install.packages('wordcloud', dependencies = TRUE, repos='http://cran.rstudio.com/')
library(wordcloud)
install.packages('e1071', dependencies = TRUE, repos='http://cran.rstudio.com/')
library(e1071)
install.packages('gmodels', dependencies = TRUE, repos='http://cran.rstudio.com/')
library(gmodels)
library(caret)

sms_raw <- read.csv("C:\\Users\\Hariprasath\\Desktop\\R\\4\\sms_spam.csv", stringsAsFactors = FALSE)
head(sms_raw)

str(sms_raw)

table(sms_raw$type)

round(prop.table(table(sms_raw$type)), digits = 2)

spam <- subset(sms_raw, type == "spam")
wordcloud(spam$text, max.words = 60, colors = brewer.pal(5, "Dark2"), random.order = FALSE)

ham <- subset(sms_raw, type == "ham")
wordcloud(ham$text, max.words = 60, colors = brewer.pal(5, "Dark2"), random.order = FALSE)

sms_corpus <- VCorpus(VectorSource(sms_raw$text))
lapply(sms_corpus[1:2], as.character)

sms_corpus_clean <- tm_map(sms_corpus, content_transformer(tolower))
sms_corpus_clean <- tm_map(sms_corpus_clean, content_transformer(removeNumbers))
sms_corpus_clean <- tm_map(sms_corpus_clean, removeWords, stopwords())
sms_corpus_clean <- tm_map(sms_corpus_clean, removePunctuation)
sms_corpus_clean <- tm_map(sms_corpus_clean, stemDocument)
sms_corpus_clean <- tm_map(sms_corpus_clean, stripWhitespace)

sms_dtm <- DocumentTermMatrix(sms_corpus_clean)
dim(sms_dtm)

sms_dtm2 <- DocumentTermMatrix(sms_corpus_clean, control = 
                                 list(tolower = TRUE,
                                      removeNumbers = TRUE,
                                      stopwords = TRUE,
                                      removePunctuation = TRUE,
                                      stemming = TRUE))

wordcloud(sms_corpus_clean, min.freq = 50, random.order = FALSE, colors=brewer.pal(8, "Dark2"))

sms_dtm_train <- sms_dtm[1:4180, ]
sms_dtm_test <- sms_dtm[4181:5574, ]

sms_train_labels <- sms_raw[1:4180, ]$type
sms_test_labels <- sms_raw[4181:5574, ]$type

prop.table(table(sms_train_labels))

prop.table(table(sms_test_labels))

sms_freq_words <- findFreqTerms(sms_dtm_train, 5)
str(sms_freq_words)

sms_dtm_freq_train <- sms_dtm_train[ , sms_freq_words]
sms_dtm_freq_test <- sms_dtm_test[ , sms_freq_words]

convert_counts <- function(x){
  x <- ifelse(x > 0, "Yes", "No")
}
sms_train <- apply(sms_dtm_freq_train, MARGIN = 2, convert_counts)
sms_test <- apply(sms_dtm_freq_test, MARGIN = 2, convert_counts)
str(sms_train)

str(sms_test)

sms_classifier <- naiveBayes(sms_train, sms_train_labels, laplace = 0)
sms_test_pred <- predict(sms_classifier, sms_test)
head(data.frame("actual" = sms_test_labels, "predicted" = sms_test_pred))

CrossTable(sms_test_pred, sms_test_labels, prop.chisq = FALSE, dnn = c("predicted", "actual"))