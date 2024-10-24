library(purrr)
library(aimsir17)
library(dplyr)

summ <- observations %>% group_by(station,month,day) %>%
  summarise(MeanWind=mean(wdsp,na.rm=T),MeanMSL=mean(msl,na.rm=T)) %>%
  ungroup()

plots <- summ %>%
          group_split(station) %>%
          map(~{
            ggplot(.,aes(x=MeanMSL,y=MeanWind,colour=station))+
              geom_point()+geom_smooth()+
              ggtitle(.$station)
          })
