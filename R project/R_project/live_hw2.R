# load library
library(RPostgreSQL)
library(RSQLite)
library(glue)

# connect DB
cloud_db <- dbConnect(PostgreSQL(),
                      host = "arjuna.db.elephantsql.com",
                      dbname = "jssfegtd",
                      user = "jssfegtd",
                      password = "8q1vP5KiKHAEIpivUPdvGivsLfzBqTt5",
                      port = 5432)

# connect to local pizza db and copy tables name
origin_db <- dbConnect(SQLite(),"pizza.db")
db_list <- dbListTables(origin_db)

# copy table to cloud_DB
for (db in db_list){
  print(db)
  dbWriteTable(cloud_db,db,data.frame(dbGetQuery(origin_db, query <- glue("select * from {db}"))))
}

# check table in DB
dbListTables(cloud_db)

# check data in table
for (db in db_list){
  print(dbGetQuery(cloud_db,query <- glue("select * from {db}")))
}


# close connection
dbDisconnect(origin_db)
dbDisconnect(cloud_db)