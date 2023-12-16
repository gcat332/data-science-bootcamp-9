# install packages
install.packages(c("readr", 
                   "readxl", 
                   "googlesheets4",
                   "jsonlite",
                   "dplyr",
                   "sqldf",
                   "RSQLite"))


# load library
library(readr)
library(readxl)
library(googlesheets4)
library(jsonlite)
library(dplyr)
library(sqldf)
library(RSQLite)



# read file .txt 
student <- read_table('student.txt')

# read file .csv
student2 <- read_csv('student.csv')

# read file .xlsx
student3 <- read_excel('students.xlsx',sheet =1)

result <- list()

for (i in 1:3) {
  result[[i]] <- read_excel('students.xlsx',sheet=i)
}

# Union data from all excel sheets
full_df_xlsx <- bind_rows(result)

# tell system url is public, no need to login
gs4_deauth()

# declare url
url <- ''

# read data from google sheet online
read_sheet(url, sheet ='students')


# read file .json
student4 <- data.frame(fromJSON('student.json'))


# Load school.csv to df
school <-read_csv('school.csv')

# Query data from school df
sqldf('select * from school;')

sqldf('select avg(student),
              sum(student)
      from school')

sqldf('select school_id, school_name, country
      from school')

# Connect DB via SQLite
connection <- dbConnect(SQLite(),'chinook.db')

# Get list of column in DB
dbListTables(connection)
dbListFields(connection,'customers')

# Query data from DB
dbGetQuery(connection,'select * from customers where country = "USA" limit 5')

# Disconnect DB
dbDisconnect(connection)

# Save and Load all file from Environment
save.image(file = 'data.RData')
load(file ='data.RData')

# Save and Load only 1 object from Environment
saveRDS(full_df_xlsx,file = 'full_df.rds')
readRDS(file = 'full_df.rds')
