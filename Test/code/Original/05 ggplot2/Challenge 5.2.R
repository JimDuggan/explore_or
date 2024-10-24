# Generate the following graph from aimsir17 (January)

library(aimsir17)
library(ggplot2)

t <- c("DUBLIN AIRPORT","MACE HEAD","SherkinIsland")

jan <- subset(observations,station %in% t & month ==1)

ggplot(data = jan,aes(x=date,y=temp))+geom_point()

ggplot(data = jan,aes(x=date,y=temp,colour=station))+geom_point()

ggplot(data = jan,aes(x=date,y=temp,colour=station,size=rain))+
      geom_point()



