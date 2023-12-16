# Load library
library(nycflights13)
library(tidyverse)

# assign data tables to dataframe
df <- flights

# preview and check what's contained
?flights
View(df)

## 1. Average delay of departure flight and arrival flight
# assume that delay flight can tracked by column dep_delay > 0 or arr_delay > 0
ans1 <- df %>%
  # create new column to track delaying and assign 100 for TRUE, 0 for FALSE
  mutate(delay_indicator = if_else(dep_delay>0 |arr_delay>0,100,0)) %>%
  # filter NA
  filter(!is.na(delay_indicator)) %>%
  # find avg
  summarise(avg_delay = mean(delay_indicator))
ans1 ## 51.6%

## 2. % of flight which delay only departure flight or arrival flight and delay both of departure and arrival
ans2 <- df %>%
  # create new column to track delaying and assign 100 for TRUE, 0 for FALSE
  mutate(delay_departure_indicator = if_else(dep_delay>0 & arr_delay<=0,100,0),
         delay_arrival_indicator = if_else(arr_delay>0 & dep_delay<=0,100,0),
         delay_both_indicator = if_else(arr_delay>0 & dep_delay>0,100,0)) %>%
  # filter NA for departure
  filter(!is.na(delay_departure_indicator)) %>%
  # filter NA for arrival
  filter(!is.na(delay_arrival_indicator)) %>%
  # find avg
  summarise(avg_delay_only_departure = mean(delay_departure_indicator),
            avg_delay_only_arrival = mean(delay_arrival_indicator),
            avg_delay_both = mean(delay_both_indicator))
ans2 ## only departure = 10.8%, only arrival = 12.4% and delay both of departure and arrival = 28.2%

## 3. % ratio between flight which delay only departure flight and flight which delay only arrival flight
ans3 <- ans2 %>%
  mutate(delay_ratio = (avg_delay_only_departure/avg_delay_only_arrival)) %>%
  select(delay_ratio)
ans3 ## 0.871

## 4. Which Carrier have the most number of delay flight
ans4 <- df %>%
  # create new column to track delaying and assign 100 for TRUE, 0 for FALSE
  mutate(delay_indicator = if_else(dep_delay>0 |arr_delay>0,100,0)) %>%
  # filter NA
  filter(delay_indicator==100) %>%
  # grouping by carrier
  group_by(carrier) %>%
  # find number of delay flight
  summarise(delay_count = n()) %>%
  # Ranking carrier
  arrange(desc(delay_count)) 
ans4 ## UA have the most number of delaying at 32877 times

## 5. Which flight route have the most number of delay flight
ans5 <- df %>%
  # create new column to track delaying and assign 100 for TRUE, 0 for FALSE
  mutate(delay_indicator = if_else(dep_delay>0 |arr_delay>0,100,0)) %>%
  # filter NA
  filter(delay_indicator==100) %>%
  # grouping by origin and destination airport
  group_by(origin,dest) %>%
  # find number of delay flight
  summarise(delay_count = n()) %>%
  # Ranking flight route 
  arrange(desc(delay_count)) 
ans5 ## JFK to LAX route have the most number of delaying at 5636 times