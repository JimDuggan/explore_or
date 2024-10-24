# Generate the following graph from aimsir17 (January)

library(ggplot2)
library(dplyr)
library(aimsir17)

jan <- filter(observations,station %in% c("MACE HEAD","DUBLIN AIRPORT","SherkinIsland"),
              month==1)

ggplot(jan, aes(x=date,y=temp))+geom_point()
ggplot(jan, aes(x=date,y=temp,colour=station))+geom_point()

ggplot(jan, aes(x=date,y=temp,colour=station,size=rain))+geom_point()


jan1 <- filter(observations,month==1)
ggplot(jan1,aes(x=date,y=temp))+geom_point()+facet_wrap(~station)
ggplot(jan1,aes(x=date,y=temp,colour=station))+geom_point()+facet_wrap(~station)









