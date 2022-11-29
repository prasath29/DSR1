fileURL <- "http://archive.ics.uci.edu/ml/machine-learning-databases/breast-cancer-wisconsin/breast-cancer-wisconsin.data"
download.file(fileURL, destfile="breast-cancer-wisconsin.data", method="curl")
data <- read.table("breast-cancer-wisconsin.data", na.strings = "?", sep=",")
str(data)
data <- data[,-1]
names(data) <- c("ClumpThickness",
                 "UniformityCellSize",
                 "UniformityCellShape",
                 "MarginalAdhesion",
                 "SingleEpithelialCellSize",
                 "BareNuclei",
                 "BlandChromatin",
                 "NormalNucleoli",
                 "Mitoses",
                 "Class")
data$Class <- factor(data$Class, levels=c(2,4), labels=c("benign", "malignant"))
set.seed(123)
ind <- sample(2, nrow(data), replace=TRUE, prob=c(0.7, 0.3))
trainData <- data[ind==1,]
validationData <- data[ind==2,]
table(trainData$Class)
prop.table(table(trainData$Class))
library(caTools)
set.seed(123)
split = sample.split(data$Class, SplitRatio = 0.7)
split
dataTrain = subset(data, split == TRUE)
dataTest = subset(data, split == FALSE) 
install.packages("rpart.plot")
library(rpart)
library(rpart.plot)
library(party)
tree = rpart(Class ~ ., data=trainData, method="class")
print(tree)
prp(tree)
prp (tree, type = 3)
rpart.plot(tree, extra = 104, nn = TRUE)
rpart.plot(entTree, extra = 104, nn = TRUE)
tree_with_params = rpart(Class ~ ., data=trainData, method="class", minsplit = 1, minbucket = 10, cp = -1)
prp (tree_with_params)
summary(tree_with_params)
plot(tree_with_params)
library(rpart.plot)
plotcp(tree)