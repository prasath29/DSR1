wine<-read.csv("C:\\Users\\Hariprasath\\Desktop\\R\\10\\whitewines.csv")
install.packages("C50")
install.packages("gmodels")
install.packages("party")
install.packages("RColorBrewer")
install.packages("psych")
install.packages("rpart")
install.packages("rpart.plot")
install.packages("RWeka")
library(C50)
library(gmodels)
library(party)
library(RColorBrewer)
library(psych)
library(rpart)
library(rpart.plot)
library(RWeka)
str(wine)
hist(wine$quality)
wine_train <- wine[1:3750, ]
wine_test <- wine[3751:4898, ]
m.rpart <- rpart(quality ~ ., data = wine_train)
m.rpart
rpart.plot(m.rpart, digits = 3)
rpart.plot(m.rpart, digits = 4, fallen.leaves = TRUE, type = 3, extra = 101)
p.rpart <- predict(m.rpart,wine_test)
summary(wine_test$quality)
MAE <- function(actual, predicted){
  mean(abs(actual - predicted))
}
MAE(wine_test$quality, p.rpart)
summary(p.rpart)
m.m5p <- M5P(quality ~. , data = wine_train)

# building the predictor
p.m5p <- predict(m.m5p, wine_test)

m.m5p
#Improved MAE
MAE(wine_test$quality, p.m5p)
#testing
test <- data.frame(fixed.acidity = 8.5, volatile.acidity = 0.33, citric.acid = 0.42, residual.sugar = 10.5, chlorides = 0.065, free.sulfur.dioxide = 47, total.sulfur.dioxide = 186, density = 0.9955, pH = 3.10, sulphates = 0.40, alcohol = 9.9)
test
test_pred <- predict(m.m5p, test)
test_pred