install.packages('nycflights13')
install.packages('tidyverse')



library(nycflights13)
library(tidyverse)
library(dplyr)

df <- nycflights13::flights

head(df)


df %>%
  filter(arr_delay >= 2)


df %>%
  filter(arr_delay < 30 & dep_delay > 60)

df %>%
  filter(between(dep_time,0000,0600))

df %>%
  filter(carrier %in% c('US','UK','DL')) %>%
  group_by(carrier) %>%
  summarise( n = n())

df %>%
  filter(is.na(dep_time))

NA^0
NA | TRUE
FALSE & NA
NA *0


df %>%
# farthest
  arrange(desc(distance))

df %>%
# shortest
  arrange(dictance )

df %>%
  select(dep_time,dep_time)

df %>%
  select(4,6,7,9)

df %>%
  select(c(4,6,7,9))

vars <- c("year", "month", "day", "dep_delay", "arr_delay")


df %>%
  mutate(cal_dep_time = ((dep_time%/%100 *60)+(dep_time%%100)),
         cal_sched_dep_time = ((sched_dep_time%/%100 *60)+(sched_dep_time%%100))) %>%
  select(dep_time,cal_dep_time,sched_dep_time,cal_sched_dep_time)


df %>%
  mutate(cal_dep_time = ((dep_time%/%100 *60)+(dep_time%%100)),
         cal_arr_time = ((arr_time%/%100 *60)+(arr_time%%100))) %>%
  mutate( arr_minus_dep_time = cal_arr_time - cal_dep_time) %>%
  select(air_time,arr_minus_dep_time)


df %>%
  select(dep_time,sched_dep_time,dep_delay)

df %>%
  mutate(ranking_delay = min_rank(dep_delay)) %>%
  arrange(desc(ranking_delay)) %>%
  select(dep_delay,ranking_delay) %>%
  head(10)

not_cancelled 
1:3 + 1:10


df %>% 
  filter() %>%
  group_by() %>%
  summarise()

df %>% count(dest)         
# alternative
df %>%
  group_by(dest) %>%
  summarise(n())

df %>% count(tailnum, wt = distance)
# alternative
df %>%
  group_by(tailnum) %>%
  summarise(sum(distance))




canceled <- df %>%
  filter(is.na(dep_time) & is.na(arr_time))

daily_canceled <- df %>%
  group_by(month,year) %>%
  mutate(cancel_flight = sum(is.na(dep_time) & is.na(arr_time))) %>%
  summarise(mean(cancel_flight)) 


avg_delay_df <- df %>%
  filter(!is.na(dep_delay)) %>%
  group_by(month,year) %>%
  summarise(, avg_delay = mean(dep_delay))


df %>%
  filter(!is.na(dep_delay) & dest == 'STL') %>%
  group_by(dest,carrier) %>%
  summarise(avg_delay =mean(dep_delay)) %>%
  arrange(desc(avg_delay))


popular_dests <- df %>% 
  group_by(dest) %>% 
  filter(n() > 365)
View(popular_dests)

worst_record <- df %>%
  group_by(tailnum) %>%
  filter(rank(desc(arr_delay))==1) %>%
  select(tailnum,arr_delay)

df %>%
  mutate(dep_hour = dep_time%/%100) %>%
  group_by(dep_hour) %>%
  filter(rank(desc(arr_delay))==1) %>%
  select(dep_hour,arr_delay)

df %>%
  group_by(dest) %>%
  filter(!is.na(dep_delay)) %>%
  mutate(minute_delay = sum(dep_delay)) %>%
  select(dest,minute_delay)


df %>%
  mutate(delay =(dep_delay>0)) %>%
  mutate(delay_next = lag(delay)) %>%
  select(delay,delay_next)

dest_carrier <-df %>%
  group_by(dest,carrier) %>%
  summarise(n = n())

dest_carrier %>%
  group_by(dest) %>%
  summarise(n = n()) %>%
  filter(n>=2) %>%
  arrange(desc(n))

df %>%
  mutate(delay =(dep_delay>0)) %>%
  mutate(delay_next = lag(delay)) %>%
  select(delay,delay_next)

new_df <- df %>%
  

df %>%
  arrange(tailnum,dep_time,day,month) %>%
  mutate(delay =(dep_delay>60)) %>%
  mutate(delay_yester_day = lag(delay)| delay) %>%
  mutate(green_count = (delay_yester_day == FALSE)) %>%
  select(tailnum,dep_time,delay,delay_yester_day,green_count) %>%
  filter(!is.na(green_count)) %>%
  group_by(tailnum) %>%
  summarise(sum(green_count))

df %>%
  group_by(dest) %>%
  filter(rank(air_time)==1) %>%
  select(tailnum,air_time,arr_delay) %>%
  ungroup() %>%
  filter(rank(desc(arr_delay))==1)

df %>%
  filter(!is.na(dep_delay)&!is.na(arr_delay)) %>%
  mutate(delay_dep =(dep_delay>120),
         delay_arr =(arr_delay>120)) %>%
  summarise(sum(delay_dep),sum(delay_arr))
         