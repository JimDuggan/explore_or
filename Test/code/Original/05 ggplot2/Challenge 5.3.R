library(ggplot2)

ggplot(data=mpg,aes(x=displ,y=hwy))+
  geom_point()+
  geom_smooth(method="lm")