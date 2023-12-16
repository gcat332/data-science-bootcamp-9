## Control Flow

# If Condition
score <- 88

if ( score >= 80 ) {
  print('Passed')
} else {
  print('failed')
}

score2 <- 70

if ( score2 >= 80 ) {
  print('Passed')
} else {
  print('failed')
}


# IfELSE Condition

# แบบ if conditions ปกติ
score3 <- 3

if ( score3 >= 80 ) {
  print('Passed')
} else if (score3 >= 70) {
  print('contact teacher')
} else {
  print('failed')
}

# แบบ Ifelse function
ifelse(score >= 80,'Passed',
      ifelse(score >= 50, 'OK',
             ifelse(score >= 30, 'Re-exam','Enroll Again')))


# FOR Loop
friends <- c('Pob','Krit','Pawat','Hui')

for (friend in friends) {
  print(paste('Hi!',friend))
}

#vectorization
print(paste('Hi!',friends))

nums <- c(5,10,12,20,25)
nums <- nums+2


# WHILE Loop
count <- 0

while (count < 5) {
  print('Hi!')
  print(count)
  count <- count + 1
}


# Function
# input -> f() -> output

x <- c(10,25,50,100)

sum(x)
mean(x)
sd(x)

# handmade function

greeting <- function(){
  print('Hello World!')
}


greeting_name <- function(name){
  print(paste('Hello World!',name))
}



# Practice Function
# add_two_nums() 
add_two_nums <- function(a,b) {
  return ( a + b )
}

# cube()
cube <- function(base, power = 3){
  return (base ** power)
}

# count_ball()
balls <- c('red','red','green','blue','pink','pink','blue')

count_ball <- function(balls,color) {
  sum(balls == color)
}

# Loop over the DataFrame
# check data sets in R
data()

# count row & column
nrow(USArrests)
ncol(USArrests)

cal_mean_by_col <- function(df){
for (i in 1:ncol(df)){
  print(names(df)[i])
  print(mean(df[[i]]))
}
}


#Apply

apply(mtcars,MARGIN=c(1,2),mean)
apply(mtcars,MARGIN=2,sum)



