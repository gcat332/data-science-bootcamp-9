# install package
install.packages('dplyr')
# load package
library('dplyr')



# read csv file
imdb <- read.csv('imdb.csv')

# review data structure
glimpse(imdb)


# print head and tail of data
head(imdb)
tail(imdb)

# select columns
select(imdb,MOVIE_NAME,YEAR) # normal select by column name
select(imdb,1,5) # normal select by column index
select(imdb, movie_name = MOVIE_NAME, release_year = YEAR) # normal select with renaming column

# pipe operator

imdb %>% 
  select(movie_name = MOVIE_NAME, release_year = YEAR) %>% 
  head(10)


# named column
names(imdb) <- tolower(names(imdb))

# filter numeric data
filter(imdb, score >= 9.0) # normal filter
imdb %>% filter(score >= 9.0) # pipe filter

imdb %>%
  select(movie_name,year,score) %>%
  filter(score>=9 & year>2000) # filter with and operator

imdb %>%
  select(movie_name,year,score) %>%
  filter(score==8.8 | score ==8.3) # filter with or operator

imdb %>%
  select(movie_name,year,score) %>%
  filter(score %in% c(8.3,8.8,9.0)) # filter with in operator

# filter string data
imdb %>%
  select(movie_name,genre,rating) %>%
  filter(rating == 'PG-13') # exact matching

imdb %>%
  select(movie_name,genre,rating) %>%
  filter(grepl("Drama",imdb$genre)) # contain matching by using grepl function

imdb %>%
  select(movie_name) %>%
  filter(grepl("The",imdb$movie_name)) # contain matching by using grepl function


# create new column
imdb %>%
  select(movie_name,score,length) %>%
  mutate(score_group = if_else(score>=9,'High Rating','Low Rating'),
         length_group = if_else(length>=120,'Long Film','Short Film'),
         score_update = score+0.1) %>%
  head(5)
         
## sort & arrange data
# ascending order
imdb %>% 
  arrange(length) %>%
  head(10)

# descending order
imdb %>% 
  arrange(desc(length)) %>%
  head(10)

# sort multiple columns
imdb %>% 
  arrange(rating,desc(length))


## summaries and group by data
## sort & arrange data
# ascending order
imdb %>% 
  arrange(length) %>%
  head(10)

# descending order
imdb %>% 
  arrange(desc(length)) %>%
  head(10)

# summaries and group by data
imdb %>% 
  filter(rating != "") %>%
  group_by(rating) %>%
  summarise(sum_length = sum(length),
            mean_length = mean(length),
            sd_length = sd(length),
            min_length = min(length),
            max_length = max(length),
            n = n())


## join data 
fav_films <- data.frame(id = c(5,10,25,30,98))

# inner join
fav_films %>%
  inner_join(imdb, by=c('id'='no'))


         