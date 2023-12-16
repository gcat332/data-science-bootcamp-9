library(tidyverse)

# Scatter Plot
ggplot(data = mtcars, mapping = aes(x=hp,y=mpg)) + 
  geom_point(size = 2, col = 'salmon') +
  geom_smooth() +
  geom_rug()

# sample visualize
ggplot(diamonds, aes(carat,price)) +
  geom_point()

small_diamonds <- sample_n(diamonds,5000)
ggplot(small_diamonds, aes(carat,price)) +
  geom_point()

# Histogram
ggplot(mtcars , aes(hp)) +
  geom_histogram(bins = 8, col = 'red', fill = 'salmon')


## box plot
ggplot(diamonds , aes(depth,price)) +
  geom_boxplot()

diamonds %>%
  count(cut)


# dodge bar
ggplot(diamonds,aes(cut,fill = color)) + 
  geom_bar(position = "dodge")


## Facet : small multiples
# plot by color
ggplot(small_diamonds, aes(carat,price)) +
  geom_point() +
  geom_smooth(method = 'lm', col = 'salmon') +
  facet_wrap(~color, ncol =4) +
# theme 
  theme_minimal() +
# label
  labs(title = 'relationship between carat and price by color',
       x = 'carat',
       y = 'price USD',
       caption = 'source from ggplot2 pakage')


# Mapping color
ggplot(small_diamonds, aes(carat,price, col=cut)) +
  geom_point() +
  facet_wrap(~color, ncol =2) +
  theme_minimal()
  