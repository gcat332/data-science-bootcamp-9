library(tidyverse)

## logistic regression example

happiness <- c(10,8,9,7,8,5,9,6,8,7,1,1,3,1,4,5,6,3,2,0)
divorce <- c(0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1)

df <- data.frame(happiness,divorce)

## Fit logistic regression full dataset
model <- glm(divorce~happiness,data = df,family = 'binomial')
summary(model)


## predict and evaluate model
df$prop_divorce <- predict(model, type="response")
df$pred_divorce <- if_else(df$prop_divorce>=0.5 , 1,0)

## create confusion matrix
confusion_matrix <- 
  table(df$pred_divorce,df$divorce,dnn = c('predicted','actual'))

## model evaluation
accuracy <- 
  (confusion_matrix[1,1]+confusion_matrix[2,2])/sum(confusion_matrix)
precision <-
  confusion_matrix[2,2]/(confusion_matrix[2,2]+confusion_matrix[1,2])
recall <-
  confusion_matrix[2,2]/(confusion_matrix[2,2]+confusion_matrix[2,1])
f1_score <-
  2*((precision*recall)/(recall+precision))

