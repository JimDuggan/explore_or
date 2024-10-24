library(ggplot2)

# dt <- ggplot2::mpg

ggplot(data=mpg,mapping = aes(x=displ,y=cty))+
  geom_point()+ggtitle("My first graph")+xlab("Engine Capacity")+
  geom_smooth(method="lm")

# ggplot(data=mpg,mapping = aes(x=displ,y=hwy))+
#   geom_point()+geom_jitter()

ggplot(data=mpg,mapping = aes(x=displ,y=hwy))+
  geom_point()

ggplot(data=mpg)+
  geom_point(mapping = aes(x=displ,y=hwy))

ggplot(data=mpg,mapping = aes(x=displ,y=hwy,colour=class))+
    geom_point()

library(aimsir17)
library(dplyr)
library(ggplot2)

jan <- filter(observations,station %in% c("MACE HEAD","DUBLIN AIRPORT","SherkinIsland"),
              month==1)





ggplot(data=mpg,mapping = aes(x=displ,y=hwy,colour=class,size=cyl))+
  geom_point()






