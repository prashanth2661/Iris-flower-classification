install.packages(c("dplyr", "caret", "randomForest"))
library(dplyr)
library(caret)
library(randomForest)

data <- read.csv("C:/Users/prash/OneDrive/Desktop/CODSOFT/Data science/IRIS.csv")

sum(is.na(data))

summary(data)

pairs(data[1:4], col = as.numeric(data$Species))

set.seed(42)
trainIndex <- createDataPartition(data$Species, p = 0.8, list = FALSE)
trainSet <- data[trainIndex, ]
valSet <- data[-trainIndex, ]

model <- train(Species ~ ., data = trainSet, method = "rf", trControl = trainControl(method = "cv", number = 5))

predictions <- predict(model, valSet)

confusionMatrix(predictions, valSet$Species)
