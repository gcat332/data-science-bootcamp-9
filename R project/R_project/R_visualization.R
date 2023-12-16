library(tidyverse)


## basic plots (base R)
# histogram - one quantitative variable
hist(mtcars$mpg)

mtcars$am <- factor(mtcars$am,
                    level = c(0,1),
                    labels = c('auto','manual'))

# bar plot - qualitative variable
table(mtcars$am) # count factor
barplot(table(mtcars$am)) # plot bar by factor

# box plot - quantitative variable
boxplot(mtcars$hp) # use for identify out-liner
fivenum(mtcars$hp) # given 5 numbers including of min, q1, med, q3, max

# whisker calculation
Q3 <- quantile(mtcars$hp,probs = .75)
Q1 <- quantile(mtcars$hp,probs = .25)
IQR <- Q3-Q1

boxplot.stats(mtcars$hp,coef = 1.5)

## filter out-liner
mtcars_no <- mtcars %>%
  filter(hp<335)
boxplot(mtcars_no$hp)

# box plot - 2 variables
# qualitative x quantitative
boxplot(  mtcars$mpg ~ mtcars$am,
          col = c("green","salmon"))


# Scatter plot
# 2x quantitative
plot(mtcars$hp, mtcars$mpg, pcj =16,
     col = "salmon",
     main = 'Correlation between HP and MPG',
     xlab = 'HP',
     ylab = 'MPG')

cor(mtcars$hp, mtcars$mpg)
