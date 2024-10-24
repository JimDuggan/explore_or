library(nycflights13)
library(dplyr)

# 1 (a) Flights that had an arrival delay of two or more hours
filter(flights,arr_delay >= 120)

target <- c("LAX","ORD","BOS")
test <- filter(flights,dest %in% target)

ggplot(test,aes(x=origin,y=air_time,colour=dest))+geom_boxplot()

# 1 (b) Flights that flew to Houston
filter(flights,dest %in% c("IAH","HOU"))

# 1 (d) Departed in Summer (July, August and September)
ans <- filter(flights,between(month,7,9))


# 1 (d) Arrived more than two hours late, but did not leave late
filter(flights,dep_delay < 0, arr_delay > 120)





