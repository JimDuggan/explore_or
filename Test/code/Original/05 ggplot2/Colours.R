ggplot(mpg)+
  geom_point(aes(x=displ,y=hwy),colour="blue")+
  geom_point(aes(x=displ,y=cty),colour="red")