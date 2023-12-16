library(tidyverse)


## Correlation
cor(mtcars$mpg,mtcars$hp)
cor(mtcars$mpg,mtcars$wt)

plot(mtcars$mpg,mtcars$hp)

ggplot(mtcars,aes(mpg,hp)) +
  geom_point() +
  geom_smooth(method = 'lm')

cor(mtcars[,c('mpg','wt','hp')])
cor.test(mtcars$mpg,mtcars$hp)

## Linear Regression

## mpg = f(hp)
# find intercept and slope
lmFit <- lm(mpg ~ hp,data = mtcars)

summary(lmFit)

# prediction equation
lmFit$coefficients[[1]] + (lmFit$coefficients[[2]]*200)


new_cars <- data.frame(
  hp = c(100,200,300,400,500)
)

# predict
new_cars$mpg_predict <- predict(lmFit, newdata =new_cars )

## root mean squared error (rmse)
# multiple linear regression
## mpg = f(hp,wt,am)
## mpg = intercept + b0*hp + b1*wt + b2*am
lmFit2 <- lm(mpg~ hp + wt + am, data = mtcars)
lmFit2
summary(lmFit2)

coefs <- coef(lmFit2)
coefs[[1]] + coefs[[2]]*200 + coefs[[3]]*3.5 + coefs[[4]]*1


## Build full model
lmFit_full <- lm(mpg ~ ., data = mtcars)
# earse gear
lmFit_full <- lm(mpg ~ . - gear , data = mtcars)

mtcars$predicted <- predict(lmFit_full)

## Train RMSE 
error <- (mtcars$mpg - mtcars$predicted) ^2
rmse <- sqrt(mean(error))


## spilt data for train and test
n <- nrow(mtcars)
id <- sample(1:n,n*0.8)
train_data <- mtcars[id,]
test_data <- mtcars[-id,]

# train model
train_model <- lm(mpg~hp+wt,data= train_data)
predict_train <- predict(train_model)
error_train <- train_data$mpg - predict_train
rmse_train <- sqrt(mean(error_train)**2)

# test model
predict_test <- predict(train_model, newdata = test_data)
error_test <- train_data$mpg - predict_test
rmse_test <- sqrt(mean(error_test)**2)

## print result 
cat("RMSE Train: ",rmse_train,
    "\nRMSE Test: ",rmse_test)

