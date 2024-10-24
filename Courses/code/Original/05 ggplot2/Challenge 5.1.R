# What might the relationship between engine size 
# and fuel efficiency (city mpg) look like?

library(ggplot2)

ggplot(data = mpg, aes(x=displ,y=cty))+
      geom_point()+ggtitle("My Graph")+
      xlab("Engine Size")+ylab("City MPG")+
      geom_smooth(method="lm")

