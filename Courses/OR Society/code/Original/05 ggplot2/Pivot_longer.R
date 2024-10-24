library(tidyr)
library(ggplot2)

test <- subset(mpg,select = c(displ,hwy,cty))
test_l <- pivot_longer(test,!displ, names_to = "Location", values_to = "Value")
ggplot(test_l,aes(x=displ,y=Value,colour=Location))+geom_point()




