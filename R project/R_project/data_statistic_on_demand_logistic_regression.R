## Logistic Regression

mtcars %>% head()
str(mtcars)

## convert am to factor 
mtcars$am <- factor(mtcars$am , levels = c(0,1), labels = c('Auto','Manual'))

## split data for build train and test data
n <- nrow(mtcars)
id <- sample(1:n,n*0.8)
train_data <- mtcars[id,]
test_data <- mtcars[-id,]

## train model
logis_model <- glm(am ~ mpg,data = train_data, family = 'binomial')
predict_train <- predict(logis_model,type='response') ## probability
train_data$pred <- if_else(predict_train>=0.5,"Manual","Auto")
error_train <- if_else(train_data$pred == train_data$am,TRUE,FALSE)

## test model
predict_test <- predict(logis_model,type='response',newdata = test_data)
test_data$pred <- if_else(predict_test>=0.5,"Manual","Auto")
error_test <- if_else(train_data$pred == train_data$am,TRUE,FALSE)


## show result
cat("%correct train model: ",mean(error_train)*100,
    "\n%correct test model: ",mean(error_test)*100)

