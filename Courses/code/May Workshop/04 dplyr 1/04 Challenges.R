library(aimsir17)
library(ggplot2)
library(dplyr)

# Q1 What is the wettest weather station in Ireland for 2017?

wws <- observations %>%
         group_by(station) %>%
         summarise(TotalRain=sum(rain,na.rm = TRUE)) %>%
         arrange(desc(TotalRain))


# Use the full data set

# Q2 What is the driest month of the year in NEWPORT
dmn <- observations %>%
         filter(station=="NEWPORT") %>%
         group_by(month) %>%
         summarise(TotalRain=sum(rain,na.rm = T)) %>%
         arrange(TotalRain)


# Q3 What is the driest month of the year by weather station, in 2017
dm_s <- observations %>% 
         group_by(month,station) %>%
         summarise(TotalRain=sum(rain,na.rm=T),
                   MaxTemp=max(temp,na.rm=T)) %>%
         ungroup()

ggplot(dm_s,aes(x=month,y=TotalRain))+geom_line()+facet_wrap(~station)+geom_point()

ggplot(dm_s,aes(x=month,y=TotalRain,colour=station))+geom_line()+geom_point()

