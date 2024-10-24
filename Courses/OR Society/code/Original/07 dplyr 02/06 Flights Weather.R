library(nycflights13)
library(dplyr)

jfk_f_jan <- filter(flights,origin=="JFK",month==1)

jfk_w_jan <- filter(weather,origin=="JFK",month==1)

jfk_comb <- left_join(jfk_f_jan, 
                      jfk_w_jan,
                      by=c("year","month","hour","day","origin"))

# Possible hypotheses
#   Impact of visibility(X) on departure delays (Y)
#   Impact of wind speed on departure delays
#   Impact of wind direction on departure delays
#   Impact of average temperature on number of delays
#   Impact of wind gusts in departure delays
#   Impact of passenger volumes on delay
#   Impact of time of day on delays
#   Extend to 12 months, and all 3 airports
