library(ggplot2)
library(dplyr)
library(zoo)


# JHCovid19States <- JHCovid19States %>%
#   dplyr::arrange(desc(state)) %>% 
#   dplyr::group_by(state) %>% 
#   dplyr::mutate(death_03da = zoo::rollmean(deaths, k = 3, fill = NA),
#                 death_05da = zoo::rollmean(deaths, k = 5, fill = NA),
#                 death_07da = zoo::rollmean(deaths, k = 7, fill = NA),
#                 death_15da = zoo::rollmean(deaths, k = 15, fill = NA),
#                 death_21da = zoo::rollmean(deaths, k = 21, fill = NA)) %>% 
#   dplyr::ungroup()

N <- 200
data <- tibble(x=1:N,
               y=rnorm(N),
               f5=zoo::rollmean(y,k=5,fill=NA),
               f7=zoo::rollmean(y,k=7,fill=NA),
               f14=zoo::rollmean(y,k=14,fill=NA))

ggplot(data)+geom_line(aes(x=x,y=y),colour="red")+
  geom_line(aes(x=x,y=f7),colour="blue")+
  geom_line(aes(x=x,y=f14),colour="black")



