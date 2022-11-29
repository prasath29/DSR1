dataset = read.csv("C:\\Users\\Hariprasath\\Desktop\\R\\12\\data.csv")
dataset$State = factor(dataset$State,
                       levels = c('New York', 'California', 'Florida'),
                       labels = c(1, 2, 3))
dataset$State
library(caTools)
set.seed(123)
split = sample.split(dataset$Profit, SplitRatio = 0.8)
training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)

# Feature Scaling
# training_set = scale(training_set)
# test_set = scale(test_set)

# Fitting Multiple Linear Regression to the Training set
regressor = lm(formula = Profit ~ .,data = training_set)

# Predicting the Test set results
Y_prediction = predict(regressor, newdata = test_set)
regressor
Y_prediction