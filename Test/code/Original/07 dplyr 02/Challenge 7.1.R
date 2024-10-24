# For October 2017, filter all observations for mace head
# Create hourly observations (mean) of wind energy generated
# Join the data sets
# Plot the wind speed v wind energy generated, 
# and add a model (also use jitter to show more points)

library(aimsir17)
library(dplyr)
library(ggplot2)

oct_ener <- filter(eirgrid17,month==10) %>%
            group_by(year,month,day,hour) %>%
            summarise(AvrWindGen=mean(IEWindGeneration,na.rm=T),
                      MaxWindGen=max(IEWindGeneration,na.rm=T))

oct_mh <- filter(observations,station %in% c("MACE HEAD"),
                 month==10)

en_w_data <- left_join(oct_mh,oct_ener,by=c("year","month","day","hour"))

ggplot(en_w_data,aes(x=wdsp,y=AvrWindGen))+
  geom_point()+geom_jitter()+geom_smooth(method="lm")
