###############################################################################################################
# This script solves call center productivity boosting with ML exercise
# from http://www.r-exercises.com/2017/05/14/call-center-productivity-boosting-with-machine-learning-exercises/
# website
###############################################################################################################

#'@export
BankApp <- function() {
  # Exercise 1
  # Load Libraries randomForest, ggplot2 and caret
  #
library(randomForest)
library(ggplot2)
library(caret)

  # BankAppExExercise 2
  # Download Download bank-full.csv from This website.

  dataSet <- read.csv("F:/bank/bank-full.csv",TRUE,";")

  # Exercise 3
  # Take a look at this data set using head function.
  # Read the data dictionary to understand all variables.

  head(dataSet)

  # Exercise 4
  # Compare age, housing and loan using ggplot boxplots to find out
  # any relations with y variable.

  ggplot(dataSet, aes(y, age)) + geom_boxplot() + facet_grid(housing ~ loan)

  # Exercise 5
  # Compare day, marital and loan using ggplot boxplots to find out
  # any relations with y variable.

  ggplot(dataSet, aes(y, day)) + geom_boxplot() + facet_grid(loan ~ marital)

  # Exercise 6
  # Make a data partition in order to separate training and testing sets.
  # Reserve 30% of all data for testing procedures.

  partition <- createDataPartition(y=dataSet$y, p = 0.7, list= FALSE)
  testing <- dataSet[-partition,]
  training <- dataSet[partition,]

  # Exercise 7
  # Create a prediction model using random forest algorithm.
  # To make this experiment reproducible set seed equals to 1234.
  set.seed(1234)
  modFit <- randomForest(y ~. , data=training)

  # Exercise 8
  # Predict values for the testing set, and take a look at those values
  # using head function.
  pred <- predict(modFit, testing)
  head(pred)

  # Exercise 9
  # Figure out how many trees were create using this algorithm
  # and the estimate error rate. Create a confusion matrix using
  # the testing versus predicted data using the table function.
  # Why this is different from the Confusion matrix stated in
  # the model description?
  print(modFit)
  matrix <- table(pred, testing$y)
  print(matrix)

  # Exercise 10
  # Consider that you are making 100 calls to make a single sale.
  # How many calls you will need now using this machine learning algorithm?
  trueYesPercent <- matrix[2,2]/(matrix[1,2] + matrix[2,1])
  callsPerSaleML <- 1/trueYesPercent
  print(callsPerSaleML)
}
##################################### EOF #########################################


