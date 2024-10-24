# Which 10 flights travelled the longest? 
# Which 10 flights traveled the shortest?

library(nycflights13)

a1 <- arrange(flights,desc(air_time))

a2 <- arrange(flights,air_time)

filter(airports,faa=="BDL" | faa == "HNL")


  