library(ggplot2)

ggplot(data=mpg, aes(x=displ,y=hwy))+
  geom_point()

ggplot(data=mpg, aes(x=displ,y=hwy,colour=class))+
  geom_point()

ggplot(data=mpg, aes(x=displ,y=hwy,colour=class,size=cyl))+
  geom_point()

ggplot(data=mpg, aes(x=displ,y=cty,colour=class,size=cyl,shape=drv))+
  geom_point()

ggplot(data=mpg, aes(x=displ,y=hwy,colour=manufacturer))+
  geom_point()+facet_grid(class~year)



