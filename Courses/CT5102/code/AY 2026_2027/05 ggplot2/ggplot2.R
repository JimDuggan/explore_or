# Chapter 7 Examples: Visualization with ggplot2 


library(ggplot2)
mpg



ggplot(data=mpg, mapping=aes(x=displ,y=cty)) +
  geom_point()


ggplot(data=mpg,mapping=aes(x=displ,y=cty,color=class))+
  geom_point()


p1 <- ggplot(data=mpg,aes(x=displ,y=hwy,size=cyl,color=class))+
  geom_point()

p1 <- p1 + 
  labs(
    title = "Exploring automobile relationships",
    subtitle = "Displacement v Highway Miles Per Gallon",
    color = "Class of Car",
    size = "Cylinder Size",
    caption = "Sample chart using the lab() function",
    tag = "Plot #1",
    x = "Displacement (Litres)",
    y = "Highway Miles Per Gallon"
  )

p1

ggplot(data=mpg,aes(x=displ,y=cty))+
  geom_point()+
  facet_wrap(~class)


ggplot(data=mpg,mapping = aes(x=displ,y=cty))+
  geom_point()+
  facet_grid(class~drv)


ggplot(data=diamonds,mapping=aes(x=cut))+
  geom_bar()


ggplot(data=diamonds,mapping=aes(x=price))+
  geom_histogram(bins = 15)


ggplot(data=mpg,mapping=aes(y=cty,x=class))+
  geom_boxplot()

library(GGally)
my_vars <- subset(mpg,select=c(cty,hwy,displ))
ggpairs(my_vars)


p1 <- ggplot(mpg,aes(x=displ,y=cty,colour=class)) + geom_point()

p1 + theme_bw() + ggtitle("theme_bw()")
p1 + theme_light() + ggtitle("theme_light()")
p1 + theme_dark()+ ggtitle("theme_dark()")
p1 + theme_minimal()+ ggtitle("theme_minimal()")
p1 + theme_classic() + ggtitle("theme_classic()")
p1 + theme_void() + ggtitle("theme_void()")

