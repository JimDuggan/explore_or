temp <- subset(observations,station %in% c("SherkinIsland", "DUBLIN AIRPORT"))

ggplot(temp,aes(x=temp))+geom_histogram(aes(fill=station))+facet_wrap(~station)

ggplot(temp,aes(x=temp))+geom_density(aes(colour=station))+facet_grid(month~station)

ggplot(observations,aes(x=day,y=hour))+
  geom_tile(aes(colour=temp))+
  facet_grid(month~station)+
  scale_colour_gradient(low = "blue", high = "red")


