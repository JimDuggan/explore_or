# Explore the relationship between minimum daily temperature 
# and maximum daily electricity demand
# 
# Use three weather stations as examples: 
#   BELMULLET, 
#   DUBLIN AIPRORT and 
#   VALENTIA OBSERVATORY.

library(aimsir17)
library(dplyr)
library(ggplot2)

temp_summ <- observations %>%
             filter(station %in% c("MACE HEAD",
                                   "DUBLIN AIRPORT",
                                   "VALENTIA OBSERVATORY")) %>%
             group_by(station,month,day) %>%
             summarise(MinTemperature=min(temp,na.rm=T))

grid_summ <- eirgrid17 %>%
             group_by(month,day) %>%
             summarise(MaxDemand=max(IEDemand,na.rm=T))

new_data <- left_join(grid_summ,temp_summ,by=c("month","day"))

ggplot(new_data,aes(x=MinTemperature,y=MaxDemand,colour=station))+
  geom_point()+geom_smooth()+facet_wrap(~station,ncol=1)

ggplot(new_data,aes(x=MinTemperature,y=MaxDemand,colour=station))+
  geom_point()+facet_wrap(~station,ncol=1)+geom_smooth()
