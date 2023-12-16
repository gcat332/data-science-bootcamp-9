## Data Types

# Numberic
age <- 29
print(age)
class(age)

# Character
my_name <- 'Gust'
print(my_name)
class(my_name)

# Logical
result <- 1 + 1 == 2
print(result)
class(result)

# Factor
animals <- c('Cat','Dog','Cat','Bird')
class(animals)
new_animals <- factor(animals)
class(new_animals)

# Date
time_now <- Sys.time()
class(time_now)
