library(nycflights13)
library(dplyr)
library(aimsir17)
library(ggplot2)

fl_s <- sample_frac(flights,.01)

set.seed(100)
fl_s1 <- sample_n(flights,100)

fl_s <- mutate(fl_s, OnTime=ifelse(dep_delay>0,F,T)) %>%
        select(OnTime,everything())

ggplot(fl_s,aes(x=OnTime))+geom_bar(aes(fill=origin))


mh_oct_16 <- filter(observations,
                    station=="MACE HEAD",
                    day==16,
                    month==10) %>%
             select(date,rain) %>%
             mutate(rain_1=lag(rain),
                    rain_2=lag(rain,2))

ggplot(mh_oct_16)+geom_line(aes(x=date,y=rain),colour="blue")+
  geom_line(aes(x=date,y=rain_1),colour="red")+
  geom_line(aes(x=date,y=rain_2),colour="green")


