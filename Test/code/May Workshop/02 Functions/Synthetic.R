library(dplyr)
library(ggplot2)
N <- 365

set.seed(100)
day <- 1:N
temp <- rnorm(N,12,4)
rain <- sample(c("Yes","No"),N,replace=T,prob = c(.3,.7))



weather <- tibble(Day=day, Temperature=temp, Rained=rain)

ggplot(weather,aes(x=Rained))+geom_bar()
