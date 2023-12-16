library(tidyverse)
library(readxl)
library(sqldf)
library(ggpmisc)

retail <- read.csv('retail_data.csv')

# create summary table
df_sum_1 <- retail %>%
  mutate(Group = if_else(Country_Name=='United Kingdom','UK','Global')) %>%
  group_by(Order_Date2,Group) %>%
  summarise(total_amount=sum(as.numeric(order_amount)),total_sales=n())

# plot 
ggplot(df_sum_1,aes(as.Date(Order_Date2),total_amount,fill=Group,label=total_amount)) +
  geom_col(position = 'dodge') +
  labs(x='date') +
  scale_x_date(date_labels="%d %b",date_breaks  ="1 day") +
  ylim(0,35000) +
  geom_text(position = 'dodge')

print(df_sum_1)

# create summary table
df_sum_2 <- retail %>%
  mutate(Group = if_else(Country_Name=='United Kingdom','UK','Global')) %>%
  filter(Group == 'UK' & !is.na(order_amount)) %>%
  group_by(Order_Date2,Group,Supplier_Code) %>%
  summarise(total_amount=sum(as.numeric(order_amount)),total_sales=n())

ggplot(df_sum_2,aes(as.Date(Order_Date2),total_amount,color=Supplier_Code,label=total_amount)) + 
  geom_line(position = 'dodge') +
  geom_text(position = position_dodge(0.9),vjust = 0) +
  scale_x_date(date_labels="%d %b",date_breaks  ="1 day") +
  labs(x = 'date') + theme_minimal()
  
print(df_sum_2)

# plot correlation between total_amount and total_sales
ggplot(df_sum_1,aes(total_amount,total_sales,color=Group)) +
  geom_point() +
  geom_smooth()


