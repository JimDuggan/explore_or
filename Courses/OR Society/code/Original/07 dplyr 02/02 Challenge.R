#Filter out incomplete flights from the dataset
#Join the flights data to the weather data
#Plot the relationship between rainfall and departure delays

library(nycflights13)
library(dplyr)
library(ggplot2)

flightsok <- flights %>% 
  filter(!is.na(dep_delay),!is.na(arr_delay))


flights_w <- left_join(flightsok,weather) %>% 
  filter(!is.na(temp))

set.seed(99)
s_data <- sample_n(flights_w,10000)

ggplot(data=s_data,aes(x=temp,y=dep_delay,colour=wind_speed))+
  geom_point()  +
  scale_colour_gradientn(colours=rainbow(10))+
  facet_wrap(~origin)+geom_smooth(method = "lm")

ggplot(data=s_data,aes(x=precip,y=dep_delay,colour=wind_speed))+
  geom_point()  +scale_colour_gradientn(colours=rainbow(10))+facet_wrap(~origin)+geom_smooth(method = "lm")
