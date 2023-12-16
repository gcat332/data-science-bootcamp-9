library(tidyverse)


df_tibble <- tibble(id=1:3,name=c('gus','krit','pob'))
df <- data.frame(id=1:3,name=c('gus','krit','pob'))

# convert normal df to tibble_df
mtcars
mtcars_tibble <- tibble(mtcars)

# lock result
set.seed(25)

# sample n rows
sample_n(mtcars,5)
sample_n(mtcars_tibble,5)

# sample n%
sample_frac(mtcars,0.2)
sample_frac(mtcars_tibble,0.2)

#slice data
slice(mtcars,1:5)
slice(mtcars_tibble,1:5)

#slice data multiple range
slice(mtcars,c(1,3,5:10))
slice(mtcars_tibble,c(1,3,5:10))

#slice data random
slice(mtcars,sample(nrow(mtcars),10))
