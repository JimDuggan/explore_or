library(aimsir17)
library(ggplot2)
library(dplyr)

t <- c("MACE HEAD","DUBLIN AIRPORT","SherkinIsland")

jan <- filter(observations,
              station %in% t,
              month==1)

p1 <- ggplot(jan)+
      geom_point(aes(x=date,y=temp,colour=station,size=rain))

p2 <- ggplot(jan)+
  geom_point(aes(x=date,y=temp,size=rain))+facet_wrap(~station)

ggplot(mpg,aes(x=displ,y=hwy))+geom_point()+geom_smooth()


