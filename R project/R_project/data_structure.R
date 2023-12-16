## Data Structures
## vector
1:10
16:25

# sequence generation
seq(from = 1, to = 100, by = 2)

# help manual
help('seq')

# function c
friend <- c('David','Marry', 'Anna','John','William')


## matrix
x <- 1:25
length(x)
dim(x) <- c(5,5)

# create matrix
m1 <- matrix(1:25, ncol=5)
m2 <- matrix(1:25, nrow=5, byrow=T)

# element wise coputation
m2 + 100
m2 * 4

## list
my_name <- 'Gust'
my_friends <- c('Krit','Pob','Pawat')
m1 <- matrix(1:25, ncol =5)
r_is_cool <- TRUE

my_list <- list(item1 = my_name,
                item2 = my_friends,
                item3 = m1,
                item4 = r_is_cool)
my_list$item3
my_list$item4


## dataframe
friend <- c('Krit','Pob','Pawat')
age <- c(28,29,28)
location <- c('MFEC','Clime Center','MFEC')
movie_lover <- c(TRUE,TRUE,FALSE)

# create dataframe from variable
df <- data.frame(friend,
                age,
                location,
                movie_lover)
View(df)
# show all rows from column 1,3
print(df[c(1,3)])
# show row 1 from column 1,3
print(df[1,c(1,3)])
# show row 1,3 from column 1,3
print(df[c(1,3),c(1,3)])

# create dataframe from list
df2 <- data.frame(my_list)
