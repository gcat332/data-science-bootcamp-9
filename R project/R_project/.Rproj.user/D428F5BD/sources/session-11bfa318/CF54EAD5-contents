## load library
mpg

## basic syntax
## ggplot(data = data_frame , mapping = aes(x=,y=,mapping) + geom_plot_type(setting)
ggplot(mtcars,aes(mpg)) +
  geom_histogram(bins=8)

## how to choose visualization
## 1. number of variable
## 2. data type


## DRY Do not Repeat Yourself
base1 <- ggplot(diamonds,aes(price))
base2 <- ggplot(diamonds,aes(cut,fill=cut))
# sample data for represent entire data set
base3 <- ggplot(sample_n(diamonds,3000),aes(carat,price,color=cut)) 


## one variable : continuous (number)
p1 <- base1 + geom_histogram()
p2 <- base1 + geom_density()
p3 <- base1 + geom_boxplot()
# pacthwork -> mange to display multiple visulization
(p1 + p2) / p3


## one variable : discrete (factor)
base2 + geom_bar()


## two variable : continuous (number) x continuous (number)
base3 + geom_point()
base3 + geom_smooth()


## shortcut qplot() -> quick plot
qplot(x= carat,data = diamonds,geom = "density")

## layer in ggplot2
base_layer <- ggplot(sample_n(diamonds,1000),aes(carat,price))
base_layer + theme_minimal() +
  geom_point(color = 'salmon') +
  geom_smooth(method = 'lm',se= TRUE) +
  geom_rug()

## manual color assign to bar plot
# assign color manual by group
base_bar <- ggplot(diamonds,aes(cut,fill=cut)) 
base_bar + geom_bar(position='dodge')+
  theme_minimal() +
  scale_fill_manual(values = c('Ideal'='salmon','Very Good'='lightgreen',
                               'Premium'='lightblue','Fair'='orange','Good'='pink'))

# assign color by gradient
base_point <- ggplot(sample_n(diamonds,1000),aes(carat,price,color=price))
base_point + geom_point()+
  scale_color_gradient(low='salmon',high='green')


## multiple sub-plot
# facet wrap -> 1 factor variable
ggplot(sample_n(diamonds,5000),aes(carat,price,color=price))+
  geom_point(alpha=0.3) +
  geom_smooth() +
  theme_minimal() +
  facet_wrap(~cut,ncol=5) +
  scale_color_gradient(low='salmon',high='green')

# facet grid -> 2 factors variable
ggplot(sample_n(diamonds,5000),aes(carat,price,color=price))+
  geom_point(alpha=0.3) +
  geom_smooth() +
  theme_minimal() +
  facet_grid(clarity ~ cut) +
  scale_color_gradient(low='salmon',high='green')


## multiple dataframes
m1 <- mtcars %>% filter(mpg >30)
m2 <- mtcars %>% filter(mpg <= 20)
ggplot() +
  geom_point(data=m1,aes(wt,mpg),color = 'blue') +
  geom_point(data=m2,aes(wt,mpg),color = 'orange')
