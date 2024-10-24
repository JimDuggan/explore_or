library(aimsir17)
library(dplyr)
library(ggplot2)

mh <- filter(observations,
             station=="MACE HEAD" | station=="DUBLIN AIRPORT" |
             station == "SherkinIsland",month==1)


ggplot(data=mh,aes(x=date,y=temp))+
  geom_point()

ggplot(data=mh,aes(x=date,y=temp,colour=station))+
  geom_point()

ggplot(data=mh,aes(x=date,y=temp,size=rain,colour=station))+
  geom_point()


library(lubridate)

mh <- mutate(mh,Day=wday(date,label = T))

ggplot(data=mh,aes(x=date,y=temp,size=rain,colour=Day, shape=station))+
  geom_point()


