install.packages('readr', dependencies = TRUE, repos='http://cran.rstudio.com/')
library(readr)
library(class)
install.packages("gmodels")
library(gmodels)
install.packages("dplyr")
library(dplyr)
bcd <- read.csv("C:\\Users\\Hariprasath\\Desktop\\R\\3\\data.csv")
str(bcd)
bcd <- select(bcd,-id,-X)
table(bcd$diagnosis)
round(prop.table(table(bcd$diagnosis)) * 100, digits = 1)
sum(is.na(bcd))
head(bcd)
cor(select(bcd,-diagnosis))
summary(bcd)
normalize <- function(x) {
  return ((x - min(x)) / (max(x) - min(x)))
}
new_bcd <- as.data.frame(lapply(select(bcd,-diagnosis), normalize))
summary(select(new_bcd,radius_mean,smoothness_mean))
bcd_train <- new_bcd[1:429,]
bcd_test <- new_bcd[430:569,]
bcd_train_labels <- bcd[1:429, 1]
bcd_test_labels  <- bcd[430:569, 1]
bcd_test_pred <- knn(train = bcd_train, test = bcd_test, cl = bcd_train_labels, k = 20) 
cm = CrossTable(x = bcd_test_labels, y = bcd_test_pred, prop.chisq = FALSE)
cm
(104+ 33)/ 140