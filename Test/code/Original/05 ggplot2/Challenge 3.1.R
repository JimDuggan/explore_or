# Explore some of the following tibbles in R
# mpg (ggplot2)
# flights (nycflights13)
# observations (aimsir17)
# eirgrid17 (aimsir17)
# stations (aimsir17)
library(nycflights13)
library(ggplot2)
library(aimsir17)

ggplot(data=mpg,aes(x=displ,y=cty))+geom_point()


ggplot(data=mpg)+geom_point(aes(x=displ,y=cty))


