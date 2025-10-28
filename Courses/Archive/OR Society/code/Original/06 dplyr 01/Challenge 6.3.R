# Select all columns from flights that contains the substring “time”

library(nycflights13)
library(dplyr)

new_t <- select(flights,contains("time"))
