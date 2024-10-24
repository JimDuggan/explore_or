library(ggplot2)

ggplot(mpg)+geom_point(aes(x=displ,y=hwy,colour=class))

ggplot(mpg)+
  geom_point(aes(x=displ,y=hwy,colour=class))+
  facet_wrap(~manufacturer)
