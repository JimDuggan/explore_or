library(aimsir17)

ggplot(data=observations,aes(x=day,y=temp))+
  geom_point()+
  facet_grid(month~station)+geom_smooth()
  