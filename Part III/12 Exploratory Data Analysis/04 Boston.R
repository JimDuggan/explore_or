# https://www.statology.org/iris-dataset-r/

# Boston Housing Values in Suburbs of Boston

# crim per capita crime rate by town.
# zn proportion of residential land zoned for lots over 25,000 sq.ft.
# indus proportion of non-retail business acres per town.
# chas Charles River dummy variable (= 1 if tract bounds river; 0 otherwise).
# nox nitrogen oxides concentration (parts per 10 million).
# rm average number of rooms per dwelling.
# age proportion of owner-occupied units built prior to 1940.
# boxcox 21
# dis weighted mean of distances to five Boston employment centres.
# rad index of accessibility to radial highways.
# tax full-value property-tax rate per $10,000.
# ptratio pupil-teacher ratio by town.
# black 1000(Bk 􀀀 0:63)2 where Bk is the proportion of blacks by town.
# lstat lower status of the population (percent).
# medv median value of owner-occupied homes in $1000s.
library(MASS)
library(ggplot2)
library(dplyr)
library(tidyr)
library(ggpubr)
library(GGally)


bos <- Boston %>%
        as_tibble() %>%
        dplyr::select(chas,rm,age,rad,ptratio,medv,nox) %>%
        rename(ByRiver=chas,
               Rooms=rm,
               Age=age,
               Radial=rad,
               PTRatio=ptratio,
               HomesValue=medv,
               Nox=nox) %>%
        mutate(ByRiver=as.logical(ByRiver))


ggpairs(dplyr::select(bos,-ByRiver))+
  theme_light()+
  theme(axis.text.x = element_text(size=8),
        axis.text.y = element_text(size=8))

bos_long <- bos %>%
             pivot_longer(names_to = "Indicator",
                          values_to = "Value",
                          -ByRiver)

ggplot(bos_long,aes(x=ByRiver,y=Value,colour=ByRiver))+
  geom_boxplot()+
  facet_wrap(~Indicator,scales="free")

ggplot(bos_long,aes(x=Value))+
  geom_histogram()+
  facet_wrap(~Indicator,scales="free")




