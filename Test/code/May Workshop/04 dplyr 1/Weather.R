library(aimsir17)
library(dplyr)
library(ggplot2)
library(ggpubr)

mh <- observations %>% 
        filter(station=="MACE HEAD") %>%
        select(station,date,month,day,hour,wdsp)

p1 <- ggplot(mh,aes(x=date,y=wdsp))+geom_point()+geom_line()

er1 <- eirgrid17 %>% 
         select(month,date,day,hour,minute,IEWindGeneration)

p2 <- ggplot(er1,aes(x=date,y=IEWindGeneration))+geom_point()+geom_line()

ggarrange(p1,p2,ncol=1)

er2 <- er1 %>%
        group_by(month,day,hour) %>%
        summarise(AvrWindGenerated=mean(IEWindGeneration,na.rm=T)) %>%
        ungroup()

full_data <- left_join(mh,er2,by=c("month","day","hour"))

ggplot(full_data,aes(x=wdsp,AvrWindGenerated))+geom_point()+geom_smooth()+geom_jitter()




