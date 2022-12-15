# 1. Load necessary libraries
library(tidyverse)
library(caret)

# 2. Read the COVID-19 dataset
data <- read.csv("covid_19_data.csv")
print(data)

# 3. Split the data into training and test sets
set.seed(123)
train_index <- createDataPartition(data$Confirmed, p = 0.8, list = FALSE)
train_data <- data[train_index,]

# 4. Fit a random forest model to the training data
model <- train(confirmed ~ ., data = train_data, method = "rf")

# 5. Make predictions on the testing data
predictions <- predict(model, test_data)

# 6. Evaluate the model performance
accuracy <- confusionMatrix(predictions, test_data$confirmed)$overall["Accuracy"]
print(accuracy)